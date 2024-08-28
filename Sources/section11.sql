-- Class 121
-- The greatest value in a List
SELECT GREATEST(20, 10, 30);
SELECT GREATEST(250, 10, 30);

-- Compute the cost to ship eaach item
-- Shipping is the maximum of (weight * $2) or $30
SELECT name, weight, GREATEST(30, 2 * weight)
FROM products;

-- Class 122
-- The least value in a List
SELECT LEAST(1, 20, 50, 100);
SELECT LEAST(120, 20, 50, 100);

-- All products are on sale!
-- Price is the least of the products price * 0.5 or $400
SELECT name, price, LEAST(price * 0.5, 400) AS price_on_sale
FROM products;

-- Class 123
-- Print each product and its price. Also print a description of the price
-- If price > 600 then 'high'
-- If price > 300 then 'medium'
-- else print 'cheap'
SELECT 
  name, price,
  CASE
    WHEN price > 600 THEN 'high'
	WHEN price > 300 THEN 'medium'
	ELSE 'cheap'
  END
FROM products;