
/* -----------------------------------------------------
   INNER JOIN 
   ----------------------------------------------------- */

/* Retrieve customer names along with their order IDs
   and order dates. Only customers with matching orders
   will be returned. */
SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

/* Retrieve product names along with sales and quantity
   information. Only products that appear in order items
   will be returned. */
SELECT
    p.product_name,
    oi.sales,
    oi.quantity
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id;

/* Retrieve order details along with the corresponding
   customer name and region. Only matching records from
   both tables will be returned. */
SELECT
    o.order_id,
    c.customer_name,
    o.region
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;


/* -----------------------------------------------------
   LEFT JOIN 
   ----------------------------------------------------- */


SELECT
    c.customer_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

/* Retrieve all products and their sales information.
   Products without corresponding order items will
   still appear, with NULL values for sales. */
SELECT
    p.product_name,
    oi.sales
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id;


