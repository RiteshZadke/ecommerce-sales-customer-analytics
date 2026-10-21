-- Customer lifetime revenue ranking
USE ecommerce_analysis;

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(
            oi.quantity * oi.unit_price - oi.discount
        ) AS lifetime_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)
SELECT
    customer_id,
    customer_name,
    total_orders,
    ROUND(lifetime_revenue, 2) AS lifetime_revenue,
    RANK() OVER (
        ORDER BY lifetime_revenue DESC
    ) AS customer_rank
FROM customer_revenue
ORDER BY customer_rank;