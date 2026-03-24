Day -1 : SQL fundamentals and few queries with SELECT and other Clauses


| Category | Full Form                     | What it does                     | Common Commands                          | Real Meaning                         |
|----------|------------------------------|----------------------------------|------------------------------------------|---------------------------------------|
| DDL      | Data Definition Language     | Creates/changes structure        | CREATE, ALTER, DROP, TRUNCATE, RENAME    | Define and modify database structure  |
| DML      | Data Manipulation Language   | Changes actual data              | INSERT, UPDATE, DELETE, MODIFY           | Work with data inside tables          |
| DQL      | Data Query Language          | Reads data                       | SELECT                                   | Retrieve data from database           |
| DCL      | Data Control Language        | Permissions/security             | GRANT, REVOKE                            | Control access and permissions        |
| TCL      | Transaction Control Language | Commit/undo operations           | COMMIT, ROLLBACK, SAVEPOINT              | Manage transactions and consistency  

 

| Data Type              | Stores                          | Common Use                               | Example                      |
|------------------------|---------------------------------|------------------------------------------|-----------------------------|
| INT                    | Whole numbers                   | IDs, counts, ages                        | age INT                     |
| BIGINT                 | Very large whole numbers        | Population, large counters               | views BIGINT                |
| VARCHAR(n)             | Variable-length text up to n    | Names, emails, usernames                 | email VARCHAR(50)           |
| TEXT                   | Long text                       | Descriptions, blogs, reviews             | description TEXT            |
| DATE                   | Date only                       | Birthdate, signup date                   | dob DATE                    |
| DATETIME / TIMESTAMP   | Date + time                     | Logins, payments, event logs             | created_at DATETIME         |
| BOOLEAN (TINYINT)      | True/False (1/0)                | Flags like is_active, is_admin           | is_active BOOLEAN           |
| DECIMAL(p,s)           | Exact decimal numbers           | Money, balances                          | price DECIMAL(10,2)         |

Primary vs Foreign Keys:

If any foreign key is present then we have to drop the child table first then we can drop the parent table.
A Composite Primary Key is when multiple columns together form the unique identifier.

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT, // we can create a table without giving or mentioning ID 
  name VARCHAR(30),
  email VARCHAR(50)
);

Constraints : Auto_increment, Not Null, Unique, Check, Default-Is_Active

Query Lifecycle
When you run a SQL query, the database does not just “instantly” give results. Internally, it follows a query lifecycle with three big steps:

Parse: Parsing is the step where the database checks whether your SQL is written correctly (syntax check). Understands what you are asking for.

Plan: Planning (also called query optimization) is the step where the database, figures out how to execute your query in the fastest or most efficient way.
Execute: Execution is the step where the database, actually runs the chosen execution plan and reads physical data from disk/memory. Applies filters, joins (if multiple tables), sorting, grouping/aggregation. Sends the final result back to you or your application.

| Clause         | What it does                           | Real Meaning                                     |
|----------------|----------------------------------------|--------------------------------------------------|
| SELECT         | Which columns to show                  | Choose columns to retrieve from table            |
| FROM           | Where to read from                     | Specify the table(s)                             |
| WHERE          | Which rows to keep                     | Filter records based on condition                |
| ORDER BY       | How to sort                            | Sort results (ASC / DESC)                        |
| LIMIT / OFFSET | How many rows to return                | Control number of rows & pagination              |
| DISTINCT       | Whether to remove duplicates           | Return only unique values                        |
| AS (Alias)     | How to rename columns/tables in output | Give temporary names for readability             |

1. SELECT & FROM
SELECT *
FROM countries;

2. WHERE
SELECT *
FROM countries
WHERE region = 'Oceania';

3. Comparison operators 
4. Logical Operators

SELECT *
FROM countries
WHERE population > 50000000 AND area < 5000000;

SELECT *
FROM countries
WHERE region = 'Asia' OR region = 'Oceania';

SELECT *
FROM countries
WHERE NOT region = 'North America'; //not operator

5. Arithmetic Operators
6. ORDER BY & LIMIT

SELECT country, area
FROM countries
ORDER BY area DESC
LIMIT 2;

7. DISTINCT & AS (Aliases)

SELECT DISTINCT region AS unique_region
FROM countries;