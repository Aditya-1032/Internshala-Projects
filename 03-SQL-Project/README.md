# Logistics Optimization for Delivery Routes – Amazon

**Project Type:** SQL Data Analysis  
**Database:** MySQL  
**Tools:** MySQL, phpMyAdmin

## 1. Project Overview

This project focuses on analyzing logistics and delivery operations using SQL. The objective is to evaluate delivery delays, route efficiency, warehouse performance, shipment tracking, and delivery agent performance to identify operational bottlenecks and opportunities for improvement.

Using relational datasets covering orders, routes, warehouses, delivery agents, and shipment tracking, the project applies SQL queries to transform raw operational data into meaningful insights.

## 2. Business Problem

Efficient logistics operations are essential for timely deliveries and customer satisfaction. Delivery delays, inefficient routes, warehouse processing issues, and shipment disruptions can affect overall delivery performance.

This project addresses the following business questions:

- Which routes experience the highest average delivery delays?
- Which routes have poor distance-to-time efficiency?
- Which warehouses have longer processing or dispatch times?
- What are the major reasons for shipment delays?
- How effectively are delivery agents meeting expected delivery timelines?
- Which operational areas should be prioritized for optimization?

## 3. Project Objectives

- Clean and prepare logistics datasets using SQL.
- Identify and handle duplicate records and missing values.
- Calculate delivery delays for individual orders.
- Rank delayed orders within each warehouse.
- Analyze average delivery time and traffic delays by route.
- Evaluate route efficiency and identify routes requiring optimization.
- Examine warehouse processing and dispatch performance.
- Analyze shipment tracking events and delay reasons.
- Calculate key delivery performance indicators.

## 4. Dataset Description

The project uses five datasets representing different parts of the logistics process.

| Dataset | Description |
|---|---|
| Orders | Order dates, expected delivery dates, actual delivery dates, and related order information. |
| Routes | Route IDs, starting and ending locations, distances, average travel times, and traffic delays. |
| Warehouses | Warehouse details and operational processing information. |
| Delivery Agents | Delivery agent information, including speed and on-time performance metrics. |
| Shipment Tracking | Shipment checkpoints, timestamps, and delivery delay reasons. |

## 5. Project Tasks and SQL Analysis

The assignment is organized into seven tasks.

### Task 1: Data Cleaning and Preparation

- Identify and remove duplicate orders.
- Replace missing traffic delay values with appropriate averages.
- Standardize date formats to `YYYY-MM-DD`.
- Identify records where the actual delivery date precedes the order date.

**SQL techniques:** Common Table Expressions (CTEs), `ROW_NUMBER()`, `UPDATE`, `AVG()`, `STR_TO_DATE()`, and conditional expressions.

### Task 2: Delivery Delay Analysis

- Calculate delivery delay in days for each order.
- Identify the top 10 routes with the highest average delivery delay.
- Rank orders by delivery delay within each warehouse using window functions.

**SQL techniques:** `DATEDIFF()`, `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT`, `RANK()`, and `PARTITION BY`.

### Task 3: Route Optimization Insights

- Calculate average delivery time for each route.
- Calculate average traffic delay by route.
- Calculate the distance-to-time efficiency ratio.
- Identify the three routes with the worst efficiency ratio.
- Find routes with more than 20% delayed shipments.
- Recommend routes for potential optimization.

**SQL techniques:** Aggregate functions, joins, calculated columns, conditional aggregation, and sorting.

### Task 4: Warehouse Performance Analysis

- Calculate average processing time for each warehouse.
- Identify the five warehouses with the longest average processing times.
- Calculate dispatch delay as the difference between dispatch time and order time.
- Rank warehouses based on their dispatch performance.

**SQL techniques:** Date and time calculations, aggregate functions, joins, and ranking.

### Task 5: Shipment Tracking Analysis

- Identify shipments delayed at specific checkpoints.
- Calculate average time spent between shipment checkpoints.
- Identify the most common reasons for shipment delays.
- Analyze shipment movement to identify potential operational bottlenecks.

**SQL techniques:** Date and time functions, conditional aggregation, joins, and grouping.

### Task 6: Delivery Agent Performance

- Calculate average delivery speed for each agent.
- Identify the top 10 agents with the highest on-time delivery rates.
- Compare agent performance using available operational metrics.

**SQL techniques:** Aggregate functions, joins, grouping, sorting, and ranking.

### Task 7: Key Performance Indicators (KPIs)

Calculate and analyze the following delivery performance indicators:

- **On-Time Delivery Rate:** Percentage of orders delivered on or before the expected delivery date.
- **Average Delivery Delay:** Average delay in days across relevant orders.
- **Route Efficiency:** Distance traveled relative to average travel time.
- **Warehouse Processing Time:** Average time required to process orders.
- **Delivery Agent Performance:** Comparison of delivery speed and on-time delivery rates.

The goal is to provide a consolidated view of logistics performance and support operational improvement decisions.

## 6. SQL Concepts and Techniques Used

- Data cleaning and duplicate identification
- Common Table Expressions (CTEs)
- Window functions: `ROW_NUMBER()` and `RANK()`
- Aggregate functions: `AVG()`, `COUNT()`, and other calculations
- Joins across relational tables
- Conditional logic using `CASE`
- Date and time calculations
- Data manipulation using `UPDATE` and `ALTER TABLE`
- Grouping, sorting, and filtering
- KPI calculations and operational analysis

## 7. Project Files

| File | Description |
|---|---|
| `Amazon.sql` | SQL queries for data cleaning and logistics analysis. |
| `Orders.csv` | Source order data. |
| `Routes.csv` | Route information. |
| `Warehouses.csv` | Warehouse information. |
| `DeliveryAgents.csv` | Delivery agent information. |
| `Shipment_Tracking.csv` | Shipment tracking records. |
| `Logistics_Optimization_Presentation.pptx` | Presentation containing the project tasks, query outputs, and recommendations. |

## 8. Key Findings and Recommendations

The project presentation identifies routes such as **R015 and R017** for possible rescheduling based on their high average delivery times.

The analysis also examines routes with poor efficiency ratios, routes with more than 20% delayed shipments, warehouse processing delays, shipment delay reasons, and delivery agent performance.

Potential recommendations include:

- Review and reschedule routes with consistently high delivery times.
- Investigate routes with high traffic delays and low distance-to-time efficiency.
- Improve warehouse processing and dispatch workflows.
- Address recurring shipment checkpoint delays.
- Use delivery agent performance metrics to identify areas for operational improvement.

Specific recommendations should be finalized using the verified query results.

## 9. Learning Outcomes

This project provided practical experience in:

- Writing SQL queries for operational data analysis.
- Cleaning and validating relational datasets.
- Using joins, CTEs, and window functions.
- Analyzing delivery delays and route efficiency.
- Evaluating warehouse and delivery agent performance.
- Calculating operational KPIs.
- Converting SQL query results into business recommendations.

## 10. Acknowledgement

This project was completed as part of the Data Science training program offered by Internshala Trainings.
