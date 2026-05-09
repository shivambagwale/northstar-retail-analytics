WITH customer_store_visits AS (
    SELECT
        store_id,
        customer_id,
        COUNT(*) AS visits
    FROM sales_transactions
    GROUP BY
        store_id,
        customer_id
)
SELECT
    st.store_name,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN visits > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        SUM(CASE WHEN visits > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS repeat_rate_pct
FROM customer_store_visits csv
JOIN stores st
    ON csv.store_id = st.store_id
GROUP BY
    st.store_name
ORDER BY
    repeat_rate_pct DESC;