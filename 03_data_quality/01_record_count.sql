USE ecommerce_analysis;

-- ============================================================
-- . TABLE ROW COUNTS
-- ============================================================

SELECT"Cagetories" AS table_name, COUNT(*) AS row_count FROM categories;
SELECT"customers" AS table_name, COUNT(*) AS row_count FROM customers;
SELECT"order_items" AS table_name, COUNT(*) AS row_count FROM order_items;
SELECT"orders" AS table_name, COUNT(*) AS row_count FROM orders;
SELECT"payments" AS table_name, COUNT(*) AS row_count FROM payments;
SELECT"products" AS table_name, COUNT(*) AS row_count FROM products;
SELECT"returns" AS table_name, COUNT(*) AS row_count FROM returns;
SELECT"reviews" AS table_name, COUNT(*) AS row_count FROM reviews;
SELECT"shipments" AS table_name, COUNT(*) AS row_count FROM shipments;
SELECT"suppliers" AS table_name, COUNT(*) AS row_count FROM suppliers;