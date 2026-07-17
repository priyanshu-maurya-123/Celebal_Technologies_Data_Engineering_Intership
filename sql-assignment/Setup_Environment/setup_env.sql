# sql assignment week2


## 1. Setup Environment

CREATE DATABASE Superstore_DB;
USE Superstore_DB;


## 2. Create Tables

  
CREATE TABLE customers (
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);

CREATE TABLE products (
    product_id VARCHAR(20),
    product_name VARCHAR(255),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(20)
);

CREATE TABLE order_items (
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(10,2),
    profit DECIMAL(10,2)
);


# Indexing

-- Customers
CREATE INDEX idx_customers_segment
    ON customers(segment);

-- Products
CREATE INDEX idx_products_category
    ON products(category);

CREATE INDEX idx_products_sub_category
    ON products(sub_category);

CREATE INDEX idx_products_category_subcategory
    ON products(category, sub_category);

-- Orders
CREATE INDEX idx_orders_customer_id
    ON orders(customer_id);

CREATE INDEX idx_orders_order_date
    ON orders(order_date);

CREATE INDEX idx_orders_ship_date
    ON orders(ship_date);

CREATE INDEX idx_orders_region
    ON orders(region);

CREATE INDEX idx_orders_country_state_city
    ON orders(country, state, city);

CREATE INDEX idx_orders_order_id
    ON orders(order_id);

-- Order Items
CREATE INDEX idx_order_items_order_id
    ON order_items(order_id);

CREATE INDEX idx_order_items_product_id
    ON order_items(product_id);

CREATE INDEX idx_order_items_order_product
    ON order_items(order_id, product_id);



## 4. Load Data

CREATE TABLE staging (
    Row_ID INT,
    Order_ID VARCHAR(20),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(10),
    Region VARCHAR(20),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Sales VARCHAR(20),
    Quantity VARCHAR(10),
    Discount VARCHAR(10),
    Profit VARCHAR(20)
);




LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sample_Superstore.csv'
INTO TABLE staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode,
 Customer_ID, Customer_Name, Segment,
 Country, City, State, Postal_Code, Region,
 Product_ID, Category, Sub_Category, Product_Name,
 Sales, Quantity, Discount, Profit);
 
 
INSERT INTO customers (customer_id,customer_name, segment)
SELECT  customer_id,customer_name, segment
FROM staging;

select * from customers;


INSERT INTO products (product_id,product_name, category, sub_category)
SELECT  product_id,product_name, category, sub_category
FROM staging;


select * from products;


INSERT INTO orders (
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    country,
    city,
    state,
    postal_code,
    region
)
SELECT
    s.Order_ID,

    CASE
        WHEN s.Order_Date LIKE '%/%'
        THEN STR_TO_DATE(s.Order_Date, '%m/%d/%Y')
        ELSE STR_TO_DATE(s.Order_Date, '%d-%m-%Y')
    END,

    CASE
        WHEN s.Ship_Date LIKE '%/%'
        THEN STR_TO_DATE(s.Ship_Date, '%m/%d/%Y')
        ELSE STR_TO_DATE(s.Ship_Date, '%d-%m-%Y')
    END,

    s.Ship_Mode,

    (
        SELECT customer_id
        FROM customers
        WHERE customer_name = s.Customer_Name
        LIMIT 1
    ) AS customer_id,

    s.Country,
    s.City,
    s.State,
    s.Postal_Code,
    s.Region

FROM staging s;

SELECT * FROM orders;

INSERT INTO order_items (
    order_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    Order_ID,
    Product_ID,
    CAST(Sales AS DECIMAL(10,2)),
    Quantity,
    CAST(Discount AS DECIMAL(10,2)),
    CAST(Profit AS DECIMAL(10,2))
FROM staging;

SELECT * FROM order_items;



## 5. Validate Data

 SELECT
    (SELECT COUNT(*) FROM customers)   AS customers_count,
    (SELECT COUNT(*) FROM products)    AS products_count,
    (SELECT COUNT(*) FROM orders)      AS orders_count,
    (SELECT COUNT(*) FROM order_items) AS order_items_count;
