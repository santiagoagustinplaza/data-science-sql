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

-- Select employee ID, name, and calculate the true salary using COALESCE
SELECT
	id,
	name,
	COALESCE(salary, department, bonus) AS tru_salary
FROM
	employees;