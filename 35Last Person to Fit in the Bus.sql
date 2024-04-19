# Write your MySQL query statement below

SELECT
    person_name
FROM

    (
        SELECT
            person_name,
            SUM(weight) OVER (ORDER BY Turn) AS cumulativeWeight
        FROM
            Queue
    )AS CTE
WHERE
    cumulativeWeight <= 1000
ORDER BY
    cumulativeWeight DESC
LIMIT 1;