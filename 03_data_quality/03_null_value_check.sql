-- ============================================================
-- . NULL VALUE CHECKS
-- ============================================================

SELECT
    COUNT(*) AS total_rows,
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(first_name IS NULL) AS null_first_name,
    SUM(last_name IS NULL) AS null_last_name,
    SUM(email IS NULL) AS null_email,
    SUM(phone IS NULL) AS null_phone
FROM customers;

SELECT
    COUNT(*) AS total_rows,
    SUM(category_id IS NULL) AS null_category_id,
    SUM(category_name IS NULL) AS null_category_name
FROM categories;

SELECT
    COUNT(*) AS total_rows,
    SUM(order_item_id IS NULL) AS null_order_item_id,
    SUM(order_id IS NULL) AS null_order_id,
    SUM(product_id IS NULL) AS null_product_id,
    SUM(quantity IS NULL) AS null_quantity,
    SUM(unit_price IS NULL) AS null_unit_price,
    SUM(discount IS NULL) AS null_discount
FROM order_items;

SELECT
    COUNT(*) AS total_rows,
    SUM(order_id IS NULL) AS null_order_id,
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(order_status IS NULL) AS null_order_status,
    SUM(shipping_city IS NULL) AS null_shipping_city,
    SUM(shipping_state IS NULL) AS shipping_state,
    SUM(shipping_cost IS NULL) AS shipping_cost
FROM orders;

SELECT
    COUNT(*) AS total_rows,
    SUM(payment_id IS NULL) AS payment_id,
    SUM(order_id IS NULL) AS null_order_id,
    SUM(payment_date IS NULL) AS null_payment_date,
    SUM(payment_method IS NULL) AS null_payment_method,
    SUM(payment_status IS NULL) AS null_payment_status,
    SUM(amount IS NULL) AS null_amount   
FROM payments;

SELECT
    COUNT(*) AS total_rows,
    SUM(product_id IS NULL) AS null_product_id,
    SUM(product_name IS NULL) AS null_product_name,
    SUM(category_id IS NULL) AS null_category_id,
    SUM(supplier_id IS NULL) AS null_supplier_id,
    SUM(price IS NULL) AS null_price,
    SUM(cost_price IS NULL) AS null_cost_price,
    SUM(stock_quantity IS NULL) AS null_stock_quantity,
    SUM(product_rating IS NULL) AS null_product_rating,
    SUM(created_at IS NULL) AS null_created_at
FROM products;

SELECT 
	COUNT(*) AS total_row,
    SUM(return_id IS NULL) AS null_return_id,
    SUM(order_item_id IS NULL) AS null_order_item_id,
    SUM(return_date IS NULL) AS null_return_date,
    SUM(return_quantity IS NULL) AS null_return_quantity,
    SUM(return_reason IS NULL) AS null_return_reason,
    SUM(refund_amount IS NULL) AS null_refund_amount,
    SUM(return_status IS NULL) AS null_return_status
FROM returns;
    
SELECT 
	COUNT(*) AS total_row,
    SUM(return_id IS NULL) AS null_return_id,
    SUM(order_item_id IS NULL) AS null_order_item_id,
    SUM(return_date IS NULL) AS null_return_date,
    SUM(return_quantity IS NULL) AS null_return_quantity,
    SUM(return_reason IS NULL) AS null_return_reason,
    SUM(refund_amount IS NULL) AS null_refund_amount,
    SUM(return_status IS NULL) AS null_return_status
FROM returns;

SELECT 
	COUNT(*) AS total_row,
    SUM(return_id IS NULL) AS null_return_id,
    SUM(order_item_id IS NULL) AS null_order_item_id,
    SUM(return_date IS NULL) AS null_return_date,
    SUM(return_quantity IS NULL) AS null_return_quantity,
    SUM(return_reason IS NULL) AS null_return_reason,
    SUM(refund_amount IS NULL) AS null_refund_amount,
    SUM(return_status IS NULL) AS null_return_status
FROM returns;

SELECT 
	COUNT(*) AS total_row,
    SUM(review_id IS NULL) AS null_review_id,
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(product_id IS NULL) AS null_product_id,
    SUM(rating IS NULL) AS null_rating,
    SUM(review_text IS NULL) AS null_review_text,
    SUM(review_date IS NULL) AS null_review_date
FROM reviews;

SELECT 
	COUNT(*) AS total_row,
    SUM(shipment_id IS NULL) AS null_shipment_id,
    SUM(order_id IS NULL) AS null_order_id,
    SUM(shipment_date IS NULL) AS null_shipment_date,
    SUM(expected_delivery_date IS NULL) AS null_expected_delivery_date,
    SUM(actual_delivery_date IS NULL) AS null_actual_delivery_date,
    SUM(delivery_status IS NULL) AS null_delivery_status,
    SUM(delivery_partner IS NULL) AS null_delivery_partner
FROM shipments;

SELECT 
	COUNT(*) AS total_row,
    SUM(shipment_id IS NULL) AS null_shipment_id,
    SUM(order_id IS NULL) AS null_order_id,
    SUM(shipment_date IS NULL) AS null_shipment_date,
    SUM(expected_delivery_date IS NULL) AS null_expected_delivery_date,
    SUM(actual_delivery_date IS NULL) AS null_actual_delivery_date,
    SUM(delivery_status IS NULL) AS null_delivery_status,
    SUM(delivery_partner IS NULL) AS null_delivery_partner
FROM shipments;

SELECT 
	COUNT(*) AS total_row,
    SUM(supplier_id IS NULL) AS null_supplier_id,
    SUM(supplier_name IS NULL) AS null_supplier_name,
    SUM(city IS NULL) AS null_city,
    SUM(state IS NULL) AS null_state,
    SUM(contact_email IS NULL) AS null_contact_email
FROM suppliers;