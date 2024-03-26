-- APPROACH --> 1
-- using JOIN will take too much time
-- but good to know!! :)
    -- SELECT 
    --     ROUND(COUNT(DISTINCT first_orders.customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM Delivery) * 100, 2) AS immediate_percentage
    -- FROM 
    --     (SELECT 
    --         customer_id,
    --         MIN(order_date) AS first_order_date
    --      FROM 
    --         Delivery
    --      GROUP BY 
    --         customer_id
    --     ) AS first_orders
    -- JOIN 
    --     Delivery d ON first_orders.customer_id = d.customer_id 
    --                AND first_orders.first_order_date = d.order_date
    -- WHERE 
    --     d.order_date = d.customer_pref_delivery_date;


-- APPROACH --> 2
-- PARTITION reduces significant time by avoiding JOIN and GROUP BY clause
-- efficient approach
    -- WITH
    --     Filtered_Table AS(
    --         SELECT
    --             DISTINCT customer_id,
    --             FIRST_VALUE(order_date = customer_pref_delivery_date) 
    --                 OVER
    --                 (
    --                     PARTITION BY 
    --                         customer_id
    --                     ORDER BY
    --                         order_date
    --                 ) AS is_immediate
    --         FROM
    --             Delivery
    --     )
    -- SELECT
    --     -- safer to multiply avg by 100 rather round
    --     -- suppose avg is 0.357
    --     -- after round it will be 0.38
    --     -- and 100 after ROUND will make it 38
    --     -- where original answer should be 35.7
    --     ROUND(AVG(is_immediate)*100.0 ,2)AS immediate_percentage
    -- FROM
    --     Filtered_Table




-- APPROACH --> 3
-- PARTITION reduces significant time by avoiding JOIN and GROUP BY clause
-- efficient approach

WITH
    MinimumOrderDateTable AS(
        SELECT
            customer_id,
            MIN(order_date) AS min_date
        FROM
            Delivery
        GROUP BY
            customer_id
    )
SELECT 
    ROUND( SUM(IF(Delivery.order_date = Delivery.customer_pref_delivery_date,1,0)) * 100.0 /COUNT(*) ,2)
    AS immediate_percentage
FROM 
    Delivery
INNER JOIN
    MinimumOrderDateTable
ON
    Delivery.customer_id = MinimumOrderDateTable.customer_id
    AND
    Delivery.order_date = MinimumOrderDateTable.min_date