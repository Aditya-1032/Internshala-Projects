-- To create a database
create database Amazon;

-- To use the created database
use amazon;

-- Task 1: Data Cleaning & Preparation

-- Identify and delete duplicate Order_ID records.

WITH duplicate_orders AS
(SELECT 
	order_id,
	ROW_NUMBER() OVER(PARTITION BY order_id ORDER BY order_date) as rn
FROM orders)
DELETE FROM orders
WHERE order_id IN (
	SELECT order_id FROM duplicate_orders where rn>1
);

-- Replace null Traffic_Delay_Min with the average delay for that route. 

UPDATE routes
SET traffic_delay_min = (
	SELECT AVG(traffic_delay_min)
    FROM (
		SELECT traffic_delay_min
        FROM routes
        WHERE traffic_delay_min IS NOT NULL
    ) AS temp
)
WHERE traffic_delay_min is NULL;

-- Convert all date columns into YYYY-MM-DD format using SQL functions.

UPDATE orders
SET Order_Date = DATE_FORMAT(STR_TO_DATE(Order_Date, '%Y-%m-%d'), '%Y-%m-%d'),
	Expected_Delivery_Date = DATE_FORMAT(STR_TO_DATE(Expected_Delivery_Date, '%Y-%m-%d'), '%Y-%m-%d'),
	Actual_Delivery_Date = DATE_FORMAT(STR_TO_DATE(Actual_Delivery_Date, '%Y-%m-%d'), '%Y-%m-%d');
    
UPDATE shipment_tracking
SET Checkpoint_Time = DATE_FORMAT(STR_TO_DATE(Checkpoint_Time, '%Y-%m-%d'), '%Y-%m-%d');

-- Ensure that no Actual_Delivery_Date is before Order_Date (flag such records).

ALTER TABLE orders
ADD COLUMN Date_Flag VARCHAR(20);
UPDATE orders
SET date_flag = CASE 
					WHEN Actual_Delivery_Date < Order_Date THEN 'Invalid_Date'
                    ELSE 'valid'
				END;

-- Task 2: Delivery Delay Analysis


-- Calculate delivery delay (in days) for each order 

ALTER TABLE orders
ADD COLUMN Delivery_Delay_Days INT;

UPDATE orders
SET Delivery_Delay_Days = DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date);
SELECT Order_ID, Delivery_Delay_Days FROM orders;

SELECT Delivery_Delay_Days, COUNT(order_id) as Order_Count
FROM orders
GROUP BY Delivery_Delay_Days;

-- Find Top 10 delayed routes based on average delay days.

SELECT 
    o.route_id,
    r.start_location,
    r.end_location,
    AVG(o.Delivery_Delay_Days) AS avg_delay_days
FROM
    orders o
        JOIN
    routes r ON o.route_id = r.route_id
GROUP BY o.route_id , r.start_location , r.end_location
ORDER BY avg_delay_days DESC
LIMIT 10;

-- Use window functions to rank all orders by delay within each warehouse. 

WITH CTE AS
(SELECT 
	o.Warehouse_ID,  
    w.Location,
    o.Delivery_Delay_Days,
    RANK() OVER(
		PARTITION BY o.warehouse_id 
        ORDER BY o.Delivery_Delay_Days DESC
	) as Delay_Rank
FROM orders o
JOIN warehouse w
ON o.warehouse_id = w.warehouse_id)

SELECT *
FROM cte
WHERE delay_rank <= 5
ORDER BY warehouse_id, location, Delay_Rank;

-- Task 3: Route Optimization Insights

-- For each route, calculate
-- Average delivery time (in days).

SELECT 
	o.route_id,
    r.start_location,
    r.end_location,
    ROUND(AVG(DATEDIFF(o.actual_delivery_date, o.order_date)),2) AS avg_del_days
FROM orders o 
JOIN routes r 
ON o.route_id = r.route_id
GROUP BY o.route_id, r.start_location, r.end_location
ORDER BY avg_del_days DESC;

-- Average traffic delay. 

SELECT
	route_id, 
    start_location,
    end_location,
	ROUND(AVG(traffic_delay_min),2) AS avg_traffic_delay_in_min
FROM routes
GROUP BY route_id,  start_location, end_location
ORDER BY avg_traffic_delay_in_min DESC;

-- Distance-to-time efficiency ratio: Distance_KM / Average_Travel_Time_Min. 

SELECT 
	route_id,
    start_location,
    end_location, 
    distance_km,
    average_travel_time_min,
	ROUND(distance_km/average_travel_time_min,2)  AS efficiency_ratio
FROM routes
ORDER BY efficiency_ratio DESC;

-- Identify 3 routes with the worst efficiency ratio.
SELECT 
	route_id,
    start_location,
    end_location,
	ROUND(distance_km/average_travel_time_min,2)  AS efficiency_ratio
FROM routes
ORDER BY efficiency_ratio 
LIMIT 3;

-- Find routes with >20% delayed shipments. 
WITH route_delays AS
(SELECT 
	Route_ID,
    count(*) AS Total_Orders,
    SUM(CASE 
		WHEN DATEDIFF(actual_delivery_date, expected_delivery_date) > 0 THEN 1
        ELSE 0
	END) AS delayed_orders
FROM orders
GROUP BY Route_ID)

SELECT 
	rd.Route_ID,
    r.start_location,
    r.end_location,
    ROUND((rd.delayed_orders/rd.total_orders)*100,2) AS Delayed_Percentage
FROM route_delays rd
JOIN routes r 
	ON rd.route_id = r.route_id
WHERE (rd.delayed_orders/rd.total_orders)*100 > 20
ORDER BY Delayed_Percentage DESC;

-- Recommend potential routes for optimization.

/*
On the basis of average delivery time (in days), we can consider Route_IDs like R015 and R017 for route rescheduling because 
these routes have higher delivery delay — if we take 6 days as a reasonable delivery buffer.
*/

/*
Routes such as R016, R006, and R008 show lower efficiency ratios compared to other routes.
This indicates that deliveries along these routes are taking longer travel times relative to their distance, which may be due to 
lower average driver speed or traffic congestion.
These routes should be reviewed for possible re-optimization or schedule adjustments to improve delivery performance.
*/

/*
All analyzed routes show over 20 % delayed shipments, indicating that delivery delays are not limited to specific routes 
but are a network-wide issue.
Therefore, route re-optimization should be prioritized across the logistics network, focusing on factors such as traffic congestion, 
scheduling efficiency, and resource allocation to reduce overall delays.
*/

/*
When we analyzed delay percentages per route, every route exceeded the 20 % threshold. That means this isn’t just a single-route issue — it’s a pattern across the network.
So instead of optimizing one or two routes, Amazon should re-evaluate route planning and traffic management strategies overall.
*/

-- Task 4: Warehouse Performance

-- Find the top 3 warehouses with the highest average processing time.

SELECT 
	Warehouse_ID,
    Location,
	ROUND(AVG(Processing_Time_Min),1) as Avg_Processing_Time
FROM warehouse
GROUP BY Warehouse_ID, Location
ORDER BY Avg_Processing_Time DESC
LIMIT 3;

-- Calculate total vs. delayed shipments for each warehouse.

SELECT
	o.Warehouse_ID,
    w.Location,
    count(*) AS Total_Shipment,
    SUM(CASE 
			WHEN o.Expected_Delivery_Date < o.Actual_Delivery_Date THEN 1
            ELSE 0 END
		) AS Delayed_Shipment
FROM orders o 
JOIN warehouse w 
ON o.Warehouse_ID = w.Warehouse_ID
GROUP BY Warehouse_ID, Location
ORDER BY Delayed_Shipment DESC;

-- Use CTEs to find bottleneck warehouses where processing time > global average.

WITH avg_processing AS
(SELECT 
	AVG(Processing_Time_Min) as global_avg
FROM warehouse)

SELECT 
	w.warehouse_id,
    w.Location,
    w.Processing_Time_Min,
    a.global_avg,
    CASE 
		WHEN w.Processing_Time_Min > a.global_avg THEN 'Bottleneck'
		ELSE 'Normal'
	END AS 'status'
FROM warehouse w 
CROSS JOIN avg_processing a 
ORDER BY Processing_Time_Min DESC
LIMIT 10;

-- Rank warehouses based on on-time delivery percentage

SELECT 
	Warehouse_ID,
    Location,
    OnTime_Percentage,
    RANK() OVER(ORDER BY OnTime_Percentage DESC) AS Rank_By_OnTime
FROM 
(SELECT 
	o.Warehouse_ID,
    w.Location,
    ROUND((SUM(CASE WHEN DATEDIFF(o.Actual_Delivery_Date,o.Expected_Delivery_Date) <= 0 
    THEN 1 ELSE 0 END)/COUNT(*))*100,2) AS OnTime_Percentage
FROM orders o 
JOIN warehouse w 
ON o.warehouse_id = w.warehouse_id
GROUP BY warehouse_id, location) t;

-- Task 5: Delivery Agent Performance

-- Rank agents (per route) by on-time delivery percentage 

SELECT 
	Route_ID,
	Agent_ID, 
    On_Time_Percentage,
    RANK() OVER(PARTITION BY Route_ID ORDER BY On_Time_Percentage DESC) AS Route_Rank
FROM deliveryagents
ORDER BY Route_ID, Route_Rank;

-- Find agents with on-time % < 80%. 

SELECT 
	Route_ID,
	Agent_ID, 
    On_Time_Percentage
FROM deliveryagents
WHERE On_Time_Percentage < 80
ORDER BY On_Time_Percentage ASC;

-- Compare average speed of top 5 vs bottom 5 agents using subqueries. 

WITH top5 AS
	(SELECT 
		Agent_ID,
		Avg_Speed_KM_HR,
		RANK() OVER(ORDER BY On_Time_Percentage DESC) AS top5_rank
	FROM (
		SELECT 
		Agent_ID,
		Avg_Speed_KM_HR,
		On_Time_Percentage
		FROM deliveryagents
		ORDER BY On_Time_Percentage DESC
		LIMIT 5) AS t),
Bottom5 AS
	(SELECT 
		Agent_ID,
		Avg_Speed_KM_HR,
		RANK() OVER(ORDER BY On_Time_Percentage ASC) AS bottom5_rank
	FROM (
		SELECT 
		Agent_ID,
		Avg_Speed_KM_HR,
		On_Time_Percentage
		FROM deliveryagents
		ORDER BY On_Time_Percentage ASC
		LIMIT 5)AS b)
SELECT 
	t.top5_rank as Rank_No,
	t.agent_id as Top_Agent_ID,
    t.Avg_Speed_KM_HR AS Top5_Avg_Speed,
    b.agent_id as Bottom_Agent_ID,
    b.Avg_Speed_KM_HR AS Bottom5_Avg_Speed
FROM top5 t
JOIN bottom5 b
ON t.top5_rank = b.bottom5_rank
ORDER BY t.top5_rank;

-- Task 6: Shipment Tracking Analytics

-- For each order, list the last checkpoint and time. 

WITH last_checkpoint AS
(SELECT 
	Order_ID,
	Checkpoint, 
	Checkpoint_Time,
	ROW_NUMBER() 
    OVER(PARTITION BY Order_ID ORDER BY Checkpoint DESC, Checkpoint_Time DESC) rnk
FROM shipment_tracking) 
SELECT 
	Order_ID,
	Checkpoint, 
	Checkpoint_Time
FROM last_checkpoint
WHERE rnk = 1;

-- Find the most common delay reasons (excluding None).

SELECT 
	Delay_Reason,
    COUNT(*) as Occurences
FROM shipment_tracking
WHERE Delay_Reason IS NOT NULL
	AND Delay_Reason != 'None'
GROUP BY Delay_Reason
ORDER BY Occurences DESC;

-- Identify orders with >2 delayed checkpoints 

SELECT 
	Order_ID,
    COUNT(Checkpoint) AS Delayed_Checkpoints
FROM shipment_tracking
WHERE Delay_Reason != 'None'
GROUP BY Order_ID
HAVING Delayed_Checkpoints > 2 
ORDER BY Delayed_Checkpoints DESC;

-- Task 7: Advanced KPI Reporting

-- Calculate KPIs using SQL queries: 

-- Average Delivery Delay per Region (Start_Location). 

SELECT
	Start_Location AS Region,
    ROUND(AVG(Delivery_Delay_Days),2) AS Avg_Delivery_Delay_Days
FROM orders o
JOIN routes r 
ON o.Route_ID = r.Route_ID
GROUP BY Start_Location
ORDER BY Avg_Delivery_Delay_Days DESC;

-- On-Time Delivery % = (Total On-Time Deliveries / Total Deliveries) * 100.

SELECT 
    ROUND(100.0 * SUM(CASE
                WHEN Delivery_Status = 'On Time' THEN 1
                ELSE 0
            END) / COUNT(*),
            2) AS On_Time_Delivery_Percent
FROM
    orders;

-- Average Traffic Delay per Route.

SELECT 
	Route_ID, 
    Start_Location,
    End_Location,
    ROUND(AVG(Traffic_Delay_Min),2) AS Avg_Traffic_Delay_Min
FROM routes
GROUP BY Route_ID, Start_Location, End_Location
ORDER BY Avg_Traffic_Delay_Min DESC;
