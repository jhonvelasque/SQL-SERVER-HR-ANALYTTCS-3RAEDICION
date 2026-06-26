-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- EXPLORATORY DATA ANALYSIS AND INSIGHTS --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --

--Pregunta #1: ¿Cuál es la antigüedad promedio de los empleados en cada departamento?
select Department , round(avg(YearsAtCompany*1.0),2) as [Anteiguedad promedio] --avg()
from Employee
group by Department
-- Antigüedad promedio por departamento  --

-- Pregunta #2: ¿Cuántos empleados en cada departamento siguen trabajando en la empresa?
SELECT Department,
	COUNT(*) AS ActiveEmployees,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*)
							FROM Employee
							WHERE Attrition = 'No'), 0
                            ) AS PercentageOfActive
FROM Employee
WHERE Attrition = 'No'
GROUP BY Department
ORDER BY ActiveEmployees DESC;

-- Question #3: How does job satisfaction for employees compare with different tenure levels?
-- Promedio de satisfacción laboral por categoría de antigüedad--
with employe_antiguedad as (
Select 
		case 
			when YearsAtCompany < 3 THEN '< 3years'
			when YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 years'
			else '>5 years' 
		end grupo_antiguedad
		 ,EmployeeID
		 ,FirstName
		 ,Age
		 ,Department
from Employee
)
select e.grupo_antiguedad,
		avg(r.JobSatisfaction*1.0) promedio_satitfacion
from employe_antiguedad e
join PerformanceRating r on (e.EmployeeID=r.EmployeeID)
group by e.grupo_antiguedad


-- Pregunta #4: Examinar cuántos empleados que trabajaron horas extras
-- han dejado la empresa frente a los que no trabajaron horas extras. --


