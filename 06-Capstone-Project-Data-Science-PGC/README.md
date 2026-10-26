# Capstone Project: End-to-End Book Analytics

## Project Overview

This capstone project demonstrates an end-to-end data science workflow using book data collected from the BooksToScrape website. The project covers web scraping, data cleaning, exploratory data analysis (EDA), machine learning, and interactive dashboard development.

The objective is to analyze book prices, ratings, genres, and availability, identify patterns in the dataset, build a price prediction model, and communicate findings through a Power BI dashboard.

## Objectives

- Collect book information through web scraping.
- Clean and preprocess the collected dataset.
- Perform exploratory data analysis to identify trends and relationships.
- Engineer useful features for analysis and modelling.
- Develop and evaluate a regression model to predict book prices.
- Build an interactive Power BI dashboard.
- Derive business insights and recommendations from the analysis.

## Tools and Technologies

- **Python**
- Pandas and NumPy
- Requests and BeautifulSoup
- Matplotlib and Seaborn
- Scikit-learn
- Jupyter Notebook
- Power BI

## Project Workflow

### 1. Web Scraping

Collected book information from BooksToScrape using Python web scraping techniques.

The extracted attributes included:
- Book title
- Genre
- Price
- Rating
- Availability

### 2. Data Cleaning and Preprocessing

Prepared the scraped data for analysis by:
- Checking missing values and duplicate records.
- Standardizing text and numeric formats.
- Removing non-informative categories.
- Creating additional features, including price bands, rating percentages, and title length.

### 3. Exploratory Data Analysis

Investigated book prices, ratings, genres, and relationships between variables through statistical summaries and visualizations.

Key areas included:
- Distribution of book prices.
- Distribution of ratings.
- Genre-wise pricing and ratings.
- Relationships between price and rating.

### 4. Machine Learning: Price Prediction

Developed a regression model to predict book prices and evaluated its performance using Mean Absolute Error (MAE), Root Mean Squared Error (RMSE), and the R² score.

**Reported model performance:**

| Evaluation Metric | Result |
|---|---:|
| Mean Absolute Error (MAE) | 12.58 |
| Root Mean Squared Error (RMSE) | 15.01 |
| R² Score | -0.094 |

The negative R² score indicates that the model did not explain price variability effectively and performed poorly relative to a baseline that predicts the mean price. This highlights the limitations of the selected features and opportunities for further model improvement.

### 5. Interactive Power BI Dashboard

Developed an interactive dashboard to present book-related KPIs and insights.

Dashboard features included:
- Total books
- Average rating
- Price range
- Interactive slicers
- Bookmarks
- Drill-through
- Decomposition tree

## Key Findings

- **Price distribution:** Book prices were slightly right-skewed, indicating the presence of higher-priced books.
- **Ratings:** Most books had ratings between 3 and 5.
- **Genre differences:** Some genres had higher book counts without necessarily having higher ratings.
- **Price and rating:** The analysis found no strong relationship between book price and rating.
- **Model limitations:** The regression model's negative R² score suggests that additional variables may be needed to explain book prices accurately.

## Business Recommendations

1. Consider genre-specific pricing strategies rather than relying on ratings alone.
2. Explore content similarity and reader preferences when developing book recommendation systems.
3. Improve future price prediction models by incorporating additional information, such as author popularity, publisher reputation, and review sentiment.
4. Use interactive dashboards to monitor book inventory, pricing patterns, and ratings across genres.

## Repository Structure

```text
06-Capstone-Project-Data-Science-PGC/
├── README.md
├── Dashboard.pbix
├── Final Report.pdf
├── Web Scrapping/
│   ├── Book_scrape.ipynb
│   └── books_full_dataset.csv
├── Data Cleaning/
│   ├── Data Cleaning.ipynb
│   └── Books_cleaned_dataset.csv
├── EDA/
│   └── EDA.ipynb
└── Modelling/
    └── MACHINE LEARNING MODEL.ipynb
```

## Conclusion

This project demonstrates the application of web scraping, data preparation, exploratory analysis, regression modelling, and interactive dashboard development in a complete data science workflow.

The findings suggest that book price alone is not a strong indicator of reader ratings. The modelling results also demonstrate the importance of evaluating predictive performance critically and identifying additional features that may improve future models.

## Project Deliverables

- Web scraping notebook
- Raw scraped dataset
- Data cleaning notebook and cleaned dataset
- EDA notebook
- Machine learning notebook
- Power BI dashboard
- Final project report

