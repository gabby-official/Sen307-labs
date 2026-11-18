-- VUA-SEN307 Lab 5
-- Name:Ogbobe Uchechukwu Marian     Matric: vug_sen_24_11799


USE sen307_vug_sen_24_11799;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers',   COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students',    COUNT(*) FROM Student
UNION ALL SELECT 'Courses',     COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments',  COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;


-- Task 1
SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation: Student is joined to Department on dept_id so we can filter by the
-- department's name instead of typing an ID number. WHERE keeps only Software
-- Engineering students, and ORDER BY s.full_name ASC sorts them alphabetically.


-- Task 2
SELECT c.course_code, c.course_title, l.full_name AS lecturer
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code, l.full_name;
-- Explanation: Course and Lecturer are linked only through the CourseAllocation
-- junction table, so two INNER JOINs are needed: Course -> CourseAllocation ->
-- Lecturer. INNER JOIN returns only rows that match in both tables, so every row is
-- a real course-lecturer pair. A course with two lecturers (SEN307 and CYB301)
-- appears twice, once per lecturer.


-- Task 3
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;
-- Explanation: LEFT JOIN keeps every row from the left table (Student) even when
-- there is no match on the right. Students with no enrolments still appear, with
-- NULL in the course_title column.

-- Task 3 : only the students with no courses
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;
-- Explanation: Adding WHERE c.course_title IS NULL keeps only the rows where the
-- LEFT JOIN found no match, which means students who are not enrolled in anything.
-- This shows the 3 students I left without enrolments in Week 6, plus Transfer
-- Student from the Part 4 exercise, who also has no enrolments.


-- Task 4
SELECT matric_no, full_name, gender, date_of_birth, dept_id
FROM Student
WHERE gender = 'F'
  AND dept_id IN (SELECT dept_id FROM Department
                  WHERE dept_name IN ('Software Engineering', 'Artificial Intelligence'))
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY full_name;
-- Explanation: This combines AND, IN and BETWEEN. gender = 'F' keeps female
-- students, IN keeps the two departments (the sub-query looks the department IDs up
-- by name, so it works whatever numbers MySQL gave them), and BETWEEN keeps dates of
-- birth from 2004-01-01 to 2005-12-31 inclusive. All three conditions must be true.

-- Task 4 (continued)
SELECT matric_no, full_name, gender, date_of_birth
FROM Student
WHERE (gender = 'F' OR gender = 'M')
  AND date_of_birth BETWEEN '2003-01-01' AND '2004-12-31'
  AND dept_id IN (SELECT dept_id FROM Department
                  WHERE dept_name IN ('Computer Science', 'Data Science'))
ORDER BY date_of_birth;
-- Explanation: Brackets around gender = 'F' OR gender = 'M' make MySQL evaluate the
-- OR first; without brackets, AND is evaluated before OR and the result changes. This
-- also leaves out students whose gender is NULL.


-- Task 5
-- Page 1 (rows 1-10)
SELECT * FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;
-- Page 2 (rows 11-20)
SELECT * FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;
-- Explanation: LIMIT 10 returns 10 rows at a time and OFFSET says how many rows to
-- skip first (0 for page 1, 10 for page 2). ORDER BY is always needed with LIMIT
-- because a table has no guaranteed row order. Without it, MySQL could return rows
-- in a different order on each query, so pages could repeat rows or skip some.


-- Challenge: Task 3 rewritten with RIGHT JOIN 
SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name;
-- Explanation: RIGHT JOIN keeps every row from the right table, so Student is placed
-- last in the chain and all students are kept. The result is the same as Task 3.
-- The LEFT JOIN version is easier to read because it starts with the table we care
-- about (Student) and follows the data from left to right, while the RIGHT JOIN
-- version makes the reader work backwards from the end.
