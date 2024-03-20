-- Loyalty Campaign

WITH customer_revenue AS (
    SELECT
        u.id AS customer_id,
        u.first_name,
        u.last_name,
        u.gender,
        p.brand,
        u.country,
        SUM(oi.sale_price * o.num_of_item) AS total_revenue
    FROM
        users u
    JOIN
        orders o ON u.id = o.user_id
    JOIN
        order_items oi ON o.order_id = oi.order_id
    JOIN
        products p ON oi.product_id = p.id
    WHERE
        u.country = 'Germany'
        AND u.gender = 'F'
        AND p.brand = 'Calvin Klein'
        AND o.status NOT IN ('Cancelled', 'Returned')
    GROUP BY
        u.id, u.first_name, u.last_name, u.gender, u.country, p.brand
)
SELECT
    first_name,
    last_name,
    gender,
    country,
    brand,
    total_revenue
FROM
    customer_revenue
ORDER BY
    total_revenue DESC
LIMIT 5;
