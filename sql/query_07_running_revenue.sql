WITH monthly_category_sales AS (
    SELECT
        p.category,
        DATE_FORMAT(s.transaction_date, '%Y-%m') AS month,
        SUM(s.total_amount) AS revenue
    FROM sales_transactions s
    JOIN products p
        ON s.product_id = p.product_id
    GROUP BY
        p.category,
        DATE_FORMAT(s.transaction_date, '%Y-%m')
)
SELECT
    category,
    month,
    revenue,
    SUM(revenue) OVER (
        PARTITION BY category
        ORDER BY month
    ) AS running_revenue
FROM monthly_category_sales
ORDER BY
    category,
    month;