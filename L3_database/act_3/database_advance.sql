-- Use your table from previous lesson

-- Creating the classroom table
CREATE TABLE classrooms (
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	student_id INTEGER NOT NULL,
	section VARCHAR(50) NOT NULL
);

SELECT * FROM classrooms ORDER BY id;

-- SELECT * FROM information_schema.columns WHERE table_name = 'students';

-- Inserting the 10 records in the classroom table
INSERT INTO classrooms(student_id, section)
VALUES
	(1,'A'), (2,'A'), (3,'B'), (4,'C'), (5,'B'), 
	(6,'A'), (7,'C'), (8,'B'), (9,'B'), (10,'C');
	
-- Inner Join
-- Matching both tables parang intersection sa set theory
SELECT
s.first_name, s.middle_name, s.last_name, s.age, s.location, c.student_id, c.section 
FROM classrooms c INNER JOIN students s ON c.student_id = s.id;

-- Left Join
-- Priority niya is classroom ilagay sa students
-- Table A(Priority) = Classrooms || Table B = Students
SELECT
s.first_name, s.middle_name, s.last_name, s.age, s.location, c.student_id, c.section 
FROM classrooms c LEFT JOIN students s ON c.student_id = s.id;


-- Right Join
-- Priority niya is students ilagay sa classroom
-- Table A = Classrooms || Table B(Priority) = Students
SELECT
s.first_name, s.middle_name, s.last_name, s.age, s.location, c.student_id, c.section 
FROM classrooms c RIGHT JOIN students s ON c.student_id = s.id;

-- Full Join
-- Combining tables parang union sa set theory
SELECT
s.first_name, s.middle_name, s.last_name, s.age, s.location, c.student_id, c.section 
FROM classrooms c FULL JOIN students s ON c.student_id = s.id;

-- Concatination of Full Name practice
-- SELECT
-- concat(UPPER(s.last_name), ' ', s.first_name, ' ', s.middle_name) full_name,
-- s.age age, s.location address, c.section section
-- FROM
-- classrooms c LEFT JOIN students s on c.student_id = s.id