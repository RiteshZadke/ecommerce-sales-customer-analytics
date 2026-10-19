-- ============================================================================================
-- 								F. Business Profitability
-- ============================================================================================
-- Revenue
-- Product Cost
-- = Gross Profit
-- Revenue - Cost of Goods Sold = Gross Profit
USE ecommerce_analysis;

WITH total_revenue AS (
    SELECT
        ROUND(
            SUM(quantity * unit_price - discount),
            2
        ) AS total_revenue
    FROM order_items
),

total_cost AS (
    SELECT
        ROUND(
            SUM(oi.quantity * p.cost_price),
            2
        ) AS total_cost
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
)

SELECT
    tr.total_revenue,
    tc.total_cost AS cost_of_goods_sold,
    ROUND(
        tr.total_revenue - tc.total_cost,
        2
    ) AS gross_profit
FROM total_revenue tr
CROSS JOIN total_cost tc;

-- Profit by product
SELECT 
	p.product_id,
    p.product_name,
	ROUND(SUM(oi.quantity * oi.unit_price - oi.discount) - SUM(oi.quantity * p.cost_price),2) AS profit
FROM order_items oi
LEFT JOIN products p
	ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY profit DESC;

-- Profit by category
SELECT 
	c.category_id,
    c.category_name,
	ROUND(SUM(oi.quantity * oi.unit_price - oi.discount) - SUM(oi.quantity * p.cost_price),2) AS profit
FROM order_items oi
LEFT JOIN products p
	ON p.product_id = oi.product_id
LEFT JOIN categories c
	ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY profit DESC;

-- Profit by month
SELECT 
	DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount),2) AS monthly_revenue
FROM order_items oi
JOIN orders o
	ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY monthly_revenue DESC;


-- Profit Margin
WITH profit AS (
    SELECT
        ROUND(
            SUM(oi.quantity * oi.unit_price - oi.discount)
            - SUM(oi.quantity * p.cost_price),
            2
        ) AS profit
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
),
revenue AS (
    SELECT
        ROUND(
            SUM(quantity * unit_price - discount),
            2
        ) AS revenue
    FROM order_items
),
margin AS (
    SELECT
        ROUND((p.profit / NULLIF(r.revenue, 0)) * 100, 2)
        AS profit_margin_percentage
    FROM profit p
    CROSS JOIN revenue r
)
SELECT *
FROM margin;

-- Highest-profit products
SELECT 
	p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount) - SUM(oi.quantity * p.cost_price)) AS profit_products
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id,
		p.product_name
ORDER BY profit_products DESC
LIMIT 5;

-- High-revenue but low-profit products
SELECT 
	p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount),2) AS revenue,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount) - SUM(oi.quantity * p.cost_price),2) AS profit_products
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id,
		p.product_name
ORDER BY revenue DESC, profit_products ASC
LIMIT 10; 
	