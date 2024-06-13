-- This SQL query selects distinct author IDs from the Views table.
# Write your MySQL query statement below
SELECT 
    DISTINCT v.author_id AS id
-- Select distinct author IDs from the Views table 'v'.
FROM Views v
-- Specify the Views table as 'v' for easier reference.
    WHERE v.author_id = v.viewer_id 
-- Filter for rows where the author ID is equal to the viewer ID.
ORDER BY
    v.author_id;
-- Order the results by the author ID column of the Views table.