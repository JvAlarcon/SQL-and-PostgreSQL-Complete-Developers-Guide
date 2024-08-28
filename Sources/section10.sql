-- Class 118
-- Selecting distinct values
-- What unique departments are there?
SELECT DISTINCT deparment
FROM products;
-- DISTINCT is going to give you a list of all the different unique values inside of a column

-- Exercise
-- Write a query that will print the number of unique phonee manufacturers.
SELECT COUNT(DISTINCT manufacturer) AS num_unique_manufacturers
FROM phones;