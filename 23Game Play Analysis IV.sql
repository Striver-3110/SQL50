-- APPROACH --> 1
-- USING THE LENGTHY AND TIME TAKING APPROACH OF JOIN

    -- SELECT 
    --     ROUND(COUNT(a1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
    --     -- *
    -- FROM
    --     Activity a1
    -- JOIN
    --     Activity a2 ON a1.player_id = a2.player_id 
    --                AND a2.event_date = a1.event_date + INTERVAL 1 DAY
    -- WHERE
    --     a1.event_date = (
    --         SELECT MIN(event_date) 
    --         FROM Activity a3 
    --         WHERE a3.player_id = a1.player_id
    --     )
    -- ORDER BY
    --     a1.player_id


-- APPROACH -->2
-- SIMPLEST POSSIBLE WAY USING DISTINCT,PARTITION,OVER,DATEDIFF
    -- SELECT
    --     ROUND(COUNT(IF(temp=1,1,null))/COUNT(DISTINCT player_id),2) AS fraction
    -- FROM
    --     (
    --         SELECT
    --             player_id,
    --             DATEDIFF(event_date, min(event_date) OVER(PARTITION BY player_id)) = 1 AS temp
    --         FROM
    --             Activity
    --     ) AS t


-- APPROACH -->3
-- SIMPLEST POSSIBLE WAY USING DISTINCT,SUBQUERY,DATE_SUB,COUNT

SELECT 
    ROUND(COUNT(player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM
    Activity
WHERE
    (player_id,DATE_SUB(event_date,INTERVAL 1 DAY))
    IN
    (
        SELECT
            player_id,
            MIN(event_date)
        FROM
            Activity
        GROUP BY
            player_id
    )
