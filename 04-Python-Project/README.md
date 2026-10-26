# Financial Risk Analysis with Python – Barclays

**Project Type:** Financial Data Analysis  
**Tools:** Python, Pandas, NumPy, Matplotlib, Seaborn, Jupyter Notebook  
**Dataset:** Barclays Financial Transactional Data

## 1. Project Overview

This project was completed as part of my Data Science training with Internshala Trainings.

The project focuses on analyzing customer financial behavior, account performance, transaction patterns, and potential financial risk indicators using Python.

Using transactional data, the analysis explores credit and debit activity, account balances, customer activity levels, net inflows, dormant accounts, and unusual financial behavior.

The objective is to transform raw transactional data into meaningful insights that can support data-driven financial analysis and risk monitoring.

## 2. Business Problem

As digital financial transactions increase, financial institutions need to understand how customers use their accounts and identify patterns that may indicate financial risk.

This project investigates questions such as:

- How do customers interact with different account types?
- What trends can be observed in deposits, payments, transfers, and withdrawals?
- Which accounts have the highest and lowest net inflows?
- Which accounts show low activity or long gaps between transactions?
- Are there accounts with negative balances or unusual transaction patterns?
- Is there a statistically significant difference in average balances between high-volume and low-volume transaction accounts?

## 3. Project Objectives

- Clean and validate financial transaction data.
- Analyze monthly and yearly transaction trends.
- Compare deposits, withdrawals, payments, and transfers.
- Identify accounts with high and low net inflows.
- Classify accounts by transaction frequency.
- Segment accounts by average balance and transaction volume.
- Identify potential financial risk indicators and anomalies.
- Perform exploratory data analysis using visualizations.
- Apply hypothesis testing to investigate differences between account segments.

## 4. Dataset Description

The project uses the **Barclays Financial Transactional Data** Excel dataset provided with the assignment.

The dataset contains 800 transaction records and 15 columns, including:

| Column | Description |
|---|---|
| `TransactionID` | Transaction identifier |
| `CustomerID` | Customer identifier |
| `AccountID` | Account identifier |
| `AccountType` | Account category, such as Savings, Current, Credit, or Loan |
| `TransactionType` | Transaction category, including Deposit, Payment, Transfer, and Withdrawal |
| `Product` | Associated financial product |
| `Firm` | Firm identifier or category |
| `Region` | Customer or account region |
| `Manager` | Associated manager |
| `TransactionDate` | Transaction date |
| `TransactionAmount` | Transaction amount |
| `AccountBalance` | Recorded account balance |
| `RiskScore` | Risk score associated with the record |
| `CreditRating` | Credit rating value |
| `TenureMonths` | Account or customer tenure in months |

## 5. Project Tasks and Analysis

The assignment consists of seven tasks.

### Task 1: Data Cleaning and Formatting

- Round selected numerical fields to two decimal places.
- Convert transaction amounts and account balances to numeric data types.
- Check for missing values.
- Convert transaction dates into datetime format.
- Standardize categorical values by removing extra spaces and applying consistent capitalization.
- Check for duplicate records.
- Investigate negative transaction amounts and flag negative balances in Savings accounts for further review.

**Tools:** Pandas, NumPy.

### Task 2: Descriptive Transactional Analysis

- Calculate monthly and yearly transaction summaries.
- Analyze transaction amounts by transaction type.
- Visualize monthly deposit and withdrawal trends.
- Identify the top five and bottom five accounts by net inflow.
- Flag accounts with gaps of two months or more between consecutive transactions.

**Net Inflow Calculation:**

Net inflow is calculated by adding deposits and transfers and subtracting payments and withdrawals, using the transaction values as defined in the analysis.

**Tools:** Pandas grouping and aggregation, datetime operations, Matplotlib.

### Task 3: Customer Profile Building

- Classify accounts into High, Medium, and Low activity groups based on transaction frequency.
- Segment accounts by average balance.
- Segment accounts by total transaction volume.
- Build a balance-versus-volume segmentation matrix.
- Identify high-net-inflow accounts.
- Profile high-frequency, low-balance accounts.
- Identify accounts with negative or near-zero balances.

**Activity Classification Rubric:**

- **High Activity:** 10 or more transactions.
- **Medium Activity:** 5–9 transactions.
- **Low Activity:** Fewer than 5 transactions.

Balance and transaction-volume segments use the 33rd and 66th percentiles as thresholds.

**Tools:** Pandas, NumPy, aggregation, quantiles, and cross-tabulation.

### Task 4: Financial Risk Identification

- Investigate accounts with potentially unusual transaction behavior.
- Examine negative balances and flag negative balances in Savings accounts.
- Analyze balance variability using statistical measures.
- Identify unusual transaction values using anomaly-detection methods specified in the analysis.
- Explore patterns that may indicate financial stress or irregular account activity.

**Tools:** Pandas, NumPy, descriptive statistics, and statistical anomaly analysis.

### Task 5: Exploratory Data Analysis and Visualization

- Visualize transaction trends over time.
- Compare deposits and withdrawals.
- Present top and bottom accounts by net inflow.
- Explore customer activity and balance segments.
- Use charts to communicate patterns and potential risk indicators.

**Tools:** Matplotlib, Seaborn.

### Task 6: Hypothesis Testing

The assignment asks whether high-volume transaction accounts have statistically higher average balances than low-volume accounts.

The analysis is intended to:

- Define high-volume and low-volume account groups.
- Formulate null and alternative hypotheses.
- Select an appropriate statistical test.
- Compare the groups' average balances.
- Interpret the test result and its implications.

The statistical conclusion should be reported according to the actual test output and significance level used in the notebook.

### Task 7: Video Presentation

The assignment requires a video presentation of less than five minutes that explains:

- The business problem and project objectives.
- The major findings from transaction and account analysis.
- The financial risk indicators identified.
- Data-backed recommendations for customer engagement or risk monitoring.

The presentation should use charts from the analysis to communicate findings clearly.

## 6. Tools and Technologies

- **Python:** Core programming language for analysis.
- **Pandas:** Data loading, cleaning, grouping, aggregation, and segmentation.
- **NumPy:** Numerical operations and conditional classification.
- **Matplotlib:** Transaction trend and account performance charts.
- **Seaborn:** Exploratory data visualization.
- **Jupyter Notebook:** Interactive development, analysis, and documentation.
- **Excel:** Source dataset format.

## 7. Key Findings Documented in the Notebook

The submitted notebook documents the following results:

- The dataset contains 800 records across 15 columns, with no missing values reported in the initial data-quality check.
- The duplicate check did not change the dataset's row count.
- The account activity classification produced 5 High Activity accounts, 65 Medium Activity accounts, and 123 Low Activity accounts.
- The analysis identified the top five accounts by net inflow, led by `ACC92360` with a recorded net inflow of 373,707.43.
- The notebook flagged four Savings accounts with negative balances for further review.
- The dormancy analysis flagged 164 accounts as dormant and 29 as non-dormant under the implemented two-month-gap rule.

These figures describe the results recorded in the notebook. Dormancy flags indicate gaps between consecutive observed transactions; they do not, by themselves, establish a customer's current account status or prove suspicious activity.

## 8. Project Files

| File | Description |
|---|---|
| `README.md` | Project overview, tasks, methods, and documented findings |
| `Financial Risk Analysis with Python- Barclays.ipynb` | Jupyter Notebook containing the Python analysis and outputs |
| `Financial Risk Analysis with Python- Barclays.xlsx` | Source transactional dataset |
| `Financial Risk Analysis with Python- Barclays.pdf` | Exported report containing the analysis and visualizations |

## 9. Learning Outcomes

This project provided practical experience in:

- Cleaning and validating structured financial data.
- Working with dates, numerical fields, and categorical variables.
- Analyzing transaction trends and account-level performance.
- Applying grouping, aggregation, and customer segmentation.
- Identifying potential risk indicators and unusual financial patterns.
- Creating visualizations for exploratory data analysis.
- Applying statistical reasoning to financial questions.
- Translating analytical results into business-oriented insights.

## 10. Conclusion

This project demonstrates the application of Python to financial transaction analysis and risk exploration. It combines data cleaning, descriptive analysis, account profiling, anomaly investigation, visualization, and hypothesis testing.

The analysis provides a structured approach to understanding customer transaction behavior and identifying accounts that may warrant further investigation.

The results should be interpreted as analytical indicators rather than definitive evidence of fraud or financial misconduct.

## 11. Acknowledgement

Completed as part of the Data Science training program offered by Internshala Trainings.
