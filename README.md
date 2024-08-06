# Unicorn Companies Data Analysis

This repository contains SQL scripts for data cleaning and exploratory data analysis (EDA) of unicorn companies. The dataset includes information about private companies with a valuation over $1 billion as of March 2022.

## Files

- **data_cleaning.sql**: Script for cleaning the unicorn companies dataset.
- **data_exploration.sql**: Script for performing exploratory data analysis on the cleaned dataset.

## Data Source

The dataset is sourced from [Maven Analytics](https://mavenanalytics.io/data-playground?order=date_added%2Cdesc&search=unicorn).

## Data Cleaning Steps

1. **Database and Table Creation**: Create the database and table structure.
2. **Data Import**: Import data into the `unicorn_companies` table.
3. **Data Inspection**: Initial inspection of the data.
4. **Missing Values Handling**: Identify and handle missing values.
5. **Duplicate Records Handling**: Identify and handle duplicate records.
6. **Whitespace Removal**: Trim whitespace from text fields.
7. **Numeric Conversion**: Convert `funding` and `valuation` columns to numeric values.
8. **Date Standardization**: Standardize date formats.
9. **Casing Standardization**: Convert text fields to upper case for consistency.

## Exploratory Data Analysis Steps

1. **Data Inspection**: Inspect the cleaned data.
2. **Descriptive Statistics**: Count rows, distinct industries, and calculate average years to unicorn status.
3. **Industry Analysis**: Identify industries with the highest number of unicorn companies.
4. **Geographical Analysis**: Identify countries and cities with the most unicorn companies.
5. **Investor Analysis**: Identify investors with the most unicorn company investments.
6. **Valuation Analysis**: List companies with the highest valuation.
7. **Funding Analysis**: Count companies without funding and those that did not disclose funding.
8. **Historical Analysis**: Identify the oldest and newest unicorn companies.

## Usage

1. **Data Cleaning**: Run `data_cleaning.sql` to clean the dataset.
2. **Exploratory Data Analysis**: Run `data_exploration.sql` to perform EDA on the cleaned dataset.

## License

This project is licensed under the MIT License.
