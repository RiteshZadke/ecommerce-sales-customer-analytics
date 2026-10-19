-- =======================================================================
-- 					A. Overall Business Performance
-- =======================================================================

USE ecommerce_analysis;

-- Total Revenue
SELECT 
	ROUND(SUM(quantity * unit_price - discount),2) AS total_revenue
FROM order_items;

-- Total Orders
SELECT
	COUNT(DISTINCT order_id) AS total_orders
FROM order_items;

-- Total Customers
SELECT 
	COUNT(*) AS total_customers
FROM customers;

-- Total Products
SELECT 
	COUNT(DISTINCT product_id) AS total_products
FROM products;

-- Total Units Sold
SELECT
	SUM(quantity) AS total_units_sold
FROM order_items;

-- Average Order Value (AOV)
SELECT
	ROUND(SUM(quantity * unit_price - discount),2)
    /COUNT(DISTINCT order_id) AS average_order_value
FROM order_items;

-- Average Items per Order
SELECT
	SUM(quantity) / COUNT(DISTINCT order_id) AS average_order_value
FROM order_items;

-- Unique Customers Who Ordered
SELECT
	c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
RIGHT JOIN orders o
	ON c.customer_id = o.order_id
GROUP BY customer_id;

-- Repeat Customers
USE ecommerce_analysis;

SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT order_id) > 1
) AS customer_orders;

-- 
WITH customer_order_counts AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT
    COUNT(CASE WHEN total_orders > 1 THEN 1 END)
        AS repeat_customers,
    COUNT(*) AS unique_ordering_customers,
    ROUND(
        100.0 * COUNT(CASE WHEN total_orders > 1 THEN 1 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS customer_repeat_rate_pct
FROM customer_order_counts;