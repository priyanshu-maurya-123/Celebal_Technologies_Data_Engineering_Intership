
/* View the structure of the customers table */
DESC customers;

/* View the structure of the products table */
DESC products;

/* View the structure of the orders table */
DESC orders;

/* View the structure of the order_items table */
DESC order_items;


/* Display all records from the customers table */
SELECT *
FROM customers;

/* Display all records from the products table */
SELECT *
FROM products;

/* Display all records from the orders table */
SELECT *
FROM orders;

/* Display all records from the order_items table */
SELECT *
FROM order_items;


/* Retrieve the first 10 customer records */
SELECT *
FROM customers
LIMIT 10;


/* Show indexes defined on the customers table */
SHOW INDEX
FROM customers;

/* Show indexes defined on the products table */
SHOW INDEX
FROM products;

/* Show indexes defined on the orders table */
SHOW INDEX
FROM orders;

/* Show indexes defined on the order_items table */
SHOW INDEX
FROM order_items;


/* List all unique customer segments */
SELECT DISTINCT segment
FROM customers;