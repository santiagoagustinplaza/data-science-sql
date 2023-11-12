-- Create a recursive common table expression (CTE) to generate a date table for the month of January 2023
WITH recursive date_table AS (
  SELECT '2023-01-01'::date AS da_date
  UNION ALL
  SELECT da_date + 1
  FROM date_table
  WHERE da_date < '2023-02-01'::date
)
-- Select all dates from the date table
SELECT *
FROM date_table;

-- Create a table named 'employees' with columns for employee information
CREATE TABLE employees (
  title VARCHAR,
  employee_id INTEGER,
  manager_id INTEGER
);

-- Insert records into the 'employees' table with employee information
INSERT INTO employees (title, employee_id, manager_id)
VALUES
('The Boss', 1, null),
('Vice President Procurement', 10, 1),
('Senior Manager Strategic Sourcing', 100, 10),
('Vice President Engineering', 20, 1),
('Data Science Engineer', 200, 20),
('Software Engineer', 201, 20),
('QA Engineer', 202, 20);

-- Create a recursive CTE named 'managers' to retrieve the hierarchical structure of employees
WITH recursive managers AS (
  SELECT '' AS hierarchy_lvl,
         employee_id,
         manager_id,
         title AS employee_title
  FROM employees
  WHERE title = 'The Boss'
  UNION ALL
  SELECT hierarchy_lvl || '-',
         e.employee_id,
         e.manager_id,
         e.title
  FROM employees e
  JOIN managers m ON e.manager_id = m.employee_id
)
-- Select hierarchical information from the 'managers' CTE
SELECT hierarchy_lvl || employee_title AS title,
       employee_id,
       manager_id
FROM managers;