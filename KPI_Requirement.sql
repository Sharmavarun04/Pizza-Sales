Use Pizza_DB
                                                                 ---- <<< KPI's Requirement >>> ----
--- Total Revenue ---
SELECT SUM(total_price) As Total_Revenue from pizza_sales

--- Average Order Value ---
SELECT SUM(Total_price) / Count(Distinct Order_id) As Avg_Order_Value FROM pizza_sales

--- Total Pizzas Sold ---
SELECT SUM(quantity) As Total_Pizzas_Sold from pizza_sales

--- Total Orders ---
SELECT COUNT(Distinct Order_id) As Total_order FROM pizza_sales

--- Average Pizzas Per Order ---
--- Use CAST to convert normal value into Decimal Value ---
--> this will do Decimal function on complete aggregation and does not show values after decimal Having output = 2.00
SELECT CAST((SUM(quantity) / COUNT(Distinct order_id)) AS DECIMAL(10,2))  --- 
As Avg_Pizzas_Per_Order FROM pizza_sales


--> this will provide the actual decimal value having an output = 2.32
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(Distinct order_id)
AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales


