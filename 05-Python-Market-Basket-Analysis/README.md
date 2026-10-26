# Market Basket Analysis with Python – Amazon

## Project Overview

This project analyzes Amazon customer survey data to understand purchasing behavior, product category preferences, shopping satisfaction, cart abandonment, and personalized recommendations. Using Python, the analysis applies data cleaning, exploratory data analysis (EDA), customer segmentation, K-Means clustering, and data visualization to identify customer behavior patterns and develop actionable business recommendations.

## Objectives

- Clean and prepare customer survey data for analysis.
- Analyze customer demographics and purchasing behavior.
- Identify popular product categories and product search methods.
- Understand the main reasons for cart abandonment.
- Segment customers based on purchase frequency and shopping satisfaction.
- Apply K-Means clustering to identify behavioral groups.
- Examine relationships between recommendation frequency, review-related measures, and shopping satisfaction.
- Recommend improvements to customer engagement and personalization strategies.

## Dataset

The dataset contains **800 customer survey responses and 24 columns** covering demographics, purchase frequency, product categories, browsing behavior, reviews, recommendations, and shopping satisfaction.

Key fields include:
- `age` and `Gender`
- `Purchase_Frequency`
- `Purchase_Categories`
- `Product_Search_Method`
- `Cart_Abandonment_Factors`
- `Customer_Reviews_Importance`
- `Recommendation_Helpfulness`
- `Rating_Accuracy`
- `Shopping_Satisfaction`

## Tools and Technologies

- **Python**
- Pandas and NumPy
- Matplotlib and Seaborn
- Scikit-learn — StandardScaler and K-Means clustering
- Mlxtend — Apriori and association rule mining libraries imported in the notebook
- Jupyter Notebook

## Project Workflow

### 1. Data Cleaning and Preparation
- Checked for duplicate records.
- Standardized categorical values.
- Handled missing values in `Product_Search_Method` using the mode.
- Corrected duplicate or inconsistently formatted column names.
- Converted rating and satisfaction columns to numeric data types.

### 2. Exploratory Data Analysis
- Analyzed customer age and gender distributions.
- Examined purchase frequency and product category preferences.
- Investigated product search methods and cart abandonment factors.
- Calculated descriptive statistics for shopping satisfaction, review importance, and rating accuracy.
- Created charts to communicate key patterns.

### 3. Customer Segmentation
Created rule-based customer groups:
- **Frequent Buyers**
- **Occasional Shoppers**
- **At-Risk Customers**
- **Others**

Also applied K-Means clustering to standardized satisfaction, review importance, rating accuracy, and recommendation frequency measures.

### 4. Recommendation and Review Analysis
- Compared shopping satisfaction across recommendation-helpfulness groups.
- Examined correlations between recommendation frequency and satisfaction.
- Evaluated review-related measures and rating accuracy.
- Developed recommendations for improving personalization and customer trust.

### 5. Data Visualization
Created visualizations including:
- Purchase frequency distribution
- Product search method distribution
- Cart abandonment factors
- Product category preferences
- Shopping satisfaction distribution
- Correlation heatmap

## Key Findings

- **Moderate satisfaction:** Average shopping satisfaction was approximately 3.01 on a five-point scale.
- **Product categories:** Clothing and Fashion appeared frequently in customers' reported purchase categories, indicating potential cross-selling opportunities.
- **Search behavior:** Keyword search was the most frequently reported product search method, with 327 responses.
- **Cart abandonment:** High shipping costs (224 responses) and finding a better price elsewhere (206 responses) were the two most frequently reported reasons.
- **Customer segmentation:** The rule-based segmentation identified 135 Frequent Buyers, 82 Occasional Shoppers, 320 At-Risk Customers, and 263 Others.
- **Recommendation frequency:** Its correlation with shopping satisfaction was approximately −0.013, indicating virtually no linear relationship in this dataset.

## Business Recommendations

1. Improve personalized recommendation relevance rather than simply increasing recommendation frequency.
2. Review shipping costs and communicate delivery charges transparently to reduce cart abandonment.
3. Strengthen review credibility and the usefulness of product information.
4. Develop targeted retention strategies for customers with low shopping satisfaction.
5. Tailor engagement campaigns to different customer behavior segments.

## Project Files

- `README.md` — Project documentation
- `Market Basket Analysis.ipynb` — Python analysis notebook
- `Amazon.csv` — Customer survey dataset
- `Market Basket Analysis-Amazon.pdf` — Project summary report
- `Market Basket Analysis.pdf` — Notebook export or detailed analysis report

## Conclusion

This project uses Python-based exploratory analysis and customer segmentation to investigate Amazon customer behavior. The findings highlight opportunities to improve shopping satisfaction, address cart abandonment, and make customer engagement more relevant. The analysis demonstrates the application of data cleaning, visualization, statistical exploration, and clustering to a business problem.

*Note: The documented dataset is survey-based. Although Apriori and association rule mining libraries were imported, specific association rules or product-pair results are not reported in the project findings above.*
