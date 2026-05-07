USE northstar_retail;

SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue
FROM sales_transactions
GROUP BY month
ORDER BY month;