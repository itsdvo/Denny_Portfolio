-- Data collected from https://catalog.data.gov/dataset/electric-vehicle-population-data
-- Electric Vehicle Population Data
-- This dataset shows the Battery Electric Vehicles (BEVs) and Plug-in Hybrid Electric Vehicles (PHEVs) that are currently registered through the Washington State Department of Licensing (DOL).

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Date]
      ,[County]
      ,[State]
      ,[Vehicle_Primary_Use]
      ,[Battery_EV_Total]
      ,[Hybrid_EV_Total]
      ,[EV_Total]
      ,[Non_EV_Total]
      ,[Total_Vehicles]
      ,[Percent_EV_County]
FROM 
	[EV_Project].[dbo].[Electric_Vehicle_Population_Siz$];

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Show recent records of County, State, Primary Vehicle Type, and electric_vehicle totals
-- In the WHERE select recent dates by using a subquery and MAX function on the date
-- ORDER BY states in ascending order followed by counties in ascending order

SELECT
    County,
    State,
	Vehicle_Primary_Use,
    EV_Total
FROM
    [EV_Project].[dbo].[Electric_Vehicle_Population_Siz$]
WHERE
    date = (
        SELECT MAX(date)
        FROM [EV_Project].[dbo].[Electric_Vehicle_Population_Siz$]
    )
ORDER BY
	State,
	County;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Show the total EV registered in WA residing per state
-- Created a CTE using the previous query but including all columns with *, as I may need to refer back to it
-- After creating a CTE set up a SELECT statement to show states and their totals with an alias as State_EV_Total
-- Lastly GROUP BY state, and ORDER BY State_EV_Total

WITH CTE_RECENT_EV AS(
SELECT
    *
FROM
    [EV_Project].[dbo].[Electric_Vehicle_Population_Siz$]
WHERE
    date = (
        SELECT MAX(date)
        FROM [EV_Project].[dbo].[Electric_Vehicle_Population_Siz$]
    )
)

SELECT
	State,
	SUM(EV_Total) AS State_EV_Total
FROM
	CTE_RECENT_EV
GROUP BY
	State
ORDER BY
	State_EV_Total DESC;

-- Output:	Shows the majority registered in WA stays in WA
--			The following EV registered in WA at other states goes from CA, VA, MD, TX
--			CA has the highest state population and EVs makes sense they would get EV out-of-state owners to visit

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Show the counties in WA that have the highest amount of EVs using CTE_RECENT_EV for up to date
-- WHERE clause search state column for 'WA'
-- ORDER BY clause on EV total DESC to see highest to lowest 

WITH CTE_RECENT_EV AS(
SELECT
    *
FROM
    [EV_Project].[dbo].[Electric_Vehicle_Population_Siz$]
WHERE
    date = (
        SELECT MAX(date)
        FROM [EV_Project].[dbo].[Electric_Vehicle_Population_Siz$]
    )
)

SELECT
	County,
	Non_EV_Total,
	EV_Total,
	Percent_EV_County
FROM
	CTE_RECENT_EV
WHERE
	State = 'WA'
ORDER BY
	EV_Total DESC

-- Output:	Shows counties based around Seattle contributes to the highest volume of EV count
--			Due to being around a major city
--			Percent conversion shows at most almost 4% of Vehicles in King County are Electric

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
-- Show how King County EV totals changed over time, FROM 2017 to 2022
-- SUM Non-EV and EV with their own aliases
-- Created Percent_EV alias for the percentage of EV within the county by year, multiplied by 100, and rounded it to the 2nd decimal point
-- the Excluded year 2023
-- GROUP BY year since we are monitoring throughout the year

SELECT
    YEAR(date) AS Year,
    SUM(Non_EV_Total) AS Total_Non_EV,
    SUM(EV_Total) AS Total_EV,
    ROUND(SUM(EV_Total) * 1.0 / (SUM(EV_Total) + SUM(Non_EV_Total)) * 100,2) AS Percent_EV
FROM
    [EV_Project].[dbo].[Electric_Vehicle_Population_Siz$]
WHERE
    county = 'King'
    AND State = 'WA'
    AND YEAR(date) <> 2023 -- Exclude year 2023
GROUP BY
    YEAR(date)
ORDER BY
    YEAR(date) ASC;

-- Output:	EV owners in King County are growing, as the percentage shows conversion increasing at a steady rate
--		Total EV from 2017 to 2023 we see an increase of 40,000 cars
