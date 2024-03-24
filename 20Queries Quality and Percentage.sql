# Write your MySQL query statement below

SELECT
    q.query_name,
    ROUND(AVG(q.rating/q.position),2) AS quality,
    ROUND(COUNT(IF(q.rating<3,1,null))*100/COUNT(q.rating),2) AS poor_query_percentage
    -- you can use sum as well as given below
    -- ROUND(SUM(q.rating<3)*100/COUNT(q.rating),2) AS poor_query_percentage
FROM
    Queries q
WHERE  
    q.query_name IS NOT NULL
GROUP BY
    q.query_name
ORDER BY
    q.query_name
;