/*ARRANGING THE RELEVANT TABLES FOR EASY SELECTION AND PREVIEW*/

SELECT * FROM [Sales].[SalesOrderHeader] 
SELECT * FROM [Sales].[SalesOrderDetail] 
SELECT * FROM [Production].[Product]
SELECT * FROM [Sales].[SalesTerritory]
SELECT * from [Person].[Person]
select * from [production].[ProductCategory]
select * from [Production].[ProductSubcategory]


/*TO CONFIRM THE TOTAL NUMBER OF CUSTOMERS*/

Select COUNT (distinct CustomerID) from [Sales].[SalesOrderHeader] 


/*TO CONFIRM MULTIPLE SALES ORDER ID IN RELATION TO ONE CUSTOMER BASED ON CUSTOMER ID*/

Select CustomerID, COUNT(distinct SalesOrderID) as Frequency
from [Sales].[SalesOrderHeader]
group by CustomerID


/*CONFIRMING MAXIMUM (MOST RECENT) AND MINIMUM (OLDEST) ORDERDATES*/

Select MAX(OrderDate) as MostRecent_Order_Date, MIN(OrderDate) as Oldest_Order_Date, DATEDIFF(MONTH, MIN(OrderDate), MAX(OrderDate)) as DateRange_In_Months
from [Sales].[SalesOrderHeader]


--OBJECTIVE 1: CUSTOMER SEGMENTATION

/*Grouping customers based on Recency, R_Rating, Frequency, F_Rating, Monetary value and M_Rating*/

Select a.CustomerID, 
DATEDIFF(Month, MAX(a.OrderDate), '2014-06-30') as Recency,
Case when DATEDIFF(Month, MAX(a.OrderDate), '2014-06-30') between 0 and 6 then 'HighRecency_Customer'
when DATEDIFF(Month, MAX(a.OrderDate), '2014-06-30') between 7 and 12 then 'GoodRecency_Customer'
when DATEDIFF(Month, MAX(a.OrderDate), '2014-06-30') between 13 and 24 then 'FairRecency_Customer'
when DATEDIFF(Month, MAX(a.OrderDate),'2014-06-30') > 24 then 'LowRecency_Customer'
End as 'R_Rating',
count (distinct a.salesorderid) as Frequency,
Case when count (distinct a.salesorderid) between 1 and 5 then 'LowFreq_Customer'
When count (distinct a.salesorderid) between 6 and 10 then 'FairFreq_Customer'
When count (distinct a.salesorderid) between 11 and 15 then 'GoodFreq_Customer'
when count (distinct a.salesorderid) > 15 then 'HighFreq_Customer'
End as 'F_Rating',
(Sum(b.LineTotal)) as MonetaryValue,
Case when (Sum(b.LineTotal)) between 1 and 1000 then 'LowMoney_Customer'
when (Sum(b.LineTotal)) > 1000 and (Sum(b.LineTotal)) <=5000 then 'FairMoney_Customer'
when (Sum(b.LineTotal)) > 5000 and (Sum(b.LineTotal)) <=50000 then 'GoodMoney_Customer'
when (Sum(b.LineTotal)) > 50000 then 'HighMoney_Customer'
End as 'M_Rating'
Into #RFM_Table
from [Sales].[SalesOrderHeader] a
inner join [Sales].[SalesOrderDetail] b
on a.SalesOrderID = b.SalesOrderID
Group by CustomerID 
order by monetaryvalue desc

select * from #RFM_Table 
Order by CustomerID



/*RFM TABLE WITH CUSTOMER SEGMENTATION*/

Select CustomerID, Recency, Frequency, MonetaryValue, R_Rating, F_Rating, M_Rating,
Case when M_Rating = 'HighMoney_Customer' and R_Rating between 'FairRecency_Customer' and 'HighRecency_Customer' then 'High Value'
when F_Rating = 'FairFreq_Customer' or F_Rating = 'GoodFreq_Customers' or F_Rating = 'HighFreq_Customer' then 'Loyal'
when R_Rating = 'LowRecency_Customer' then 'Dormant'
when M_Rating = 'lowmoney_customer' then 'Low Spenders'
when F_Rating = 'LowFreq_Customer' and R_Rating = 'FairRecency_customer'  then 'At Risk'
when R_Rating = 'HighRecency_Customer' or R_Rating = 'GoodRecency_Customer' and M_Rating = 'GoodMoney_Customer' or M_Rating = 'FairMoney_Customer' and F_Rating = 'LowFreq_Customer' then 'Occassional Shoppers'
Else 'Ungrouped'
End as 'Customer_Segments'
into #Customer_Seg
From #RFM_Table

select * from #Customer_Seg 
Order by CustomerID


--OBJECTIVE 2: CUSTOMER RETENTION

/*FOR CUSTOMERS WITHOUT A PURCHASE IN THE LAST 12 MONTHS*/

Select count (Distinct Customerid) as No_Purchase_In_Last_12Months
from #RFM_Table
Where Recency > 12


/*FIRST TIME BUYERS IN THE LAST 12 MONTHS*/

--Joining relevant tables
select a. customerid, a.orderdate,  b. salesorderid
into #SalesOrderHeader_and_Details
from [Sales].[SalesOrderHeader] a
inner join [Sales].[SalesOrderDetail] b
on a.salesorderid = b.salesorderid

Select CustomerID, DATEDIFF(Month, min(OrderDate), '2014-06-30') as Months_Since_First_Purchase
from #SalesOrderHeader_and_Details
Group by CustomerID
having DATEDIFF(Month, min(OrderDate), '2014-06-30') <= '12'



/*HOW OFTEN DO CUSTOMERS MAKE REPEAT PURCHASES?*/
 
Select CustomerID, Frequency-1 as Repeat_Purchases,
case when Frequency-1 > '0' then 'Repeated purchase'
when Frequency-1 = '0' then 'One Timers' else 'null'
End as Purchase_Segment
into #Repeat_Pur
from #RFM_Table
group by CustomerID, Frequency

select * from #Repeat_Pur 


/*NUMBER OF CUSTOMERS WITH REPEATED AND ONE-TIME PURCHASES*/  

Select purchase_segment, count (CustomerID) as No_Of_Customers from #Repeat_Pur
Group by Purchase_Segment


/*FOR CUSTOMERS WITH DECLINE IN PURCHASE FREQUENCY OR MONETARY VALUE*/

-- Joined both SalesOrder_Header and SalesOrder_Details Tables
Select a. customerid, a.orderdate,  b. salesorderid, b. LineTotal
into #Both_Tables
from [Sales].[SalesOrderHeader] a
inner join [Sales].[SalesOrderDetail] b
on a.salesorderid = b.salesorderid

Select * from #Both_Tables 

-- Got Previous Frequency and Monetary Values (For the oldest year and half)
select CustomerID, count (distinct SalesOrderID) as PreviousFrequency, sum (LineTotal) as Previous_MonetaryValue
into #Previous_YearandHalf
from #Both_Tables
where OrderDate <= '2012-12-13'
group by CustomerID

select * from #Previous_YearandHalf
order by CustomerID desc

-- Got Current Frequency and Monetary Values (For the latest year and half)
select CustomerID, count (distinct SalesOrderID) as CurrentFrequency, sum (linetotal) as Current_MonetaryValue
into #Current_YearandHalf
from #Both_Tables
where OrderDate > '2012-12-13'
group by CustomerID

select * from #Current_YearandHalf
order by CustomerID desc


-- Joined #Previous and #Current tables in order to get customers common to both timeframes & compare their status based on Frequency and Monetary Value
select a.CustomerID, a. PreviousFrequency, b.CurrentFrequency,
case when PreviousFrequency > CurrentFrequency then 'Decline'
when PreviousFrequency < CurrentFrequency then 'Increase'
else 'No Change'
end as Frequency_Status, 
a.Previous_MonetaryValue, b.Current_MonetaryValue, 
case when Previous_MonetaryValue > Current_MonetaryValue then 'Decline'
when Previous_MonetaryValue < Current_MonetaryValue then 'Increase'
else 'No Change'
end as MonetaryValue_Status 
into #Comparison
from #Previous_YearandHalf a
inner join #Current_YearandHalf b
on a. CustomerID = b.CustomerID


Select * from #Comparison 



-- Getting Customers with Decline in Purchase Frequency Specifically 
Select CustomerID, Frequency_Status
into #Frequency_Decline
from #Comparison
where Frequency_Status = 'decline'

select * from #Frequency_Decline
order by CustomerID 


-- Getting Customers with Decline in MonetaryValue Specifically 
Select CustomerID, MonetaryValue_Status
into #MonetaryValue_Decline
from #Comparison
where MonetaryValue_Status = 'decline'

select * from #MonetaryValue_Decline
order by CustomerID 



--OBJECTIVE 3: CROSS SELLING AND UPSELLING

/*PRODUCTS FREQUENTLY PURCHASED TOGETHER*/

SELECT a.name as Product_Name1, e.Name as Product_Name2, COUNT(Distinct b.SalesOrderID) as Frequency
Into #FreqPurchased_Together
FROM [Production].[Product] a
JOIN [Sales].[SalesOrderDetail] b 
ON a.ProductID = b.ProductID
JOIN [Sales].[SalesOrderHeader] c 
ON b.SalesOrderID = c.SalesOrderID
JOIN [Sales].[SalesOrderDetail] d
ON c.SalesOrderID = d.SalesOrderID
JOIN [Production].[Product] e
ON d.ProductID = e.ProductID
WHERE a.ProductID > e.ProductID
GROUP BY a.Name, e.Name
ORDER BY frequency DESC

Select * from #FreqPurchased_Together
order by Frequency Desc


/*PRODUCTS PURCHASED TOGETHER AND THEIR SEGMENTATION*/

Select * ,
Case when Frequency >= 200 then 'Most Purchased Together'
when Frequency >=100 and Frequency <200 then 'Highly Purchased Together'
when Frequency >= 50 and Frequency < 100 THEN 'Moderately Purchased Together'
when Frequency <50 THEN 'Least Purchased Together'
End as 'Freq_PurchasedTogether_Segments'
into #FreqPurchased_Segments
from #FreqPurchased_Together


Select * from #FreqPurchased_Segments
order by Frequency desc


/*CUSTOMERS THAT HAVE MADE HIGH VALUE PURCHASE RECENTLY*/

select a. customerid, b. salesorderid, b.linetotal, b.ProductID, c.name,
case when a.orderdate between '2013-12-31' and '2014-06-30' then 'Recent_Purchase'
when a.orderdate < '2013-12-31' then 'Old_Purchase'
End as 'Purchase_status'
into #Up_Selling
from [Sales].[SalesOrderHeader] a
inner join [Sales].[SalesOrderDetail] b
on a.salesorderid = b.salesorderid
inner join [Production].[Product] c
on b.ProductID = c.ProductID


Select * from #Up_Selling


Select customerid, purchase_status, sum (LineTotal) as Sum_of_Purchases
into #Recent_highvalue_purchase
from #Up_Selling
group by CustomerID, Purchase_status
having sum (LineTotal) >= '50000' and Purchase_status = 'recent_purchase'
order by sum (LineTotal) desc

Select * from #Recent_highvalue_purchase
order by Sum_of_Purchases desc



Select a.CustomerID, b.salesorderid, a.Purchase_status, b.LineTotal as Sale_Amount,b.name as Product_name
into #Products_for_Highvalue
from #Recent_highvalue_purchase a
inner join #Up_Selling b
on a.CustomerID = b.customerID


Select * from #Products_for_Highvalue


--OBJECTIVE 4: PRODUCT PERFORMANCE

/*TOTAL NUMBER OF PRODUCTS*/

SELECT Count (distinct Name) AS No_of_Products FROM [Production].[Product]

/*PRODUCTS WITH AND WITHOUT ORDERS*/

SELECT a.Name as Product_Name, a.SellStartDate, a.SellEndDate, a.Discontinueddate, Count (distinct SalesOrderID) as No_Of_Orders
into #Product_Order
From [Production].[Product] a
Left join [Sales].[SalesOrderdetail] b
on a.ProductID = b.ProductID
Group by a.Name, a.SellStartDate, a.SellEndDate, a.DiscontinuedDate

Select * from #Product_Order
Order by Product_Name


Select * 
into #Products_With_Orders
from #Product_Order
where No_Of_Orders > '0'

Select * from #Products_With_Orders


Select * 
into #Products_Without_Orders
from #Product_Order
where No_Of_Orders = '0'

Select * from #Products_Without_Orders


/*PRODUCTS WITH SELL START DATE < 2011-05-31*/

Select * from #Products_Without_Orders
where SellStartDate < '2011-05-31'


/*PRODUCT ORDER INFORMATION*/

Select c.Customerid, b.Salesorderid, e.Name as ProductCategory_Name, d.Name as ProductSubcategory_Name, a.Name as Product_Name
into #Product_Info
from [Production].[Product] a
inner join [Sales].[SalesOrderDetail] b
on a.ProductID = b.ProductID
inner join [Sales].[SalesOrderHeader] c
on b.SalesOrderID = c.SalesOrderID
inner join [Production].[ProductSubcategory] d
on a.ProductSubcategoryID = d.ProductSubcategoryID
inner join [Production].[ProductCategory] e
on d.ProductcategoryID = e.ProductCategoryID
Group by c.CustomerID, b.SalesOrderID, e.name, d.Name, a.Name


Select * from #Product_Info
order by CustomerID

/*TOTAL AMOUNT OF PRODUCT ORDERS*/

Select count (salesorderid) as Total_ProductOrders from #Product_Info


/*RANKING PRODUCT SALES BY CATEGORIES*/

Select Productcategory_Name, Count (salesorderid) as Amount_Sold
from #Product_Info
Group by ProductCategory_Name
Order by Amount_Sold Desc


/*RANKING PRODUCT SALES BY SUBCATEGORIES*/

Select Productsubcategory_Name, Count (salesorderid) as Amount_Sold
from #Product_Info
Group by ProductsubCategory_Name
Order by Amount_Sold Desc


/*BEST AND LEAST SELLING PRODUCTS*/

Select Product_Name, Count (salesorderid) as Amount_Sold
from #Product_Info
Group by Product_Name
Order by Amount_Sold Desc



-- OBJECTIVE 5: INVENTORY MANAGEMENT

/*POPULAR PRODUCTS AMONGST HIGH VALUE CUSTOMERS*/

SELECT c.CustomerID, b.SalesOrderID, a.Name as Product_Name, a.SafetyStockLevel, e.Name as ProductCategory_Name, f.Customer_Segments, f.M_Rating
into #INVENTORY_Table
from [Production].[Product] a
inner join [Sales].[SalesOrderDetail] b
on a.ProductID = b.ProductID
inner join [Sales].[SalesOrderHeader] c
on b.SalesOrderID = c.SalesOrderID
inner join [Production].[ProductSubcategory] d
on a.ProductSubcategoryID = d.ProductSubcategoryID
inner join [Production].[ProductCategory] e 
on d.ProductcategoryID = e.ProductCategoryID
inner join #Customer_Seg f
on c.CustomerID = f.CustomerID
 

Select * from #INVENTORY_Table 
order by Product_Name

Select  count (SalesOrderID) as Product_Amount, Product_Name, ProductCategory_Name, Customer_Segments
into #Popular_HighValue
from #INVENTORY_Table
group by Product_Name, ProductCategory_Name,Customer_Segments
having Customer_Segments = 'high value'
order by Product_Amount desc

Select TOP 20 *
from #Popular_HighValue 
order by Product_Amount desc


/*PRODUCT CATEGORIES THAT CONSISTENTLY DRIVE HIGH SALES*/

SELECT c.CustomerID, a.Name as Product_Name, b.SalesOrderID, b.LineTotal, a.ProductID, d.ProductCategoryID, e.Name as ProductCategory_Name
into #INVENTORY_Table2
from [Production].[Product] a
inner join [Sales].[SalesOrderDetail] b
on a.ProductID = b.ProductID
inner join [Sales].[SalesOrderHeader] c
on b.SalesOrderID = c.SalesOrderID
inner join [Production].[ProductSubcategory] d
on a.ProductSubcategoryID = d.ProductSubcategoryID
inner join [Production].[ProductCategory] e
on d.ProductcategoryID = e.ProductCategoryID

Select * from #INVENTORY_Table2 


Select ProductCategory_Name, sum (LineTotal) as Total_Sales
into #Drive_HighSales
from #INVENTORY_Table2
Group by ProductCategory_Name

Select * from #Drive_HighSales
order by Total_Sales desc


--OBJECTIVE 6: PRODUCT SALES AND TERRITORIES / GEOGRAPHICAL LOCATIONS

/*JOINING THE RELEVANT TABLES AND IDENTIFYING COLUMNS*/

SELECT c. Customerid, b.SalesOrderID, c.OrderDate, a.Name as Product_Name, d.Name as Product_SubCategory_Name, e.Name as ProductCategory_Name, 
Case when CountryRegionCode = 'US' then 'USA'
When CountryRegionCode = 'CA' then 'CANADA'
When CountryRegionCode = 'FR' then 'FRANCE'
When CountryRegionCode = 'DE' then 'GERMANY'
When CountryRegionCode = 'AU' then 'AUSTRALIA'
When CountryRegionCode = 'GB' then 'UNITED KINGDOM'
End as 'Country', f.[Group] as Continent, b.LineTotal as Sale_Amount
into #Territories_and_Products
from [Production].[Product] a
inner join [Sales].[SalesOrderDetail] b
on a.ProductID = b.ProductID
inner join [Sales].[SalesOrderHeader] c
on b.SalesOrderID = c.SalesOrderID
inner join [Production].[ProductSubcategory] d
on a.ProductSubcategoryID = d.ProductSubcategoryID
inner join [Production].[ProductCategory] e
on d.ProductcategoryID = e.ProductCategoryID
inner join [Sales].[SalesTerritory] f
on c.TerritoryID = f.TerritoryID

Select * from #Territories_and_Products



/*RANKING THE COUNTRIES BY NUMBER OF CUSTOMERS*/

Select Country, count (distinct customerid) AS No_Of_Customers 
from #Territories_and_Products
Group by Country
order by No_Of_Customers desc


/*RANKING THE COUNTRIES BY GENERATED REVENUE*/

Select Country, sum (Sale_Amount) as Total_Revenue
FROM #Territories_and_Products
Group by Country
order by Total_Revenue desc



/*RANKING THE COUNTRIES BY AMOUNT OF PRODUCT CATEGORIES SOLD*/

Select Productcategory_name, Count (SalesOrderID) AS Amount_Sold, Country
FROM #Territories_and_Products
Group by Country, ProductCategory_Name
order by Amount_Sold Desc


/*RANKING THE AMOUNT OF BIKES SOLD BY SUBCATEGORY AND COUNTRY*/

Select Product_subcategory_name, count (salesorderid) as Amount_Sold, Country
from #Territories_and_Products
where ProductCategory_Name = 'bikes'
Group by Product_SubCategory_Name, Country
Order by Amount_Sold Desc