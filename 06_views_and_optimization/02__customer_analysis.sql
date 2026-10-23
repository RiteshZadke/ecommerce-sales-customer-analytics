-- customer analytics views

USE ecommerce_analysis;

CREATE VIEW vw_customers_segments AS
	WITH customr_details AS (
	SELECT 
		c.customer_id,
        concat(c.first_name,c.last_name," ") AS full_name,
        ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS total_revenue,
		COUNT(DISTINCT o.order_id) AS total_orders
	FROM customers c
    LEFT JOIN orders o
		ON c.customer_id = o.customer_id
	JOIN order_items oi
		ON o.order_id = oi.order_id 
	GROUP BY c.customer_id)
    
    SELECT
    customer_id,
    full_name,
    total_orders,
    total_revenue,
    CASE
        WHEN total_orders = 1
            THEN 'One-Time Customer'
        WHEN total_orders BETWEEN 2 AND 5
            THEN 'Occasional Customer'
        WHEN total_orders BETWEEN 6 AND 10
            THEN 'Frequent Customer'
        ELSE 'Highly Frequent Customer'
    END AS customer_segment
FROM customr_details
ORDER BY total_orders DESC;

SELECT * FROM vw_customers_segments;