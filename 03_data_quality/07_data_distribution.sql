-- ============================================================
-- . ORDER STATUS DISTRIBUTION
-- ============================================================
SELECT 
	order_status,
    COUNT(*) AS total_order
FROM orders
GROUP BY order_status
ORDER BY total_order DESC;

-- ============================================================
-- . PAYMENT STATUS DISTRIBUTION
-- ============================================================
SELECT 
	payment_status,
    COUNT(*) AS total_payments
FROM payments 
GROUP BY payment_status
ORDER BY total_payments DESC;

-- ============================================================
-- . DELIVERY STATUS DISTRIBUTION
-- ============================================================
SELECT 
	delivery_status,
    COUNT(*) AS total_delivery_status
FROM shipments
GROUP BY delivery_status
ORDER BY total_delivery_status DESC;

-- ============================================================
-- . RETURN STATUS DISTRIBUTION
-- ============================================================
SELECT 
	return_status,
    COUNT(*) AS total_delivery_status
FROM returns
GROUP BY return_status
ORDER BY total_delivery_status DESC;


-- ============================================================
-- . REVIEW RATING DISTRIBUTION
-- ============================================================
SELECT 
	rating,
	COUNT(*) AS total_rating
FROM reviews
GROUP BY rating
ORDER BY total_rating DESC;

-- ============================================================
-- . CUSTOMER DISTRIBUTION BY STATE
-- ============================================================
SELECT 
	state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY state
ORDER BY total_customers DESC;
	
-- ============================================================
-- . PRODUCT DISTRIBUTION BY CATEGORY
-- ============================================================
SELECT
	c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p
	ON c.category_id = p.category_id
GROUP BY c.category_id
ORDER BY total_products DESC;