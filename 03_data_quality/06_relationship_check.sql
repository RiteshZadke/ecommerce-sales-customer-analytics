
-- ============================================================
--  PAYMENT RELATIONSHIP CHECK
-- ============================================================
SELECT 
	order_id,
    COUNT(*) AS payment_count
FROM payments
GROUP BY order_id
HAVING COUNT(*) > 1;

-- ============================================================
--  SHIPMENT RELATIONSHIP CHECK
-- ============================================================
SELECT
    order_id,
    COUNT(*) AS shipment_count
FROM shipments
GROUP BY order_id
HAVING COUNT(*) > 1;