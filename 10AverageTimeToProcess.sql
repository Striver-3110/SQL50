-- # Write your MySQL query statement below


-- --  APPROACH --> 1****************************************************************************************************
-- SELECT a1.machine_id,ROUND(AVG(a1.timestamp - a2.timestamp),3) AS processing_time
-- FROM Activity a1
-- INNER JOIN Activity a2
-- USING (machine_id, process_id)
-- -- ON a1.machine_id = a2.machine_id 
-- -- AND a1.process_id = a2.process_id
-- WHERE 
--     a1.activity_type = 'end' 
--     AND a2.activity_type = 'start'
-- -- AND a1.activity_type = 'end' 
-- -- AND a2.activity_type = 'start'
-- GROUP BY a1.machine_id
-- ORDER BY a1.machine_id;


-- --  APPROACH --> 2****************************************************************************************************
SELECT 
    a1.machine_id,
    ROUND(AVG(a1.timestamp - a2.timestamp),3) AS processing_time
FROM 
    Activity a1
-- INNER JOIN
JOIN 
    Activity a2
ON 
    a1.machine_id = a2.machine_id 
    AND 
    a1.process_id = a2.process_id
    AND

    -- a1.activity_type = 'end' 
    -- AND 
    -- a2.activity_type = 'start'
    a1.timestamp > a2.timestamp

GROUP BY 
    a1.machine_id
ORDER BY 
    a1.machine_id;

    

--  APPROACH --> 3****************************************************************************************************
    -- SELECT
    --     a.machine_id,
    --     ROUND(
    --         AVG(
    --             (SELECT avg(a1.timestamp) FROM Activity a1 WHERE a1.activity_type = 'end' AND a1.machine_id = a.machine_id)-
    --             (SELECT avg(a1.timestamp) FROM Activity a1 WHERE a1.activity_type = 'start' AND a1.machine_id = a.machine_id)
    --         )
    --     ,3) AS processing_time
    -- FROM 
    --     Activity a
    -- GROUP BY a.machine_id;