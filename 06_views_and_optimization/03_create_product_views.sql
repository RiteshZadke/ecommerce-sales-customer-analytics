-- product performance views

USE ecommerce_analysis;
DROP VIEW IF exists product_performance;

CREATE VIEW product_performance AS 
	WITH product_details AS (
		SELECT 
			c.category_id,
			p.product_id,
			p.product_name,
			ROUND(SUM(oi.quantity * oi.unit_price - discount),2) AS total_revenue,
			SUM(oi.quantity) AS unit_sold
		FROM products p
		LEFT JOIN order_items oi
			ON p.product_id = oi.product_id
		JOIN categories c
			ON c.category_id = p.category_id
		GROUP BY p.product_id,
				p.product_name
	)
    
    SELECT 
		c.category_id,
        c.category_name,
        pd.product_id,
        pd.product_name,
        pd.total_revenue,
        pd.unit_sold,
        DENSE_RANK() OVER(PARTITION BY c.category_id ORDER BY total_revenue DESC) AS product_ranking
	FROM categories c
    LEFT JOIN product_details pd
		ON c.category_id = pd.category_id;

SELECT * FROM product_performance;