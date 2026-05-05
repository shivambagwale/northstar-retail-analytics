USE northstar_retail;

SELECT
    s.city,
    p.product_name,
    SUM(st.total_amount) AS revenue
FROM sales_transactions st
JOIN stores s
    ON st.store_id = s.store_id
JOIN products p
    ON st.product_id = p.product_id
GROUP BY s.city, p.product_name
ORDER BY revenue DESC;
