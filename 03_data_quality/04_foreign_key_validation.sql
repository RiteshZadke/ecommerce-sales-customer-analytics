-- ============================================================
-- . FOREIGN KEY VALIDATION
-- ============================================================

-- Orders → Customers
SELECT COUNT(*) AS invalid_customer_orders
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Products → Categories
SELECT COUNT(*) AS invalid_product_categories
FROM products p
LEFT JOIN categories c
    ON p.category_id = c.category_id
WHERE c.category_id IS NULL;

-- Products → Suppliers
SELECT COUNT(*) AS invalid_products_suppliers
FROM products p
LEFT JOIN suppliers s
	ON p.supplier_id = s.supplier_id
WHERE p.supplier_id IS NULL;

-- Order Items → Orders
SELECT COUNT(*) AS invalid_order_items_orders
FROM order_items oi
LEFT JOIN orders o
	ON oi.order_id = o.order_id
WHERE oi.order_id IS NULL;

-- Order Items → Products
SELECT COUNT(*) AS invalid_order_items_product
FROM order_items oi
LEFT JOIN products p
	ON oi.product_id = p.product_id
WHERE oi.order_id IS NULL;

-- Payments → Orders
SELECT COUNT(*) AS invalid_order_product
FROM orders o
LEFT JOIN payments p
	ON o.order_id = p.order_id
WHERE o.order_id IS NULL;

-- Shipments → Orders
SELECT COUNT(*) AS invalid_shipments_orders
FROM orders o
LEFT JOIN shipments s
	ON o.order_id = s.order_id
WHERE o.order_id IS NULL;

-- Returns → Order Items
SELECT COUNT(*) AS invalid_returns_order_itmes
FROM order_items oi
LEFT JOIN returns r
	ON oi.order_item_id = r.order_item_id
WHERE oi.order_item_id IS NULL;

-- Reviews → Customers
SELECT COUNT(*) AS invalid_customers_reviews
FROM reviews r
LEFT JOIN customers c
	ON r.customer_id = c.customer_id
WHERE r.customer_id IS NULL;

-- Reviews → Products
SELECT COUNT(*) AS invalid_products_reviews
FROM reviews r
LEFT JOIN products p
	ON r.product_id = p.product_id
WHERE r.product_id IS NULL;