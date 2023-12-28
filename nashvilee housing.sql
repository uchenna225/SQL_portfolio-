-- selecting everything in the table 
SELECT *
FROM Nashville_housing_data_2013_201$

-- altering the table by creating a new role saledate and setting the datatype to DATE
ALTER TABLE Nashville_housing_data_2013_201$
ADD saledate DATE

--updating the table in order for it to have effect and adding value to the saledate 
-- by using only date from [Sale DATE]

UPDATE Nashville_housing_data_2013_201$
SET saledate = CONVERT(DATE, [Sale Date])

-- Did a self join on where property_address value is null using the first table
-- we have duplicate records and nulls, we want to fill the  record where value is null usin the dublicate
-- so using the self join on the parcel ID and unnamed: 0  
SELECT a.[Unnamed: 0], a.[Parcel ID], a.[Property Address], b.[Unnamed: 0], b.[Parcel ID], b.[Property Address], ISNULL(a.[Property Address],b.[Property Address])
FROM Nashville_housing_data_2013_201$ a
JOIN Nashville_housing_data_2013_201$ b
ON a.[Parcel ID] = b.[Parcel ID]
and a.[Unnamed: 0] <> b.[Unnamed: 0]
WHERE a.[Property Address] is null

--updated the table setting the first table equal to the second table on 
-- we set the the value of the null in a.property using the ISNULL FUNCTION 
-- we set the values on b to a while the conditions are met
UPDATE a
SET a.[Property Address] = ISNULL(a.[Property Address],b.[Property Address])
FROM Nashville_housing_data_2013_201$ a
JOIN Nashville_housing_data_2013_201$ b
ON a.[Parcel ID] = b.[Parcel ID]
and a.[Unnamed: 0] <> b.[Unnamed: 0]
WHERE a.[Property Address] is null

SELECT [Property Address]
FROM Nashville_housing_data_2013_201$
WHERE [Property Address] IS NULL	

SELECT *, CAST([Sale Date] AS Date) AS Date_only
FROM Nashville_housing_data_2013_201$	

--WILL NEED TO ADD ALTER AND AND A COLUM TO MAKE ACTUAL CHENAGES TO THE TABLE
--UPDATE Nashville_housing_data_2013_201$
--SET Date_only = CAST([Sale Date] AS Date)

SELECT [Property Address]
FROM Nashville_housing_data_2013_201$

SELECT DISTINCT([Sold As Vacant])
FROM Nashville_housing_data_2013_201$

SELECT [Sold As Vacant],
CASE WHEN [Sold As Vacant] = 'Yes' THEN 'Y'
	WHEN [Sold As Vacant] = 'No' THEN 'N'
	END
FROM Nashville_housing_data_2013_201$

UPDATE Nashville_housing_data_2013_201$
SET [Sold As Vacant] = CASE WHEN [Sold As Vacant] = 'Yes' THEN 'Y'
	WHEN [Sold As Vacant] = 'No' THEN 'N'
	END

SELECT *
FROM Nashville_housing_data_2013_201$

-- we will be deleting duplicates 
-- first we get our cte
-- but before that we partion

WITH a AS (
    SELECT *,
        -- ROW_NUMBER assigns unique values to each row 
        -- It can be used to detect duplicates.
        ROW_NUMBER() OVER (
            -- The PARTITION BY clause allows you to make calculations on rows separately within each partition.
            PARTITION BY [Parcel ID], [Sale Price], saledate, [Property Address], [Legal Reference]
            -- Assuming you have an average (AVG()) there instead of ROW_NUMBER, 
            -- you could have calculated the average of everything partitioned by.
            ORDER BY [Unnamed: 0]
        ) AS row_num
    FROM Nashville_housing_data_2013_201$
)

-- Use the CTE in a subsequent query
DELETE
FROM a
WHERE row_num > 1;

