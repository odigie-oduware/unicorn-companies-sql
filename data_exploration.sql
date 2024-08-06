/*
************************************************************************
			EXPLORATORY DATA ANALYSIS 
*************************************************************************
*/

USE unicorn_companies_db;

-- Inspect the data
SELECT *
FROM unicorns;

-- Count the number of rows
SELECT COUNT(*) AS total_rows FROM unicorns;
-- There are 1074 records

-- Count the number of distinct industries
SELECT COUNT(DISTINCT(industry))
FROM unicorns;
-- There are 15 different industries in the dataset

-- Calculate the average time it takes for companies to reach unicorn status
SELECT AVG(YEAR(date_joined) - year_founded) AS avg_years_to_unicorn
FROM unicorns;
-- It takes about 7 years for companies to achieve unicorn status from their founding date

-- Determine the industries with the highest number of unicorn companies
SELECT industry, COUNT(*) AS company_count
FROM unicorns
GROUP BY industry
ORDER BY company_count DESC
LIMIT 10;
-- Fintech, Internet Software and E-commerce 

-- Identify the country with the most unicorn companies
SELECT country, COUNT(*) AS company_count
FROM unicorns
GROUP BY country
ORDER BY company_count DESC
LIMIT 10;
-- United States 

-- Identify the city with the most unicorn companies
SELECT city, COUNT(*) AS company_count
FROM unicorns
GROUP BY city
ORDER BY company_count DESC
LIMIT 10;
-- San Fansisco 

-- Find out which investors have funded the most unicorn companies
WITH investor_list AS (
    SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(select_investors, ',', numbers.n), ',', -1)) AS investor
    FROM unicorns
    JOIN (SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) numbers 
    ON CHAR_LENGTH(select_investors) - CHAR_LENGTH(REPLACE(select_investors, ',', '')) >= numbers.n - 1
)
SELECT investor, COUNT(*) AS num_investments
FROM investor_list
GROUP BY investor
ORDER BY num_investments DESC
LIMIT 10;
-- Accel, Tiger Global Management and Andreessen Horowitz

-- List the unicorn companies with the highest valuation
SELECT company, numeric_valuation
FROM unicorns
ORDER BY numeric_valuation DESC
LIMIT 10;
-- Bytedance, SpaceX and SHEIN 

-- Count the number of unicorn companies without funding
SELECT COUNT(*) AS unicorns_without_funding
FROM unicorns
WHERE numeric_funding = 0;
-- There's only 1 Unicorn Company without funding

-- Count the number of companies that did not disclose their funding
SELECT COUNT(*)
FROM unicorns
WHERE numeric_funding IS NULL;
-- 12 companies didnt disclose their funding

-- The oldest unicorn company in the dataset
SELECT company, industry, year_founded
FROM unicorns
ORDER BY year_founded ASC
LIMIT 3;
-- Otto Bock Healthcare, Promasidor Holdings and FIve Star Business Finance

-- The newest unicorn companies in the dataset
SELECT company, industry, year_founded
FROM unicorns
ORDER BY year_founded DESC
LIMIT 3;
-- Candy.com, Yuga Labs and Flink Food

-- Average valuation of companies by year founded
WITH year_valuations AS (
    SELECT year_founded, AVG(numeric_valuation) AS avg_valuation
    FROM unicorns
    GROUP BY year_founded
)
SELECT * 
FROM year_valuations
ORDER BY year_founded;


