-- Create a table named 'users' with columns for user information
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);

-- Create a table named 'orders' with columns for order information and a foreign key reference to 'users'
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(user_id),
  order_date DATE NOT NULL,
  total_amount NUMERIC(10,2) NOT NULL
);

-- Insert records into the 'users' table with user information
INSERT INTO users (username, email) VALUES
  ('alice', 'alice@example.com'),
  ('bob', 'bob@example.com'),
  ('charlie', 'charlie@example.com');

-- Insert records into the 'orders' table with order information and associated user IDs
INSERT INTO orders (user_id, order_date, total_amount) VALUES
  (1, '2022-04-01', 50.00),
  (1, '2022-03-15', 25.00),
  (2, '2022-04-02', 100.00),
  (3, '2022-04-01', 75.00),
  (3, '2022-03-20', 30.00),
  (3, '2022-03-01', 20.00);

-- Select all records from the 'orders' and 'users' tables
SELECT * FROM orders;
SELECT * FROM users;

-- Select usernames, order IDs, and order dates, including the latest order date for each user
SELECT
	u.username,
	o.order_id,
	o.order_date
FROM
	users u
LEFT JOIN LATERAL (
	SELECT
		order_id,
		order_date
	FROM
		orders
	WHERE
		user_id = u.user_id
	ORDER BY
		order_date DESC
	LIMIT 1
) o ON
	TRUE;