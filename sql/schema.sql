CREATE DATABASE IF NOT EXISTS northstar_retail;
USE northstar_retail;

CREATE TABLE stores (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50),
    pincode VARCHAR(10),
    size_sqft INT,
    open_date DATE,
    manager_name VARCHAR(100),
    manager_phone VARCHAR(25)
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(80),
    subcategory VARCHAR(100),
    unit_price DECIMAL(10,2),
    unit_cost DECIMAL(10,2),
    brand VARCHAR(80),
    launch_date DATE
);

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(120),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    phone VARCHAR(30),
    email VARCHAR(120),
    join_date VARCHAR(30),
    loyalty_tier VARCHAR(30)
);

CREATE TABLE sales_transactions (
    transaction_id VARCHAR(20) PRIMARY KEY,
    transaction_date VARCHAR(30),
    transaction_time TIME,
    store_id VARCHAR(10),
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    total_amount DECIMAL(12,2),
    payment_method VARCHAR(50),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE inventory_snapshots (
    inventory_id VARCHAR(20) PRIMARY KEY,
    snapshot_date VARCHAR(30),
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    opening_stock INT,
    units_sold INT,
    units_received INT,
    closing_stock INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
