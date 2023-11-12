-- Prerun code
create table tutorial.employees (
	id numeric primary key, 
	first_name varchar not null, 
	last_name varchar not null, 
	email varchar,
	hire_date date default current_date, 
	department varchar default 'Unassigned'
);

-- Update the 'employees' table in the 'tutorial' schema
UPDATE tutorial.employees
	-- Set values.
	SET
    first_name = 'Jane',
    last_name = 'Doe',
    email = 'janedoe@example.com'
    
-- Specify the condition for the update to apply (where 'id' is 2)
WHERE id = 2;