WITH store_revenue AS (
    SELECT
        st.city,
        st.store_name,
        SUM(s.total_amount) AS revenue
    FROM sales_transactions s
    JOIN stores st
        ON s.store_id = st.store_id
    GROUP BY
        st.city,
        st.store_name
)
SELECT
    city,
    store_name,
    revenue,
    RANK() OVER (
        PARTITION BY city
        ORDER BY revenue DESC
    ) AS city_rank
FROM store_revenue
ORDER BY
    city,
    city_rank;