USE capstone_db;
SELECT u.first_name, u.last_name, u.gender, u.country, p.brand, SUM(o.num_of_item * oi.sale_price) AS total_sales_value
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.order_id = oi.id
JOIN products p ON oi.product_id = p.id
WHERE 
    u.country IN ('Germany') AND
    u.gender IN ('F') AND	
    p.brand IN ('Calvin Klein') AND
    o.status NOT IN ('Cancelled', 'Returned')
GROUP BY u.first_name, u.last_name, u.gender, u.country, p.brand
ORDER BY total_sales_value DESC
LIMIT 5;