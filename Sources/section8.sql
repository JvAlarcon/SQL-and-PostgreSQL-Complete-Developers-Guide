-- Class 87
SELECT * FROM products
ORDER BY price DESC
LIMIT 4;

SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4;

-- Union
(SELECT * FROM products
ORDER BY price DESC
LIMIT 4)
UNION
(SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4);
-- We have a result set of 7 itens. This means there is an item in both statements.
-- When UNION has the same item in both result set, it will show only one.
-- With UNION ALL, you can show the same item in both result sets
(SELECT * FROM products
ORDER BY price DESC
LIMIT 4)
UNION ALL
(SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4);

-- Class 88
-- In UNION, we are only allowed to merge two queries with the same result set.
-- In other words, the SELECT statement need to be equal in both statements that are being merged by UNION
(SELECT name, price FROM products
ORDER BY price DESC
LIMIT 4)
UNION ALL
(SELECT price, weight FROM products
ORDER BY price / weight DESC
LIMIT 4);
-- Result: UNION types character varying and integer cannot be matched

-- Class 89
-- There are other keywords we can use to work with multiple sets of data
-- UNION -> Join together the results of two queries and remove duplicate rows
-- UNION ALL -> Join together result of two queries
-- INTERSECT -> Find the rows common in the results of two queries and remove duplicates.
-- INTERSECT ALL -> Fom tje rows common in the result of two queries. This means that if some result is present two times in the first query result or the second query result, it will show two times. But if it's present in both one time, it will show the one time.
-- EXCEPT -> Find the rows that are present in the first query but NOT second query and remove duplicates
-- EXCEPT ALL -> Find the rwos that are present in the first query but NOT second query. This means that if some result is present two times in the first query result or the second query result, it will show two times. But if it's present in both one time, it will show the one time.
(SELECT * FROM products
ORDER BY price DESC
LIMIT 4)
INTERSECT
(SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4);

(SELECT * FROM products
ORDER BY price DESC
LIMIT 4)
INTERSECT ALL
(SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4);

-- Class 90
(SELECT * FROM products
ORDER BY price DESC
LIMIT 4)
EXCEPT
(SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4);

(SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4)
EXCEPT
(SELECT * FROM products
ORDER BY price DESC
LIMIT 4)
-- This query has a different result than the previous one

(SELECT * FROM products
ORDER BY price DESC
LIMIT 4)
EXCEPT ALL
(SELECT * FROM products
ORDER BY price / weight DESC
LIMIT 4);

-- Exercise
SELECT manufacturer FROM phones
WHERE price < 170
UNION 
SELECT manufacturer FROM phones
GROUP BY manufacturer
HAVING COUNT(manufacturer) > 2