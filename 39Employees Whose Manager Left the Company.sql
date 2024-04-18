# Write your MySQL query statement below

WITH 
    CTE AS(
        SELECT
            DISTINCT manager_id AS manager
        FROM
            Employees
        WHERE
            manager_id IS NOT NULL
    ),
    MANAGER AS(
        SELECT
            *
        FROM
            CTE c
        LEFT OUTER JOIN
            Employees e
        ON
            c.manager = e.employee_id
    ),
    LEFT_MANAGER AS(
        SELECT 
            manager
        FROM
            MANAGER
        WHERE
            employee_id IS NULL
    ),
    EMP_LEFT_MANAGER AS(
        SELECT 
            * 
        FROM
            LEFT_MANAGER lm
        INNER JOIN
            Employees e
        ON
            lm.manager = e.manager_id
    )

SELECT
    employee_id
FROM
    EMP_LEFT_MANAGER
WHERE
    salary < 30000
ORDER BY
    employee_id