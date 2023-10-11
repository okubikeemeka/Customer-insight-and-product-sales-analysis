# CUSTOMER INSIGHT AND PRODUCT SALES ANALYSIS
<img width="1400" alt="Summary dashboard" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/8ff82a29-4653-412b-9cc4-824803bdba87">

# Introduction
Customer insight and product performance analysis help businesses to create a 360 degree view of the customers, understand market demands and how their brand impacts product purchase decisions and compares to competition. It helps companies gain better understanding of their diverse customer base and ways to tailor their products to meet the needs and expectations of customers as high performing products can drive sales and improve customer satisfaction. Some key benefits of performing these analyses include reduced churn and increased customer retention, smarter product improvements, personalized and targeted marketing strategy, increased sales and revenue and lower customer acquisition cost.

This project employed customer insight and product performance analysis to address various business challenges for 'AdventureWorks', a fictitious e-commerce company that specializes on sales of sporting, hiking and camping equipment 
under these product categories: Bikes, Accessories, clothing and components.

# Objectives
To obtain insights aimed at addressing various business challenges relating to:
- Customer segmentation
- Customer retention
- Cross-selling and upselling
- Inventory management
- Product performance
- Sales territories and marketing campaign optimization.

# Data information
The database used for this project is **Microsoft SQL Adventureworks 2019** which tests and demonstrates different Microsoft SQL server functionalities. 

See link to database: <https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak>

# Data analysis and visualization
**Azure Data Studio** was utilized for the SQL database queries and data analysis. The necessary information were extracted and the resulting outputs were saved and exported as **MS Excel** files in order to advance the ETL (Extraction, Transformation and Load) processes. 
**Power BI Query editor** was used to transform and confirm total validity of the data, after which the files were loaded into **Power BI** for creation of the visualization dashboards. 

# Addressing the various business objectives:
# a) Customer segmentation
**Problem:** How can the customer base be segmented to better understand their behaviour and needs?

**Solution:** Group the customers based on their recency, frequency and monetary value and identify the different customer segments that emerge from the analysis.

***Confirming total number of customers:***
<img width="800" alt="Total number of customers" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/068cd10b-c9d0-4f7b-b5a1-5295f2605aa0">

***Confirming multiple orders associated with distinct customers:***
<img width="800" alt="Confirming multiple Sales order ID" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/e9a1a0dc-dc44-408f-b16f-70bbf245fb11">

***Confirming most recent and oldest order dates:***
<img width="1200" alt="Confirming most recent and oldest order dates" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/e5b35b7a-4c8e-4701-b158-295d26e218ee">

***Grouping customers based on Recency, Frequency and Monetary value (RFM):***
<img width="1000" alt="RFM Table" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/54001e2f-fd08-4f13-9e82-9576b5d2e90a">

***RFM table with customer segmentation:***
<img width="1400" alt="RFM Table with customer segments" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/546290b6-ef5a-4554-b793-9cedef4366b8">


***Customer segment visualization:***
<img width="1400" alt="Customer segmentation" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/472e77e1-531f-4c9b-a4cd-371fdb186ee2">

**Insights from customer segmentation:**
-	A total of six customer segments emerged from the analysis.
-	At 282 and an average monetary value of $256,020, the high value customers comprised 1.47% of the customer population, contributing 65.7% of the total revenue and 43.5% of total product orders.
-	The occasional shoppers with an average monetary value of $3,805 constituted 38.27% of the customer base, contributing 25.34% of total revenue and 24.70% of total product sales.
-	The ‘low spenders’ is the most populous segment with 10,793 customers (56.45%) and an average monetary value of $140, contributing 1.36% of the total revenue and 25.1% of total product orders.
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
<img width="800" alt="Customers without purchase in the last 12 months" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/46755b71-873b-41a2-bf68-2277c8e87573">


***First time buyers in the last 12 months:***
<img width="800" alt="First time buyers in the last 12 months" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/f6c10dae-3f62-4d35-8f7e-1a4e5d995f12">


***How often do customers make repeat purchases:***
<img width="800" alt="Customers and purchase segments" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/1cb24a53-363b-4237-a0cd-428cc1843587">



***One timers and returning customers:***
<img width="800" alt="Number of customers with repeated and one time purchases" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/241e414b-4a46-4ba6-a8fe-9c9f82f2f1c5">


***For customers with decline in purchase frequency and monetary value:***

<img width="800" alt="Frequency and Monetary values for the oldest year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/86f26345-0805-4100-ab20-ccc73ebaec89">

<img width="900" alt="No of customers with an order in the previous year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/a9abe7cf-0555-4f8b-9b37-019a51dc0377">

<img width="800" alt="Current frequency and monetary value for the latest year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/824e3420-4a9a-455a-b7a1-7a6a2095c079">

<img width="900" alt="No of customers with an order in the latest year and half" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/d13ba6f9-b009-42e2-9084-bb910bb3b19c">

<img width="1200" alt="Comparing frequency and monetary status over the two timeframes" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/a606a826-a6c9-439f-9f46-16c3b1443cdb">

<img width="600" alt="Number of customers with decline in purchase frequency" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/e68f48ef-0451-4ac9-b87e-fb7e8d83d500">

<img width="600" alt="Number of customers with decline in monetary value" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/b80a34af-60b7-4813-8c64-97b174beb7d0">

***Customer retention visualization:***
<img width="1400" alt="Customer retention" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/71eb89de-d1c4-4367-8505-f55889a4b147">

**Insights from customer retention analysis:**
-	A total of 11,649 customers had single transactional orders over the ’37 month’ review period, representing an overall churn rate of 60.93%.
-	At 39.07% overall retention rate, a total of 7470 customers made repeated purchases within the review period.
-	In the last 12 months, a total of 669 customers did not make a purchase, indicating a recent churn rate of 3.49%.
-	The overall churned customers generated $6.77 million which represents 6.16% of the total revenue, while the returning customers at $103.08 million, generated 93.8% of the total revenue. This indicates that despite the greater overall customer churn than retention rate, majority of the churned customers were low spenders.
-	The year with the least customers and product orders is 2011, with 1,406 customers and 5,716 product orders, while 2013 recorded the highest number of customers  (11,095) and product orders (56,573).
-	3786 customers made purchases on either side of the date equally diving the period under review, with 75.17%, 22.64% and 2.19% having no change, an increase and a decline in purchase frequency respectively.
-	For the above set of customers, 58.37% had a decline in monetary value, 41.44% had a monetary value increase while 0.18% had no change in monetary value status.

# c) Cross-selling and upselling
**Problem:** How can opportunities for cross selling and upselling be identified for the existing customers?

**Solutions:** Identify products that are frequently purchased together and recommend complementary products to customers based on this criteria. Also, identify customers who have made high value purchases recently for potential premium upgrades.


***Product pairs frequently purchased together:***
<img width="800" alt="Products frequently purchased together" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/c92b89ca-b47e-482a-bf73-13159749fbdf">

***Products purchased together and their segmentation:***
<img width="800" alt="Products purchased together and their segmentation" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/e0878a20-1e9b-4d53-86e4-d36c0647731d">

***Customers with recent high value purchases:***
<img width="800" alt="Customers with high value purchase recently" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/836c3a80-4860-483f-9906-33a7a69c58e6">

***Cross-selling and upselling visualization:***
<img width="1400" alt="Cross selling and upselling" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/de17c175-9639-4408-ace3-441d15daf40e">


**Insights from cross-selling and upselling analysis:**
-	A total of 11,430 product pairs were purchased together.
-	Mountain bottle cage and Water bottle - 30 oz were purchased together a total of 1692 times, representing the 'most purchased together' product pair.
-	Product pairs purchased together (>= 200 times) were classified as ‘most purchased together’, comprising the least percentage (6.89%) of the segments, while product pairs bought together (< 50 times) were classified as ‘least purchased together’, accounting for the most percentage (35.92%) of the segments.
-	A total of 135 customers made recent (last 6 months of period under review) high value (>= $50,000) purchases.
-	Total sum of recent high value purchases is $11.165 million.
-	Customer IDs ‘29923’ and ‘29617’ were the top 2 customers with recent high value purchases, having monetary values of $220,496 and $187,964 respectively.
-	The most ordered product by recent big spenders is the AWC Logo cap (476 sold).


# d) Product performance and inventory management 
**Problem:** How can product performance be assessed and inventory efficiently managed based on customer demand and preferences?

**Solutions:** Identify best and least sellers, top and least revenue generating products, order and revenue distribution by product categories, popular products among high value customers, specific product categories that consistently drive high sales, safety stock level distribution and how to ensure sufficent stock availability of products.


***Total number of products:***

<img width="600" alt="Total no of products" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/06d2f3ae-5039-4b51-b192-6f6f778d4bb9">

***Products with and without orders:***
<img width="1000" alt="Products with and without orders" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/6399aa7a-3890-4fe4-adfe-24e800e61347">

***Number of sold products:***

<img width="600" alt="Products with orders" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/21252878-7874-499a-98f3-092a89bd722b">

***Number of unsold products:***

<img width="600" alt="Products without orders" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/0182843f-3651-43af-b1a8-350b1f097e3e">

***Products with prior sell start date:***

<img width="600" alt="Products with prior sell start date" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/e2fe5e79-0b1d-4d41-bf0a-dc10490f976f">

***Product order information:***
<img width="1000" alt="Product order information" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/32ef583b-629a-43de-a7b8-4286954c52b3">

***Total product orders:***

<img width="600" alt="Total amount of product orders" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/98347453-c340-4894-982d-0b254eb4caca">

***Best and least selling products:***

<img width="600" alt="Top 20 best sellers" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/77ed4aee-4d98-44ea-a588-f2656584fbeb">

<img width="600" alt="20 Least sellers" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/dfddf26a-86d2-4172-b219-a65cf0567df5">


***Product sales by categories:***
<img width="900" alt="Ranking product sales by categories" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/80f58685-aa3b-4580-b7c4-3f1d8aaeaa8d">

***Product sales by subcategories:***
<img width="800" alt="Ranking product sales by subcategories" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/07526ce8-97b1-4240-b73e-b9a4a0c1af74">

***Popular products among high value customers:***
<img width="1000" alt="Popular products among high value customers" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/4af6aba8-39b7-40e4-9b41-6d5e4efb4450">

***Product categories that consistently drive high sales:***
<img width="1000" alt="Product categories that consistently drive high sales" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/0f23256d-3966-4333-be66-7789d20ff37e">

***Product performance and inventory management visualization:***
<img width="1400" alt="Inventory management and product performance" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/e42589a7-c8d5-4f42-8de7-f64553dfa3f3">

**Insights from analysis of product performance and inventory management:**
-	Out of 504 total number of products, 266 were purchased by customers while 238 were unsold.
-	211 out of the 238 unsold products had ‘sell start dates’ before the first day of the period under review. These could be discontinued products.
-	The top 2 best selling products are Water bottle 30 – oz and AWC Logo cap, with 4688 and 3382 product quantities sold respectively.
-	The least selling product is the ‘LL Touring frame – Blue, 58’ , with only 2 pieces sold.
-	The top revenue generating product is the ‘Mountain-200 Black, 38’, recording $4.4 million in total revenue.
-	Accessories is the product category with the most orders (41,194), representing 33.96% of products category sold, while components had the least orders at 18,698, accounting for 15.4% of total product category orders.
-	At $94.65 million, Bikes is the product category that mostly drive high sales, accounting for a huge percentage (86.17%) of total revenue generated, while accessories represent the least revenue generating product category, with 1.16% of total revenue and $1.27 million generated.
-	AWC Logo cap is the best-selling product among overall high value customers.
-	The safety stock levels for the best-selling products are low (mostly between 4 and 100) but considerably higher for the lower selling products (500).

# e) Sales territories and marketing campaign optimization
**Problem:** How can marketing campaigns be optimized to target the right customers based on sales territories and segments?

**Solution:** Prioritizing specific marketing campaigns based on customer and product performance across the sales territories and identifying the most effective channels in reaching these customers.

***Product sales and sales territories:***
<img width="1000" alt="Product sales and territories" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/d4e65cb0-6322-4100-9bc7-4d950aa2f3f2">

***Ranking countries by customer distribution:***
<img width="800" alt="Ranking the countries by number of customers" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/cb8db954-970a-4898-8508-6060434551ee">

***Ranking countries by generated revenue:***
<img width="800" alt="Ranking the countries by generated revenue" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/f4dbed7e-0af6-41ad-8e47-a4751e798e8c">

***Ranking countries by product categories sold:***
<img width="800" alt="Ranking the countries by Prod Categories sold" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/efcd610b-8680-486c-b29c-af43633783f7">

***Bike sales by subcategory and country:***
<img width="800" alt="Bike sales by subcategory and country" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/3865de47-8494-4413-8961-65b55fd0d3bc">

***Visualization for sales territories and marketing campaign optimization:***
<img width="1400" alt="Sales territories and marketing campaign optimization" src="https://github.com/okubikeemeka/Customer-insight-and-product-sales-analysis/assets/136992065/27f0b14c-b85b-45ec-8eae-e28ceb0e5473">

**Insights from analysis of sales territories and marketing campaign optimization:**
-	At 8210, USA accounted for highest number (43%) of the customer population, while Canada with 1,677 customers comprised 8.7% and lowest number of the customer base.
-	North America accounted for 72.24% ($79.3 million) of total revenue and 65% (79217) of total product orders while the Pacific region generated $10.65 million, representing 9.69% of total revenue and 12.4% of total product quantity sold (15,058).
-	The top 2 revenue generating countries were the USA and Canada, with total sale values of $63 million and $16.36 million respectively, while Germany was the least revenue generating sales territory at $4.9 million.
-	USA accounted for most product orders (60,153) at 49.5%, while Germany had the least percentage of product orders (7528) at 6.85%.
-	Bikes represent the best-selling product category in the USA, with 21,336 orders, while Accessories had the most product orders in the rest of the sales countries.
-	The highest revenue generating year is 2013, with $43.62 million in total sales, while the least revenue was generated in 2011, with total sales of $12.64 million. However, it is important to note that 2011 and 2013 had six-month periods each, with the rest having 12 months.


