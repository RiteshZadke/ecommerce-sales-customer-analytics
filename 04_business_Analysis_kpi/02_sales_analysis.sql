-- =====================================================================================================
-- 								B. Sales Analysis
-- =====================================================================================================
USE ecommerce_analysis;
-- Revenue by month
SELECT 
	DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount),2) AS monthly_revenue
FROM order_items oi
JOIN orders o
	ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY monthly_revenue DESC;

-- Orders by month
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- Monthly growth
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.quantity * oi.unit_price - oi.discount) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
),

monthly_growth AS (
    SELECT
        month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY month
        ) AS previous_month_revenue
    FROM monthly_sales
)

SELECT
    month,
    ROUND(revenue, 2) AS revenue,
    ROUND(previous_month_revenue, 2) AS previous_month_revenue,
    ROUND(
        (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100,
        2
    ) AS monthly_growth_percentage
FROM monthly_growth
ORDER BY month;

-- Revenue by category
SELECT 
	p.category_id,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS revenue
FROM products p 
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.category_id
ORDER BY revenue DESC;

-- Revenue by product
SELECT 
	p.product_id,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS revenue
FROM products p 
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY revenue DESC;

-- Revenue by supplier 
SELECT 
	s.supplier_id,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS revenue
FROM suppliers s
JOIN products p
	ON s.supplier_id = p.supplier_id
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY s.supplier_id
ORDER BY revenue DESC;
    
-- Revenue by customer
SELECT 
	c.customer_id,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY revenue DESC;

-- Revenue by location
SELECT 
	o.shipping_state,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS revenue
FROM orders o
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY o.shipping_state
ORDER BY revenue DESC;

-- Top 10 products
SELECT 
	p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS revenue
FROM products p
JOIN order_items oi
	ON p.product_id  = oi.product_id
GROUP BY p.product_id,p.product_name
ORDER BY revenue DESC
LIMIT 10;

-- Bottom 10 products
SELECT 
	p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS revenue
FROM products p
JOIN order_items oi
	ON p.product_id  = oi.product_id
GROUP BY p.product_id,p.product_name
ORDER BY revenue ASC
LIMIT 10;