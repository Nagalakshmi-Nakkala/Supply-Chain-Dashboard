CREATE DATABASE SupplyChainDB;

USE SupplyChainDB;


-- Late delivery by shipping mode
DESCRIBE supply_chain_cleaned;

-- Late delivery by shipping mode
SELECT `Shipping Mode`,
       COUNT(*) AS total_orders,
       ROUND(SUM(`Delivery Delay`) * 100.0 / COUNT(*), 1) AS late_pct
FROM supply_chain_cleaned
GROUP BY `Shipping Mode`
ORDER BY late_pct DESC;



--  Sales by market
SELECT Market,
       ROUND(SUM(Sales), 0) AS total_sales,
       COUNT(*) AS total_orders
FROM supply_chain_cleaned
GROUP BY Market
ORDER BY total_sales DESC;



-- Top 5 categories by profit
SELECT `Category Name`,
       ROUND(AVG(`Benefit per order`), 1) AS avg_profit,
       COUNT(*) AS total_orders
FROM supply_chain_cleaned
GROUP BY `Category Name`
ORDER BY avg_profit DESC
LIMIT 5;




-- Order status count
SELECT `Order Status`,
       COUNT(*) AS total,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM supply_chain_cleaned), 1) AS pct
FROM supply_chain_cleaned
GROUP BY `Order Status`
ORDER BY total DESC;
