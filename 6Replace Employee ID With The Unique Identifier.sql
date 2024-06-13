-- This SQL query selects unique_id and name columns from the Employees and EmployeeUNI tables.
# Write your MySQL query statement below
SELECT
    euni.unique_id,
    emp.name
-- Select unique_id from EmployeeUNI and name from Employees.
FROM 
    Employees emp
-- Specify the Employees table as 'emp' for easier reference.
LEFT JOIN
    EmployeeUNI euni
-- Perform a left join with the EmployeeUNI table 'euni'.
ON
    emp.id = euni.id;
-- Join condition: match the id column from Employees with the id column from EmployeeUNI.