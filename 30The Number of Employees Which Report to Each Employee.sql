# Write your MySQL query statement below

    SELECT
        e1.employee_id AS employee_id,
        e1.name AS name,
        COUNT(e2.reports_to) AS reports_count,
        ROUND(AVG(e2.age),0) AS average_age
    FROM
        Employees e1
    INNER JOIN
        Employees e2
    ON
        e1.employee_id = e2.reports_to
    GROUP BY
        e1.employee_id
    ORDER BY
        e1.employee_id


SELECT
    e1.employee_id AS employee_id,
    e1.name AS name,
    COUNT(e2.reports_to) AS reports_count,
    ROUND(AVG(e2.age),0) AS average_age
FROM
    Employees e1
INNER JOIN
    Employees e2
ON
    e1.employee_id = e2.reports_to
GROUP BY
    1
ORDER BY
    1