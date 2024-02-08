SELECT * 
FROM Data$

SELECT YEAR(Month) AS Year
FROM Data$

SELECT MONTH(Month) AS MONTH
FROM Data$

ALTER TABLE Data$
ADD Year AS YEAR(Month)

ALTER TABLE Data$
ADD MONTHS AS MONTH(Month)

SELECT [Total Passengers]
FROM [Data$]
WHERE [YEAR] = 2021 AND [MONTHS] = 6 AND Country = 'Mexico'

SELECT TOP 1 Country, [Total Passengers]
FROM [Data$]
WHERE [YEAR] = 2021 AND [MONTHS] = 5
ORDER BY [Total Passengers] DESC

SELECT Country, MAX([Total Passengers]) AS MaxPassengers
FROM [Data$]
WHERE [YEAR] = 2021 AND [MONTHS] = 5
GROUP BY Country
ORDER BY MAX([Total Passengers]) DESC

SELECT SUM([Total Passengers]) AS total_number_of_passengers_in_april
FROM [Data$]
WHERE [YEAR] = 2021 AND [MONTHS] = 4

SELECT SUM([Total Passengers]) AS total_number_of_passengers_in_april
FROM [Data$]
WHERE [YEAR] = 2021 AND [MONTHS] = 3 AND Country = 'Japan'

SELECT [MONTHS], [Total Passengers] AS total_number_of_passengers
FROM [Data$]
WHERE [YEAR] = 2021 AND [MONTHS] IN (2,3,4,5) AND Country = 'Canada'

SELECT Country, [MONTHS], [Total Passengers] AS total_number_of_passengers
FROM [Data$]
WHERE [YEAR] = 2021 AND [MONTHS] IN (4,5,6)
ORDER BY [Total Passengers] DESC

-- TO FIND THE COUNTRY  WITH THE HIGHEST INCREASE IN NUMBER OF PASSENERS BETWEEN APRIL AND JUNE
SELECT 
    Country,
    SUM(CASE WHEN [MONTHS] = 6 THEN [Total Passengers] ELSE 0 END) -
    SUM(CASE WHEN [MONTHS] = 4 THEN [Total Passengers] ELSE 0 END) AS passenger_increase
FROM 
    [Data$]
WHERE 
    [YEAR] = 2021 AND [MONTHS] IN (4, 6)
GROUP BY 
    Country
ORDER BY 
    passenger_increase DESC

SELECT Country, MONTHS, SUM([Total Passengers]) AS SUM_OF_TOTAL_PASSENGERS
FROM [Data$]
WHERE Country = 'United Kingdom'
GROUP BY Country, MONTHS

SELECT Country, MIN([Total Passengers]) AS min_passengers
FROM [Data$]
WHERE Year = 2021 AND MONTHS = 6
GROUP BY Country
ORDER BY MIN([Total Passengers]) ASC

SELECT Country, [Total Passengers]
FROM [Data$]
WHERE Year = 2021 AND MONTHS = 6
ORDER BY [Total Passengers] 

SELECT Country, [Total Passengers] 
FROM [Data$]
WHERE Year = 2021 AND MONTHS = 5 AND Country IN ('Germany', 'France')
ORDER BY [Total Passengers]

SELECT Country, [Total Passengers] 
FROM [Data$]
WHERE Year = 2021 AND MONTHS = 3 AND Country = 'China'
ORDER BY [Total Passengers]

SELECT
DISTINCT(Country)
FROM (
		-- THIS GETS THE RECORD FROM THE PREVIOUS MONTH
		SELECT 
		D.Country, 
		D.[Total Passengers],
		MONTHS,
		LAG([Total Passengers]) OVER(PARTITION BY Country ORDER BY MONTHS) AS lag_p
		FROM Data$ D
		WHERE MONTHS BETWEEN 2 AND 7 AND YEAR = 2021
	 ) AS prev_pass
WHERE [Total Passengers] > lag_p

SELECT Country, AVG([Total Passengers]) AS avg_passengers_per_month
FROM [Data$]
GROUP BY Country

SELECT 
Country,
[Total Passengers],
MONTHS
FROM (
		-- THIS GETS THE RECORD FROM THE PREVIOUS MONTH
		SELECT	
		D.Country, 
		D.[Total Passengers],
		MONTHS,
		LAG([Total Passengers], 1) OVER(PARTITION BY Country ORDER BY MONTHS) AS lag_p
		FROM Data$ D
		WHERE MONTHS BETWEEN 4 AND 6 AND YEAR = 2021
	 ) AS prev_pass
	 --CHECKS IF THE CURRENT PASSENGER IS LESS THEN THE PREVIOUS
WHERE [Total Passengers] < lag_p

SELECT DISTINCT(Country)
FROM Data$ D
WHERE Country LIKE '%United%'
ORDER BY Country

SELECT 
TOP 1 D.Country,
SUM(D.[Total Passengers])
FROM Data$ D
WHERE MONTHS BETWEEN 1 AND 3
GROUP BY D.Country

SELECT 
TOP 1 MONTHS,
D.[Total Passengers]
FROM Data$ D
WHERE D.Country = 'Argentina' 
ORDER BY D.[Total Passengers] DESC

SELECT
MONTHS,
SUM(D.[Total Passengers]) AS TOTAL_PER_MONTH_IN_2021
FROM Data$ D
WHERE D.Year = 2021
GROUP BY MONTHS

-- TO FIND THE PERCENTAGE INCREASE

WITH PASSCTE AS (
		SELECT 
		d.Country,
		d.[Total Passengers],
		LAG([Total Passengers]) OVER(PARTITION BY Country ORDER BY MONTHS) LAG_P
		FROM Data$ d
		WHERE YEAR = 2021 AND MONTHS IN (2,3)
) 
SELECT 
TOP 1 Country,
(([Total Passengers] - LAG_P)/LAG_P) *100 AS Percentage_increase
FROM PASSCTE
ORDER BY Percentage_increase DESC

SELECT
    Country,
    MONTHS,
    AVG([Total Passengers]) AS AveragePassengersPerMonth
FROM
    Data$
WHERE
    Country <> 'United States'
GROUP BY
    Country, MONTHS
ORDER BY
    Country, MONTHS;

