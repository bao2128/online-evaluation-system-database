CREATE VIEW bdate_7_ AS

SELECT bdate, fname, minit, lname
FROM dbo.Employee
WHERE DATEPART(month,dbo.Employee.bdate) =7
GROUP BY bdate, fname, minit, lname;
