SELECT * FROM scm.inventory_operations;

#1.	What is the overall sales performance?
SELECT sum(units_sold) AS total_units_sold, sum(COGS) AS total_revenue
FROM scm.inventory_operations;


#2.	Which regions contribute the most to revenue?
SELECT region, sum(units_sold) AS total_units, sum(cogs) AS revenue
FROM scm.inventory_operations
GROUP BY region
ORDER BY revenue DESC;


#3.	Which product categories drive sales?
SELECT category, sum(units_sold) AS units_sold, sum(cogs) AS revenue
FROM scm.inventory_operations
GROUP BY category;


#4.	Which suppliers contribute the most to sales?
SELECT supplier, sum(units_sold) AS total_units, sum(cogs) AS revenue
FROM scm.inventory_operations
GROUP BY supplier
ORDER BY revenue DESC;


#5.	What is the distribution of order status?
SELECT order_status, count(*) AS total_orders
FROM scm.inventory_operations
GROUP BY order_status;


#6.	Which suppliers have the highest delivery lead time?
SELECT supplier, avg(`lead_time (days)`) AS avg_lead_time
FROM scm.inventory_operations
GROUP BY supplier
ORDER BY avg_lead_time DESC;


#7.	How efficiently are warehouses utilizing capacity?
SELECT warehouse, avg(inventory_level) AS avg_inventory_level, avg(warehouse_capacity) AS capacity,
(avg(inventory_level) / avg(warehouse_capacity)) * 100 AS utilization_pct
FROM scm.inventory_operations
GROUP BY warehouse;


#8.	Which categories are overstocked or understocked?
SELECT category, avg(inventory_level) AS avg_stock
FROM scm.inventory_operations
GROUP BY category
ORDER BY avg_stock DESC;


#9.	Which regions incur the highest transportation costs?
SELECT region, sum(transportation_cost) AS total_transport_cost
FROM scm.inventory_operations
GROUP BY region
ORDER BY total_transport_cost DESC;


#10. What is the cost efficiency across product categories?
SELECT category, sum(cogs)/sum(units_sold) AS cost_per_unit
FROM scm.inventory_operations
GROUP BY category;


#11. How does sales performance vary over time?
SELECT date AS month, sum(units_sold) AS total_units, sum(cogs) AS revenue
FROM scm.inventory_operations
GROUP BY date
ORDER BY date;


#12. Which warehouses perform best in terms of delivery efficiency?
SELECT warehouse, sum(units_sold) AS total_units, avg(`lead_time (days)`) AS avg_delivery_time
FROM scm.inventory_operations
GROUP BY warehouse;