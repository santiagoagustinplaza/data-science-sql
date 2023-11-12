-- Create a temporary table named employees
CREATE TEMPORARY TABLE employees (
    id SERIAL PRIMARY KEY, 
    f_name VARCHAR (255),
    l_name VARCHAR(255),
    salary varchar, 
    department VARCHAR (255), 
    bonus varchar
);

-- Insert data into the temporary employees table
INSERT INTO employees (f_name, l_name, salary, department, bonus) VALUES
    ('John', 'Doe', 50000.00, 'IT', 5000),
    ('Jane', 'Doe', NULL, 'Sales', 5000),
    ('Bob', 'Smith', 75000.00, NULL, 5000),
    ('Rob', 'Smith', 155000.00, NULL, 5000);

-- Select specific columns along with a calculated column for full name
SELECT
    f_name,
    l_name,
    -- Concatenate first and last names to create a full name
    CONCAT(f_name, ' ', l_name) AS full_name,
    -- Concatenate full name with department (if available) or 'No Dept'
    CONCAT(f_name, ' ', l_name, ' - ', COALESCE(department, 'No Dept')) AS full_name_dept
FROM
    employees;

-- Select all columns from the employees table
SELECT * 
FROM employees;
