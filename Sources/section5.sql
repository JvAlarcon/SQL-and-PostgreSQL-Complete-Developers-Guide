-- class 62
SELECT user_id
FROM comments
GROUP BY user_id;

-- class 63
-- Aggregates functions
-- COUNT() -> Returns the number of values in a group of values
-- SUM() -> Finds the sum of a group of numbers
-- AVG() -> Finds the average of a group of numbers
-- MIN() -> Returns the minimum value from a group of numbers
-- MAX() -> Return the maximum value from a group of numbers

SELECT MAX(id)
FROM comments;

SELECT MIN(id)
FROM comments;

SELECT AVG(id)
FROM comments;

SELECT COUNT(id)
FROM comments;

SELECT SUM(id)
FROM comments;

-- class 64
SELECT user_id, MAX(id)
FROM comments
GROUP BY user_id;

SELECT user_id, COUNT(contents) AS total_comments_by_user
FROM comments
GROUP BY user_id;

-- class 65
SELECT COUNT(user_id) FROM photos;
-- COUNT doesn't count null values, that's why we have a result of 20 instead of 21

SELECT COUNT(*) FROM photos;
-- That way you are going to count the total numbers of rows
-- The * is a way of dealing with nulls value inside a table. The better way to handle that and make the data consistent is to avoid null values for your tables.

-- class 66
SELECT photo_id, COUNT(contents) AS total_comments_by_photo
FROM comments
GROUP BY photo_id;

-- Exercise
SELECT author_id, COUNT(title) AS total_books_by_authors
FROM books
GROUP BY author_id;

-- Exercise
SELECT a.name AS author_name, COUNT(title) AS total_books
FROM authors AS a 
INNER JOIN books AS b ON a.id = b.author_id
GROUP BY a.name;

-- class 71 and 72
SELECT photo_id, COUNT(contents) AS number_of_comments_by_photo
FROM comments
WHERE photo_id < 3
GROUP BY photo_id
HAVING COUNT(contents) > 2

-- class 73
SELECT user_id
FROM comments
WHERE photo_id < 2
GROUP BY user_id
HAVING COUNT(contents) >= 2

SELECT user_id
FROM comments
WHERE photo_id < 50
GROUP BY user_id
HAVING COUNT(contents) > 20

-- Exercise
SELECT manufacturer, SUM(price * units_sold) AS total_revenue
FROM phones
GROUP BY manufacturer
HAVING SUM(price * units_sold) > 2000000