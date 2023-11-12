-- Create a table named 'customers' with columns 'id', 'name', and 'address' in JSONB format
CREATE TABLE customers (
	id SERIAL PRIMARY KEY, 
	name TEXT, 
	address JSONB
);

-- Insert a customer record with name and address data in JSONB format
INSERT INTO customers (name, address) VALUES ('John Doe', '{"street": "123 Main St", "city": "New York", "state": "NY", "zip":"10001"}');

-- Select specific address fields from the 'customers' table based on the customer's name
SELECT address->>'street' AS street, address->>'city' AS city, address->>'state' AS state, address->>'zip' AS zip 
FROM customers
WHERE name = 'John Doe';

-- Create an index on the 'city' field within the 'address' JSONB column
CREATE INDEX idx_customers_address_city ON customers ((address>>>'city'));

-- Select customer names where the 'city' in the 'address' field is 'New York'
SELECT name
FROM customers
WHERE address->>'city' = 'New York';

-- Update the 'address' field for a customer named 'John Doe' by changing the 'city' to 'Los Angeles'
UPDATE customers
SET address = jsonb_set(address, '{city}', 'Los Angeles')
WHERE name = 'John Doe';

-- Select all records from the 'customers' table after the update
SELECT * FROM customers;