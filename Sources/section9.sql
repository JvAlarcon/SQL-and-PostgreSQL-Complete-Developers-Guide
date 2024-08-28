-- Class 93
-- List the name and price of all products that are MORE EXPENSIVE than all products in the 'Toys' department
-- Easy way or more like, cheat way
SELECT name, price FROM products
WHERE price > 876;

-- Using subquery
SELECT name, price FROM products
WHERE price > (
  SELECT MAX(price) FROM products
  WHERE department = 'Toys'
);

-- Exercise
SELECT name, price, (price / (SELECT MAX(price) FROM phones) AS price_ratio
FROM phones;

-- Class 100
-- Sub queries with from
SELECT user_id, COUNT(user_id)
FROM orders
GROUP BY user_id;

SELECT AVG(order_count) 
FROM (
  SELECT user_id, COUNT(user_id) AS order_count
  FROM orders
  GROUP BY user_id
) AS p;

-- Exercise
SELECT MAX(p.avg_price) AS max_average_price
FROM (
  SELECT AVG(price) AS avg_price
  FROM phones
  GROUP BY manufacturer
) as p;

-- Class 103
-- Sub queries with join
SELECT first_name
FROM users AS u
JOIN (
  SELECT user_id FROM orders WHERE product_id = 3
) AS o
ON u.id = o.user_id;

-- Class 104
-- Sub queries with where
SELECT id
FROM orders
WHERE product_id IN (
  SELECT id FROM products WHERE price / weight > 50
);

-- Class 105
-- Data Structure with where subqueries
-- Operator in the WHERE clause -> Structure of data the subquery must return
-- > -> Single value
-- < -> Single value
-- >= -> Single value
-- <= -> Single value
-- = -> Single value
-- <> or != -> Single value
-- IN -> Single column
-- NOT IN -> Single column
-- > ALL/SOME/ANY -> Single column
-- < ALL/SOME/ANY -> Single column
-- >= ALL/SOME/ANY -> Single column
-- <= ALL/SOME/ANY -> Single column
-- = ALL/SOME/ANY -> Single column
-- <> ALL/SOME/ANY -> Single column

-- Show the name of all products with a price greater than the average product price
SELECT name FROM products
WHERE price > (
  SELECT AVG(price) FROM products -- returns a single value
);

-- Exercise
SELECT name, price FROM phones
WHERE price > (
  SELECT price FROM phones WHERE manufacturer = 'Samsung' AND name = 'S5620 Monte'
);

-- Class 108
-- NOT IN operator in a List
-- Show the name of all products that are NOT IN the same department as products with a price less than 100
SELECT name, department FROM products
WHERE department NOT IN (
  SELECT department FROM products WHERE price < 100
);

-- Class 109
-- Show the name, department, and price of products that are more expensive than all products in 'Industrial' department
SELECT name, department, price
FROM products
WHERE price > ALL (
  SELECT price FROM products WHERE department = 'Industrial'
);

-- Class 110
-- SOME is an alias for ANY - You can make use of this two keywords, it's uo to you.
-- Show the name of products that are more expensive than at least one product in the 'Industrial' department
SELECT name, department, price
FROM products
WHERE price > ANY (
  SELECT price FROM products WHERE department = 'Industrial'
);

-- Exercise
-- Write a query that prints the name of all phones that have a price greater than all phones made by Samsung
SELECT name
FROM phones
WHERE price > ALL (
  SELECT price FROM phones WHERE manufacturer = 'Samsung'
);

-- Class 113
-- Correlated Subqueries
-- To understand correlated subqueries, we will solve another problem
-- Show the name, department and price of the most expensive product in each department
SELECT p1.name, p1.department, p1.price
FROM products AS p1
WHERE p1.price = (
  SELECT MAX(p2.price) FROM products AS p2
  WHERE p1.department = p2.deparment
);
-- Correlated subqueries essentially means that you are referring to some row of a outside query in the inner query
-- p1 is referring in the inner subquery in WHERE clause

-- Class 114
-- Another correlated subquery
-- Without using a join or a group by, print the number of orders for each product
SELECT p.name, (
  SELECT COUNT(*)
  FROM orders AS o
  WHERE o.product_id = p.id
) AS numbers_of_orders
FROM products AS p;

-- Class 115
-- We can use only SELECT statement with subquery as long the subquery return only a single value
SELECT (
  SELECT MAX(price) FROM products;
);
-- Why would we ever use this?
-- It's useful if you ever try to calculate one single value
-- Quick example, find the ratio between the maximum price item and the lowest price item
SELECT (SELECT MAX(price) FROM PRODUCTS) / (SELECT MIN(price) FROM products);
SELECT (SELECT MAX(price) FROM PRODUCTS) / (SELECT AVG(price) FROM products);

-- Exercise
-- Using only subqueries, print the max price, min price and average price of all phones. Rename each column to max_price, min_price, avg_price.
SELECT 
  (SELECT MAX(price) FROM phones) AS max_price,
  (SELECT MIN(price) FROM phones) AS min_price,
  (SELECT AVG(price) FROM phones) AS avg_price;
