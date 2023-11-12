# DQL vs. DDL vs. DML vs. DCL
Data management and maintenance are essential components of modern-day database systems. In this lecture, we will discuss the differences between DQL, DDL, DML, and DCL and provide examples of each.

## DQL (Data Query Language)
DQL is a language used to retrieve data from a database. It is used to select, filter, and sort data from one or more tables in a database. Examples of DQL statements include:
- `SELECT * FROM {table_name};`
- `SELECT {column_name} FROM {table_name} WHERE {condition};`
- `SELECT COUNT(*) FROM {table_name};`

## DDL (Data Definition Language)
DDL is a language used to define the structure of a database. It is used to create, modify, and delete database objects such as tables, indexes, and constraints. Examples of DDL statements include:
- `CREATE TABLE {table_name} ({column1_name} {column1_datatype}, {column2_name} {column2_datatype}, ...);`
- `ALTER TABLE {table_name} ADD {column_name} {column_datatype};`
- `DROP TABLE {table_name};`

## DML (Data Manipulation Language)
DML is a language used to manipulate data in a database. It is used to insert, update, and delete data from one or more tables in a database. Examples of DML statements include:
- `INSERT INTO {table_name} ({column1_name}, {column2_name}, ...) VALUES ({value1}, {value2}, ...);`
- `UPDATE {table_name} SET {column_name} = {new_value} WHERE {condition};`
- `DELETE FROM {table_name} WHERE {condition};`

## DCL (Data Control Language)
DCL is a language used to control access to a database. It is used to grant and revoke permissions to users and roles in a database. Examples of DCL statements include:
- `GRANT {permission} ON {object_name} TO {user_name};`
- `REVOKE {permission} ON {object_name} FROM {user_name};`
- `DENY {permission} ON {object_name} TO {user_name};`

In conclusion, DQL, DDL, DML, and DCL are important languages used in data management and maintenance. Understanding the differences between them is crucial for managing and maintaining a database effectively.

# SQL Syntax
## Keywords
Keywords are the basic building blocks of SQL queries. They tell the database what to do. 

## Clauses
Clauses provide additional information to keywords. Some common clauses include:
- `SELECT` clause: Specifies which columns to retrieve
- `FROM` clause: Specifies the table(s) from which to retrieve data
- `WHERE` clause: Filters the results based on a condition
- `ORDER` BY clause: Sorts the results based on a column
- `LIMIT` clause: Limits the number of results returned

## Expressions
Expressions are used to evaluate a single value. They can be made up of columns, operators, and literals. Some common operators include:
- `=`: Equal to
- `!=`: Not equal to
- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal to
- `<=`: Less than or equal to

## Predicates
Predicates are expressions that evaluate to a boolean value (true or false). They are used to filter the results of a query. Some common predicates include:
- `WHERE age = 5`: Filters the results to only include students with an age of 5
- `WHERE name LIKE 'John%'`: Filters the results to only include students whose name starts with "John"

## Binding and Optimization
When you submit a SQL query, the database goes through a process called binding to make sure that the query is syntactically correct. Then, it goes through an optimization process to determine the most efficient way to execute the query.
You can use the `EXPLAIN` keyword to see how the database is optimizing your query. For example, the following query will show you the query plan for the query `SELECT * FROM students WHERE age = 5:`
`EXPLAIN SELECT * FROM students WHERE age = 5;`

## Additional Notes
It is generally not a good idea to use `SELECT *` without a `LIMIT` clause, as this can return a large amount of data that you may not need.
You can use expressions to perform calculations on data. For example, the following query calculates the average GPA of students:
- `SELECT AVG(GPA) FROM students;`