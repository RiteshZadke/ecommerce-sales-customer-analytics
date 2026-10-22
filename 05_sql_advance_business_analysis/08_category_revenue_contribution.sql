USE ecommerce_analysis;

WITH category_revenue AS (
    SELECT
        c.category_id,
        c.category_name,
        SUM(
            oi.quantity * oi.unit_price - oi.discount
        ) AS revenue
    FROM categories c
    JOIN products p
        ON c.category_id = p.category_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY c.category_id, c.category_name
)
SELECT
    category_name,
    ROUND(revenue, 2) AS category_revenue,
    ROUND(
        revenue / NULLIF(SUM(revenue) OVER (), 0) * 100,
        2
    ) AS revenue_contribution_percentage
FROM category_revenue
ORDER BY revenue DESC;