CREATE VIEW Depdt_lager_2 AS
SELECT Essn, fname, minit, lname, COUNT(dbo.Dependent.Essn) AS Num_Count
FROM dbo.Employee JOIN dbo.Dependent ON Dependent.Essn = Employee.ssn
GROUP BY Essn, fname, minit, lname
HAVING COUNT(Essn)>=2;