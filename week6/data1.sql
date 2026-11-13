
-- VUA-SEN307 Week 6 Practical (Lab 4): DML - Insert, Update, Delete

USE sen307_vug_sen_24_11799;

--  Departments and Courses 
INSERT INTO Department (dept_name) VALUES
  ('Software Engineering'),
  ('Computer Science'),
  ('Artificial Intelligence'),
  ('Data Science'),
  ('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
  ('SEN307', 'Database Systems', 3,
   'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
  ('SEN301', 'Software Architecture', 3,
   'Architectural styles, design patterns, microservices and how to structure large software systems.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
  ('COS301', 'Operating Systems', 3,
   'Processes, threads, CPU scheduling, memory management and file systems.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('COS305', 'Computer Networks', 3,
   'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('AIN301', 'Introduction to Artificial Intelligence', 3,
   'Intelligent agents, search algorithms, knowledge representation and reasoning.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('AIN305', 'Machine Learning', 3,
   'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('AIN307', 'Natural Language Processing', 3,
   'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('DTS301', 'Data Visualization and Analytics', 2,
   'Exploratory data analysis, charts, dashboards and telling stories with data.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
  ('DTS305', 'Big Data Technologies', 3,
   'Distributed storage and processing of very large datasets with Hadoop and Spark.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
  ('CYB301', 'Network Security', 3,
   'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
   (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- Should list 5 departments with 10 courses between them
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

-- Note the ID numbers
SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

-- ============================================================
-- PART 2: Your own data
-- ============================================================

-- Step 1: Lecturers (10)
INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
  ('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
  ('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
  ('VUA/ST/103', 'Dr Chinedu Nwosu', 'c.nwosu@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('VUA/ST/104', 'Mrs Folake Adeyemi', 'f.adeyemi@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('VUA/ST/105', 'Dr Ibrahim Abdullahi', 'i.abdullahi@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('VUA/ST/106', 'Dr Blessing Ekwueme', 'b.ekwueme@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('VUA/ST/107', 'Dr Tunde Balogun', 't.balogun@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
  ('VUA/ST/108', 'Mrs Hauwa Suleiman', 'h.suleiman@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
  ('VUA/ST/109', 'Dr Emeka Obiora', 'e.obiora@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
  ('VUA/ST/110', 'Dr Zainab Garba', 'z.garba@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

--  Students

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
  ('20231234', 'Ada Obi', 'F', '2005-03-14', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
  ('20231235', 'John Musa', 'M', '2004-11-02', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('VUG/SEN/24/11799', 'Ogbobe Uchechukwu', 'F', '2007-05-25', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),  
  ('20231236', 'Grace Okon', 'F', '2005-07-21', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
  ('20231237', 'Chidera Nwankwo', 'M', '2004-02-09', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('20231238', 'Fatima Yusuf', 'F', '2005-09-30', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('20231239', 'Emeka Okonkwo', 'M', '2003-12-17', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('20231240', 'Aisha Bello', 'F', '2006-01-25', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('20231241', 'Tunde Adewale', 'M', '2004-06-08', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('20231242', 'Ngozi Eze', 'F', '2005-04-19', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
  ('20231243', 'Ibrahim Danjuma', 'M', '2003-10-03', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
  ('20231244', 'Blessing Udoh', 'F', '2006-08-12', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
  ('20231245', 'Samuel Ojo', 'M', '2004-05-27', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
  ('20231246', 'Halima Abubakar', 'F', '2005-12-01', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
  ('20231247', 'Kelechi Anyanwu', 'M', '2006-03-22', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('20231248', 'Zainab Lawal', 'F', '2007-02-14', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
  ('20231249', 'Oluwaseun Adebayo', 'M', '2003-07-09', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
  ('20231250', 'Yetunde Ajayi', 'F', '2004-09-18', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
  ('20231251', 'Musa Ibrahim', 'M', '2005-11-29', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
  ('20231252', 'Precious Okeke', 'F', '2006-10-06', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science'));

--  Enrolments 
SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;

INSERT INTO Enrolment (student_id, course_id) VALUES
  ((SELECT student_id FROM Student WHERE matric_no = '20231234'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231234'), (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231235'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231235'), (SELECT course_id FROM Course WHERE course_code = 'COS301')),
  ((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/11799'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/11799'), (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
  ((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/11799'), (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231236'), (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231236'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231237'), (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231237'), (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231237'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231238'), (SELECT course_id FROM Course WHERE course_code = 'COS301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231238'), (SELECT course_id FROM Course WHERE course_code = 'COS305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231238'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231239'), (SELECT course_id FROM Course WHERE course_code = 'COS301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231239'), (SELECT course_id FROM Course WHERE course_code = 'COS305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231240'), (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231240'), (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231240'), (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231241'), (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231241'), (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231241'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231242'), (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231242'), (SELECT course_id FROM Course WHERE course_code = 'DTS305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231242'), (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231243'), (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231243'), (SELECT course_id FROM Course WHERE course_code = 'DTS305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231244'), (SELECT course_id FROM Course WHERE course_code = 'CYB301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231244'), (SELECT course_id FROM Course WHERE course_code = 'COS305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231245'), (SELECT course_id FROM Course WHERE course_code = 'CYB301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231245'), (SELECT course_id FROM Course WHERE course_code = 'COS305')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231246'), (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231246'), (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231247'), (SELECT course_id FROM Course WHERE course_code = 'COS301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231247'), (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231248'), (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231248'), (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231249'), (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
  ((SELECT student_id FROM Student WHERE matric_no = '20231249'), (SELECT course_id FROM Course WHERE course_code = 'AIN301'));

-- Course allocations
INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
  ((SELECT course_id FROM Course WHERE course_code = 'SEN307'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/101')),
  ((SELECT course_id FROM Course WHERE course_code = 'SEN307'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/102')),
  ((SELECT course_id FROM Course WHERE course_code = 'SEN301'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/102')),
  ((SELECT course_id FROM Course WHERE course_code = 'COS301'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/103')),
  ((SELECT course_id FROM Course WHERE course_code = 'COS305'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/104')),
  ((SELECT course_id FROM Course WHERE course_code = 'AIN301'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/105')),
  ((SELECT course_id FROM Course WHERE course_code = 'AIN305'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/106')),
  ((SELECT course_id FROM Course WHERE course_code = 'AIN307'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/106')),
  ((SELECT course_id FROM Course WHERE course_code = 'DTS301'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/107')),
  ((SELECT course_id FROM Course WHERE course_code = 'DTS305'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/108')),
  ((SELECT course_id FROM Course WHERE course_code = 'CYB301'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/109')),
  ((SELECT course_id FROM Course WHERE course_code = 'CYB301'), (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/110'));



--  UPDATING a record

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

UPDATE Student SET dept_id = 4 WHERE matric_no = '20231234';


SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';


-- Referential integrity

-- creating a department with a student in it
INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
        (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));


DELETE FROM Department WHERE dept_name = 'Library and Information Science';


-- Reassigning the dependent student to another department
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department
               WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';


DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SELECT * FROM Department;


SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers',   COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students',    COUNT(*) FROM Student
UNION ALL SELECT 'Courses',     COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments',  COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;
