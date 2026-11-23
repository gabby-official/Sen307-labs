-- VUA-SEN307 Lab 6: Aggregate Functions, Grouping and Subqueries
-- Name: Ogbobe Uchechukwu Marian     Matric: vug_sen_24_11799;

-- Run ONE query at a time: click inside it and press Ctrl + Enter.

USE sen307_vug_sen_24_11799;


-- Task 1
SELECT c.course_code, c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_title
ORDER BY total_students DESC, c.course_code;
-- Explanation: GROUP BY makes one row per course and COUNT(e.student_id) counts the
-- enrolled students in each group. LEFT JOIN keeps every course, even one with no
-- enrolments. For an empty course the join produces one row whose e.student_id is
-- NULL; COUNT(e.student_id) ignores NULLs, so it gives 0. COUNT(*) would count that
-- row itself and wrongly give 1.


-- Task 2: 
-- Threshold 3
SELECT c.course_code, c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_title
HAVING COUNT(e.student_id) > 3
ORDER BY total_students DESC, c.course_code;

-- Threshold 5
SELECT c.course_code, c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_title
HAVING COUNT(e.student_id) > 5
ORDER BY total_students DESC, c.course_code;

-- Threshold 7
SELECT c.course_code, c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_title
HAVING COUNT(e.student_id) > 7
ORDER BY total_students DESC, c.course_code;
-- Explanation: WHERE filters individual rows before grouping, but HAVING filters whole
-- groups after they have been counted, so it can use COUNT(). A higher threshold
-- keeps fewer courses: more than 3 keeps six courses, while both more than 5 and more
-- than 7 keep only SEN307, which has 8 students.


-- Task 3
-- Step 1: courses per student
SELECT s.student_id, s.full_name, COUNT(e.course_id) AS course_count
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
GROUP BY s.student_id, s.full_name
ORDER BY course_count DESC, s.full_name;

-- Step 2: average of those counts
SELECT ROUND(AVG(course_count), 2) AS avg_courses_per_student
FROM (
    SELECT s.student_id, COUNT(e.course_id) AS course_count
    FROM Student s
    LEFT JOIN Enrolment e ON s.student_id = e.student_id
    GROUP BY s.student_id
) AS per_student;
-- Explanation: The inner query counts the courses of every student. The LEFT JOIN keeps
-- students with no enrolments, who get a count of 0. The outer query then averages
-- those counts and rounds to 2 decimal places. Because the zeros are included, the
-- result is lower than if only enrolled students were counted. With 40 enrolments and
-- 21 students it should be about 1.90.


-- Task 4 
SELECT student_id, matric_no, full_name
FROM Student
WHERE student_id NOT IN (SELECT student_id FROM Enrolment)
ORDER BY full_name;
-- Explanation: The inner query runs once and returns the list of every student_id that
-- appears in Enrolment. The outer query keeps the students whose ID is not in that
-- list. This returns the same 4 students as Week 7, Task 3 (the LEFT JOIN with
-- IS NULL), so the two methods give the same answer. NOT IN is safe here because
-- Enrolment.student_id can never be NULL; if the list contained a NULL, NOT IN would
-- return no rows at all.


-- Task 5 
SELECT d.dept_name, s.full_name,
       (SELECT COUNT(*) FROM Enrolment e WHERE e.student_id = s.student_id) AS courses
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE (SELECT COUNT(*) FROM Enrolment e WHERE e.student_id = s.student_id)
      = (SELECT COUNT(*)
         FROM Enrolment e2
         JOIN Student s2 ON e2.student_id = s2.student_id
         WHERE s2.dept_id = s.dept_id
         GROUP BY e2.student_id
         ORDER BY COUNT(*) DESC
         LIMIT 1)
ORDER BY d.dept_name, s.full_name;
-- Explanation: The last subquery is correlated because it uses s.dept_id from the
-- outer query, so it runs once for every student. It counts the enrolments of each
-- student in the same department as s, sorts those counts from highest to lowest and
-- keeps the top one with LIMIT 1, which is the highest count in that department. The
-- outer WHERE keeps a student only if their own count equals that highest count, so
-- students who tie for the top all appear.
