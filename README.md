# Unicorn Companies Analysis

This repository contains an SQL-based analysis of unicorn companies valued at $1 billion or more. The project focuses on data cleaning and exploration to uncover trends and insights about these high-growth companies.

## Project Overview

Unicorn companies are startups that have reached a valuation of $1 billion or more. This project explores the key characteristics of these companies, including:
- Their industries
- Geographical locations
- Time to reach unicorn status
- Top investors behind them

## Dataset

The dataset used in this analysis includes the following fields:
- **Company**: The name of the unicorn company.
- **Valuation**: The company's valuation in billions (B) of dollars.
- **Date Joined**: The date the company reached a $1 billion valuation.
- **Industry**: The industry the company operates in.
- **City**: The city where the company was founded.
- **Country**: The country where the company was founded.
- **Continent**: The continent where the company was founded.
- **Year Founded**: The year the company was established.
- **Funding**: The total amount raised by the company across all funding rounds in billions (B) or millions (M) of dollars.
- **Select Investors**: Top 4 investing firms or individual investors.

You can access the dataset [here](https://mavenanalytics.io/data-playground?order=date_added%2Cdesc&search=unicorn).

## Tools and Approach

### MySQL

MySQL is used for data cleaning and exploratory data analysis.

### Data Cleaning

The raw data required significant cleaning to ensure accuracy and consistency:
- **Handling Missing Data**: Missing cities were filled with placeholders.
- **Removing Duplicates**: Duplicate records were identified and removed.
- **Standardizing Formats**: Text fields were standardized, and valuation and funding amounts were converted to numeric values for easier analysis.

### Exploratory Data Analysis (EDA)

With clean data, the analysis explores several key aspects:
- **Industry Leaders**: Fintech, Internet Software, and E-commerce lead in the number of unicorns.
- **Geographical Insights**: The United States dominates the unicorn landscape, with San Francisco emerging as a key hub.
- **Investment Patterns**: Top investors like Accel, Tiger Global Management, and Andreessen Horowitz play a significant role in backing unicorns.
- **Growth Speed**: On average, it takes about 7 years for a startup to achieve unicorn status.

## SQL Scripts

- **`data_cleaning.sql`**: Script for cleaning and preparing the dataset for analysis.
- **`data_analysis.sql`**: Script for performing exploratory data analysis and generating insights.

## Conclusion

This project not only cleans and explores data on unicorn companies but also provides a deeper understanding of the factors that contribute to their success. By examining trends in industries, locations, and investments, we gain valuable insights into the dynamics of these billion-dollar startups.
