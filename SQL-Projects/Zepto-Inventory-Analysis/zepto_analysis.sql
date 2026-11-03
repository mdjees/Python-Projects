DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(150),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

-- DATA EXPLORATION
SELECT COUNT(*) AS row_count FROM zepto;
SELECT * FROM zepto LIMIT 10;

SELECT *
FROM zepto
WHERE name IS NULL OR mrp IS NULL OR category IS NULL
   OR discountPercent IS NULL OR availableQuantity IS NULL
   OR discountedSellingPrice IS NULL OR weightInGms IS NULL
   OR outOfStock IS NULL OR quantity IS NULL;

SELECT DISTINCT category FROM zepto ORDER BY category;

SELECT outOfStock, COUNT(*) AS sku_count
FROM zepto
GROUP BY outOfStock
ORDER BY outOfStock;

SELECT name, COUNT(*) AS sku_count
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY sku_count DESC, name;

-- DATA CLEANING
SELECT *
FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

-- Apply this conversion only when the source values are stored in paise.
-- Run once; do not rerun on already-converted data.
UPDATE zepto
SET mrp = mrp / 100.00,
    discountedSellingPrice = discountedSellingPrice / 100.00;

-- BUSINESS QUESTIONS
-- 1. Products with the highest listed discount percentages
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- 2. Higher-priced products currently out of stock
SELECT DISTINCT name, mrp
FROM zepto
WHERE mrp > 300 AND outOfStock = TRUE
ORDER BY mrp DESC;

-- 3. Estimated value of currently available discounted inventory.
-- This is NOT realised revenue or sales.
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS estimated_discounted_inventory_value
FROM zepto
GROUP BY category
ORDER BY estimated_discounted_inventory_value DESC;

-- 4. Higher-priced products with relatively small discounts
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent ASC;

-- 5. Categories with the highest average discount
SELECT category, ROUND(AVG(discountPercent), 2) AS average_discount_pct
FROM zepto
GROUP BY category
ORDER BY average_discount_pct DESC
LIMIT 5;

-- 6. Product weight segmentation
SELECT name, weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'LOW'
           WHEN weightInGms < 5000 THEN 'MEDIUM'
           ELSE 'BULK'
       END AS weight_category
FROM zepto
ORDER BY weightInGms;

-- 7. Total listed inventory weight by category
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_inventory_weight_g
FROM zepto
GROUP BY category
ORDER BY total_inventory_weight_g DESC;
