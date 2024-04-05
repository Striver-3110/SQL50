# Write your MySQL query statement below



-- APPROACH -->1
    -- using avg aggrigate function and IF clause
        -- SELECT 
        --     s.user_id,
        --     ROUND(AVG(IF(c.action="confirmed",1,0)),2) AS confirmation_rate
        -- FROM
        --     Signups s
        -- LEFT OUTER JOIN
        --     Confirmations c
        -- USING
        --     (user_id)
        -- GROUP BY
        --     s.user_id
        -- ;



-- APPROACH -->2
    -- using sum,count aggrigate functions and IF clause
        -- SELECT 
        --     user_id,
        --     ROUND(SUM(IF(c.action="confirmed",1,0))/COUNT(*),2) AS confirmation_rate
        -- FROM 
        --     Signups s
        -- LEFT OUTER JOIN
        --     Confirmations c
        -- USING
        --     (user_id)
        -- GROUP BY
        --     s.user_id;


-- APPROACH -->3
    -- using sum,count aggrigate functions and CASE clause

SELECT
    s.user_id,
    CASE
        WHEN 
            c.time_stamp IS NULL
        THEN 
            0.00
        ELSE
            ROUND(SUM(IF(c.action="confirmed",1,0))/COUNT(*),2)
                -- When you use COUNT(expression), it counts the number of non-NULL 
                -- values of expression. The expression c.action = "confirmed" 
                -- evaluates to TRUE (which is 1) or FALSE (which is 0). 
                -- However, COUNT(c.action = "confirmed") counts the number of times this expression 
                -- evaluates to non-zero (both 1 and 0 are non-zero in SQL's perspective).
                -- ***********************ROUND(COUNT(c.action="confirmed")/COUNT(*),2)****************************
                -- Using COUNT(c.action="confirmed") does not directly count the confirmed actions. 
                -- Instead, it counts all rows where c.action is non-NULL, which includes 
                -- all rows regardless of whether the action was confirmed or not.

    END AS confirmation_rate

FROM
    Signups s
LEFT OUTER JOIN
    Confirmations c
USING
    (user_id)
GROUP BY
    s.user_id
ORDER BY
    s.user_id
;
