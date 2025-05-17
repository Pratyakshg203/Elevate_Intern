CREATE DATABASE Retail;
USE Retail;
/*Total Sales, Profit, and Quantity*/
SELECT 
    ROUND(SUM(sale_price), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity
FROM order_clean;
/*Sales by Category*/
SELECT 
    category,
    ROUND(SUM(sale_price), 2) AS sales,
    ROUND(SUM(profit), 2) AS profit
FROM order_clean
GROUP BY category
ORDER BY sales DESC;
/* Top 5 Cities by Sales*/
SELECT 
    city,
    state,
    ROUND(SUM(sale_price), 2) AS total_sales
FROM order_clean
GROUP BY city, state
ORDER BY total_sales DESC
LIMIT 5;
/*Monthly Sales Trend*/
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(sale_price), 2) AS monthly_sales
FROM order_clean
GROUP BY month
ORDER BY month;
/*Average Discount per Sub-category*/
SELECT 
    sub_category,
    ROUND(AVG(discount), 2) AS avg_discount
FROM order_clean
GROUP BY sub_category
ORDER BY avg_discount DESC;

-- Sales Distribution by Shipping Mode
SELECT 
    ship_mode,
    COUNT(*) AS order_count,
    ROUND(SUM(sale_price), 2) AS total_sales
FROM order_clean
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- Top 5 States by Quantity Sold
SELECT 
    state,
    SUM(quantity) AS total_quantity
FROM order_clean
GROUP BY state
ORDER BY total_quantity DESC
LIMIT 5;
-- Least Profitable Products (Losses)
SELECT 
    product_id,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sale_price), 2) AS total_sales
FROM order_clean
GROUP BY product_id
HAVING total_profit < 0
ORDER BY total_profit ASC
LIMIT 10;