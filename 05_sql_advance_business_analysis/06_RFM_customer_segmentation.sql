USE ecommerce_analysis;

WITH reference_date AS (
    SELECT MAX(order_date) AS analysis_date
    FROM orders
),
customer_metrics AS (
    SELECT
        o.customer_id,
        DATEDIFF(
            r.analysis_date,
            MAX(o.order_date)
        ) AS recency_days,
        COUNT(DISTINCT o.order_id) AS frequency,
        SUM(
            oi.quantity * oi.unit_price - oi.discount
        ) AS monetary
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    CROSS JOIN reference_date r
    GROUP BY o.customer_id, r.analysis_date
),
rfm_scores AS (
    SELECT
        *,
        NTILE(5) OVER (
            ORDER BY recency_days DESC
        ) AS recency_score,
        NTILE(5) OVER (
            ORDER BY frequency ASC
        ) AS frequency_score,
        NTILE(5) OVER (
            ORDER BY monetary ASC
        ) AS monetary_score
    FROM customer_metrics
)
SELECT
    customer_id,
    recency_days,
    frequency,
    ROUND(monetary, 2) AS monetary,
    recency_score,
    frequency_score,
    monetary_score,
    CASE
        WHEN recency_score >= 4
             AND frequency_score >= 4
             AND monetary_score >= 4
            THEN 'High Value'
        WHEN recency_score >= 3
             AND frequency_score >= 3
            THEN 'Loyal / Engaged'
        WHEN recency_score <= 2
             AND frequency_score >= 3
            THEN 'At Risk'
        ELSE 'Needs Attention'
    END AS customer_segment
FROM rfm_scores
ORDER BY monetary_score DESC, frequency_score DESC;