CREATE VIEW dbo.bdate_7_ AS
SELECT fname, minit, lname, sex
FROM dbo.Employee
WHERE DATEPART(MONTH,bdate) = 7;
GO 

ALTER VIEW dbo.bdate_7_ AS
SELECT fname, minit, lname, sex 
FROM dbo.Employee
WHERE DATEPART(MONTH,bdate) = 7
UNION
SELECT NULL,NULL,NULL,NULL  WHERE 1 = 0;