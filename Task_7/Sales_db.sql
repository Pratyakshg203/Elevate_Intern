CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;
CREATE TABLE IF NOT EXISTS sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2)
);
INSERT INTO sales (product, quantity, price) VALUES
('Apple', 10, 0.50),
('Apple', 5, 0.50),
('Banana', 20, 0.30),
('Banana', 10, 0.30),
('Orange', 15, 0.40),
('Orange', 10, 0.40),
('Grapes', 8, 1.00),
('Grapes', 12, 1.00);
SELECT * FROM sales;