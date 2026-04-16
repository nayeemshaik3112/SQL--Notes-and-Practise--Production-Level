A subquery is a select statement written inside another sql query and then sub query is first evalulates the inner query first
then uses the result while executing the outer query

What Are Subqueries
A subquery is simply a SELECT statement written inside another SQL statement.

Outer query = the main query you run.
Inner query = the SELECT written inside it.
SQL evaluates the inner query first, then uses its result to finish the outer query.
------------------------------------------------------------------
select 
  o.order_id;
(select u.username from users u where u.userid = o.user_id) as name
from orders o

sub query with in 

SELECT u.user_id
FROM users u
WHERE u.user_id IN (
  SELECT DISTINCT o.user_id
  FROM orders o
);
------------------------------------------------------------------
->Scalar Subquery Example:

If we have lot of products and their amounts I need to get the product where the amount is > avg amount

first - inner query 
select avg(o1.amount) from orders o1
second - outer query + inner query

select 
  o.order_id,
  o.product_id,
  o.amount
from orders as o
where o.amount > (select avg(o1.amount) from orders o1)

->Column Subquery
Imagine I have users table which has user_id and also orders table which has order_id

select 
  u.user_id
  from users as u
  where u.user_id in (select distinct(o.order_id) from orders as o)

Same tables orders, users, products
find the max spend by user - if user_id has 1 - 50, again 1 - 100 total is 100

Inner -> 
(select o.user_id as user_id , sum(o.amount) as total _amount
from orders o
group by o.user_id) as t

Inner query to sum all the user_id amount since using the group by and it converts into a table 
Outer query just fetch the max of that table

Outer query -> select max(t.total_spend) from (inner query)

Logical query Processing order

from/join
where
group by
having
select
order by
limit
------------------------------------------------------------------
IN

Inner query gets all unique user_ids that appear in orders. Outer query returns only those users whose user_id is in that list.

select o.user_id, o.product_id
from orders o
where o.product_id in (
  select p.product_id 
  from products p 
  where p.product = 'tablet'
);

first inner query executes , it takes all the product with tablet
then compares in the orders table where this product_id is present in there
------------------------------------------------------------------
EXISTS
checks whether a subquery returns at least one row. 
The database stops searching as soon as a match is found. Because the actual values are irrelevant, SELECT 1 is commonly used.
1- True
0- False

if Exists return 1 it means it has 1 row and that is correct
if Exists return 0 it means it has 0 row and that is correct

SELECT
  u.user_id,
  u.name
FROM users u
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.user_id = u.user_id
);


SELECT u.user_id
FROM users u
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.user_id = u.user_id
    AND o.amount >= 500
);

EXISTS returns TRUE/FALSE, not rows. It stops as soon as it finds the first matching order (efficient).
The subquery is correlated: it uses u.user_id from the outer query.
------------------------------------------------------------------
NOT EXISTS
NOT EXISTS ensures that no matching row exists. This pattern is the most reliable way to express all products or none missing logic.

if Not Exists return 0 it means it has 0 rows and that is correct
if Not Exists return 1 it means it has 1 row and that is wrong


SELECT
  u.user_id,
  u.name
FROM users u
WHERE NOT EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.user_id = u.user_id
);


SELECT
  u.user_id,
  u.name
FROM users u
WHERE NOT EXISTS (// Second here it says get that user is Not Exist with all the products , but some one is there with all the products so if become
  SELECT 1
  FROM products p 
  WHERE NOT EXISTS ( // First for every product ex: tablet it will check whether it is present in all tables if yes then false  because we check with not exists
    SELECT 1
    FROM orders o
    WHERE o.user_id = u.user_id AND o.product_id = p.product_id
  )
);
------------------------------------------------------------------
Correlated Subquery
A correlated subquery references columns from the outer query. The inner query executes once for each row processed by the outer query.

SELECT
  u.user_id,
  u.name,
  (
    SELECT MAX(o.amount)
    FROM orders o
    WHERE o.user_id = u.user_id
  ) AS max_amount
FROM users u
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.user_id = u.user_id
)
ORDER BY max_amount DESC;