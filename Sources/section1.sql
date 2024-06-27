-- class 5
CREATE TABLE cities (
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);

-- class 7
INSERT INTO cities (name, country, population, area)
VALUES ('Tokyo', 'Japan', 385050000, 8223);

-- Multiple rows in insert
INSERT INTO cities (name, country, population, area)
VALUES 
  ('Delhi', 'India', 281250000, 2240),
  ('Shanghai', 'China', 221250000, 4015),
  ('Sao Paulo', 'Brazil', 209350000, 3043);

-- class 8
SELECT * FROM cities;

SELECT name, country FROM cities;

SELECT population, area, name FROM cities;

-- class 9
SELECT name, population / area FROM cities;
SELECT name, population / area AS population_density FROM cities;

-- Exercise
SELECT name, price * units_sold AS revenue FROM phones;

-- class 12 - String operators and functions
-- || -> Join two strings
-- CONCAT() -> Join two strings
-- LOWER() -> Gives a lowe case string
-- LENGTH() -> Gives a number of characters in a string
-- UPPER() -> Gives an upper case string
SELECT name || country FROM cities;
SELECT name || ' - ' || country FROM cities;
SELECT name || ' - ' || country AS location FROM cities;

SELECT CONCAT(name, country) AS location FROM cities;
SELECT CONCAT(name, ' - ', country) AS location FROM cities;

SELECT 
  CONCAT(UPPER(name), ' - ', LOWER(country)) AS location 
FROM 
  cities;
  
SELECT 
  UPPER(CONCAT(name, ' - ', country)) AS location 
FROM 
  cities;