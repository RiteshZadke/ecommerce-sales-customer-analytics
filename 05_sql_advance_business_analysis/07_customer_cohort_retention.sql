USE ecommerce_analysis;

WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(
            DATE_FORMAT(order_date, '%Y-%m-01')
        ) AS cohort_month
    FROM orders
    GROUP BY customer_id
),
customer_activity AS (
    SELECT DISTINCT
        customer_id,
        DATE_FORMAT(order_date, '%Y-%m-01') AS activity_month
    FROM orders
),
cohort_activity AS (
    SELECT
        fp.cohort_month,
        ca.activity_month,
        ca.customer_id,
        PERIOD_DIFF(
            DATE_FORMAT(ca.activity_month, '%Y%m'),
            DATE_FORMAT(fp.cohort_month, '%Y%m')
        ) AS months_since_first_order
    FROM first_purchase fp
    JOIN customer_activity ca
        ON fp.customer_id = ca.customer_id
)
SELECT
    cohort_month,
    months_since_first_order,
    COUNT(DISTINCT customer_id) AS active_customers
FROM cohort_activity
GROUP BY
    cohort_month,
    months_since_first_order
ORDER BY
    cohort_month,
    months_since_first_order;