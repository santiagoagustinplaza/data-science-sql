-- Create a temporary table to hold some sample data
CREATE TEMPORARY TABLE my_table (
  id SERIAL PRIMARY KEY,
  value INTEGER
);

-- Insert some sample data into the table
INSERT INTO my_table (value) VALUES (1), (2), (3), (4), (5);

-- Select all data from the table
SELECT * FROM my_table;

-- Declare a variable to hold the sum of the values
DO $$
DECLARE
  da_sum INTEGER := 0;
  row RECORD;
BEGIN
  -- Loop over each row in the table and add the value to the sum
  FOR row IN SELECT * FROM my_table
  LOOP
    da_sum := da_sum + row.value;
   
    -- Print a notice for each row's sum
    RAISE NOTICE 'The sum of the values in row % is %', row.id, da_sum;
  END LOOP;
END;
$$;

-- Insert values into the table using a WHILE loop
DO $$
DECLARE
  i INTEGER := 1;
  row RECORD;
BEGIN
  -- Loop over values 1 to 10 and insert a row for each value
  WHILE i <= 10 LOOP
    INSERT INTO my_table (value) VALUES (i);
    i := i + 1;
  END LOOP;
END;
$$;

-- Select all data from the table after using the WHILE loop
SELECT * FROM my_table;

-- Insert values into the table using a DECLARE block and FOR loop
DO $$
DECLARE
  i INTEGER;
BEGIN
  -- Loop from 100 to 1000 and insert a row for each value
  FOR i IN 100..1000 LOOP
    INSERT INTO my_table (value) VALUES (i);
  END LOOP;
END;
$$;

-- Select all data from the table after using the FOR loop
SELECT * FROM my_table;
