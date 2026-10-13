/*
==========================================================
E-COMMERCE SALES & CUSTOMER ANALYTICS
TABLE RELATIONSHIPS
==========================================================

1. CUSTOMERS → ORDERS
   Relationship: One-to-Many (1:N)
   PK: customers.customer_id
   FK: orders.customer_id

   One customer can place many orders.
   Each order belongs to one customer.


2. ORDERS → ORDER_ITEMS
   Relationship: One-to-Many (1:N)
   PK: orders.order_id
   FK: order_items.order_id

   One order can contain multiple products.
   Each order_item belongs to one order.


3. PRODUCTS → ORDER_ITEMS
   Relationship: One-to-Many (1:N)
   PK: products.product_id
   FK: order_items.product_id

   One product can appear in many order_items.
   Each order_item refers to one product.


4. CATEGORIES → PRODUCTS
   Relationship: One-to-Many (1:N)
   PK: categories.category_id
   FK: products.category_id

   One category can contain many products.
   Each product belongs to one category.


5. SUPPLIERS → PRODUCTS
   Relationship: One-to-Many (1:N)
   PK: suppliers.supplier_id
   FK: products.supplier_id

   One supplier can supply many products.
   Each product belongs to one supplier.


6. ORDERS → PAYMENTS
   Relationship: One-to-One (1:1)
   PK: orders.order_id
   FK: payments.order_id

   Each order has one payment record.
   Each payment belongs to one order.


7. ORDERS → SHIPMENTS
   Relationship: One-to-One (1:1)
   PK: orders.order_id
   FK: shipments.order_id

   Each order has one shipment record.
   Each shipment belongs to one order.


8. ORDER_ITEMS → RETURNS
   Relationship: One-to-Many (1:N)
   PK: order_items.order_item_id
   FK: returns.order_item_id

   One order item can have return records.
   Each return belongs to one order item.


9. CUSTOMERS → REVIEWS
   Relationship: One-to-Many (1:N)
   PK: customers.customer_id
   FK: reviews.customer_id

   One customer can write many reviews.
   Each review belongs to one customer.


10. PRODUCTS → REVIEWS
    Relationship: One-to-Many (1:N)
    PK: products.product_id
    FK: reviews.product_id

    One product can receive many reviews.
    Each review belongs to one product.

==========================================================
*/