-- Prerun code
create table tutorial.employees (
	id numeric primary key, 
	first_name varchar not null, 
	last_name varchar not null, 
	email varchar,
	hire_date date default current_date, 
	department varchar default 'Unassigned'
);

INSERT INTO employees (id, first_name, last_name, email) 
VALUES (1, 'John', 'Doe', 'johndoe@example.com');

select * from employees e ;

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