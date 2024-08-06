/*
****************************************************************
			DATA CLEANING
****************************************************************
*/

-- Creating the Database
CREATE DATABASE unicorn_companies_db;
USE unicorn_companies_db;

-- Creating the Table
CREATE TABLE unicorn_companies (
    company VARCHAR(255),
    valuation VARCHAR(50),
    date_joined DATE,
    industry VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    continent VARCHAR(255),
    year_founded INT,
    funding VARCHAR(50),
    select_investors TEXT
);
-- Importing the data using the MySQL Table Data Import Wizard

-- Inspect the Table
SELECT * 
FROM unicorn_companies;

-- Create a new table and populate it with the data from unicorn_companies
CREATE TABLE unicorns AS
SELECT *
FROM unicorn_companies;

-- Inspect the data
SELECT * FROM unicorns LIMIT 10;

-- Check for missing values
WITH missing_values AS (
    SELECT *
    FROM unicorns
    WHERE company IS NULL OR company = ''
       OR valuation IS NULL OR valuation = ''
       OR date_joined IS NULL
       OR industry IS NULL OR industry = ''
       OR city IS NULL OR city = ''
       OR country IS NULL OR country = ''
       OR continent IS NULL OR continent = ''
       OR year_founded IS NULL OR year_founded = ''
       OR funding IS NULL OR funding = ''
)
SELECT * FROM missing_values;
-- Some records had missing cities (16 records)

-- Fill the missing cities with placeholders 'Unknown'
UPDATE unicorns
SET city = 'Unknown'
WHERE city IS NULL OR city = '';

-- Verify there are no more missing values
WITH missing_values AS (
    SELECT *
    FROM unicorns
    WHERE company IS NULL OR company = ''
       OR valuation IS NULL OR valuation = ''
       OR date_joined IS NULL
       OR industry IS NULL OR industry = ''
       OR city IS NULL OR city = ''
       OR country IS NULL OR country = ''
       OR continent IS NULL OR continent = ''
       OR year_founded IS NULL OR year_founded = ''
       OR funding IS NULL OR funding = ''
)
SELECT * FROM missing_values;

-- Check for duplicate records
WITH duplicates AS (
    SELECT *,
           ROW_NUMBER() 
           OVER (PARTITION BY company, 
           valuation, date_joined, industry, 
           city, country, continent, year_founded, 
           funding, select_investors ORDER BY company) AS duplicate_records
    FROM unicorns
)
SELECT *
FROM duplicates
WHERE duplicate_records > 1; 

-- Removing white spaces
UPDATE unicorns
SET company = TRIM(company),
    valuation = TRIM(valuation),
    date_joined = TRIM(date_joined),
    industry = TRIM(industry),
    city = TRIM(city),
    country = TRIM(country),
    continent = TRIM(continent),
    funding = TRIM(funding),
    select_investors = TRIM(select_investors);
    
SELECT *
FROM unicorns;

-- Add columns for numeric funding and numeric valuation
ALTER TABLE unicorns
ADD COLUMN numeric_funding BIGINT,
ADD COLUMN numeric_valuation BIGINT;

-- Populate numeric_funding
UPDATE unicorns
SET numeric_funding = CASE
    WHEN funding LIKE '$%M' THEN CAST(REPLACE(REPLACE(funding, '$', ''), 'M', '') AS UNSIGNED) * 1000000
    WHEN funding LIKE '$%B' THEN CAST(REPLACE(REPLACE(funding, '$', ''), 'B', '') AS UNSIGNED) * 1000000000
    ELSE NULL
END;

-- Populate numeric_valuation
UPDATE unicorns
SET numeric_valuation = CASE
    WHEN valuation LIKE '$%M' THEN CAST(REPLACE(REPLACE(valuation, '$', ''), 'M', '') AS UNSIGNED) * 1000000
    WHEN valuation LIKE '$%B' THEN CAST(REPLACE(REPLACE(valuation, '$', ''), 'B', '') AS UNSIGNED) * 1000000000
    ELSE NULL
END;

-- Verify that the new columns contain expected values
SELECT company, funding, numeric_funding, valuation, numeric_valuation
FROM unicorns
LIMIT 10;

-- Standardize date formats
UPDATE unicorns
SET date_joined = STR_TO_DATE(date_joined, '%Y-%m-%d')
WHERE date_joined IS NOT NULL;

-- Standardize casing (convert to upper case for consistency) 
UPDATE unicorns
SET company = UPPER(company),
    industry = UPPER(industry),
    city = UPPER(city),
    country = UPPER(country),
    continent = UPPER(continent),
    select_investors = UPPER(select_investors);

SELECT *
FROM unicorns
LIMIT 10;


