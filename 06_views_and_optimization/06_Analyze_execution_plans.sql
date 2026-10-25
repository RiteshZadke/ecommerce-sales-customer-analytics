USE ecommerce_analysis;

EXPLAIN 
SELECT *
FROM orders
WHERE order_id = 1001;

-- ===== analyze a JOIN ============

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
  
  CREATE INDEX idx_orders_status_date
ON orders(order_status, order_date);

EXPLAIN ANALYZE
SELECT
    o.order_id,
    o.order_date,
    oi.product_id,
    oi.quantity
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_id = 1001;

/*
TASK 6: EXECUTION PLAN ANALYSIS

Query 1: Primary-key lookup
- Access type:
- Chosen index:
- Estimated rows:
- Interpretation:

Query 2: JOIN
- Access type for orders:
- Access type for order_items:
- Chosen indexes:
- Estimated rows:
- Join strategy:

Query 3: Status and date filter
- Access type before index:
- Access type after index:
- Chosen index after index:
- Estimated rows before and after:
- Conclusion:
*/