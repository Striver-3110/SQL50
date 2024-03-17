# Write your MySQL query statement below

WITH
    CTE AS(
            SELECT
                product_name,
                SUM(o.unit) AS units
            FROM
                Orders o
            INNER JOIN
                Products p
            ON
                o.product_id = p.product_id
            WHERE
                order_date
                BETWEEN
                "2020-02-01"
                AND
                LAST_DAY("2020-02-01")
            GROUP BY
                p.product_name
            
    )


SELECT
    DISTINCT product_name,
    units AS unit
FROM
    CTE
WHERE
    units >= 100



--  SELECT
--                 *,
--                 SUM(o.unit) AS unit
--             FROM
--                 Orders o
--             INNER JOIN
--                 Products p
--             ON
--                 o.product_id = p.product_id
--             GROUP BY
--                 p.product_name