-- Create a new database.
create database advanced_tutorial;

-- Create a schema named `tutorial` within the `advanced_tutorial` database.
create schema tutorial;

-- Create a table named `employees` within the `tutorial` schema.
create table tutorial.employees (
  id numeric primary key, -- This column is the primary key, which uniquely identifies each row in the table.                    
  first_name varchar not null,-- The `not null` constraint ensures that this column cannot contain empty values.
  last_name varchar not null,
  email varchar,
  hire_date date default current_date, 
  department varchar default 'Unassigned' -- The `default` clause specifies that if no value is provided for this column.
);

-- Select all data from the `tutorial.employees` table.
select * from tutorial.employees;