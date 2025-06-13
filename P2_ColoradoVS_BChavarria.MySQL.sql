
-- ================================================
-- Goal: Calculate total annual sales by county
-- Features:
--    - Normalizes inconsistent county names
--    - Aggregates quarterly sales into yearly totals
--    - Provides clean output for dashboards/visuals
-- ================================================

SELECT
    -- Extract year from the dataset
    year,

    -- Normalize county names to handle inconsistencies like "Boulder/Broomfield"
    CASE
        WHEN county IN ('Boulder/Broomfield', 'Boulder', 'Broomfield') THEN 'Boulder-Broomfield'
        WHEN county = 'Rest of State' THEN 'Other Counties'
        ELSE county
    END AS normalized_county,

    -- Aggregate total sales for the year and county
    SUM(sales) AS total_sales

FROM
    colorado_vehicle_sales  

-- Group by year and normalized county name
GROUP BY
    year,
    normalized_county

-- Sort results for easy reading
ORDER BY
    year ASC,
    normalized_county ASC;

-- Step 1: Drop table if it already exists to ensure a clean slate
DROP TABLE IF EXISTS yearly_sales_by_county;

-- Step 2: Create a new table for normalized and aggregated yearly county sales
CREATE TABLE yearly_sales_by_county (
    year INT,
    normalized_county VARCHAR(100),
    total_sales BIGINT
);

-- Step 3: Insert data into the new table by aggregating and normalizing county names
INSERT INTO yearly_sales_by_county (year, normalized_county, total_sales)
SELECT 
    year,
    -- Normalize inconsistent county naming conventions
    CASE 
        WHEN county IN ('Boulder/Broomfield', 'Boulder', 'Broomfield') THEN 'Boulder-Broomfield'
        WHEN county = 'Rest of State' THEN 'Other Counties'
        ELSE county
    END AS normalized_county,
    
    -- Aggregate total sales per county per year
    SUM(sales) AS total_sales
FROM colorado_vehicle_sales
GROUP BY year, normalized_county
ORDER BY year, normalized_county;

-- Query to get total sales for each county over all quarters and years
Create Table total_sales (
SELECT 
    county, 
    SUM(sales) AS total_sales
FROM 
    colorado_vehicle_sales
GROUP BY 
    county
ORDER BY 
    total_sales DESC);

-- Query to get year-over-year sales growth for each county
Create Table yoy_growth (
WITH Sales_Yearly AS (
    SELECT 
        county, 
        year, 
        SUM(sales) AS yearly_sales
    FROM 
        colorado_vehicle_sales
    GROUP BY 
        county, year
)
SELECT 
    a.county,
    a.year,
    a.yearly_sales,
    ((a.yearly_sales - b.yearly_sales) / b.yearly_sales) * 100 AS yoy_growth_percentage
FROM 
    Sales_Yearly a
JOIN 
    Sales_Yearly b 
    ON a.county = b.county AND a.year = b.year + 1
ORDER BY 
    a.county, a.year);
    
    -- Query to get the quarterly breakdown for each year and county
Create Table quarterly_breakdown (
SELECT 
    county,
    year,
    quarter,
    SUM(sales) AS quarterly_sales
FROM 
    colorado_vehicle_sales
GROUP BY 
    county, year, quarter
ORDER BY 
    county, year, quarter);


