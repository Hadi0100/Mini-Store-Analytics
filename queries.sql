-- 1) Total revenue (PAID only)
SELECT ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'PAID';

-- 2) Revenue by month
SELECT
  DATE_TRUNC('month', o.order_date)::date AS month,
  ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'PAID'
GROUP BY 1
ORDER BY 1;

-- 3) Top 3 customers by spend
SELECT
  c.full_name,
  ROUND(SUM(oi.quantity * oi.unit_price), 2) AS spend
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'PAID'
GROUP BY c.full_name
ORDER BY spend DESC
LIMIT 3;

-- 4) Best-selling products (by units)
SELECT
  p.name,
  SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'PAID'
GROUP BY p.name
ORDER BY units_sold DESC;

-- 5) Revenue by category
SELECT
  p.category,
  ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'PAID'
GROUP BY p.category
ORDER BY revenue DESC;

-- 6) Customers who have never placed an order
SELECT c.customer_id, c.full_name, c.email
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

-- 7) Average order value (AOV) for PAID orders
WITH order_totals AS (
  SELECT
    o.order_id,
    SUM(oi.quantity * oi.unit_price) AS order_total
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.order_id
  WHERE o.status = 'PAID'
  GROUP BY o.order_id
)
SELECT ROUND(AVG(order_total), 2) AS avg_order_value
FROM order_totals;

-- 8) Orders with 2+ unique products
SELECT
  o.order_id,
  COUNT(DISTINCT oi.product_id) AS unique_products
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id
HAVING COUNT(DISTINCT oi.product_id) >= 2
ORDER BY unique_products DESC;

-- 9) Find “repeat customers” (2+ PAID orders)
SELECT
  c.full_name,
  COUNT(*) AS paid_orders
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.status = 'PAID'
GROUP BY c.full_name
HAVING COUNT(*) >= 2
ORDER BY paid_orders DESC;

-- 10) Refund impact (PAID vs REFUNDED totals)
SELECT
  o.status,
  ROUND(SUM(oi.quantity * oi.unit_price), 2) AS amount
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status IN ('PAID','REFUNDED')
GROUP BY o.status
ORDER BY o.status;
