-- Calculate the duration represented by the specified interval
SELECT INTERVAL '1 day 2 hours 30 minutes';

-- Add an interval of 1 day to the current timestamp
SELECT NOW() + INTERVAL '1 day';

-- Extract the year from the current timestamp using different syntaxes
SELECT 
	EXTRACT('year' FROM NOW()),
	date_part('year', NOW());

-- Calculate the age between the current timestamp and a specified date
SELECT AGE(NOW(), '2022-03-18');