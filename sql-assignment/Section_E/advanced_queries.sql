

/* -----------------------------------------------------
   CASE Statement Examples
   ----------------------------------------------------- */

/* Classify each order item based on profit amount */
SELECT
    order_id,
    profit,
    CASE
        WHEN profit > 100 THEN 'High Profit'
        WHEN profit > 0 THEN 'Profit'
        ELSE 'Loss'
    END AS profit_status
FROM order_items;

/* Categorize discounts into different levels */
SELECT
    order_id,
    discount,
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_level
FROM order_items;

/* Classify sales values into High, Medium, and Low categories */
SELECT
    sales,
    CASE
        WHEN sales > 1000 THEN 'High Sale'
        WHEN sales > 500 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END AS sales_category
FROM order_items;

/* Evaluate regional performance based on total sales */
SELECT
    o.region,
    SUM(oi.sales) AS total_sales,
    CASE
        WHEN SUM(oi.sales) > 100000 THEN 'Excellent'
        WHEN SUM(oi.sales) > 50000 THEN 'Good'
        ELSE 'Average'
    END AS performance
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.region;


/* -----------------------------------------------------
   Transaction Examples
   ----------------------------------------------------- */

/* Begin a transaction and permanently update discount */
START TRANSACTION;

UPDATE order_items
SET discount = 0.15
WHERE order_id = 'CA-2017-152156';

COMMIT;


/* Begin a transaction and test an update.
   Changes are undone using ROLLBACK. */
START TRANSACTION;

UPDATE order_items
SET profit = profit - 100
WHERE order_id = 'CA-2017-152156';

ROLLBACK;


/* Demonstrate SAVEPOINT usage within a transaction */
START TRANSACTION;

/* First update */
UPDATE order_items
SET discount = 0.10
WHERE order_id = 'CA-2017-152156';

/* Create a savepoint */
SAVEPOINT sp1;

/* Second update */
UPDATE order_items
SET discount = 0.20
WHERE order_id = 'CA-2017-152156';

/* Revert to the savepoint, undoing only the second update */
ROLLBACK TO sp1;

/* Commit the remaining transaction changes */
COMMIT;