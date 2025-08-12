-- =========================================================
-- TASK 6: Sales Trend Analysis Using Aggregations
-- Dataset: online_sales (from synthetic_online_retail_data.csv)
-- Objective: Analyze monthly revenue and order volume
-- =========================================================


-- =========================================================
-- 1. Extract the month from order_date
-- =========================================================
SELECT 
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month
FROM online_sales;


-- =========================================================
-- 2. Group data by year and month
-- =========================================================
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


-- =========================================================
-- 3. Calculate monthly revenue using SUM()
-- Formula: revenue = quantity * price
-- =========================================================
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    SUM(quantity * price) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


-- =========================================================
-- 4. Count order volume (all rows)
-- =========================================================
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    COUNT(*) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


-- =========================================================
-- 5. Count unique orders (using COUNT DISTINCT)
-- Only works if an order_id column exists in the table
-- =========================================================
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


-- =========================================================
-- 6. Combine monthly revenue and volume in one query
-- =========================================================
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    SUM(quantity * price) AS monthly_revenue,
    COUNT(*) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


-- =========================================================
-- 7. Get the top 3 months by revenue
-- =========================================================
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    SUM(quantity * price) AS monthly_revenue
FROM online_sales
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;


-- =========================================================
-- 8. Limit results for a specific time period (example: 2024 only)
-- =========================================================
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%Y-%m-%d')) AS month,
    SUM(quantity * price) AS monthly_revenue,
    COUNT(*) AS order_volume
FROM online_sales
WHERE STR_TO_DATE(order_date, '%Y-%m-%d') 
      BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY year, month
ORDER BY monthly_revenue DESC;
