-- Create a table named 'employees' with columns for employee information
CREATE TABLE employees (
	id SERIAL PRIMARY KEY, 
	f_name VARCHAR(255),
	l_name VARCHAR(255),
	salary VARCHAR,
	department VARCHAR(255),
	bonus VARCHAR
);

-- Insert records into the 'employees' table with employee information
INSERT INTO employees (f_name, l_name, salary, department, bonus) VALUES
	('John', 'Doe', '50000.00', 'IT', '5000'),
	('Jane', 'Doe', NULL, 'Sales', '5000'),
	('Bob', 'Smith', '75000.00', NULL, '5000'),
	('Rob', 'Smith', '155000.00', NULL, '5000');

-- Select employee first name, last name, full name, and full name with department using CONCAT and COALESCE
SELECT
	f_name,
	l_name,
	CONCAT(f_name, ' ', l_name) AS full_name,
	CONCAT(f_name, ' ', l_name, ' - ', COALESCE(department, 'No Dept')) AS full_name_dept
FROM
	employees;