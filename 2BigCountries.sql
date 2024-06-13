# Write your MySQL query statement below


-- This SQL query selects the name, population, and area columns from the World table.
SELECT 
    w.name,
    w.population,
    w.area
-- Select the name, population, and area columns from the World table 'w'.
FROM
    World w
-- Specify the World table as 'w' for easier reference.
WHERE
    -- Filter for countries with an area greater than or equal to 3,000,000 or population greater than or equal to 25,000,000.
    w.area >= 3000000 
    OR
    w.population >= 25000000
-- Alternative condition: countries with area greater than or equal to 3,000,000 or population greater than or equal to 25,000,000.
ORDER BY 
    w.name;
-- Order the results by the name column of the World table.