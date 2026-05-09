SELECT
    p.product_id,
    p.product_name,
    COALESCE(SUM(s.quantity), 0) AS units_sold
FROM products p
LEFT JOIN sales_transactions s
    ON p.product_id = s.product_id
    AND s.transaction_date >= (
        SELECT DATE_SUB(MAX(transaction_date), INTERVAL 30 DAY)
        FROM sales_transactions
    )
GROUP BY
    p.product_id,
    p.product_name
HAVING
    units_sold < 5
ORDER BY
    units_sold ASC,
    p.product_name;