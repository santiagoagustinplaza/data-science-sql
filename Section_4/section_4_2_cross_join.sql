-- Create a table named 'class_unnormalized' with columns for student information, advisor, room, and three classes
CREATE TABLE class_unnormalized (
	student_id SERIAL,
	advisor VARCHAR,
	room VARCHAR,
	class1 VARCHAR,
	class2 VARCHAR,
	class3 VARCHAR
);

-- Insert records into the 'class_unnormalized' table with unnormalized class information
INSERT INTO class_unnormalized (
	advisor,
	room,
	class1,
	class2,
	class3
)
VALUES
('Jones', 123, 'Biology', 'Chemistry', 'Physics'),
('Smith', 131, 'English', 'Math', 'Library Science');

-- Create a table named 'buildings' with columns for building information
CREATE TABLE buildings (
	building_id SERIAL,
	building_name VARCHAR
);

-- Insert records into the 'buildings' table with building names
INSERT INTO buildings (building_name)
VALUES ('Rathskeller'), ('Amundsen'), ('JRC');

-- Select all records from the 'class_unnormalized' and 'buildings' tables
SELECT * FROM class_unnormalized;
SELECT * FROM buildings;

-- Perform a cross join between 'class_unnormalized' and 'buildings' to get combinations of student, advisor, and building
SELECT
	student_id,
	advisor,
	building_name
FROM
	class_unnormalized
CROSS JOIN buildings b;
