USE ecommerce_analysis;

-- business KPI views
CREATE VIEW vw_business_kpis AS 
	SELECT 
		ROUND(SUM(oi.quantity * oi.unit_price - oi.discount),2) AS total_revenue,
		COUNT(DISTINCT o.order_id) AS total_order,
        COUNT(DISTINCT o.customer_id) AS ordering_customers,
        SUM(oi.quantity) AS total_quantity_sold,
        ROUND(SUM(oi.quantity * oi.unit_price - oi.discount) / NULLIF(COUNT(DISTINCT o.order_id),0),2) AS average_order_value
	FROM orders o
    JOIN order_items oi
		ON oi.order_id = o.order_id;
        
SELECT * FROM vw_business_kpis;