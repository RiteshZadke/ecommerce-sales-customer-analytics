-- profitability views

CREATE VIEW profitability_view AS
WITH sales_summary AS (
    SELECT
        p.product_id,
        SUM(oi.quantity * oi.unit_price - oi.discount) AS total_revenue,
        SUM(oi.quantity * oi.unit_price - oi.discount) - SUM(oi.quantity * p.cost_price) AS profit
    FROM products p
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.cost_price
)
SELECT
    product_id,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(profit, 2) AS profit,
    ROUND(profit / NULLIF(total_revenue, 0) * 100, 2) AS margin
FROM sales_summary;

SELECT * FROM profitability_view;