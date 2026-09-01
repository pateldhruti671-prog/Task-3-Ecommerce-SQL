# E-Commerce SQL Data Analysis

## Task 3 – SQL for Data Analysis

This project demonstrates SQL techniques for analyzing an e-commerce dataset using MySQL.

## Tools Used

- MySQL
- MySQL Workbench
- SQL
- GitHub

## Database

Database name:

`ecommerce`

## Tables

The database contains the following tables:

- `customers`
- `products`
- `orders`

## SQL Concepts Demonstrated

### 1. Basic SQL Queries
- SELECT
- WHERE
- ORDER BY

### 2. Aggregate Functions
- SUM()
- AVG()
- COUNT()
- GROUP BY

### 3. Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

### 4. Subqueries

A subquery is used to identify products priced above the average product price.

### 5. NULL Handling

COALESCE() is used to handle missing values.

### 6. Views

A customer order summary view was created for reusable analysis.

### 7. Indexing

An index was created on `orders.customer_id`:

`idx_customer_id`

### 8. Query Optimization

EXPLAIN was used to verify that MySQL uses the customer ID index for filtering orders.

## Analysis Performed

The project includes analysis such as:

- Total quantity sold by product
- Total revenue by product
- Average revenue per user
- Customers and their orders
- Products above average price
- Customer order summaries

## Project Structure

```text
Task-3-Ecommerce-SQL/
│
├── ecommerce_analysis.sql
├── README.md
│
├── dataset/
│
└── screenshots/