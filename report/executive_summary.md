# Executive Summary

This project analyzes NorthStar Retail transactional, customer, product, store, and inventory datasets to identify business trends, customer behavior, and operational patterns.

## Key Findings

- Total revenue analyzed: 14.05M
- Total transactions: 6,525
- Total customers: 535

- The top 20% of customers contributed approximately 33.9% of total revenue.
- Repeat customer rate was 99.8%, indicating strong customer retention within the dataset.
- Weekend transactions had significantly higher basket values than weekday transactions.
- Top revenue-generating products included Smart Watch Lite, mens blazer, and Bluetooth Speaker X10.
- Highest-performing stores included NorthStar Whitefield, NorthStar Kothrud, and NorthStar Camp.

## Data Quality Notes

- customers.csv contains 535 records while the imported MySQL customers table contained 506 records.
- Referential integrity checks confirmed that no sales transactions referenced missing customer, product, or store records.
- Mixed date formats and inconsistent naming conventions were identified and cleaned during preprocessing.

## Deliverables

- SQL-based analysis
- Python exploratory analysis
- statistical testing
- Power BI dashboard
- GitHub project repository