-- Creando nuestra base de datos 
CREATE DATABASE BD_HR_3RA ;
GO

USE BD_HR_3RA ;
GO
--> ddl -->create  
--> dml -->alter , inser into , ctas 
--> dql --> select , join , group by , order by
---------------------------------
-- CARGA EMPLEADOS
---------------------------------
IF OBJECT_ID('Employee', 'U') IS NOT NULL
    DROP TABLE Employee;
-- Creando la tabla Employee para importar Employee.csv
CREATE TABLE dbo.Employee (
    EmployeeID varchar(20) NOT NULL PRIMARY KEY,
    FirstName varchar(50) NULL,
    LastName varchar(50) NULL,
    Gender varchar(20) NULL,
    Age INT NULL,
    BusinessTravel varchar(30) NULL,
    Department varchar(50) NULL,
    DistanceFromHome_KM tinyint NULL,
    State char(2) NULL,
    Ethnicity varchar(80) NULL,
    Education tinyint NULL,
    EducationField varchar(60) NULL,
    JobRole varchar(80) NULL,
    MaritalStatus varchar(20) NULL,
    Salary int NULL,
    StockOptionLevel tinyint NULL,
    OverTime varchar(5) NULL,
    HireDate date NULL,
    Attrition varchar(3) NULL,
    YearsAtCompany tinyint NULL,
    YearsInMostRecentRole tinyint NULL,
    YearsSinceLastPromotion tinyint NULL,
    YearsWithCurrManager tinyint NULL
);

-- IMPORTANDO DATOS DE CSV

BULK INSERT Employee
FROM 'C:\HOME LOCAL\SQL-SERVER-HR-ANALYTTCS-3RAEDICION\Data\Employee.csv' -- Reemplaza con la ruta real
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,           -- Ignora el encabezado del CSV
    FIELDTERMINATOR = ',',  -- Cambia por ';' si tu CSV usa punto y coma
    ROWTERMINATOR = '\n' -- Salto de l�nea est�ndar (LF) o '\n'
   -- ENCODING = 'UTF-8'      -- Importante si tienes acentos o tildes
 
);
------------------------------
-- CARGANDO PerformanceRating
-----------------------------
IF OBJECT_ID('PerformanceRating', 'U') IS NOT NULL
    DROP TABLE PerformanceRating;
-- Crear la tabla con tipos de datos adecuados
CREATE TABLE PerformanceRating (
    PerformanceID                 NVARCHAR(20) PRIMARY KEY, -- Ej: 'PR01'
    EmployeeID                    NVARCHAR(50),             -- Debe coincidir con el formato de tu otra tabla
    ReviewDate                    DATE,                     -- SQL Server maneja formato YYYY-MM-DD
    EnvironmentSatisfaction       INT,
    JobSatisfaction               INT,
    RelationshipSatisfaction      INT,
    TrainingOpportunitiesWithinYear INT,
    TrainingOpportunitiesTaken    INT,
    WorkLifeBalance               INT,
    SelfRating                    INT,
    ManagerRating                 INT
);

BULK INSERT PerformanceRating
FROM 'C:\HOME LOCAL\SQL-SERVER-HR-ANALYTTCS-3RAEDICION\Data\PerformanceRating.csv' -- Reemplaza con la ruta real
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,           -- Ignora el encabezado del CSV
    FIELDTERMINATOR = ',',  -- Cambia por ';' si tu CSV usa punto y coma
    ROWTERMINATOR = '\n' -- Salto de l�nea est�ndar (LF) o '\n'
       -- Importante si tienes acentos o tildes
 
);


SELECT *
FROM PerformanceRating
