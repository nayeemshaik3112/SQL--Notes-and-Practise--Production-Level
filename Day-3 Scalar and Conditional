Day - 3 Scalar and Condition Functions
---------------------------------------------
ROUND():

ROUND(number, decimals) rounds a number to the given decimal places. If decimals are not given, it rounds to the nearest integer.

SELECT
    id,
    name,
    fee_paid,
    ROUND(fee_paid, 0) AS fee_rupees,
    ROUND(fee_paid, 2) AS fee_2dp
FROM students
ORDER BY id;

Standard rounding rules:

0.5 and above => rounds up
< 0.5 => rounds down
---------------------------------------------
ABS():

ABS(number) returns the absolute value (distance from zero). 
So negative becomes positive, 
positive stays positive and 
NULL stays NULL.

SELECT 
  id, 
  name, 
  score_change, 
  ABS(score_change) AS abs_score_change
FROM students
ORDER BY id;
---------------------------------------------
GREATEST() and LEAST()

GREATEST(a, b, ...) returns the largest value from the given list.

LEAST(a, b, ...) returns the smallest value from the given list.

SELECT
  id,
  name,
  test1,
  test2,
  test3,
  GREATEST(test1, test2, test3) AS GREATEST_score,
  LEAST(test1, test2, test3)    AS LEAST_score
FROM students
ORDER BY id;

Note: If any test column is NULL, result becomes NULL.
---------------------------------------------
IF NULL ()

IF NULL() is a function that checks a value, and:

if the value is NOT NULL, it returns the value
if the value is NULL, it returns the replacement/default you provide
IFNULL(expression/value, replacement_value) only, accepts 2 arguments

SELECT 
  id,
  name,
  IFNULL(phone, 'Not Provided') AS phone_status
FROM students;

“If phone is NULL, then show 'Not Provided', otherwise show actual phone value”

NULL means missing / unknown data
'' means data exists but is empty


If want to handle both NULL and empty strings, you must first convert empty strings to NULL using NULLIF():

SELECT 
  id,
  name,
  phone,
  IFNULL(NULLIF(phone, ''), 'Not Provided') AS final_phone
FROM students;

first -> NULLIF converts the phone with '' as NULL -> important - ' ' -> null -> not provided
and NULL values are treated as Not provided and converted by IFNULL
---------------------------------------------
COALESCE ()

COALESCE(value, replacement) returns the first non-NULL value from the list. So if value is NULL, it returns replacement.

SELECT id, 
       COALESCE(primary_email, work_email, personal_email) AS contact_email
FROM coalesce_demo;

if the primary_email is not null then it returns the primary_email, if it is null then it returns the work_email that is also null then personal_email
if the primary_email is "" then this is empty string not null, null means missing data here "" here means data is there but no entered empty data is there
---------------------------
COALESCE with Default Email

SELECT id, 
       COALESCE(primary_email, work_email, personal_email, 'hello@tuf') AS contact_email
FROM coalesce_demo;

I am saying here if nothing is found all were nulls then return a default 'hello@tuf' as contact_email
---------------------------
COALESCE with NULLIF and TRIM

SELECT id, 
       COALESCE(NULLIF(TRIM(primary_email),''), work_email, personal_email) AS contact_email
FROM coalesce_demo;

first it will trim any extra spaces or leading spaces then
NULL if will convert '' empty string into NULL so that coalesce will treat those '' into Null and skip them

5	''	NULL	raj@gmail.com	5.0	0.0 -> '' converted to null and next also we have null then we have raj@gmail.com - this will be returned
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Concept            | Definition                                                       | Used in                  | MySQL Syntax              | PostgreSQL Syntax
-------------------|------------------------------------------------------------------|--------------------------|---------------------------|--------------------------
IS NULL            | Checks whether a column value is actually NULL (missing)         | WHERE (filter rows)      | col IS NULL               | col IS NULL
IS NOT NULL        | Checks whether a column value is present (not NULL)              | WHERE (filter rows)      | col IS NOT NULL           | col IS NOT NULL
IFNULL()           | Replaces NULL with a given value (does not filter rows)          | SELECT (clean output)    | IFNULL(col, value)        | Not available
NULLIF		   | NULLIF will make '' into NULL then NULL will be converted byIFNULL | -                      | NULLIF (col, value)       | Not available
COALESCE()         | Returns first non-NULL value (standard SQL function)             | SELECT (clean output)    | COALESCE(col, value)      | COALESCE(col, value)
Common mistake     | NULL cannot be compared using = (it is not a normal value)       | -                        | col = NULL (invalid)      | col = NULL (invalid)
-----------------------------------------------------------------------------------------------------------------------------------------