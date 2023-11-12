-- Create employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INTEGER NOT NULL,
    salary NUMERIC(10, 2) NOT NULL
);

-- Insert initial data into the employees table
INSERT INTO employees (first_name, last_name, department_id, salary) VALUES
    ('Alice', 'Smith', 1, 50000),
    ('Bob', 'Johnson', 2, 60000),
    ('Charlie', 'Brown', 1, 55000);

-- Create a stored procedure to insert an employee
CREATE OR REPLACE PROCEDURE insert_employee (
    p_first_name VARCHAR, p_last_name VARCHAR, p_department_id INTEGER, p_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employees (first_name, last_name, department_id, salary)
    VALUES (p_first_name, p_last_name, p_department_id, p_salary);
END;
$$;

-- View the current state of the employees table
SELECT * FROM employees;

-- Call the insert_employee stored procedure to add a new employee
CALL insert_employee('David', 'Martinez', 3, 155000);

-- Create a function to calculate the average salary for a given department
CREATE OR REPLACE FUNCTION average_salary (p_department_id INTEGER)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE 
    v_avg_salary NUMERIC;
BEGIN
    -- Calculate average salary for the specified department
    SELECT AVG(salary) INTO v_avg_salary
    FROM employees
    WHERE department_id = p_department_id;

    -- Return the calculated average salary
    RETURN v_avg_salary;
END;
$$;

-- Call the average_salary function for department_id = 1
SELECT average_salary(1);