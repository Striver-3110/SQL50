# Write your MySQL query statement below

SELECT
    -- project_id,average_years
    p.project_id,
    ROUND(SUM(e.experience_years)/COUNT(e.employee_id),2) AS average_years
FROM
    Employee e
LEFT OUTER JOIN
    Project p
USING
    (employee_id)
WHERE
    p.project_id IS NOT NULL
GROUP BY    
    p.project_id
ORDER BY
    p.project_id
;