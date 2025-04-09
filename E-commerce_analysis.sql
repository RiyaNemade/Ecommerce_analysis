-- Customer table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    registration_date DATE
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Details table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert into customers
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'India', '2023-01-10'),
(2, 'Neha Verma', 'neha@gmail.com', 'USA', '2023-02-12'),
(3, 'John Smith', 'john@gmail.com', 'UK', '2023-03-15');

-- Insert into products
INSERT INTO products VALUES
(101, 'Smartphone', 'Electronics', 30000),
(102, 'Laptop', 'Electronics', 60000),
(103, 'Desk Chair', 'Furniture', 5000);

-- Insert into orders
INSERT INTO orders VALUES
(1001, 1, '2023-04-01', 90000),
(1002, 2, '2023-04-02', 30000),
(1003, 3, '2023-04-05', 5000);

-- Insert into order_details
INSERT INTO order_details VALUES
(1, 1001, 101, 2, 30000),
(2, 1001, 102, 1, 30000),
(3, 1002, 101, 1, 30000),
(4, 1003, 103, 1, 5000);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_details;

--Total Revenue Generated--

SELECT SUM(total_amount) AS total_revenue FROM orders

--Top Customer by Revenue--

SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;


--Top Selling Product (by Quantity)--

SELECT p.product_name, SUM(od.quantity) AS total_units_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 1;

--Product Generating Highest Revenue--

SELECT p.product_name, SUM(od.unit_price * od.quantity) AS revenue_generated
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue_generated DESC
LIMIT 1;


--Customer Distribution by Country--

SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

--Month-wise Revenue Trend--

SELECT MONTH(order_date) AS month, SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY MONTH(order_date);

--Repeat Customers--

SELECT customer_id, COUNT(order_id) AS orders_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

--Average Order Value (AOV)--

SELECT AVG(total_amount) AS avg_order_value FROM orders;

--Category-wise Quantity Sold--

SELECT category, SUM(od.quantity) AS total_units
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY category;

--Customers with No Orders--

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
