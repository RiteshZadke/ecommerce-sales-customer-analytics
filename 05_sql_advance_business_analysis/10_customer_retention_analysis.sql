-- Month-over-month customer retention
USE ecommerce_analysis;
WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(DATE_FORMAT(order_date, '%Y-%m')) AS first_order_month
    FROM orders
    GROUP BY customer_id
),
monthly_activity AS (
    SELECT DISTINCT
        customer_id,
        DATE_FORMAT(order_date, '%Y-%m') AS order_month
    FROM orders
)
SELECT
    ma.order_month,
    COUNT(DISTINCT CASE
        WHEN fp.first_order_month = ma.order_month
        THEN ma.customer_id
    END) AS new_customers,
    COUNT(DISTINCT CASE
        WHEN fp.first_order_month < ma.order_month
        THEN ma.customer_id
    END) AS returning_customers,
    COUNT(DISTINCT ma.customer_id) AS total_active_customers
FROM monthly_activity ma
JOIN first_purchase fp
    ON ma.customer_id = fp.customer_id
GROUP BY ma.order_month
ORDER BY ma.order_month;