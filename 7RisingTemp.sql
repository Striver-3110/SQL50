# Write your MySQL query statement below

SELECT 
    current.id  -- Select the id column from the current weather table
FROM
    Weather current,  -- Define an alias for the Weather table as "current"
    Weather yesterday  -- Define an alias for the Weather table as "yesterday"
WHERE
    current.recordDate = yesterday.recordDate + INTERVAL 1 DAY  -- Join the tables on recordDate with a 1-day offset
    AND
    current.temperature > yesterday.temperature  -- Filter for records where the current temperature is higher than yesterday's
ORDER BY 
    current.id ASC;  -- Sort the results by the id column in ascending order
