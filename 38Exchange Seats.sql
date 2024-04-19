# Write your MySQL query statement below

WITH
    CTE AS(
        SELECT
            *,
            LEAD(student,1) OVER() AS student1,
            LAG(student,1) OVER() AS student2
        FROM
            Seat
    )

SELECT
    id,
    CASE
        WHEN
            id % 2 = 1
        THEN
            IF(student1 IS NULL,student,student1)
        ELSE
            student2
    END AS student
FROM
    CTE
ORDER BY
    id ASC;


-- SELECT
--             *,
--             LEAD(student,1) OVER() AS student1,
--             LAG(student,1) OVER() AS student2
--         FROM
--             Seat