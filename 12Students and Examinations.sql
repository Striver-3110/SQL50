# Write your MySQL query statement below


SELECT
    stud.student_id, 
    stud.student_name, 
    sub.subject_name,
    COUNT(ex.student_id) AS attended_exams
    -- COUNT(ex.subject_name) AS attended_exams
FROM 
    Students stud
CROSS JOIN
    Subjects sub
LEFT OUTER JOIN
    Examinations ex
    
-- ON
--     stud.student_id = ex.student_id
--     AND
--     sub.subject_name = ex.subject_name
USING
    (student_id,subject_name)

GROUP BY
    stud.student_id, 
    stud.student_name, 
    sub.subject_name
ORDER BY
    stud.student_id,
    sub.subject_name
    ASC;



