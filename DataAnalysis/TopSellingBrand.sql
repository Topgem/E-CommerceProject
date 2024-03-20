-- Top selling brands

WITH brand_sales AS (
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
)
SELECT
    RANK()  OVER (ORDER BY total_quantity_sold DESC) AS category_rank,
    ROW_NUMBER() OVER (ORDER BY total_quantity_sold DESC) AS category_row,
	DENSE_RANK() OVER (ORDER BY total_quantity_sold DESC) AS category_dense_rank,
    brand,
    total_quantity_sold,
    total_sales_value
FROM
    brand_sales;