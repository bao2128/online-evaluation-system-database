CREATE VIEW Emp_Proj_Hour AS
SELECT ssn, fname, minit, lname, Pno, pname, Hours
FROM (dbo.employee JOIN dbo.Works_on ON Employee.ssn = dbo.Works_on.essn) JOIN dbo.Project ON Project.pnumber = Works_on.Pno
WHERE Plocation = 'Houston';