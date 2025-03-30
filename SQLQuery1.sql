SELECT*
FROM pizza_sales;


-- KPI'S REQUIREMENTS


SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;


SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avd_Order_Value
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Avg_Per_order
FROM pizza_sales;



---CHART REQUIREMENTS----

SELECT DATENAME(DW, order_date) AS order_day,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY order_day DESC;

SELECT DATEPART(HOUR, order_time) AS order_hours,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)


SELECT pizza_category,SUM(total_price) AS Total_Sales, SUM(total_price)*100 /
(SELECT SUM(total_price)FROM pizza_sales WHERE MONTH(order_date)=1) AS PCT
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
CAST(SUM(total_price)*100/
(SELECT SUM(total_price)FROM pizza_sales WHERE DATEPART(quarter, order_date)=1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE DATEPART(quarter, order_date)=1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category


SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC


SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) 


SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
WHERE MONTH (order_date) = 8
GROUP BY pizza_name
ORDER BY SUM(quantity) 