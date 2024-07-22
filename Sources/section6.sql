-- Exercise
SELECT paid, COUNT(paid)
FROM orders
GROUP BY paid

-- Exercise
SELECT u.first_name AS First_Name, u.last_name AS Last_Name, o.paid AS Paid
FROM users AS u
INNER JOIN orders AS o ON u.id = o.user_Id

SELECT CONCAT(u.first_name, ' ', u.last_name)  AS Name, o.paid AS Paid
FROM users AS u
INNER JOIN orders AS o ON u.id = o.user_Id