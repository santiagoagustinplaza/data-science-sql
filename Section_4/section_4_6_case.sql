-- Create a table named 'employees' with columns for employee information
CREATE TABLE employees (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255), 
	salary VARCHAR,
	department VARCHAR(255),
	bonus VARCHAR
);

-- Drop the 'employees' table (Note: This action removes the entire table and its data)
DROP TABLE employees;

-- Insert records into the 'employees' table with employee information
INSERT INTO employees (name, salary, department, bonus) VALUES
	('John Doe', '50000.00', 'IT', '5000'),
	('Jane Doe', NULL, 'Sales', '5000'),
	('Bob Smith', '55000.00', NULL, '5000');

-- Select employee name, salary, and classify salary based on conditions using CASE statement
SELECT 
	name,
	salary,
	CASE
		WHEN salary < 60000 THEN 'entry level'
		WHEN salary < 100000 THEN 'mid'
		WHEN salary < 200000 THEN 'big baller'
		WHEN salary < 200000 OR bonus > 0 THEN 'really big baller'
		ELSE 'uncaught exception'
	END AS salary_classification
FROM
	employees;