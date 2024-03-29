# Write your MySQL query statement below

WITH 
    RequesterFriendsCount AS(
        SELECT
            requester_id,
            COUNT(*) AS friends_of_requester
        FROM
            RequestAccepted
        GROUP BY
            requester_id
        ORDER BY
            requester_id

    ),
    AccepterFriendsCount AS(
        SELECT
            accepter_id,
            COUNT(*) AS friends_of_accepter
        FROM
            RequestAccepted
        GROUP BY
            accepter_id
        ORDER BY
            accepter_id
    ),
    FilteredTable AS(
        SELECT  
            *
        FROM
            RequesterFriendsCount rfc

        UNION ALL

        SELECT  
            *
        FROM
            AccepterFriendsCount afc
    )

SELECT 
    requester_id AS id,
    sum(friends_of_requester) AS num
FROM
    FilteredTable
GROUP BY 
    1
ORDER BY 
    2 DESC
LIMIT 1