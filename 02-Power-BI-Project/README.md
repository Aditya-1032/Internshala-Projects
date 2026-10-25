# Retail Customer Retention Analytics – TESCO

**Project Type:** Customer Analytics & Business Intelligence  
**Tool:** Microsoft Power BI  
**Training Program:** Internshala Data Science Training

## 1. Project Overview

Retail Customer Retention Analytics is a Power BI project developed as part of my Data Science training with Internshala Trainings.

The project uses a retail business scenario based on TESCO to analyze customer retention, churn behavior, repeat purchases, loyalty program effectiveness, store performance, and Customer Lifetime Value (CLV).

The goal is to consolidate customer, transaction, store, loyalty, and churn data into an interactive dashboard that supports data-driven customer retention strategies.

## 2. Business Problem

Customer retention is a key challenge for retail businesses operating across multiple regions and store formats.

The project focuses on answering the following business questions:

- Why are customers churning, and which segments are most affected?
- Which customers are valuable and which may be at risk?
- How do loyalty tiers and promotions relate to customer retention?
- How does repeat purchase behavior vary across customer segments?
- Which regions and store types require targeted retention strategies?
- How can customer lifetime value guide retention decisions?

## 3. Project Objectives

- Consolidate customer demographics, transaction history, store information, loyalty data, and churn indicators.
- Develop a structured data model in Power BI.
- Analyze churn rates across customer and store segments.
- Evaluate repeat purchase behavior and loyalty tiers.
- Assess promotion effectiveness and loyalty point activity.
- Calculate and segment Customer Lifetime Value.
- Build an interactive, multi-page dashboard with actionable recommendations.

## 4. Dataset Description

The project uses five CSV datasets provided with the assignment.

| Dataset | Description |
|---|---|
| `Customer_Demographics.csv` | Customer IDs, age, gender, membership date, marital status, region, and income group. |
| `Customer_Transactions.csv` | Transaction dates, store IDs, product categories, purchase amounts, quantities, and promotion usage. |
| `Store_Locations.csv` | Store IDs, cities, regions, store types, and opening years. |
| `Loyalty_Program.csv` | Customer loyalty tiers, points earned, points redeemed, and redemption dates. |
| `Churn_Labelled_Customers.csv` | Last transaction dates, churn labels, and days since the last purchase. |

## 5. Project Tasks and Analysis

The assignment covers eight tasks.

### Task 1: Data Modeling and Cleaning

- Load and transform datasets using Power Query Editor.
- Remove duplicate records using relevant key columns.
- Set appropriate data types and handle missing values.
- Create membership duration, transaction year, and transaction month fields.
- Establish relationships between customer demographics, transactions, loyalty, churn, and store data.

### Task 2: Churn and Retention Metrics

- Calculate the overall churn rate.
- Analyze churn by region, income group, and store type.
- Identify the five regions with the highest churn rates.
- Create a funnel showing total customers, repeat customers, and churned customers.

**Churn Rate Formula:**

`Churn Rate = (Churned Customers / Total Customers) × 100`

### Task 3: Repeat Purchase Analysis

- Categorize customers by purchase frequency.
- Compare average purchase frequency across regions, age groups, and loyalty tiers.
- Identify product categories frequently purchased by loyal customers.
- Visualize customer distribution across purchase-frequency segments.

The assignment defines purchase-frequency groups as:
- Low tier: 2–4 purchases
- Mid tier: 5–10 purchases
- High tier: 11 or more purchases

### Task 4: Promotion and Loyalty Impact

- Calculate the percentage of transactions involving promotions.
- Compare average purchase amounts with and without promotions.
- Compare churn rates across loyalty tiers.
- Visualize points earned versus points redeemed by tier.
- Develop recommendations for improving loyalty program effectiveness.

### Task 5: Store Performance vs. Retention

- Connect transactions with store location information.
- Compare average transaction amounts by store type.
- Analyze churn rates by store region.
- Examine the relationship between store opening year and retention.
- Recommend store-specific customer retention initiatives.

### Task 6: Customer Lifetime Value (CLV) Analysis

- Calculate CLV using total customer spend and membership duration.
- Segment customers into low-, medium-, and high-value groups.
- Visualize CLV against days since the last purchase.
- Compare average CLV by loyalty tier and region.
- Identify valuable customers who may benefit from targeted reactivation campaigns.

**CLV Formula:**

`CLV = Total Amount Spent / Membership Duration (in years)`

### Task 7: Final Dashboard and Executive Summary

Develop a multi-page Power BI report covering:

- **Page 1 – Overview KPIs:** Churn, CLV, and repeat purchase rate.
- **Page 2 – Loyalty and Promotion Impact:** Promotion usage, loyalty tiers, redemption, and churn.
- **Page 3 – Store and Region Insights:** Store performance and regional retention.
- **Page 4 – Customer Segmentation:** Churned, repeat, and high-value customers.

The assignment also calls for slicers for region, income group, loyalty tier, and store type, along with a summary of the three main recommendations.

### Task 8: Video Explanation

Prepare a 3–5 minute presentation explaining the project, business problem, key findings, and actionable recommendations in your own words.

## 6. Dashboard Highlights and Reported Findings

The submitted project report presents the following results:

- **51.67% churn rate**, with 155 churned customers out of 300.
- **0.85 repeat rate**, as displayed in the executive dashboard.
- **331.3 average CLV**, as displayed in the executive dashboard.
- Liverpool and Birmingham are identified in the report as priority regions for retention campaigns.
- The Platinum loyalty tier has the highest reported churn rate among the three loyalty tiers.
- Superstores show a higher average transaction amount than Express stores.
- More than half of transactions involve promotions, while the reported average purchase amounts with and without promotions are relatively close.

These findings are based on the submitted report and should be interpreted in the context of its underlying dataset and metric definitions.

## 7. Key Business Recommendations

The project report proposes the following actions:

1. **Strengthen loyalty benefits:** Encourage Silver customers to progress toward Gold through relevant rewards and exclusive benefits.
2. **Improve Platinum retention:** Review Platinum tier benefits, redemption convenience, and personalized offers.
3. **Reactivate valuable customers:** Target high-CLV customers who have not purchased recently.
4. **Optimize promotions:** Favor targeted, loyalty-based or region-based offers over blanket discounts.
5. **Prioritize high-churn regions:** Focus retention initiatives on Liverpool and Birmingham, as highlighted in the report.
6. **Improve newer-store onboarding:** Strengthen early engagement and loyalty-building initiatives at newer stores.

## 8. Tools and Techniques

- **Microsoft Power BI:** Interactive dashboards and business reporting.
- **Power Query Editor:** Data loading, cleaning, and transformation.
- **Data Modeling:** Relationships between customer, transaction, loyalty, churn, and store tables.
- **DAX and Measures:** KPI calculations and analytical metrics, where implemented in the report.
- **Data Visualization:** KPI cards, bar charts, funnel charts, scatter plots, and slicers.
- **Customer Segmentation:** Purchase-frequency and CLV-based analysis.

## 9. Project Files

- `README.md` — Project overview, tasks, methodology, and reported findings.
- `TESCO Project.pbix` — Power BI report file.
- `Customer_Demographics.csv` — Customer demographic data.
- `Customer_Transactions.csv` — Transaction data.
- `Store_Locations.csv` — Store information.
- `Loyalty_Program.csv` — Loyalty program data.
- `Churn_Labelled_Customers.csv` — Customer churn data.

## 10. Learning Outcomes

This project provided practical experience in:

- Cleaning and transforming data using Power Query.
- Building relationships between multiple datasets.
- Developing customer retention and churn metrics.
- Analyzing repeat purchases, loyalty, and promotional activity.
- Calculating and segmenting customer lifetime value.
- Building interactive dashboards for business decision-making.
- Translating analytical findings into customer retention recommendations.

## 11. Acknowledgement

Completed as part of the Data Science training program offered by Internshala Trainings.
