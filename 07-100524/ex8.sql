--1.Wykorzystujac wyrazenie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki  pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej TempEmployeeInfo. Rozwiaz w oparciu o AdventureWorks.

USE AdventureWorks2019;

WITH CTE1 AS (
  SELECT ph.BusinessEntityID, p.FirstName, p.LastName, ph.Rate
  FROM HumanResources.EmployeePayHistory AS ph
  INNER JOIN Person.Person AS p ON ph.BusinessEntityID = p.BusinessEntityID
  )
SELECT * INTO #TempEmployeeInfo FROM CTE1;
SELECT * FROM #TempEmployeeInfo;

--2.Uzyskaj informacje na temat przychodów ze sprzedazy według firmy i kontaktu (za pomocą CTE i bazy AdventureWorksLT).
 
USE AdventureWorksLT2019;

SELECT * FROM SalesLT.Customer c; 

WITH CTE2 (CompanyContract, Revenue) AS (
  SELECT CONCAT(c.CompanyName, ' (', c.FirstName, ' ', c.LastName,' )') AS CompanyContact, sh.TotalDue as Revenue
  FROM SalesLT.Customer AS c
  INNER JOIN SalesLT.SalesOrderHeader AS sh ON c.CustomerID = sh.CustomerID
  )
SELECT 
ROW_NUMBER() OVER (ORDER BY CompanyContract),
CompanyContract, Revenue FROM CTE2
ORDER BY CompanyContract;

--3.Napisz zapytanie, które zwróci wartość sprzedaży dla poszczególnych kategorii produktów.
WITH CTE3 AS (
  SELECT pc.Name AS Category, sod.LineTotal AS Prices
  FROM SalesLT.ProductCategory AS pc
  INNER JOIN SalesLT.Product AS p ON p.ProductCategoryID = pc.ProductCategoryID
  INNER JOIN SalesLT.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
  )
SELECT 
ROW_NUMBER() OVER (ORDER BY Category),
Category, SUM(Prices) AS SalesValue
FROM CTE3
GROUP BY Category
ORDER BY Category;
