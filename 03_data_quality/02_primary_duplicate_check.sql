-- ============================================================
-- . PRIMARY KEY DUPLICATE CHECKS
-- ============================================================

SELECT customer_id, COUNT(customer_id) AS cnt
FROM customers 
GROUP BY customer_id 
HAVING COUNT(customer_id)>1;


SELECT category_id, COUNT(category_id) AS cnt
FROM categories 
GROUP BY category_id
HAVING COUNT(category_id) > 1;

SELECT order_item_id, COUNT(order_item_id) AS cnt
FROM order_items 
GROUP BY order_item_id
HAVING COUNT(order_item_id) > 1;

SELECT order_id, COUNT(order_id) AS cnt
FROM orders 
GROUP BY order_id
HAVING COUNT(order_id) > 1;

SELECT payment_id, COUNT(payment_id) AS cnt
FROM payments 
GROUP BY payment_id
HAVING COUNT(payment_id) > 1;

SELECT product_id, COUNT(product_id) AS cnt
FROM products
GROUP BY product_id
HAVING COUNT(product_id) > 1;

SELECT return_id, COUNT(return_id) AS cnt
FROM returns
GROUP BY return_id
HAVING COUNT(return_id) > 1;

SELECT review_id, COUNT(review_id) AS cnt
FROM reviews 
GROUP BY review_id
HAVING COUNT(review_id) > 1;

SELECT shipment_id, COUNT(shipment_id) AS cnt
FROM shipments 
GROUP BY shipment_id
HAVING COUNT(shipment_id) > 1;

SELECT supplier_id, COUNT(supplier_id) AS cnt
FROM suppliers 
GROUP BY supplier_id
HAVING COUNT(supplier_id) > 1;


-- ============================================================
-- . UNIQUE EMAIL CHECK
-- ============================================================

SELECT
    email,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;


-- ============================================================
-- . UNIQUE PHONE CHECK 
-- ============================================================

SELECT
    phone,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY phone
HAVING COUNT(*) > 1;
