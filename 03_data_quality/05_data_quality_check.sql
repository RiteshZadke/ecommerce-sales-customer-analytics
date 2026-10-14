-- ============================================================
-- . PRODUCT DATA QUALITY
-- ============================================================

-- Invalid selling price
SELECT * 
FROM products
WHERE price <= 0;

-- Invalid cost price
SELECT *
FROM products
WHERE cost_price <= 0;

-- Cost price greater than selling price
SELECT *
FROM products
WHERE cost_price > price;

-- Invalid stock quantity
SELECT * 
FROM products
WHERE stock_quantity < 0;

-- Invalid product rating
SELECT *
FROM products
WHERE product_rating < 1 OR product_rating > 5;

-- ============================================================
-- . ORDER ITEM DATA QUALITY
-- ============================================================

-- Invalid quantity
SELECT *
FROM order_items
WHERE quantity <= 0;

-- Invalid unit price
SELECT *
FROM order_items
WHERE unit_price <= 0;

-- Invalid discount
SELECT *
FROM order_items
WHERE discount < 0;

-- Discount greater than unit price
SELECT *
FROM order_items
WHERE discount > unit_price;

-- ============================================================
-- . REVIEW DATA QUALITY
-- ============================================================

-- Invalid review rating
SELECT *
FROM reviews
WHERE rating <1 OR rating > 5;

-- ============================================================
-- . RETURN DATA QUALITY
-- ============================================================

-- Invalid return quantity
SELECT *
FROM returns
WHERE return_quantity <= 0;


-- Invalid refund amount
SELECT *
FROM returns
WHERE refund_amount < 0;

-- ============================================================
-- . PAYMENT DATA QUALITY
-- ============================================================
-- Invalid payment amount
SELECT *
FROM payments
WHERE amount <= 0;