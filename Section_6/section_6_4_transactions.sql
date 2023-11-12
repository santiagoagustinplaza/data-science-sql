-- Start a transaction
BEGIN TRANSACTION;

-- Transfer 100 from account A to account B
UPDATE accounts SET balance = balance - 100 WHERE account_id = 'A';
UPDATE accounts SET balance = balance + 100 WHERE account_id = 'B';

-- Commit the transaction
COMMIT;

-- Start a new transaction
BEGIN TRANSACTION;

-- Insert a new customer
INSERT INTO customers (name, email) VALUES ('John Doe', 'john.doe@example.com');

-- Create a savepoint named sp1
SAVEPOINT sp1;

-- Insert a new order
INSERT INTO orders (customer_id, product_id, quantity) VALUES (1, 101, 5);

-- If there's an issue, rollback to the savepoint sp1
ROLLBACK TO sp1;

-- Continue with the transaction
UPDATE customers SET email = 'johndoe@example.com' WHERE name = 'John Doe';

-- Commit the transaction
COMMIT;
