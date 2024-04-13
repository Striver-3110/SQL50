# Write your MySQL query statement below

WITH 
    CTE AS(
        
        SELECT
            *,
            CASE 
                WHEN
                    income < 20000
                THEN
                    "Low Salary"
                WHEN
                    income >= 20000 && income <= 50000
                THEN
                    "Average Salary"
                ELSE
                    "High Salary"
            END AS category
        FROM
            Accounts
    ),

    categories AS (
        SELECT 'Low Salary' AS category
        UNION ALL
        SELECT 'Average Salary'
        UNION ALL
        SELECT 'High Salary'
    )

SELECT
    category,
    COUNT(account_id) AS accounts_count
FROM
    categories
LEFT JOIN
    CTE
USING
    (category)
GROUP BY
    CTE.category