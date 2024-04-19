-- Approach 1
-- using CTE
    WITH 
    Filtered AS(
        SELECT
            IF(COUNT(DISTINCT student) >= 5,class,null) as class
        FROM
            Courses
        GROUP BY
            class
    )
    SELECT * FROM Filtered WHERE class IS NOT NULL

-- Approach 2
-- using HAVING

    SELECT
        class
    FROM
        Courses
    GROUP BY
        class
    HAVING
        COUNT(DISTINCT student) >= 5
