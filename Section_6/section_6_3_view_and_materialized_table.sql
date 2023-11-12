-- Create the first table for customers
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100)
);

-- Create the second table for orders with a foreign key referencing customers
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create a materialized view named customer_orders
CREATE MATERIALIZED VIEW customer_orders AS
SELECT
  customers.customer_id,
  customers.first_name,
  customers.last_name,
  orders.order_id,
  orders.order_date,
  orders.total_amount
FROM
  customers
JOIN orders ON customers.customer_id = orders.customer_id;

-- Select all data from the materialized view
SELECT * FROM customer_orders;

-- Insert data into the customers table
INSERT INTO customers (customer_id, first_name, last_name, email) VALUES
  (1, 'John', 'Doe', 'johndoe@example.com'),
  (2, 'Jane', 'Smith', 'janesmith@example.com'),
  (3, 'Bob', 'Johnson', 'bobjohnson@example.com');

-- Insert data into the orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
  (1, 1, '2023-05-01', 100.00),
  (2, 1, '2023-05-05', 200.00),
  (3, 2, '2023-05-06', 50.00),
  (4, 3, '2023-05-07', 75.00);

-- Select data from the materialized view after data insertion
SELECT * FROM customer_orders;

-- Select all data from the customers table
SELECT * FROM customers;

-- Refresh the materialized view to reflect changes in the underlying tables
REFRESH MATERIALIZED VIEW customer_orders;