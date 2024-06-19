# Write your MySQL query statement below

WITH
    CTE AS(
        SELECT 
            d.name AS Department,
            e.name AS Employee,
            e.salary AS Salary,
            DENSE_RANK() OVER (PARTITION BY d.name ORDER BY Salary DESC) AS rnk
        FROM 
            Employee e
        JOIN 
            Department d
        ON 
            e.departmentId = d.id
    )
SELECT
    Department, Employee, Salary
FROM 
    CTE
WHERE
    rnk <= 3