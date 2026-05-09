WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.full_name,
        SUM(s.total_amount) AS revenue
    FROM sales_transactions s
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.customer_id, c.full_name
),
ranked_customers AS (
    SELECT
        customer_id,
        full_name,
        revenue,
        ROW_NUMBER() OVER (
            ORDER BY revenue DESC
        ) AS rn,
        COUNT(*) OVER () AS total_customers
    FROM customer_revenue
)
SELECT
    customer_id,
    full_name,
    revenue
FROM ranked_customers
WHERE rn <= CEIL(total_customers * 0.20)
ORDER BY revenue DESC;