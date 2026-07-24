# Week 6 -  Spark Assignment

## Objective

The objective of this assignment is to understand Apache Spark architecture, Lazy Evaluation, DataFrame transformations, filtering, schema handling, and optimized file formats such as CSV and Parquet. The assignment also demonstrates how to build simple Spark data processing pipelines using PySpark.

---

## Technologies Used

- Apache Spark
- PySpark
- Databricks Community/Free Edition
- Python

---

## Topics Covered

- Spark Architecture
  - Driver
  - Cluster Manager
  - Executors
- Lazy Evaluation
- DAG (Lineage Graph)
- Reading CSV files
- Reading Parquet files
- DataFrame Transformations
- Filtering and Selecting Data
- Renaming Columns
- Data Type Casting
- Adding New Columns
- Predicate Pushdown
- Transformations vs Actions
- Client Mode vs Cluster Mode
- Performance Best Practices

---

## Practical Tasks Completed

- Created sample Spark DataFrames
- Filtered records using multiple conditions
- Selected required columns
- Renamed DataFrame columns
- Converted String columns into Double data type
- Added calculated columns using expressions
- Filtered datasets with AND and OR conditions
- Demonstrated CSV and Parquet read/write syntax
- Explained Spark architecture and performance concepts

---

## Project Structure

```
Week6/
│
├── Spark.ipynb
├── README.md
```

---

## Sample Dataset

A sample DataFrame was created inside the notebook for demonstration purposes.

Columns used:

- product_id
- category
- price
- old_name
- base_price
- region
- priority

Another DataFrame (`df_orders`) was created for filtering operations.

---

## Key Concepts Learned

- Spark executes transformations lazily.
- DAG helps Spark optimize execution and recover from failures.
- Parquet provides better performance than CSV because it is a columnar storage format.
- Predicate Pushdown reduces unnecessary data reads.
- Avoid using `collect()` on large datasets; prefer `show()` or `limit()`.

---

## Files Used

For demonstration:

- CSV (example path)
  ```
  data/source.csv
  ```

- Parquet (example path)
  ```
  path/to/input
  ```

> **Note:** These paths are placeholders provided in the assignment. Replace them with actual file locations when running the notebook in your own environment.

---

## Learning Outcome

After completing this assignment, I gained practical knowledge of:

- Spark Architecture
- Spark DataFrames
- DataFrame Transformations
- Filtering Operations
- Schema Handling
- CSV vs Parquet
- Spark Performance Optimization
- Lazy Evaluation
- Fault Tolerance using DAG

---

## Author

**Priyanshu Maurya**
