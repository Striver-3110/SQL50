# Write your MySQL query statement below

SELECT
    x,
    y,
    z,
    -- IF(x+y > z && y+z > x && x+z > y,"Yes","No")triangle
    CASE 
        WHEN
            x+y > z && y+z > x && x+z > y
        THEN
            "Yes"
        ELSE
            "No"
    END AS triangle
FROM
    Triangle