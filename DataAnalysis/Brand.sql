SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM 
    sales_transactions
WHERE 
    transaction_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 9 MONTH)
GROUP BY 
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY 
    year DESC, month DESC;
	
    
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