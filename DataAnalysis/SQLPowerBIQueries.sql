USE capstone_db;
SELECT u.country, SUM(o.num_of_item) AS total_sales
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE status NOT IN ('Cancelled', 'Returned')
GROUP BY u.country
ORDER BY total_sales DESC
LIMIT 10;


USE capstone_db;
SELECT COUNT(order_id) AS total_orders, gender
FROM orders o
WHERE status NOT IN ('Cancelled', 'Returned')
GROUP BY gender
ORDER BY total_orders DESC;


USE capstone_db;
SELECT u.age, COUNT(u.id) AS total_customers
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE status NOT IN ('Cancelled', 'Returned')
GROUP BY age
ORDER BY age;


SELECT
    CASE
        WHEN age <= 12 THEN 'Kids'
        WHEN age BETWEEN 13 AND 19 THEN 'Teenager'
        WHEN age BETWEEN 20 AND 55 THEN 'Adult'
        WHEN age >= 56 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(DISTINCT id) AS customer_count  -- Corrected to use 'id' instead of 'user_id'
FROM
    users
WHERE
    id IN (SELECT DISTINCT user_id FROM orders WHERE status NOT IN ('Cancelled', 'Returned'))
GROUP BY
    age_group
ORDER BY
    age_group;