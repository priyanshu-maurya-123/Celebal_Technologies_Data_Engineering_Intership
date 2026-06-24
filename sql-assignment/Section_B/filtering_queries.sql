
/* -----------------------------------------------------
   Customer Filtering
   ----------------------------------------------------- */

/* Retrieve customers belonging to the Consumer segment */
SELECT *
FROM customers
WHERE segment = 'Consumer';


/* -----------------------------------------------------
   Product Filtering
   ----------------------------------------------------- */

/* Retrieve products in the Furniture category */
SELECT *
FROM products
WHERE category = 'Furniture';

/* Retrieve products in the Office Supplies category */
SELECT *
FROM products
WHERE category = 'Office Supplies';


/* -----------------------------------------------------
   Order Filtering
   ----------------------------------------------------- */

/* Retrieve orders from the West region */
SELECT *
FROM orders
WHERE region = 'West';

/* Retrieve orders placed in California */
SELECT *
FROM orders
WHERE state = 'California';

/* Retrieve orders placed on or after January 1, 2017 */
SELECT *
FROM orders
WHERE order_date >= '2017-01-01';

/* Retrieve orders from either the East or West region */
SELECT *
FROM orders
WHERE region IN ('East', 'West');


/* -----------------------------------------------------
   Order Item Filtering
   ----------------------------------------------------- */

/* Retrieve order items with profit greater than 100 */
SELECT *
FROM order_items
WHERE profit > 100;

/* Retrieve order items that received a discount */
SELECT *
FROM order_items
WHERE discount > 0;

/* Retrieve order items with sales between 100 and 500 */
SELECT *
FROM order_items
WHERE sales BETWEEN 100 AND 500;