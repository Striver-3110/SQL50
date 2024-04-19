# Write your MySQL query statement below
WITH
    CTE AS(
        SELECT
            *,
            LEAD(num,1) OVER(ORDER BY id) AS num1,
            LEAD(num,2) OVER(ORDER BY id) AS num2,
            LEAD(id, 1) OVER(ORDER BY id) AS id1,
            LEAD(id, 2) OVER(ORDER BY id) AS id2
        FROM
            Logs
    )

SELECT
    DISTINCT num AS ConsecutiveNums
FROM
    CTE
WHERE
    num = num1 
    AND
    num = num2
    AND
    id1 = id + 1 
    AND
    id2 = id + 2