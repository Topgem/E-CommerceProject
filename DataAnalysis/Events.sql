SELECT * FROM capstone_db.events;

SELECT COUNT(traffic_source) AS total_count, traffic_source AS channels
FROM users as u
INNER JOIN orders AS o 
ON u.id = o.user_id
WHERE o.status NOT IN ('Cancelled', 'Returned')
GROUP BY channels
ORDER BY channels DESC
LIMIT 3;
