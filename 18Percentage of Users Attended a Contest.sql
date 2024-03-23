# Write your MySQL query statement below


-- APPROACH 1:
-- using DISTINCT,ROUND,COUNT,CROSS JOIN,GROUP BY,ORDER BY,DESC,ASC

    -- SELECT
    --     r.contest_id,
    --     ROUND(((COUNT(DISTINCT r.user_id))/(SELECT COUNT(*) FROM Users))*100,2) AS percentage
    -- FROM
    --     Register r
    -- CROSS JOIN
    --     Users u
    -- ON
    --     u.user_id = r.user_id
    -- GROUP BY
    --     r.contest_id
    -- ORDER BY
    --     percentage DESC
    --     ,
    --     r.contest_id ASC
    -- ;



-- APPROACH 2:
-- same as approach 1 but without using CROSS JOIN 
    -- using DISTINCT,ROUND,COUNT,GROUP BY,ORDER BY,DESC,ASC

    SELECT
        contest_id,

        --  ************ CREDIT @wucodes ************
        -- keyword DISTINCT is redundant here, 
        -- as conceptually the table Register 
        -- will only have unique user_id's associated 
        -- with each contest, as stated: "(contest_id, user_id) is the 
        -- primary key (combination of columns with unique values) for this table."
        -- Each combination of contest_id and user_id is unique, 
        -- so when we group by contest_id, we will not see 
        -- duplicate user_id's associated with any contest_id.
        ROUND(((COUNT(DISTINCT user_id))/(SELECT COUNT(*) FROM Users))*100,2) AS percentage
    FROM
        Register
    -- CROSS JOIN
    --     Users u
    -- ON
    --     u.user_id = r.user_id
    GROUP BY
        contest_id
    ORDER BY
        percentage DESC
        ,
        -- you may ignore acs key word 
        -- as sql by default orders columns by 
        -- ascending order
        contest_id ASC
    ;


