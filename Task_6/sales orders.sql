CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;
DROP TABLE IF EXISTS online_sales;
CREATE TABLE online_sales (
    order_id VARCHAR(255),
    order_date DATE,
    product VARCHAR(255),
    quantity_ordered INT,
    price_each DECIMAL(10,2)
);
LOAD DATA INFILE 'D:\intern elevate\Task_ 6\sales orders export 2025-04-29 14-38-58\\sales orders export 2025-04-29 14-38-58.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_date, product, quantity_ordered, price_each);
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(quantity_ordered * price_each) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;