/* E-commerce revenue, customer and product analytics
   Dialect: MySQL 8+
   Expected tables: orders, order_items, products, customers, payments, deliveries
   Monetary amounts are assumed to use a consistent currency. Validate schema names.
*/

-- 1. Revenue by year-month (keeps years distinct)
WITH order_sales AS (
  SELECT order_id, SUM(quantity * selling_price) AS order_revenue
  FROM order_items GROUP BY order_id
)
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS year_month,
       SUM(os.order_revenue) AS revenue
FROM order_sales os
JOIN payments p ON p.order_id = os.order_id
GROUP BY DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY year_month;

-- 2. Gross product contribution using realised selling price less unit cost
SELECT p.product_id, p.product_name,
       SUM(oi.quantity) AS units_sold,
       SUM(oi.quantity * (oi.selling_price - p.cost)) AS gross_contribution
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY gross_contribution DESC;

-- 3. Total revenue
SELECT ROUND(SUM(quantity * selling_price), 2) AS total_revenue
FROM order_items;

-- 4. Monthly revenue trend (year-month)
WITH order_sales AS (
  SELECT order_id, SUM(quantity * selling_price) AS revenue
  FROM order_items GROUP BY order_id
)
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS year_month,
       SUM(os.revenue) AS monthly_revenue
FROM order_sales os
JOIN payments p ON p.order_id = os.order_id
GROUP BY DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY year_month;

-- 5. Total distinct orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM orders;

-- 6. Average order value
WITH order_sales AS (
  SELECT order_id, SUM(quantity * selling_price) AS revenue
  FROM order_items GROUP BY order_id
)
SELECT ROUND(AVG(revenue), 2) AS average_order_value FROM order_sales;

-- 7. Revenue contribution by product
WITH product_sales AS (
  SELECT product_id, SUM(quantity * selling_price) AS revenue
  FROM order_items GROUP BY product_id
)
SELECT p.product_name, ps.revenue,
       ROUND(100.0 * ps.revenue / NULLIF(SUM(ps.revenue) OVER (), 0), 2) AS revenue_share_pct
FROM product_sales ps
JOIN products p ON p.product_id = ps.product_id
ORDER BY ps.revenue DESC;

-- 8. Total customers
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM customers;

-- 9. Repeat-customer rate: customers with 2+ orders / all ordering customers
WITH customer_orders AS (
  SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
  FROM orders GROUP BY customer_id
)
SELECT COUNT(*) AS ordering_customers,
       SUM(order_count >= 2) AS repeat_customers,
       ROUND(100.0 * SUM(order_count >= 2) / NULLIF(COUNT(*), 0), 2) AS repeat_customer_rate_pct
FROM customer_orders;

-- 10. Customer revenue (historical revenue proxy for CLV, not predictive lifetime value)
WITH order_revenue AS (
  SELECT order_id, SUM(quantity * selling_price) AS revenue
  FROM order_items GROUP BY order_id
)
SELECT o.customer_id, SUM(orv.revenue) AS historical_customer_revenue
FROM orders o
JOIN order_revenue orv ON orv.order_id = o.order_id
GROUP BY o.customer_id
ORDER BY historical_customer_revenue DESC;

-- 11. Top five products by revenue
SELECT p.product_id, p.product_name,
       SUM(oi.quantity * oi.selling_price) AS total_revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 12. Returned line-item rate (change numerator/denominator if business definition differs)
SELECT ROUND(
  100.0 * COUNT(DISTINCT CASE WHEN d.return_flag = 'Y' THEN oi.order_id END)
  / NULLIF(COUNT(DISTINCT oi.order_id), 0), 2
) AS orders_with_return_pct
FROM order_items oi
JOIN deliveries d ON d.order_id = oi.order_id;

-- 13. Average delivery time
SELECT ROUND(AVG(DATEDIFF(delivered_date, shipped_date)), 2) AS avg_delivery_days
FROM deliveries
WHERE delivered_date IS NOT NULL AND shipped_date IS NOT NULL;

-- 14. Cancellation rate
SELECT ROUND(
  100.0 * SUM(CASE WHEN LOWER(order_status) = 'cancelled' THEN 1 ELSE 0 END)
  / NULLIF(COUNT(*), 0), 2
) AS cancellation_rate_pct
FROM orders;
