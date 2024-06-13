-- This SQL query selects the name column from the Customer table.
SELECT 
    c.name
-- Select the name column from the Customer table 'c'.
FROM
    Customer c
-- Specify the Customer table as 'c' for easier reference.
WHERE
    -- Filter for customers whose referee_id is not equal to 2 or is NULL.

    -- NOT c.referee_id = 2 OR c.referee_id IS NULL
    c.referee_id <> 2 OR c.referee_id IS NULL
    -- c.referee_id != 2 OR c.referee_id IS NULL
    
    -- Alternative condition: c.referee_id not equal to 2 or is NULL.
ORDER BY 
    c.id;
-- Order the results by the id column of the Customer table.