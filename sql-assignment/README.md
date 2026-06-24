# WEEK2_CEI – Sales Data Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing sales data using SQL by applying filtering, aggregation, joins, conditional logic, and transaction management techniques. The objective is to explore business data, generate meaningful insights, and strengthen practical SQL skills through real-world analytical queries.

## 🎯 Objective

Analyze sales data using SQL to:

* Explore database schema and data
* Apply filtering conditions using `WHERE`
* Perform aggregations using `GROUP BY`
* Combine tables using joins
* Implement conditional logic using `CASE`
* Demonstrate transaction control using `COMMIT`, `ROLLBACK`, and `SAVEPOINT`
* Generate business insights from sales data
* Validate data quality and query results

---

## 🗄️ Database Schema

The project uses four related tables:

### 1. Customers

Stores customer information such as customer ID, name, and segment.

### 2. Products

Stores product details including category and product information.

### 3. Orders

Contains order-level details such as order date, region, and state.

### 4. Order Items

Stores transactional data including sales, quantity, profit, and discounts.

---

## 🚀 Project Workflow

### Step 1: Environment Setup

* Create a SQL database.
* Open MySQL, PostgreSQL, or SQLite.

### Step 2: Create Tables

Execute all table creation scripts in the following order:

1. customers
2. products
3. orders
4. order_items

### Step 3: Create Indexes

Create indexes to improve query performance.

### Step 4: Load Data

Insert data into all tables and verify successful loading.

### Step 5: Validate Data

Use `COUNT(*)` and sample queries to ensure data integrity.

---

## 📂 Project Structure

```text
sql-assignment/
│
├── Section_A/
│   └── basic_queries.sql
│
├── Section_B/
│   └── filtering_queries.sql
│
├── Section_C/
│   └── aggregation_queries.sql
│
├── Section_D/
│   └── joins_queries.sql
│
├── Section_E/
│   └── advanced_queries.sql
│
└── README.md
```

---

## 📖 Sections Covered

### Section A – Basics

* Table structure inspection (`DESC`)
* Viewing sample records (`SELECT`)
* Index inspection (`SHOW INDEX`)
* Retrieving distinct values

**Skills Used**

* SELECT
* LIMIT
* DISTINCT
* DESCRIBE

---

### Section B – Filtering

Applied filtering conditions to retrieve specific records.

**Examples**

* Customers by segment
* Products by category
* Orders by region
* Orders by state
* Date-based filtering
* Sales and profit filtering

**Skills Used**

* WHERE
* IN
* BETWEEN
* Comparison Operators

---

### Section C – Aggregation

Performed summary calculations and grouped analysis.

**Examples**

* Total sales
* Total profit
* Total quantity
* Average sales
* Average profit
* Category-wise sales
* Region-wise profit

**Skills Used**

* SUM()
* AVG()
* COUNT()
* MAX()
* MIN()
* GROUP BY

---

### Section D – Joins

Combined data from multiple tables to generate meaningful business information.

**Examples**

* Customer orders
* Product sales details
* Order-region analysis
* Customer order history

**Skills Used**

* INNER JOIN
* LEFT JOIN

---

### Section E – Advanced SQL

#### CASE Statements

Used conditional logic to categorize:

* Profit status
* Discount levels
* Sales categories
* Regional performance

#### Transactions

Implemented transaction management using:

* START TRANSACTION
* COMMIT
* ROLLBACK
* SAVEPOINT

---

## 📊 Sample Business Insights

### Customer Analysis

* Customer segments can be analyzed to identify the largest customer group.
* Segment-wise distribution helps understand customer behavior.

### Product Analysis

* Product categories contribute differently to overall sales.
* Category-level aggregation helps identify high-performing categories.

### Regional Analysis

* Sales and profit vary across regions.
* Regional performance classification helps identify growth opportunities.

### Profitability Analysis

* Orders can be classified into profitable and loss-making categories.
* Profit tracking assists in business decision-making.

---

## ✅ Data Validation Performed

The following validation checks were completed:

* Table structure verification
* Record count verification
* Index validation
* Duplicate checks
* Data quality checks
* Query result verification

---

## 🛠 SQL Concepts Demonstrated

* Data Exploration
* Filtering and Conditions
* Aggregation Functions
* Grouping Data
* Joins
* Conditional Logic
* Transactions
* Query Optimization
* Data Validation

---

## 📈 Learning Outcomes

After completing this project, I gained hands-on experience in:

* Writing efficient SQL queries
* Analyzing sales datasets
* Performing business-focused data analysis
* Using joins and aggregations effectively
* Managing database transactions safely
* Organizing SQL projects using industry-standard practices

---

## 📌 Conclusion

This project demonstrates practical SQL skills through end-to-end sales data analysis. It covers database exploration, filtering, aggregations, joins, conditional logic, and transaction management while generating meaningful business insights from structured sales data.


## Author
Priyanshu Maurya