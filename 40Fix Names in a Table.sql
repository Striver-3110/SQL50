# Write your MySQL query statement below

SELECT
    user_id,
    CONCAT(UPPER(SUBSTR(TRIM(name),1,1)),LOWER(SUBSTR(TRIM(name),2,LENGTH(name)))) AS name
FROM
    Users
ORDER BY
    user_id