-- Creating the table
CREATE TABLE students(id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, first_name VARCHAR(50) NOT NULL, middle_name VARCHAR(50) DEFAULT 'Blank', last_name VARCHAR(50) NOT NULL, age INT NOT NULL, location VARCHAR(100) NOT NULL);

-- See the table by id number in ascending order
SELECT * FROM students ORDER BY id;

-- Inserting the 6 records in the table
INSERT INTO students(first_name, last_name, age, location) VALUES('Juan', 'Cruz', 18, 'Manila');
INSERT INTO students(first_name, last_name, age, location) VALUES('Anne', 'Wall', 20, 'Manila');
INSERT INTO students(first_name, last_name, age, location) VALUES('Theresa', 'Joseph', 21, 'Manila');
INSERT INTO students(first_name, last_name, age, location) VALUES('Issac', 'Gray', 19, 'Laguna');
INSERT INTO students(first_name, last_name, age, location) VALUES('Zack', 'Matthews', 22, 'Marikina');
INSERT INTO students(first_name, last_name, age, location) VALUES('Finn', 'Lam', 25, 'Manila');

-- Updating the first record in the table
UPDATE students SET first_name = 'Ivan', middle_name = 'Ingram', last_name = 'Howard', age = 25, location = 'Bulacan' WHERE id = 1;

-- Deleting the last record in the table
DELETE FROM students WHERE id in(Select Max(id) from students);