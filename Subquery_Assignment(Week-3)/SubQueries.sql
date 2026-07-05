#--------------- Step 1: Setup Data ----------------------

CREATE DATABASE superstore;
USE superstore;

SELECT * FROM superstore_raw;
SELECT COUNT(*) FROM superstore_raw;


#--------------  Create customers Table  -----------------
	
CREATE TABLE customers (
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50)
);



INSERT INTO customers (
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Postal_Code,
    Region
)
SELECT
    `Customer ID`,
    `Customer Name`,
    MAX(Segment),
    MAX(Country),
    MAX(City),
    MAX(State),
    MAX(`Postal Code`),
    MAX(Region)
FROM superstore_raw
GROUP BY
    `Customer ID`,
    `Customer Name`;

TRUNCATE TABLE customers;

SELECT COUNT(*) FROM customers;


#--------------  Create products Table  -----------------

CREATE TABLE products (
    Product_ID VARCHAR(30),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200)
);



INSERT INTO products (
    Product_ID,
    Category,
    Sub_Category,
    Product_Name
)
SELECT DISTINCT
    `Product ID`,
    Category,
    `Sub-Category`,
    `Product Name`
FROM superstore_raw;


SELECT COUNT(*) FROM products;


#--------------  Create orders Table  -----------------

CREATE TABLE orders (
    Order_ID VARCHAR(30),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Product_ID VARCHAR(30),
    Sales DECIMAL(10,4),
    Quantity INT,
    Discount DECIMAL(10,4),
    Profit DECIMAL(10,4)
);


INSERT INTO orders (
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_ID,
    Product_ID,
    Sales,
    Quantity,
    Discount,
    Profit
)
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;


SELECT COUNT(*) FROM orders;


#----------- Step 2: Perform Required Queries ---------------


#------ Find all orders where sales are greater than the average sales.

SELECT *
FROM orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM orders
);


#--------------Find the highest sales order for each customer

SELECT *
FROM orders o
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM orders
    WHERE Customer_ID = o.Customer_ID
);


#---------Calculate total sales for each customer

WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)
SELECT *
FROM CustomerSales;

#--------Find customers whose total sales are above average.

WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)
SELECT *
FROM CustomerSales
WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)
    FROM CustomerSales
);

#----------Rank all customers based on total sales.

WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)
SELECT
    Customer_ID,
    Total_Sales,
    RANK() OVER (ORDER BY Total_Sales DESC) AS Customer_Rank
FROM CustomerSales;


#------------Assign row numbers to each order within a customer.

SELECT
    Order_ID,
    Customer_ID,
    Sales,
    ROW_NUMBER() OVER
    (
        PARTITION BY Customer_ID
        ORDER BY Sales DESC
    ) AS `Row Number`
FROM orders;


#----------------Display top 3 customers based on total sales.

WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)
SELECT *
FROM
(
    SELECT
        Customer_ID,
        Total_Sales,
        RANK() OVER (ORDER BY Total_Sales DESC) AS Customer_Rank
    FROM CustomerSales
) x
WHERE Customer_Rank <= 3;


#---------Step 3: Final Combined Query 

WITH CustomerSales AS
(
    SELECT
        o.Customer_ID,
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY o.Customer_ID, c.Customer_Name
)
SELECT
    Customer_Name,
    Total_Sales,
    RANK() OVER (ORDER BY Total_Sales DESC) AS Customer_Rank
FROM CustomerSales;

#---------Mini Project: Customer Sales Insights 

#---Who are the top 5 customers?  

WITH CustomerSales AS
(
    SELECT
        o.Customer_ID,
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY o.Customer_ID, c.Customer_Name
)
SELECT *
FROM CustomerSales
ORDER BY Total_Sales DESC
LIMIT 5;

#----Who are the bottom 5 customers?  

WITH CustomerSales AS
(
    SELECT
        o.Customer_ID,
        c.Customer_Name,
        SUM(o.Sales) AS Total_Sales
    FROM orders o
    JOIN customers c
        ON o.Customer_ID = c.Customer_ID
    GROUP BY o.Customer_ID, c.Customer_Name
)
SELECT *
FROM CustomerSales
ORDER BY Total_Sales ASC
LIMIT 5;

#------Which customers made only one order?  

SELECT
    Customer_ID,
    COUNT(Order_ID) AS Total_Orders
FROM orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID) = 1;

#-----Which customers have above-average sales?

WITH CustomerSales AS
(
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY Customer_ID
)
SELECT *
FROM CustomerSales
WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)
    FROM CustomerSales
);


#------------What is the highest order value per customer? 

 SELECT
    Customer_ID,
    MAX(Sales) AS Highest_Order_Value
FROM orders
GROUP BY Customer_ID;

