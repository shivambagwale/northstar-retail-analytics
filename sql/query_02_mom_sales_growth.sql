WITH monthly_sales AS (
    SELECT
        s.store_id,
        st.store_name,
        DATE_FORMAT(s.transaction_date, '%Y-%m') AS month,
        SUM(s.total_amount) AS revenue
    FROM sales_transactions s
    JOIN stores st ON s.store_id = st.store_id
    GROUP BY s.store_id, st.store_name, DATE_FORMAT(s.transaction_date, '%Y-%m')
),
sales_with_prev AS (
    SELECT
        store_id,
        store_name,
        month,
        revenue,
        LAG(revenue) OVER (
            PARTITION BY store_id
            ORDER BY month
        ) AS prev_revenue
    FROM monthly_sales
)
SELECT
    store_name,
    month,
    revenue,
    prev_revenue,
    ROUND(
        ((revenue - prev_revenue) / prev_revenue) * 100,
        2
    ) AS mom_growth_pct
FROM sales_with_prev
ORDER BY store_name, month;