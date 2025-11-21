SELECT 
	*
FROM pizza_sales

-- Hourly Trend for Total Orders
SELECT
	DATEPART(HOUR, order_time) AS order_hours,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

-- Daily Trend for Total Orders
SELECT
	DATENAME(DW, order_date) AS order_day,
	COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
	GROUP BY DATENAME(DW, order_date)

-- Monthly Trend for OrdersSELECT	DATENAME(MONTH, order_date) AS order_month,	COUNT(DISTINCT order_id) AS total_orders_per_monthFROM pizza_sales	GROUP BY DATENAME(MONTH, order_date)