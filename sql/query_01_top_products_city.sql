WITH product_city_revenue AS (
    SELECT
        st.city,
        p.product_name,
        SUM(s.total_amount) AS revenue
    FROM sales_transactions s
    JOIN stores st ON s.store_id = st.store_id
    JOIN products p ON s.product_id = p.product_id
    GROUP BY st.city, p.product_name
),
ranked_products AS (
    SELECT
        city,
        product_name,
        revenue,
        ROW_NUMBER() OVER (
            PARTITION BY city
            ORDER BY revenue DESC
        ) AS rn
    FROM product_city_revenue
)
SELECT
    city,
    product_name,
    revenue
FROM ranked_products
WHERE rn <= 10
ORDER BY city, revenue DESC;