SHOW INDEX FROM customers;
SHOW INDEX FROM categories;
SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;
SHOW INDEX FROM payments;
SHOW INDEX FROM products;
SHOW INDEX FROM returns;
SHOW INDEX FROM reviews;
SHOW INDEX FROM shipments;
SHOW INDEX FROM suppliers;

EXPLAIN
SELECT
    o.order_id,
    o.order_date,
    oi.product_id,
    oi.quantity
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_id = 1001;

EXPLAIN
SELECT
    order_id,
    order_date,
    order_status
FROM orders
WHERE order_status = 'Delivered'
  AND order_date >= '2025-01-01'
  AND order_date < '2026-01-01';