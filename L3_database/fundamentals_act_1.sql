CREATE TABLE students(id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, first_name VARCHAR(50), middle_name VARCHAR(50) DEFAULT 'Blank', last_name VARCHAR(50), age INT, location VARCHAR(100));

SELECT * FROM students

INSERT INTO students(first_name, middle_name, last_name, age, location) VALUES('Ivan', 'Ingram', 'Howard', 25, 'Bulacan')
INSERT INTO students(first_name, last_name, age, location) VALUES('Juan', 'Cruz', 18, 'Manila')
INSERT INTO students(first_name, last_name, age, location) VALUES('Anne', 'Wall', 20, 'Manila')
INSERT INTO students(first_name, last_name, age, location) VALUES('Theresa', 'Joseph', 21, 'Manila')
INSERT INTO students(first_name, last_name, age, location) VALUES('Issac', 'Gray', 19, 'Laguna')
INSERT INTO students(first_name, last_name, age, location) VALUES('Zack', 'Matthews', 22, 'Marikina')
INSERT INTO students(first_name, last_name, age, location) VALUES('Finn', 'Lam', 25, 'Manila')

DELETE FROM students WHERE id in(Select Max(id) from students)