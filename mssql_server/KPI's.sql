SELECT
	*
FROM pizza_sales

-- KPI's

-- Total revenue
SELECT 
	SUM(total_price) AS total_revenue
FROM pizza_sales

-- Avg order value
SELECT
	(
		SUM(total_price) 
		/ 
		COUNT(DISTINCT order_id)
	) AS avg_order_value
FROM pizza_sales

-- Total pizzas sold
SELECT
	SUM(quantity) AS total_pizzas_sold
FROM pizza_sales

-- Total orders
SELECT
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales

-- Avg pizzas per order
SELECT
	CAST(
		CAST(SUM(quantity) AS DECIMAL(10,2)) 
		/
		CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
	AS DECIMAL(10,2)
	)
AS avg_pizzas_per_order
FROM pizza_sales


