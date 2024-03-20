USE capstone_db;
	
-- Top 5 brand     
SELECT 
        p.brand,
        SUM(o.num_of_item) AS total_quantity_sold,
		SUM(oi.sale_price * o.num_of_item) AS total_sales_value
FROM
        products p
JOIN
        order_items oi ON p.id = oi.product_id
JOIN
        orders o ON oi.order_id = o.order_id
WHERE
        o.status NOT IN ('Cancelled', 'Returned')
GROUP BY
        p.brand
ORDER BY 
		total_quantity_sold DESC
LIMIT 5;