-- SUPPLY CHAIN CONTROL TOWER | DuckDB

SELECT COUNT(DISTINCT "Order Id") AS total_orders,
       SUM(Sales) AS total_sales,
       AVG("Days for shipping (real)") AS avg_actual_shipping_days
FROM read_csv_auto('../data/sample_supply_chain_data.csv');

WITH prepared AS (
    SELECT *,
           CASE WHEN "Days for shipping (real)" > "Days for shipment (scheduled)"
                THEN 1.0 ELSE 0.0 END AS late_shipment_flag
    FROM read_csv_auto('../data/sample_supply_chain_data.csv')
)
SELECT Market,
       COUNT(DISTINCT "Order Id") AS orders,
       AVG(late_shipment_flag) AS late_rate,
       SUM(Sales) AS total_sales
FROM prepared
GROUP BY Market
ORDER BY late_rate DESC;

WITH prepared AS (
    SELECT *,
           CASE WHEN "Days for shipping (real)" > "Days for shipment (scheduled)"
                THEN 1.0 ELSE 0.0 END AS late_shipment_flag
    FROM read_csv_auto('../data/sample_supply_chain_data.csv')
)
SELECT "Shipping Mode",
       COUNT(DISTINCT "Order Id") AS orders,
       AVG(late_shipment_flag) AS late_rate
FROM prepared
GROUP BY "Shipping Mode"
ORDER BY late_rate DESC;
