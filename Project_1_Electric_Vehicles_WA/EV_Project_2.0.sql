--	DATA SOURCE:	https://catalog.data.gov/dataset/electric-vehicle-population-data
--	Title:			Electric Vehicle Population Data
--	Meta Update:	May 13, 2023
--	Description:	This dataset shows the Battery Electric Vehicles (BEVs) and Plug-in Hybrid Electric Vehicles (PHEVs) that are currently registered through the Washington State Department of Licensing (DOL).

--	Broke down the data into three tables, converted dates on Excel, and assign entry_id as the primary key

--SELECT TOP (1000) [entry_id]
--      ,[Date]
--      ,[County]
--      ,[State]
--  FROM [EV_Project_2.0].[dbo].[EV_WA_Date_Region]

--SELECT TOP (1000) [entry_id]
--      ,[Vehicle_Primary_Use]
--      ,[Battery_EV_Total]
--      ,[Hybrid_EV_Total]
--      ,[EV_Total]
--  FROM [EV_Project_2.0].[dbo].[EV_WA_Type]

--SELECT TOP (1000) [entry_id]
--      ,[Non_EV_Total]
--      ,[Total_Vehicles]
--      ,[Percent_EV_County]
--  FROM [EV_Project_2.0].[dbo].[EV_WA_Total_Percent]


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--	Look for all data with the most recent values that are registered in WA

SELECT
	CONVERT(date, date_region.date) AS year_month_date,
	date_region.County,
	date_region.state,
	type.Vehicle_Primary_Use,
	type.Battery_EV_Total,
	type.Hybrid_EV_Total,
	type.EV_Total,
	total_percent.Non_EV_Total,
	total_percent.Total_Vehicles,
	total_percent.Percent_EV_County
FROM
	[EV_Project_2.0].[dbo].[EV_WA_Date_Region] AS date_region
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Type] AS type
ON
	date_region.entry_id=type.entry_id
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Total_Percent] AS total_percent
ON
	total_percent.entry_id=type.entry_id
WHERE
	date_region.date = (
		SELECT MAX(date)
		FROM
		[EV_Project_2.0].[dbo].[EV_WA_Date_Region])
	AND
	date_region.state = 'WA'
ORDER BY
	date_region.County
;

--	SYNTAX EXPLANATION

--	SELECT clause:
		--	Showed all columns with their respective alias to refer for future use
		--	Applied CONVERT function to date_region.date in order to remove hours:minutes:seconds
--	FROM clause:
		--	Perform multiple inner joins on the primary key of entry_id
		--	Assigned aliases for each table
--	WHERE clause:
		--	Trying to retrieve recent data since they were assigned with dates
		--	Used a subquery on date_region.date
		--	Applied the MAX function for highest value date, from EV_WA_Date_Region table
		--	AND clause:
			--	looking for cars registered originally in WA 
			--	set date_region.state to retrieve string values that contain 'WA'
--	ORDER BY clause:
		--	Ascending on date_region.County so we can view in alphabetical order

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	QUESTION 1:
		--	Which counties had the highest amount of electric vehicles? Also, form a CTE from the previous query

WITH Update_EV_Table AS
(
SELECT
	CONVERT(date, date_region.date) AS year_month_date,
	date_region.County,
	date_region.state,
	type.Vehicle_Primary_Use,
	type.Battery_EV_Total,
	type.Hybrid_EV_Total,
	type.EV_Total,
	total_percent.Non_EV_Total,
	total_percent.Total_Vehicles,
	total_percent.Percent_EV_County
FROM
	[EV_Project_2.0].[dbo].[EV_WA_Date_Region] AS date_region
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Type] AS type
ON
	date_region.entry_id=type.entry_id
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Total_Percent] AS total_percent
ON
	total_percent.entry_id=type.entry_id
WHERE
	date_region.date = (
		SELECT MAX(date)
		FROM
		[EV_Project_2.0].[dbo].[EV_WA_Date_Region])
	AND
	date_region.state = 'WA'
)

SELECT
	*
FROM
	Update_EV_Table
WHERE
	EV_Total =
		(SELECT
			MAX(EV_Total)
		FROM
			Update_EV_Table)
;

--	OUTPUT:
		--	Displays King County, with EV Primary type being Passenger cars, with an EV_Total of 66704 as of 2023-04-30

--	SYNTAX EXPLANATION:

--	WITH clause:
		--	Known as a Common Table Expression (CTE), it forms a temporary table to make queries from
		--	Assigned AS Update_EV_Table
		--	Used the previous query but removed the ORDER BY clause because it doesn't work with a CTE
--	SELECT clause:
		--	Show everything
--	FROM clause:
		--	Query from the temporary table Update_EV_Table
--	WHERE clause:
		--	Used a similar subquery from Max date but with EV_Total instead
		--	FROM the temporary table Update_EV_Table

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	QUESTION 2:
		--	What are the top 5 counties that have the highest totals in EV, and calculate the percentage they are in within the county EV population

WITH Update_EV_Table AS
(
    SELECT
        CONVERT(date, date_region.date) AS year_month_date,
        date_region.County,
        date_region.state,
        type.Vehicle_Primary_Use,
        type.Battery_EV_Total,
        type.Hybrid_EV_Total,
        type.EV_Total,
        total_percent.Non_EV_Total,
        total_percent.Total_Vehicles,
        total_percent.Percent_EV_County
    FROM
        [EV_Project_2.0].[dbo].[EV_WA_Date_Region] AS date_region
    INNER JOIN
        [EV_Project_2.0].[dbo].[EV_WA_Type] AS type
        ON date_region.entry_id = type.entry_id
    INNER JOIN
        [EV_Project_2.0].[dbo].[EV_WA_Total_Percent] AS total_percent
        ON total_percent.entry_id = type.entry_id
    WHERE
        date_region.date = (
            SELECT MAX(date)
            FROM [EV_Project_2.0].[dbo].[EV_WA_Date_Region]
        )
        AND date_region.state = 'WA'
)

SELECT TOP 5
    County,
    State,
    Vehicle_Primary_Use,
    Battery_EV_Total,
    (ROUND((CASE WHEN EV_Total <> 0 THEN Battery_EV_Total / EV_Total ELSE 0 END),4))*100 AS Percent_Battery_EV,
    Hybrid_EV_Total,
    (ROUND((CASE WHEN EV_Total <> 0 THEN Hybrid_EV_Total / EV_Total ELSE 0 END),4))*100 AS Percent_Hybrid_EV,
    EV_Total
FROM
    Update_EV_Table
ORDER BY
    EV_Total DESC;
;
--	OUTPUT:
		--	Top 5 counties are King, Snohomish, Pierce, Clark, and Spokane
		--	Most EVs are battery powered ranging from 67% to 80% across all 5 counties
		--	Car manufacturers are investing more in battery vs hybrid, a trend for future

--	SYNTAX EXPLANATION:

--	WITH clause:
		--	Used previous CTE
--	SELECT clause:
		--	TOP 5 for only the first nth results
		--	Added two percentage columns for battery and hybrid vehicles
		--	CASE statement to exclude null or 0 values
			--	Basically saying if the value is not 0 then do the arithmetic of vehicle equipment type divided by EV_Total
		--	ROUND function wrapped around the case statement with 4 digits because I multiply by 100 to give a presentable percent value
--	FROM clause:
		--	CTE table
--	ORDER BY clause:
		--	Want to see the highest EV_Total descending

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--	QUESTION 3:
		--	How has the EV Population for King, Snohomish, and Pierce counties changed? Also, what is the percentage of EVs in their respective county population?

SELECT
	CONVERT(date, date_region.date) AS year_month_date,
	date_region.County,
	date_region.state,
	SUM(type.Battery_EV_Total) AS BEV_YTD,
	SUM(type.Hybrid_EV_Total) AS HEV_YTD,
	SUM(type.EV_Total) AS EV_Total_YTD,
	SUM(total_percent.Total_Vehicles) AS Total_Vehicles_YTD,
	ROUND((SUM(type.EV_Total) / SUM(total_percent.Total_Vehicles)) * 100, 2) AS EV_Percentage
FROM
	[EV_Project_2.0].[dbo].[EV_WA_Date_Region] AS date_region
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Type] AS type
ON
	date_region.entry_id=type.entry_id
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Total_Percent] AS total_percent
ON
	total_percent.entry_id=type.entry_id
WHERE
	County IN ('King','Snohomish','Pierce')
GROUP BY
	CONVERT(date, date_region.date),
	date_region.County,
	date_region.state
ORDER BY
	year_month_date,
	County
;
--	OUTPUT:
		--	Shows King, Pierce, and Snohomish battery, hybrids, total EV, total vehicles, and EV percentage to population YTD
		--	GROUP BY year in ascending order (Oldest->Newest)

--	SYNTAX EXPLANATION:

--	SELECT clause:
		--	CONVERTED date, county, region
		--	SUM function on Battery, Hybrid, EV, and total Vehicles
		--	SUM EV / SUM Total for percentage multiplied by 100 for percentage, and then ROUNDED to 2 decimals
--	FROM clause:
		--  Perform the same JOINS from before using the primary key 'entry_id'
--	WHERE clause:
		--	County we use IN to include string values that match either King, Snohomish, or Pierce
--	GROUP BY clause:
		--	For our non-aggregate columns we have to include them in our GROUP BY statement
--	ORDER BY clause:
		--	Sort by year first (default ascending) so we oldest dates first, then sort by County (default ascending)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- QUESTION 4:
		--	What is the fourth highest Electric Vehicle Population county that registered through the Washington State Department of Licensing (DOL) in recent years

WITH DENSE_CTE AS
(
SELECT
	DISTINCT date_region.County,
	date_region.state,
	SUM(type.Battery_EV_Total) AS BEV_Total,
	SUM(type.Hybrid_EV_Total) AS HEV_Total,
	SUM(type.EV_Total) AS Electric_Total,
	DENSE_RANK() OVER (ORDER BY SUM(type.EV_Total) DESC) AS DENSERANK
FROM
	[EV_Project_2.0].[dbo].[EV_WA_Date_Region] AS date_region
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Type] AS type
ON
	date_region.entry_id=type.entry_id
INNER JOIN
	[EV_Project_2.0].[dbo].[EV_WA_Total_Percent] AS total_percent
ON
	total_percent.entry_id=type.entry_id
WHERE
	date_region.date = (
		SELECT MAX(date)
		FROM
		[EV_Project_2.0].[dbo].[EV_WA_Date_Region])
GROUP BY
	CONVERT(date, date_region.date),
	date_region.County,
	date_region.state
)

SELECT
	*
FROM
	DENSE_CTE
WHERE
	DENSERANK = 4
;

--	OUTPUT:
		--	Displays Clark County as the 4th listed with a Dense Rank of Electric Vehicle Totals within the whole population

--	SYNTAX EXPLANATION:
			
--	CTE:
		--	SELECT clause:
			--	Set it by DISTINCT county for no repeats
			--	Retrieve State in case other states would rank in fourth
			--	SUM BEV, HEV and Total EVs
			--	Apply DENSE RANK OVER the sum totals of EV Vehicles
				--	DESC order for largest to lowest when applying DENSE RANK
--	SELECT clause:
		--	Everything
--	FROM clause:
		--	From CTE we assigned as DENSE_CTE
--	WHERE clause:
		--	Set it from the DENSERANK column equal to 4, therefore, grabbing the 4th rank

