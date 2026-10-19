-- =====================================================================================================================
-- 											E. Operations
-- =====================================================================================================================
USE ecommerce_analysis;
-- Order status distribution
SELECT 
	order_status,
    COUNT(*) AS total_order
FROM orders
GROUP BY order_status
ORDER BY total_order DESC;

-- Payment method distribution
SELECT
    payment_method,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_method
ORDER BY total_payments DESC;

-- Shipment status
SELECT 
	delivery_status,
    COUNT(*) AS total_delivarys
FROM shipments
GROUP BY delivery_status    
ORDER BY total_delivarys DESC;

-- Average delivery time
SELECT 
	ROUND(AVG(DATEDIFF(actual_delivery_date, shipment_date)),2) AS average_delivery_date
FROM shipments
WHERE actual_delivery_date IS NOT NULL AND shipment_date IS NOT NULL;

-- Delayed shipments
SELECT 
	shipment_id,
    order_id,
    delivery_status
FROM shipments
WHERE delivery_status = "Delayed";

-- Cancellation rate
SELECT
	COUNT(*) AS total_orders,
    SUM(CASE 
			WHEN LOWER(order_status) = 'cancelled' 
            THEN 1
            ELSE 0
		END
		) AS cancelled_orders,
	ROUND(SUM(
			CASE 
				WHEN LOWER(order_status) = "cancelled"
                THEN 1
                ELSE 0
			END
    )* 100.0 /NULLIF(COUNT(*),0),2) AS cancellation_rate_percentage
FROM orders;

--  Return Rate
WITH total_orders AS (
    SELECT COUNT(*) AS total_orders
    FROM orders
),
returned_orders AS (
    SELECT COUNT(DISTINCT oi.order_id) AS returned_orders
    FROM order_items oi
    JOIN returns r
        ON oi.order_item_id = r.order_item_id
)
SELECT
    t.total_orders,
    r.returned_orders,
    ROUND(
        r.returned_orders * 100.0
        / NULLIF(t.total_orders, 0),
        2
    ) AS return_rate_percentage
FROM total_orders t
CROSS JOIN returned_orders r;

-- Refund amount
SELECT 
	SUM(refund_amount) AS total_refund_amount,
    AVG(refund_amount) AS avg_refund_amount
FROM returns;