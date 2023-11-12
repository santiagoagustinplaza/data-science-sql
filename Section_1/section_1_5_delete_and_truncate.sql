-- Prerun code
create table tutorial.employees (
	id numeric primary key, 
	first_name varchar not null, 
	last_name varchar not null, 
	email varchar,
	hire_date date default current_date, 
	department varchar default 'Unassigned'
);

-- Insert a record into the 'employees' table
INSERT INTO employees (id, first_name, last_name, email) 
VALUES (1, 'John', 'Doe', 'johndoe@example.com');

-- Select all records from the 'employees' table and alias it as 'e'
select * from employees e ;

-- Insert multiple records into the 'employees' table
INSERT INTO employees (id, first_name, last_name, email) VALUES
(2, 'Jane', 'Smith', 'janesmith@example.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@example.com'),
(4, 'Alice', 'Williams', 'alicewilliams@example.com');

-- Delete a record from the 'employees' table where 'id' is 3
delete from tutorial.employees where id = 3;

-- Delete records from the 'employees' table where 'id' is either 1 or 4
delete from tutorial.employees where id in (1, 4);

-- Truncate the 'employees' table, removing all records
TRUNCATE TABLE tutorial.employees;

-- Insert multiple records into the 'employees' table after truncation
INSERT INTO tutorial.employees (id, first_name, last_name, email) VALUES
(2, 'Jane', 'Smith', 'janesmith@example.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@example.com'),
(4, 'Alice', 'Williams', 'alicewilliams@example.com');