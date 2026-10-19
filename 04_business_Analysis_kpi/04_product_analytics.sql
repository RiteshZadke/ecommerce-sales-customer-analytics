-- ==========================================================================
-- 								Product Analytics
-- ==========================================================================
   USE ecommerce_analysis;      
-- Best-selling products
SELECT 
	p.product_id,
    p.product_name,
    COUNT(DISTINCT oi.order_id) AS times_orderd
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id,
		p.product_name
ORDER BY times_orderd DESC
LIMIT 10;

-- Highest-revenue products
SELECT 
	p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS total_revenue
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id,
		p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Lowest-performing products
SELECT 
	p.product_id,
    p.product_name,
    COUNT(DISTINCT oi.order_id) AS times_orderd,
    ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS total_revenue
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id,
		p.product_name
ORDER BY total_revenue ASC
LIMIT 10;

-- Category performance
SELECT 
	c.category_id,
    c.category_name,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount),2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS order_fequency
FROM categories c
LEFT JOIN products p
	ON c.category_id = p.category_id
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY c.category_id,c.category_name
ORDER BY total_revenue DESC;

-- Average product price
SELECT 
	p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * oi.unit_price - oi.discount)/COUNT(DISTINCT oi.order_id),2) AS avg_product_value
FROM productS p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY avg_product_value DESC;

-- Units sold per product
SELECT
    p.product_id,
    p.product_name,
    COALESCE(SUM(oi.quantity), 0) AS total_units_sold
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC;

-- Product review ratings
SELECT 
	p.product_id,
    p.product_name,
    ROUND(AVG(r.rating),1) as AVG_rating
FROM products p
LEFT JOIN reviews r
	ON p.product_id = r.product_id
GROUP BY product_id,p.product_name
ORDER BY AVG_rating DESC;

-- Return rate by product
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_units_sold,
    COALESCE(SUM(r.return_quantity), 0) AS total_units_returned,

    ROUND(
        COALESCE(SUM(r.return_quantity), 0) * 100.0
        / NULLIF(SUM(oi.quantity), 0),
        2
    ) AS return_rate_percentage

FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id

LEFT JOIN returns r
    ON oi.order_item_id = r.order_item_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY return_rate_percentage DESC;