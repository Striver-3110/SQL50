-- # Write your MySQL query statement below


WITH
    MovieRatingUsers AS(
        SELECT
            *
        FROM
            MovieRating
        INNER JOIN
            Users
        USING
            (user_id)
    ),
    UserMaxRatingCount AS(
        SELECT
            *,
            COUNT(DISTINCT movie_id) AS rating_count
        FROM
            MovieRatingUsers
        GROUP BY
            user_id
        ORDER BY
            rating_count DESC,
            name ASC
        LIMIT 1
    ),
    MovieRatingMovies AS(
        SELECT
            *
        FROM
            MovieRating
        NATURAL JOIN
            Movies
    ),
    MovieWithMaxRating AS(
        SELECT
            *
        FROM
            MovieRatingMovies
        WHERE
            created_at 
        BETWEEN
            DATE('2020-02-01')
        AND
            '2020-02-29'
        GROUP BY
            movie_id
        ORDER BY
            AVG(rating) DESC,
            title ASC
        LIMIT 1
    )


SELECT
    name AS results
FROM
    UserMaxRatingCount
UNION ALL
SELECT
    title
FROM
    MovieWithMaxRating

        