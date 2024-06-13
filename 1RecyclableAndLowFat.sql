-- This SQL query selects product IDs from the Products table where the products are both low fat and recyclable
SELECT 
    p.product_id 
-- Select the product_id column from the Products table
FROM
    Products p
-- Specify the Products table as 'p' for easier reference
WHERE
    p.low_fats = 'Y'
    -- Filter for products with low fats being 'Y' (yes)
    AND
    p.recyclable = 'Y'
    -- Filter for products that are recyclable being 'Y' (yes)
ORDER BY 
    p.product_id;
-- Order the results by the product_id column