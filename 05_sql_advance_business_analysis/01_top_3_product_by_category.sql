-- Top 3 products by revenue in each category
USE ecommerce_analysis;

WITH product_revenue AS (
    SELECT
        c.category_id,
        c.category_name,
        p.product_id,
        p.product_name,
        SUM(
            oi.quantity * oi.unit_price - oi.discount
        ) AS revenue
    FROM categories c
    JOIN products p
        ON c.category_id = p.category_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        c.category_id,
        c.category_name,
        p.product_id,
        p.product_name
),
ranked_products AS (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY category_id
            ORDER BY revenue DESC
        ) AS revenue_rank
    FROM product_revenue
)
SELECT
    category_name,
    product_id,
    product_name,
    ROUND(revenue, 2) AS revenue,
    revenue_rank
FROM ranked_products
WHERE revenue_rank <= 3
ORDER BY category_name, revenue_rank;
