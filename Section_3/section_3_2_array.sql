-- Create a table named 'array_table' with columns 'id' and 'myarray'
CREATE TABLE array_table (
  id SERIAL PRIMARY KEY,
  myarray INTEGER[]
);

-- Select all records from the 'array_table' table
select * from array_table;

-- Insert a record into the 'array_table' table with an array value
insert into array_table (myarray)
values (array[1, 2, 3, 4]);

-- Select all records from the 'array_table' table
select * from array_table;

-- Querying an ARRAY column to find records where 2 is present in 'myarray'
SELECT *
FROM array_table
WHERE 2 = ANY(myarray);

-- Querying to find records where the entire array matches a specified array
select * 
from array_table 
where array[9, 27, 43, 64]::integer[] = myarray;

-- Unpivot an ARRAY column to display each element separately along with the corresponding id
select id, unnest(myarray)
from array_table;