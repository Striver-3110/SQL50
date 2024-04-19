# Write your MySQL query statement below

WITH
    CTE_DEFAULT_PRICE AS(
        SELECT
            DISTINCT product_id,
            10 AS price
        FROM
            Products
        GROUP BY
            product_id
        HAVING
            min(change_date) > "2019-08-16"
    ),
    CTE AS(
        SELECT
            product_id,
            new_price
        FROM
            Products
        WHERE
            (product_id,change_date) IN (
                SELECT
                    product_id,
                    MAX(change_date)
                FROM
                    Products
                WHERE
                    change_date <= "2019-08-16"
                GROUP BY
                    product_id
            )

    )



SELECT
    *
FROM
    CTE_DEFAULT_PRICE 
UNION
SELECT
    *
FROM
    CTE 
