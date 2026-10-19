-- ======================================================================================
-- 						Customer Analytics
-- ======================================================================================
USE ecommerce_analysis;
-- New vs returning customers
WITH customer_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)

SELECT
    COUNT(*) AS total_ordering_customers,

    COUNT(
        CASE
            WHEN total_orders = 1 THEN 1
        END
    ) AS one_time_customers,

    COUNT(
        CASE
            WHEN total_orders > 1 THEN 1
        END
    ) AS returning_customers

FROM customer_orders;

-- Customer purchase frequency
SELECT 
	customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

--  Customer lifetime revenue
SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount),2) AS total_revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY c.customer_id,
		c.first_name,
        c.last_name;

-- Top customers by revenue
SELECT 
	c.customer_id,
    c.first_name,
    c.last_name,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount),2) AS total_revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY c.customer_id,
		c.first_name,
        c.last_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Average customer order value
SELECT 
	c.customer_id,
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT oi.order_id),2) AS AOV
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY c.customer_id;

-- Customers with only one order
SELECT 
	c.customer_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id 
HAVING COUNT(o.order_id) = 1;

-- Customers with multiple orders
SELECT 
	c.customer_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_id 
HAVING COUNT(o.order_id) > 1;

-- Customer segmentation
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_orders,
    CASE
        WHEN total_orders = 1
            THEN 'One-Time Customer'
        WHEN total_orders BETWEEN 2 AND 5
            THEN 'Occasional Customer'
        WHEN total_orders BETWEEN 6 AND 10
            THEN 'Frequent Customer'
        ELSE 'Highly Frequent Customer'
    END AS customer_segment
FROM customer_orders
ORDER BY total_orders DESC;