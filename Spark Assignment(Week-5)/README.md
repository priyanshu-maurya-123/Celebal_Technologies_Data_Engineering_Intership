## Objective

The objective of this assignment is to understand Apache Spark DataFrames and perform data cleaning, transformation, filtering, aggregation, and schema modification using PySpark. The assignment also demonstrates how to build a complete data processing pipeline.

---

## Technologies Used

- Python 3
- Apache Spark (PySpark)
- Databricks Community Edition

---

## Topics Covered

- Spark Fundamentals
- Limitations of MapReduce
- In-Memory Computing
- Spark DataFrames
- DataFrame Immutability
- Data Cleaning
- Removing Duplicate Records
- Handling Null Values
- Filtering Data
- GroupBy Operations
- Aggregate Functions
- Wide Transformations and Shuffle
- Schema Modification
- Data Processing Pipeline

---

## Dataset

A sample dataset was created using `createDataFrame()` containing the following columns:

- user_id
- transaction_date
- region
- product_category
- sale_amount
- age
- subscription
- city
- email
- username
- store_id
- price
- raw_timestamp
- status

The dataset includes:

- Duplicate records
- Null values
- Empty string values
- Multiple regions and product categories

---

## Tasks Performed

### Q1
Studied the limitations of MapReduce and advantages of Apache Spark.

### Q2
Understood how Spark uses In-Memory Computing to improve performance.

### Q3
Removed duplicate records using `dropDuplicates()`.

### Q4
Filtered sales data for the West region and calculated the average sale amount by product category.

### Q5
Handled null values using `na.fill()`.

### Q6
Grouped records by city and counted the number of records.

### Q7
Learned DataFrame immutability and column operations.

### Q8
Filtered Premium subscribers between the ages of 18 and 30.

### Q9
Understood why null values should be handled before performing aggregations.

### Q10
Converted a string timestamp into `TimestampType` and renamed the column.

### Q11
Studied Shuffle operations and Wide Transformations.

### Q12
Removed rows containing null emails or empty usernames.

### Q13
Calculated minimum, maximum, and average price using `agg()`.

### Q14
Learned the risks of using `inferSchema=True` with inconsistent data.

### Q15
Built a complete Spark processing pipeline by:
- Removing duplicate records
- Filling null price values
- Grouping by store_id
- Calculating total revenue

---

## Key PySpark Functions Used

- createDataFrame()
- show()
- filter()
- between()
- groupBy()
- agg()
- avg()
- sum()
- min()
- max()
- count()
- dropDuplicates()
- na.fill()
- withColumn()
- withColumnRenamed()
- cast()
- drop()
- alias()

---

## Learning Outcomes

After completing this assignment, I learned how to:

- Work with Spark DataFrames
- Clean and transform data
- Handle duplicate and missing values
- Perform filtering and aggregation
- Modify DataFrame schemas
- Understand shuffle operations
- Build an end-to-end Spark data processing pipeline

---

## Output

The notebook successfully demonstrates:

- Data cleaning
- Data transformation
- Filtering
- Aggregation
- Schema modification
- Processing pipeline execution

All tasks were executed successfully in Databricks using PySpark.

---

## Author

**Priyanshu Maurya**

