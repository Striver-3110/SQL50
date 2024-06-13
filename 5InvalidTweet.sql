# Write your MySQL query statement below

SELECT 
    t.tweet_id
FROM
    Tweets t
WHERE 
    CHAR_LENGTH(t.content) > 15
    -- Using LENGTH() is incorrect. 
    -- The question is asking for the 
    -- number of characters used in the content.
    -- LENGTH() returns the length of
    -- the string measured in bytes. 
    -- CHAR_LENGTH() returns the length of
    -- the string measured in characters.
ORDER BY
    t.tweet_id;