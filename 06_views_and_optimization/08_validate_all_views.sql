USE ecommerce_analysis;

-- 1. Business KPIs
SELECT * FROM vw_business_kpis;

-- 2. Customer segmentation
SELECT * FROM vw_customers_segments LIMIT 10;

-- 3. Product performance
SELECT * FROM product_performance LIMIT 10;

-- 4. Profitability
SELECT * FROM profitability_view LIMIT 10;



-- Reconcile business KPIs with the original query
WITH original_kpis AS (
    SELECT
        ROUND(
            SUM(oi.quantity * oi.unit_price - oi.discount), 2
        ) AS total_revenue,
        COUNT(DISTINCT o.order_id) AS total_orders,
        COUNT(DISTINCT o.customer_id) AS ordering_customers,
        SUM(oi.quantity) AS total_quantity_sold,
        ROUND(
            SUM(oi.quantity * oi.unit_price - oi.discount)
            / NULLIF(COUNT(DISTINCT o.order_id), 0),
            2
        ) AS average_order_value
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
),
view_kpis AS (
    SELECT *
    FROM vw_business_kpis
)
SELECT
    'total_revenue' AS metric,
    original_kpis.total_revenue AS original_value,
    view_kpis.total_revenue AS view_value,
    ROUND(
        original_kpis.total_revenue - view_kpis.total_revenue, 2
    ) AS difference
FROM original_kpis
CROSS JOIN view_kpis

UNION ALL

SELECT
    'total_orders',
    original_kpis.total_orders,
    view_kpis.total_order,
    original_kpis.total_orders - view_kpis.total_order
FROM original_kpis
CROSS JOIN view_kpis

UNION ALL

SELECT
    'ordering_customers',
    original_kpis.ordering_customers,
    view_kpis.ordering_customers,
    original_kpis.ordering_customers - view_kpis.ordering_customers
FROM original_kpis
CROSS JOIN view_kpis

UNION ALL

SELECT
    'total_quantity_sold',
    original_kpis.total_quantity_sold,
    view_kpis.total_quantity_sold,
    original_kpis.total_quantity_sold - view_kpis.total_quantity_sold
FROM original_kpis
CROSS JOIN view_kpis

UNION ALL

SELECT
    'average_order_value',
    original_kpis.average_order_value,
    view_kpis.average_order_value,
    ROUND(
        original_kpis.average_order_value
        - view_kpis.average_order_value, 2
    )
FROM original_kpis
CROSS JOIN view_kpis;


-- Validate product performance and profitability

-- product revenue and units sold
WITH original_product_metrics AS (
    SELECT
        p.product_id,
        ROUND(
            SUM(oi.quantity * oi.unit_price - oi.discount), 2
        ) AS revenue,
        SUM(oi.quantity) AS units_sold
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id
)
SELECT
    v.product_id,
    v.product_name,
    v.total_revenue AS view_revenue,
    o.revenue AS original_revenue,
    v.unit_sold AS view_units_sold,
    o.units_sold AS original_units_sold
FROM product_performance v
JOIN original_product_metrics o
    ON v.product_id = o.product_id
WHERE ABS(v.total_revenue - o.revenue) > 0.01
   OR v.unit_sold <> o.units_sold;
   
-- profitability calculations
SELECT
    product_id,
    total_revenue,
    profit,
    margin,
    CASE
        WHEN total_revenue IS NULL THEN 'CHECK NULL REVENUE'
        WHEN total_revenue = 0 AND margin IS NULL
            THEN 'CHECK ZERO REVENUE'
        WHEN ABS(
            margin - profit / NULLIF(total_revenue, 0) * 100
        ) > 0.01
            THEN 'MARGIN MISMATCH'
        ELSE 'PASS'
    END AS validation_status
FROM profitability_view;

-- Validating customer segmentation
SELECT
    customer_segment,
    COUNT(*) AS customer_count
FROM vw_customers_segments
GROUP BY customer_segment
ORDER BY customer_count DESC;

SELECT
    v.customer_id,
    v.total_orders AS view_orders,
    o.actual_orders
FROM vw_customers_segments v
JOIN (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS actual_orders
    FROM orders
    GROUP BY customer_id
) o
    ON v.customer_id = o.customer_id
WHERE v.total_orders <> o.actual_orders;


-- Validating index and query optimization changes

USE ecommerce_analysis;

SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;

-- Inspect the plan for a date-filtered query
EXPLAIN
SELECT
    order_id,
    order_date,
    order_status
FROM orders
WHERE order_status = 'Delivered'
  AND order_date >= '2025-01-01'
  AND order_date < '2026-01-01';

-- Inspect the actual execution plan if supported
EXPLAIN ANALYZE
SELECT
    order_id,
    order_date,
    order_status
FROM orders
WHERE order_status = 'Delivered'
  AND order_date >= '2025-01-01'
  AND order_date < '2026-01-01';