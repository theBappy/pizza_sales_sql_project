SELECT
	*
FROM pizza_sales
-- % of Sales by Pizza Category
SELECT
	pizza_category,
		CAST(SUM(total_price) AS DECIMAL(10, 2)) AS total_sales,
		SUM(total_price) * 100 / (
			SELECT
				SUM(total_price) 
			FROM pizza_sales
				WHERE MONTH(order_date) = 1
		) AS PCT
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

--  % of Sales by Pizza Size
SELECT
	pizza_size,
		CAST(SUM(total_price) AS DECIMAL(10, 2)) AS total_sales,
		CAST(SUM(total_price) * 100 
		/
			(
				SELECT
					SUM(total_price) 
				FROM pizza_sales
					--WHERE MONTH(order_date) = 1
			) AS DECIMAL (10, 2)) AS PCT
FROM pizza_sales
--WHERE MONTH(order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC


-- Total Pizzas Sold by Pizza Category
SELECT
	pizza_category,
	SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
-- WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC

-- Top 5 Pizzas sold
SELECT
	TOP 5 pizza_name,
	SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold DESC

-- Bottom 5 Pizzas sold
SELECT
	TOP 5 pizza_name,
	SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizzas_sold ASC

-- Top 5 Pizzas by Revenue
SELECT
	TOP 5 pizza_name,
	SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC

-- Bottom 5 Pizzas by Revenue
SELECT
	TOP 5 pizza_name,
	SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC


-- Top 5 Pizzas by Quantity
SELECT 
	Top 5 pizza_name, 
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

-- Bottom 5 Pizzas by Quantity
SELECT 
	Top 5 pizza_name, 
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--  Top 5 Pizzas by Total Orders
SELECT
	TOP 5 pizza_name,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC

--  Bottom 5 Pizzas by Total Orders
SELECT
	TOP 5 pizza_name,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC