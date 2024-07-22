-- Class 82
SELECT * FROM products
ORDER BY price;
-- By default, ORDER BY goes from the leastest value to the greatest value
-- If you want to flip that order, add a optional keyword DESC in "ORDER BY field" statament. E.G. "ORDER BY price DESC"
-- And by default, the ORDER BY statament has the optional keyword ASC. That's why it will always go from the he leastest value to the greatest value.
-- E.G. "ORDER BY price ASC".

SELECT * FROM products
ORDER BY price DESC;

-- Class 83
SELECT * FROM products
ORDER BY name;
-- This sort is by alphabetical order differently from 'price' field, which is a number.

SELECT * FROM products
ORDER BY name DESC;
-- Again, you can flip the order from A-Z to Z-A

-- You can appply two orders too.
SELECT * FROM products
ORDER BY price, weight;

SELECT * FROM products
ORDER BY price, weight DESC;

SELECT * FROM products
ORDER BY price ASC, weight DESC;
-- This means that if you have the same price for a product, the criteria for ordering these products become the weight.

-- Class 84
-- OFFSET n -> Skip the first 'n' rows of the result set, where 'n' has to be a number.
-- LIMIT n -> Only give the first 'n' rows of the result set, where 'n' has to be a number.

-- OFFSET
SELECT COUNT(id) FROM users;

SELECT * FROM users
OFFSET 40;

-- LIMIT
SELECT * FROM users
LIMIT 5;

SELECT * FROM users
LIMIT 1;

SELECT * FROM users
LIMIT 50;

SELECT * FROM users
LIMIT 100;

-- Combining OFFSET and LIMIT
SELECT * FROM products
ORDER BY price DESC
LIMIT 5
OFFSET 1;
-- By convention, put LIMIT first before OFFSET

-- Exercise
SELECT name FROM phones
ORDER BY price DESC
LIMIT 2
OFFSET 1;