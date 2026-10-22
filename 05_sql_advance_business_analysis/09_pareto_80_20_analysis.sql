USE ecommerce_analysis;

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(
            oi.quantity * oi.unit_price - oi.discount
        ) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
),
pareto AS (
    SELECT
        *,
        SUM(revenue) OVER (
            ORDER BY revenue DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_revenue,
        SUM(revenue) OVER () AS total_revenue
    FROM product_revenue
)
SELECT
    product_id,
    product_name,
    ROUND(revenue, 2) AS revenue,
    ROUND(cumulative_revenue, 2) AS cumulative_revenue,
    ROUND(
        cumulative_revenue / NULLIF(total_revenue, 0) * 100,
        2
    ) AS cumulative_revenue_percentage
FROM pareto
ORDER BY revenue DESC;