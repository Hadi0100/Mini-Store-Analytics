INSERT INTO customers (full_name, email, created_at) VALUES
('Amina Hassan', 'amina@example.com', '2025-10-01'),
('Omar Ali',     'omar@example.com',  '2025-10-05'),
('Sarah Khan',   'sarah@example.com', '2025-10-12'),
('John Reed',    'john@example.com',  '2025-10-18'),
('Lina Noor',    'lina@example.com',  '2025-11-02');

INSERT INTO products (name, category, unit_price) VALUES
('Wireless Mouse', 'Electronics', 24.99),
('USB-C Cable',    'Electronics',  9.99),
('Notebook',       'Stationery',   4.50),
('Water Bottle',   'Lifestyle',   18.00),
('Hoodie',         'Apparel',     45.00),
('Beanie',         'Apparel',     15.00);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2025-11-01', 'PAID'),
(1, '2025-11-15', 'PAID'),
(2, '2025-11-20', 'PAID'),
(3, '2025-12-02', 'PENDING'),
(4, '2025-12-05', 'PAID'),
(5, '2025-12-06', 'REFUNDED');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 24.99),
(1, 2, 2,  9.99),
(1, 3, 3,  4.50),
(2, 5, 1, 45.00),
(2, 6, 1, 15.00),
(3, 4, 2, 18.00),
(3, 2, 1,  9.99),
(4, 1, 1, 24.99),
(5, 5, 2, 45.00),
(6, 6, 1, 15.00);
