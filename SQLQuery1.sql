USE master
GO

/****** Object:  Database Company     ******/
IF DB_ID('Company') IS NOT NULL
	DROP DATABASE Company
GO

CREATE DATABASE Company
GO 

USE Company
GO

/****** Object:  Table Department  ******/   
CREATE TABLE Department
(	dname		VARCHAR(15) NOT NULL,
	dnumber		INT			NOT NULL,
	mgrssn		CHAR(9)		NOT NULL,
	mgrstartdate	DATE,
	PRIMARY KEY (dnumber),
	UNIQUE (dname)
);
GO

/****** Object:  Table Employee  ******/   
CREATE TABLE Employee 
(	fname		VARCHAR(15)	NOT NULL,
	minit		CHAR,						
	lname		VARCHAR(15)	NOT NULL,
	ssn			CHAR(9)		NOT NULL,
	bdate		DATE,
	address		VARCHAR(30),
	sex			CHAR(1),
	salary		DECIMAL(10,2)	DEFAULT 10000,
	superssn	CHAR(9),
	dno			INT		NOT NULL,
	PRIMARY KEY (ssn),
	CHECK(sex='M' OR sex='F')	
);
GO

/****** Object:  Table Dept_locations  ******/   
CREATE TABLE Dept_locations
(	dnumber		INT			NOT NULL,
	dlocation	VARCHAR(15)	NOT NULL,
	PRIMARY KEY	(dnumber, dlocation),
);
GO

/****** Object:  Table Project  ******/   
CREATE TABLE Project
(	pname		VARCHAR(15)	NOT NULL,
	pnumber		INT			NOT NULL,
	plocation	VARCHAR(15),
	dnum		INT,
	PRIMARY KEY (pnumber),
	UNIQUE (pname),
);
GO

/****** Object:  Table Works_on  ******/   
CREATE TABLE	Works_on
(	Essn	CHAR(9)		NOT NULL,
	Pno		INT			NOT NULL,
	Hours	DECIMAL(3, 1)	NOT NULL,
	PRIMARY KEY (Essn, Pno),		
);

ALTER TABLE dbo.Works_on
	ALTER COLUMN Hours DECIMAL(3,1) NULL;
GO

/****** Object:  Table Dependent  ******/   
CREATE TABLE Dependent
(	Essn		CHAR(9)		NOT NULL,
	Dependent_name	VARCHAR(15) NOT NULL,
	Sex			CHAR,
	Bdate		DATE,
	Relationship	VARCHAR(8),
	PRIMARY KEY (Essn, Dependent_name),
);
GO

-------------------------Insert data-----------------------------------------------------------------------------------------------------

INSERT INTO Department VALUES ('Research', 5, '333445555', CAST('05-22-1988'AS DATE));
INSERT INTO Department VALUES ('Administration', 4, '987654321', CAST('01-01-1995'AS DATE));
INSERT INTO Department VALUES ('Headquarters', 1, '888665555', CAST('06-09-1981'AS DATE));

INSERT INTO Employee VALUES ('John', 'B', 'Smith', '123456789', CAST('01-09-1965'AS DATE), '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO Employee VALUES ('Franklin', 'T', 'Wong', '333445555', CAST('12-08-1955'AS DATE), '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO Employee VALUES ('Alicia', 'J', 'Zelaya', '999887777', CAST('07-19-1968'AS DATE), '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
INSERT INTO Employee VALUES ('Jennifer', 'S', 'Wallace', '987654321', CAST('06-20-1941'AS DATE), '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO Employee VALUES ('Ramesh', 'K', 'Narayan', '666884444', CAST('09-15-1962'AS DATE), '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO Employee VALUES ('Joyce', 'A', 'English', '453453453', CAST('07-31-1972'AS DATE), '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO Employee VALUES ('Ahmad', 'V', 'Jabbar', '987987987', CAST('03-29-1969'AS DATE), '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
INSERT INTO Employee VALUES ('James', 'E', 'Borg', '888665555', CAST('11-10-1973'AS DATE), '450 Stone, Houston, TX', 'M', 55000, null, 1);

INSERT INTO Dept_locations VALUES (1, 'Houston');
INSERT INTO Dept_locations VALUES (4, 'Stafford');
INSERT INTO Dept_locations VALUES (5, 'Bellaire');
INSERT INTO Dept_locations VALUES (5, 'Sugarland');
INSERT INTO Dept_locations VALUES (5, 'Houston');

INSERT INTO Project VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO Project VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO Project VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO Project VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO Project VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO Project VALUES ('Newbenefits', 30, 'Stafford', 4);

INSERT INTO Works_on VALUES ('123456789', 1, 32.5);
INSERT INTO Works_on VALUES ('123456789', 2, 7.5);
INSERT INTO Works_on VALUES ('666884444', 3, 40.0);
INSERT INTO Works_on VALUES ('453453453', 1, 20.0);
INSERT INTO Works_on VALUES ('453453453', 2, 20.0);
INSERT INTO Works_on VALUES ('333445555', 2, 10.0);
INSERT INTO Works_on VALUES ('333445555', 3, 10.0);
INSERT INTO Works_on VALUES ('333445555', 10, 10.0);
INSERT INTO Works_on VALUES ('333445555', 20, 10.0);
INSERT INTO Works_on VALUES ('999887777', 30, 30.0);
INSERT INTO Works_on VALUES ('999887777', 10, 10.0);
INSERT INTO Works_on VALUES ('987987987', 10, 35.0);
INSERT INTO Works_on VALUES ('987987987', 30, 5.0);
INSERT INTO Works_on VALUES ('987654321', 30, 20.0);
INSERT INTO Works_on VALUES ('987654321', 20, 15.0);
INSERT INTO Works_on VALUES ('888665555', 20, null);

INSERT INTO Dependent VALUES ('333445555', 'Alice', 'F', CAST('04-05-1986'AS DATE), 'Daughter');
INSERT INTO Dependent VALUES ('333445555', 'Theodore', 'M', CAST('10-25-1983' AS DATE), 'Son');
INSERT INTO Dependent VALUES ('333445555', 'Joy', 'F', CAST('05-03-1958'AS DATE), 'Spouse');
INSERT INTO Dependent VALUES ('987654321', 'Abner', 'M', CAST('02-28-1942'AS DATE), 'Spouse');
INSERT INTO Dependent VALUES ('123456789', 'Michael', 'M', CAST('01-04-1988'AS DATE), 'Son');
INSERT INTO Dependent VALUES ('123456789', 'Alice', 'M', CAST('01-04-1988'AS DATE), 'Son');
INSERT INTO Dependent VALUES ('123456789', 'Elizabeth', 'M', CAST('05-05-1967'AS DATE), 'Spouse');
GO 

ALTER TABLE dbo.Employee
	ADD FOREIGN KEY (superssn) REFERENCES EMPLOYEE (ssn),
	FOREIGN KEY (dno) REFERENCES DEPARTMENT (dnumber);
GO 

ALTER TABLE DEPARTMENT 
	ADD FOREIGN KEY (Mgrssn) REFERENCES EMPLOYEE (Ssn);
GO 

ALTER TABLE dbo.Dept_locations
	ADD FOREIGN KEY (dnumber) REFERENCES Department(dnumber);
GO

ALTER TABLE dbo.Project
	ADD FOREIGN KEY (dnum)REFERENCES Department(dnumber) ON DELETE SET NULL;
GO

ALTER TABLE dbo.Works_on
	ADD FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn) ON DELETE CASCADE,
	FOREIGN KEY (Pno) REFERENCES PROJECT (Pnumber) ON DELETE CASCADE;
GO

ALTER TABLE dbo.Dependent
	ADD FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn) ON DELETE CASCADE;
GO
