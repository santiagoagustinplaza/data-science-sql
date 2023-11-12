-- Prerun code
create database advanced_tutorial;

create schema tutorial;

create table tutorial.employees (
	id numeric primary key, 
	first_name varchar not null, 
	last_name varchar not null, 
	email varchar,
	hire_date date default current_date, 
	department varchar default 'Unassigned'
);
select * from tutorial.employees;

-- This is the template for modifying tables using the ALTER TABLE statement.
ALTER [object] [object_name] [command];
-- Replace [object] with the type of object you are modifying (e.g., TABLE, COLUMN).
-- Replace [object_name] with the name of the object you are modifying (e.g., employees).
-- Replace [command] with the specific command you are using (e.g., ADD COLUMN, DROP COLUMN).

-- We can add a column
ALTER TABLE tutorial.employees ADD COLUMN age INT;

-- We can drop a column
ALTER TABLE tutorial.employees DROP COLUMN age;

-- We can also set a default value
ALTER TABLE tutorial.employees ALTER COLUMN dept SET DEFAULT 'Reassigned';