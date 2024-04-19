-- Approach 1
-- CTE Approach
    -- WITH
    --     Filtered AS(
    --         SELECT
    --             * 
    --         FROM
    --             Employee
    --         WHERE
    --             primary_flag = 'Y'

    --     ),
        
    --     TableWithNull AS(
    --         SELECT  
    --             employee_id,
    --             IF(COUNT(department_id) = 1,department_id,
    --             (
    --                 SELECT 
    --                     Filtered.department_id 
    --                 FROM
    --                     Filtered
    --                 WHERE
    --                     Employee.employee_id = Filtered.employee_id) 
    --             )AS department_id
    --         FROM
    --             Employee
    --         GROUP BY
    --             employee_id

    --     )

    -- SELECT
    --     * 
    -- FROM
    --     TableWithNull
    -- WHERE
    --     department_id IS NOT NULL;
    
    
-- Approach-2
-- using union
    SELECT
        employee_id,
        department_id
    FROM
        Employee
    WHERE
        primary_flag = 'Y'

    UNION

    SELECT
        employee_id,
        department_id
    FROM
        Employee
    GROUP BY
        employee_id
    HAVING 
        COUNT(department_id) = 1