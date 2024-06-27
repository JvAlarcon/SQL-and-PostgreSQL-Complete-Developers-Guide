-- class 13
SELECT name, area FROM cities
WHERE area > 4000;

-- class 14
SELECT name, area FROM cities
WHERE area = 8223;

SELECT name, area FROM cities
WHERE area != 8223;

SELECT name, area FROM cities
WHERE area <> 8223;

-- class 15
SELECT name, area FROM cities
WHERE area BETWEEN 2000 AND 5000;

SELECT name, area FROM cities
WHERE name IN('Delhi', 'Shanghai');

SELECT name, area FROM cities
WHERE name NOT IN('Delhi', 'Shanghai');

SELECT name, area FROM cities
WHERE area NOT IN(3043, 8223);

SELECT name, area FROM cities
WHERE area NOT IN(3043, 8223) AND name = 'Delhi';

SELECT name, area FROM cities
WHERE 
  area NOT IN(3043, 8223) 
  OR name = 'Sao Paulo'
  OR name = 'Delhi';

-- Exercise 1
SELECT name, price FROM phones
WHERE units_sold > 5000

-- Exercise 2
SELECT name, manufacturer FROM phones
WHERE manufacturer IN('Apple', 'Samsung');
  
SELECT name, manufacturer FROM phones
WHERE manufacturer = 'Apple' OR manufacturer = 'Samsung';

-- Exercise 3
SELECT name, price * units_sold AS total_revenue FROM phones
WHERE price * units_sold > 1000000

-- class 22
UPDATE cities SET population = 39505000 WHERE name = 'Tokyo'

-- class 23
DELETE FROM cities WHERE name = 'Tokyo';

INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 385050000, 8223);

-- Exercise 4
UPDATE phones SET units_sold = 8543 WHERE name = 'N8';
SELECT * from phones;

-- Exercise 5
DELETE FROM phones WHERE manufacturer = 'Samsung';
SELECT * FROM phones;