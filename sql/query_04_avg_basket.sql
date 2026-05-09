SELECT
    st.city,
    st.store_name,
    ROUND(AVG(s.total_amount), 2) AS avg_basket_size
FROM sales_transactions s
JOIN stores st
    ON s.store_id = st.store_id
GROUP BY
    st.city,
    st.store_name
ORDER BY
    st.city,
    avg_basket_size DESC;