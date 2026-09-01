
DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;

USE ecommerce;
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
email VARCHAR(100),
city VARCHAR(50)
);
CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers (customer_id, customer_name, email, city)
VALUES
(1, 'Riya Sharma', 'riya@gmail.com', 'Surat'),
(2, 'Neha Patel', 'neha@gmail.com', 'Mumbai'),
(3, 'Aman Shah', 'aman@gmail.com', 'Ahmedabad'),
(4, 'Priya Mehta', 'priya@gmail.com', 'Surat'),
(5, 'Rahul Joshi', 'rahul@gmail.com', 'Delhi');
INSERT INTO products (product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 25000.00),
(103, 'Headphones', 'Electronics', 2000.00),
(104, 'Backpack', 'Accessories', 1500.00),
(105, 'Running Shoes', 'Footwear', 3000.00),
(106, 'Smart Watch', 'Electronics', 5000.00),
(107, 'T-Shirt', 'Clothing', 800.00),
(108, 'Jeans', 'Clothing', 1800.00);

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date)
VALUES
(1001, 1, 101, 1, '2026-08-01'),
(1002, 2, 102, 2, '2026-08-03'),
(1003, 3, 103, 1, '2026-08-05'),
(1004, 1, 104, 2, '2026-08-07'),
(1005, 4, 105, 1, '2026-08-10'),
(1006, 5, 106, 1, '2026-08-12'),
(1007, 2, 107, 3, '2026-08-15'),
(1008, 4, 101, 1, '2026-08-18'),
(1009, 3, 108, 2, '2026-08-20'),
(1010, 5, 102, 1, '2026-08-22');
SELECT *
FROM customers;
SELECT customer_name, city
FROM customers;
SELECT *
FROM customers
WHERE city = 'Surat';
SELECT *
FROM customers
ORDER BY customer_name;
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;
SELECT SUM(p.price * o.quantity) AS total_sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id;
SELECT AVG(price) AS average_price
FROM products;
SELECT
c.customer_name,
p.product_name,
o.quantity,
o.order_date
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id;
CREATE VIEW order_details AS
SELECT
c.customer_name,
p.product_name,
o.quantity,
o.order_date
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN products p
ON o.product_id = p.product_id;

SELECT *
FROM order_details;
CREATE INDEX idx_customer_id
ON orders(customer_id);
SHOW INDEX FROM orders;
USE ecommerce;

SHOW TABLES;
DESCRIBE customers;

DESCRIBE orders;

DESCRIBE products;
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE customers;
USE ecommerce;

SELECT *
FROM customers;
SELECT *
FROM customers
WHERE city = 'Surat';
SELECT *
FROM customers
ORDER BY customer_name ASC;
SELECT
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM orders
GROUP BY product_id
ORDER BY total_quantity_sold DESC;
SELECT
    p.product_name,
    SUM(o.quantity) AS units_sold,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;
SELECT
    c.customer_name,
    p.product_name,
    o.quantity,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id;
    SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.quantity
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
    SELECT
    c.customer_name,
    o.order_id,
    o.quantity,
    o.order_date
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;
    SELECT
    product_id,
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;
SELECT
    SUM(o.quantity * p.price) / COUNT(DISTINCT o.customer_id)
        AS average_revenue_per_user
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id;
    SELECT
    customer_name,
    COALESCE(email, 'Not Available') AS email
FROM customers;
CREATE OR REPLACE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_quantity
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
SELECT *
FROM customer_order_summary
ORDER BY total_quantity DESC;
SELECT * FROM customer_order_summary;
SHOW INDEX FROM orders;
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 1;
CREATE DATABASE ecommerce;
USE ecommerce;

-- TABLE CREATION
-- DATA INSERTION

-- BASIC QUERIES
-- AGGREGATE QUERIES
-- JOINS
-- SUBQUERY
-- NULL HANDLING
-- VIEW
-- INDEX
-- EXPLAIN
