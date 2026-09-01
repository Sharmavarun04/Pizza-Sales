Use Pizza_DB
                                                               ---- <<< Chart's Requirement >>> ----
--- Daily Trend for Total Orders ---
SELECT DATENAME(DW, order_date) As Order_Day, COUNT(Distinct order_id) As Total_Orders --- DATENAME(DW, Column_name) is used to provide weekday of date mentioned in as data
FROM pizza_sales GROUP BY DATENAME(DW, order_date)                                     ----GROUP BY categorize orders according to weekdays

--- Monthly Trend for Total Orders ---
SELECT DATENAME(MONTH, order_date) AS Months, COUNT(Distinct order_id) As Total_Orders --- DATENAME(DW, Column_name) is used to provide Month of date mentioned in as data
FROM pizza_sales GROUP BY DATENAME(MONTH, order_date)
Order by Total_Orders DESC

--- Hourly trend for Total Orders ---
SELECT DATEPART(HOUR, order_time) AS Under_Hours, COUNT(Distinct order_id) AS Total_Orders --- DATEPART(HOUR, DATE_time) for hours to find
FROM pizza_sales 
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--- Percentage of sales by pizza category ---
SELECT pizza_category, SUM(total_price) As Total_Sales, 
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Sales_Percentage_by_Category
FROM pizza_sales
GROUP BY pizza_category	

SELECT pizza_category, SUM(total_price) As Total_Sales, 
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales Where MONTH(order_date) = 9) AS Sales_Percentage_by_Category
FROM pizza_sales
Where MONTH(order_date) = 9 ---(for the month of September, We can change the month number as  per our requirement)
GROUP BY pizza_category	

--- Percentage of Sales by Pizza Size ---
SELECT pizza_size, SUM(total_price) As Total_Sales, 
SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Sales_Percentage_by_Size
FROM pizza_sales
GROUP BY pizza_size

--> Here we USed Cast and DATE PART function to test the new feature--
SELECT pizza_size, CAST(SUM(Total_price) AS DECIMAL (10,2)) AS Total_Sales,
CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Sales_Percentage_By_size
FROM pizza_sales
Where DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size

--- Top 5 Pizzas By Revenue, Orders and Quantity ---
Select * from pizza_sales
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue, 
SUM(quantity) AS Total_Quantity, COUNT(order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
