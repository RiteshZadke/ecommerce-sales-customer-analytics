USE ecommerce_analysis;

SELECT
    o.order_id,
    o.order_date,
    SUM(oi.quantity * oi.unit_price - oi.discount) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_date >= '2025-01-01'
  AND o.order_date < '2026-01-01'
GROUP BY
    o.order_id,
    o.order_date;
    
EXPLAIN
SELECT
    o.order_id,
    o.order_date,
    SUM(oi.quantity * oi.unit_price - oi.discount) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_date >= '2025-01-01'
  AND o.order_date < '2026-01-01'
GROUP BY
    o.order_id,
    o.order_date;
    
SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;

CREATE INDEX idx_orders_order_date
ON orders(order_date);

SELECT
    o.order_id,
    o.order_date,
    oi_revenue.revenue
FROM (
    SELECT order_id, order_date
    FROM orders
    WHERE order_date >= '2025-01-01'
      AND order_date < '2026-01-01'
) o
JOIN (
    SELECT
        order_id,
        SUM(quantity * unit_price - discount) AS revenue
    FROM order_items
    GROUP BY order_id
) oi_revenue
    ON o.order_id = oi_revenue.order_id;
    
EXPLAIN ANALYZE
SELECT
    o.order_id,
    o.order_date,
    SUM(oi.quantity * oi.unit_price - oi.discount) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_date >= '2025-01-01'
  AND o.order_date < '2026-01-01'
GROUP BY
    o.order_id,
    o.order_date;
    
    