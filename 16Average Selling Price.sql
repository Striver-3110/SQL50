-- # Write your MySQL query statement below


-- APPROACH --> 1
-- using case, and coalesce function for handling null values
        -- SELECT

        --     p.product_id,
        --     IFNULL(ROUND(
        --             SUM(units*price)/SUM(units)
        --         ,2)
        --     ,0) AS average_price

        -- FROM
        --     Prices p
        -- LEFT JOIN
        --     UnitsSold us
            
        -- -- USING
        --     -- (product_id)
        -- -- where clause generates error for the id's that are not present in the unitsSold table
        -- -- WHERE
        -- --     start_date <= purchase_date
        -- --     AND
        -- --     end_date >= purchase_date

        -- -- instead use ON clause
        -- ON
        --     p.product_id = us.product_id
        --     AND
        --     purchase_date 
        --     BETWEEN
        --         start_date
        --         AND 
        --         end_date

        -- GROUP BY
        --     p.product_id;



-- APPROACH --> 2
-- using case, and coalesce function for handling null values
        -- SELECT
        --     p.product_id,
        --     -- Parameters: You provide a list of expressions. 
        --     -- COALESCE evaluates these expressions 
        --     -- in order and returns the first one that is not NULL.
        --         -- i.e.

        --             -- SELECT COALESCE(NULL, NULL, 'Hello', 'World');
        --             -- Output:
        --             -- Hello

        --     -- Return Type: The return type of COALESCE is the same 
        --     -- as the data type of the first non-null value in the list.
        --     COALESCE(ROUND(SUM(CASE
        --         WHEN us.purchase_date BETWEEN p.start_date AND p.end_date
        --         THEN us.units * p.price
        --         ELSE 0
        --     END) / SUM(CASE
        --         WHEN us.purchase_date BETWEEN p.start_date AND p.end_date
        --         THEN us.units
        --         ELSE 0
        --     END), 2), 0) AS average_price
        -- FROM
        --     Prices p
        -- LEFT JOIN
        --     UnitsSold us ON p.product_id = us.product_id
        -- GROUP BY
        --     p.product_id
        -- ORDER BY
        --     p.product_id;



-- APPROACH --> 3
-- removing redundent case from approach 2 and using only coalesce function for handling null values
        -- SELECT
        --     p.product_id,
        --     -- Parameters: You provide a list of expressions. 
        --     -- COALESCE evaluates these expressions 
        --     -- in order and returns the first one that is not NULL.
        --         -- i.e.

        --             -- SELECT COALESCE(NULL, NULL, 'Hello', 'World');
        --             -- Output:
        --             -- Hello

        --     -- Return Type: The return type of COALESCE is the same 
        --     -- as the data type of the first non-null value in the list.
        --     COALESCE(ROUND(
        --                 SUM(us.units * p.price) / SUM(us.units)
        --             , 2)
        --     , 0) AS average_price
        -- FROM
        --     Prices p
        -- LEFT JOIN
        --     UnitsSold us 
        -- ON 
        --     p.product_id = us.product_id
        --     AND
        --     us.purchase_date 
        --     BETWEEN 
        --         p.start_date
        --         AND 
        --         p.end_date
        -- GROUP BY
        --     p.product_id
        -- ORDER BY
        --     p.product_id;


-- APPROACH --> 4
-- removing redundent case from approach 2 and using only IFNULL function for handling null values
        SELECT
            p.product_id,
            IFNULL(ROUND(
                        SUM(us.units * p.price) / SUM(us.units)
                    , 2)
             ,0) AS average_price

        FROM
            Prices p
        LEFT JOIN
            UnitsSold us 
        ON 
            p.product_id = us.product_id
            AND
            us.purchase_date 
            BETWEEN 
                p.start_date
                AND 
                p.end_date
        GROUP BY
            p.product_id
        ORDER BY
            p.product_id;


-- APPROACH --> 5
-- removing redundent case from approach 2 and using only coalesce function for handling null values
        -- SELECT
        --     p.product_id,
        --     CASE 
        --         WHEN 
        --             ROUND(
        --                     SUM(us.units * p.price) / SUM(us.units)
        --             , 2)
        --             IS NULL
        --         THEN 0
        --         ELSE
        --             ROUND(
        --                     SUM(us.units * p.price) / SUM(us.units)
        --             , 2)
        --     END AS average_price
            

        -- FROM
        --     Prices p
        -- LEFT JOIN
        --     UnitsSold us 
        -- ON 
        --     p.product_id = us.product_id
        --     AND
        --     us.purchase_date 
        --     BETWEEN 
        --         p.start_date
        --         AND 
        --         p.end_date
        -- GROUP BY
        --     p.product_id
        -- ORDER BY
        --     p.product_id;





--  ************************************************WRONG APPROACHES************************************************
-- APPROACH --> 1
-- removing redundent case from approach 2 and using only coalesce function for handling null values
        -- SELECT
        --     p.product_id,
        --     -- will return null value
        --     -- when there is no match for joining column in the left table
        --     -- but we need 0 instead null
        --     -- we can use 
        --     ROUND(
        --         SUM(us.units * p.price) / SUM(us.units)
        --     , 2) AS average_price     

        -- FROM
        --     Prices p
        -- LEFT JOIN
        --     UnitsSold us 
        -- ON 
        --     p.product_id = us.product_id
        --     AND
        --     us.purchase_date 
        --     BETWEEN 
        --         p.start_date
        --         AND 
        --         p.end_date
        -- GROUP BY
        --     p.product_id
        -- ORDER BY
        --     p.product_id;