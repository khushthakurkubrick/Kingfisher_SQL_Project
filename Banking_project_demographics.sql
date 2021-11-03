--Aggregated data by region
SELECT DISTINCT A3 as Region, SUM(A4) as [Population], SUM(A4*(A10/100)) AS UrbanPopulation, 
	SUM(A15) As NumCrime95, SUM(A16) As NumCrime96, CAST(AVG(A12) AS DECIMAL(10,2)) As UnempRate95, 
	CAST(AVG(A13) AS DECIMAL(10,2)) As UnempRate96
FROM banking.district
GROUP BY A3

--Total of everything
SELECT SUM(A4) As TotalPop, CAST(SUM(A4*(A10/100)) AS INT) As TotalUrbPop, CAST(AVG(A12) AS DEC(10,2)) As AvgUnempRate95, 
	CAST(AVG(A13) AS DEC(10,2)) As AvgUnempRate96, SUM(A15) As TotCrime95, SUM(A16) As TotCrime96 
FROM [banking].[district]