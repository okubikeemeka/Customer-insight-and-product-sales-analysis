# CUSTOMER INSIGHT AND PRODUCT SALES ANALYSIS
<img width="1400" alt="Executive summary dashboard" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/80e189b2-c110-46e8-8788-9bee0d2a9a57">

# Introduction











# Objectives
To obtain insights aimed at addressing various business challenges relating to:
- Customer segmentation
- Customer retention
- Cross-selling and upselling
- Inventory management
- Product performance
- Sales territories and marketing campaign optimization.

# Data information
The database used for this project is **Microsoft SQL Adventureworks 2019** which tests and demonstrates different Microsoft SQL server functionalities. Some of the tables from which relevant data were extracted include: a) Customer b) SalesOrderHeader c) SalesOrderDetail d) SalesTerritory e) Person f) Product e) Product category, etc.

See link to database: <https://Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak> 

# Data analysis and visualization
**Azure Data Studio** was utilized for the SQL database queries and data analysis. The necessary information were extracted and the resulting outputs were saved and exported as **MS Excel** files in order to advance the ETL (Extraction, Transformation and Load) processes. 
**Power BI Query editor** was used to confirm total validity of the data and the visualization dashboards were created using **Power BI**. 

# Addressing the various business objectives:
# a) Customer segmentation
**Problem:** How can the customer base be segmented to better understand their behaviour and needs?

**Solution:** Group the customers based on their recency, frequency and monetary value and identify the different customer segments that emerge from the analysis.

***Grouping customers based on Recency, Frequency and Monetary value (RFM):***
<img width="1000" alt="RFM Table" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/54001e2f-fd08-4f13-9e82-9576b5d2e90a">

***RFM table with customer segmentation:***
<img width="1300" alt="RFM Table with customer segments" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/546290b6-ef5a-4554-b793-9cedef4366b8">


***Customer segment visualization:***
<img width="1200" alt="Customer segmentation" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/522fed68-df46-4378-9217-f0a3b6e7af46">

**Insights from customer segmentation:**
-	A total of six customer segments emerged from the analysis.
-	At 282 and an average monetary value of $256,020, the high value customers comprised 1.47% of the customer population, contributing 65.7% of the total revenue and 43.5% of total product orders.
-	The occasional shoppers with an average monetary value of $3,805 constituted 38.27% of the customer base, contributing 25.34% of total revenue and 24.70% of total product sales.
-	The ‘low spenders’ was the most populous segment with 10,793 customers (56.45%) and an average monetary value of $140, contributing 1.36% of the total revenue and 25.1% of total product orders.
-	1.66% of the customer base comprised the ‘dormant’ customers, with an average monetary value of $17,485, contributing 5.06% of total revenue and 1.96% of product quantity sold.
-	A total of 263 customers (1.37% of customer base) were considered to be at risk, with $3,073 average monetary value, contributing 0.73% of the total revenue and 0.56% of total product orders.
-	The loyal customers made up 0.76% of the customer population, with an average monetary value of $13,258, contributing 1.76% of total revenue and 4% of total product quantity sold.
-	80% of the high value customers were from North America, with 175 customers emerging from the USA, and 51 emerging from Canada, while Germany had the least (10) high value customers from all the sales countries.
-	At 9.16%, Canada had the least low spenders, while the USA (45.64%) had the highest number of low spending customers.
-	The most purchased product categories by high value customers and low spenders were bikes (21,344 orders) and accessories (23,524 orders) respectively.

# b) Customer retention
**Problem:** How can customers who are at the risk of churning be identified and proactive measures taken to retain them?

**Solutions:** Identify overall customer retention and churn rates, customer churn in the last 12 months, customer distribution by order year, product order by year, customers with decline in purchase frequency and monetary values and channels to reach out to these customers with personalized offers or interventions. 

***Customers without a purchase in the last 12 months:***

<img width="600" alt="Customers without purchase in the last 12 months" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/46755b71-873b-41a2-bf68-2277c8e87573">


***First time buyers in the last 12 months:***

<img width="700" alt="First time buyers in the last 12 months" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/f6c10dae-3f62-4d35-8f7e-1a4e5d995f12">


***How often do customers make repeat purchases:***

<img width="600" alt="Customers and purchase segments" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/1cb24a53-363b-4237-a0cd-428cc1843587">



***One timers and returning customers:***

<img width="600" alt="Number of customers with repeated and one time purchases" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/241e414b-4a46-4ba6-a8fe-9c9f82f2f1c5">


***For customers with decline in purchase frequency and monetary value:***

<img width="800" alt="Frequency and Monetary values for the oldest year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/86f26345-0805-4100-ab20-ccc73ebaec89">

<img width="900" alt="No of customers with an order in the previous year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/a9abe7cf-0555-4f8b-9b37-019a51dc0377">

<img width="800" alt="Current frequency and monetary value for the latest year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/824e3420-4a9a-455a-b7a1-7a6a2095c079">

<img width="900" alt="No of customers with an order in the latest year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/d13ba6f9-b009-42e2-9084-bb910bb3b19c">

<img width="1000" alt="Comparing frequency and monetary status over the two timeframes" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/a606a826-a6c9-439f-9f46-16c3b1443cdb">

<img width="600" alt="Number of customers with decline in purchase frequency" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/e68f48ef-0451-4ac9-b87e-fb7e8d83d500">

<img width="600" alt="Number of customers with decline in monetary value" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/b80a34af-60b7-4813-8c64-97b174beb7d0">

***Customer retention visualization:***
<img width="1200" alt="Customer retention" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/b7650f0e-2f48-4bc8-93e8-10ec4ac2b6a2">

**Insights from customer retention:**
-	A total of 11,649 customers had single transactional order over the ’37 month’ review period, representing an overall churn rate of 60.93%.
-	At 39.07% overall retention rate, a total of 7470 customers made repeated purchases within the review period.
-	In the last 12 months, a total of 669 customers did not make a purchase, indicating a recent churn rate of 3.49%.
-	The overall churned customers generated $6.77 million which represents 6.16% of the total revenue, while the returning customers at $103.08 million, generated 93.8% of the total revenue. This indicates that despite the greater overall customer churn than retention rate, majority of the churned customers were low spenders.
-	The year with the least customers and product orders was 2011, with 1,406 customers and 5,716        product orders, while 2013 recorded the highest number of customers  (11,095) and product orders (56,573).
-	3786 customers made purchases on either side of the date equally diving the period under review, with 75.17%, 22.64% and 2.19% having no change, an increase and a decline in purchase frequency respectively.
-	For the above set of customers, 58.37% had a decline in monetary value, 41.44% had a monetary value increase while 0.18% had no change in monetary value status.












