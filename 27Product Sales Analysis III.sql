-- Approach 1
-- using CTE(Common Table Approach)
    WITH
        FilteredSales AS(
            SELECT
                DISTINCT product_id,
                FIRST_VALUE(year) 
                    OVER 
                        (
                            PARTITION BY product_id
                            ORDER BY year
                        )
                    AS first_year
            FROM
                Sales
        )

    SELECT
        s.product_id,
        fs.first_year,
        s.quantity,
        s.price
    FROM
        Sales s
    INNER JOIN
        FilteredSales fs
    ON
        s.product_id = fs.product_id
        AND
        s.year = fs.first_year


-- Approach 2
    SELECT product_id, year AS first_year, quantity, price
    FROM Sales
    WHERE (product_id , year) IN (
        SELECT product_id , MIN(year)
        FROM Sales
        GROUP BY product_id
    )