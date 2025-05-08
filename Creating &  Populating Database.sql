-- This file is intended to help you learn how to create a database, its objects, and populate them with data.

-- To create a database 
CREATE DATABASE practice;

-- To use the particular database 
USE practice;

-- Learn about Datatypes and charactersets - https://docs.google.com/document/d/1bKJQf84Kfszhb99T9ku5iWppJgaQg5MtB6ZCAkIpPzw/edit?tab=t.z7drku9uufuq

SHOW CHARACTER SET; -- list of all available characterset in the server.


-- Setting at database level
CREATE DATABASE practice
	CHARACTER SET  'utf8mb3';
    
ALTER DATABASE practice
	CHARACTER SET 'utf8mb4';


-- After learning how to create a table, proceed to explore the following two levels.

-- Setting at table level 
CREATE TABLE practice.user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  message TEXT
  )
	CHARACTER SET 'utf8mb4'
	COLLATE 'utf8mb4_bin';	

-- Setting at column level 
CREATE TABLE practice.user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  message TEXT CHARACTER SET 'utf8mb4'
  );
  
  
  
DROP TABLE .user;

DROP DATABASE practice;


-- Table creation https://docs.google.com/document/d/1bKJQf84Kfszhb99T9ku5iWppJgaQg5MtB6ZCAkIpPzw/edit?tab=t.6tl426ea3ev3

/* There are three steps in table creations process 
Step - 1 :  Design
	Entity - table , attribute - column
	Logically designing a table by analyzing the requirements.
	In this phase , writing the entities ,finding suitable datatype for that attributes in the entity.
	Setting primary key.

Step - 2 :  Refinement ( Normalization + Constraints )
	Simply finetuning and optimizing the design that created previously.
	- Applying normalization .
	- Add Constraints


	About normalizations - https://drive.google.com/file/d/1Bmc-7ONdyipJ0ALQ1RhrrOJLNQlLdS_u/view?usp=drive_link
	
Step - 3 : Building SQL statements
	Now we write the actual SQL code to create the table.
*/



/*
Online Course Enrollment System:

You are building the backend database for an online course platform like Coursera or Udemy. The system needs to:

Store student information

Store course details

Track student enrollments

Allow multiple students to enroll in multiple courses

Track completion status and feedback

*/

CREATE DATABASE edumate 
	CHARACTER SET 'utf8mb4';
    

USE edumate;


-- Entity to store the STUDENTS informations 

CREATE TABLE students(
	student_id INT UNSIGNED AUTO_INCREMENT,
    first_name VARCHAR(100)  NOT NULL,
    second_name VARCHAR(100),
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) ,
    dob DATE ,
    gender ENUM('MALE' , 'FEMALE') NOT NULL,
    status ENUM ('ACTIVE' , 'INACTIVE') DEFAULT 'ACTIVE', 
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login  DATETIME ,
    CONSTRAINT student_id_pk PRIMARY KEY (student_id)
    );

    

-- Entity to store the INSTRUCTORS informations 

CREATE TABLE instructors(
	instructor_id INT UNSIGNED AUTO_INCREMENT,
	instructor_name	 VARCHAR(100)  NOT NULL,
    CONSTRAINT instructor_id_pk PRIMARY KEY (instructor_id)
    );
    
-- Entity to store the COURSES informations 
    
CREATE TABLE courses(
	course_id INT UNSIGNED AUTO_INCREMENT,
    course_name	 VARCHAR(100)  NOT NULL,
    course_fee INT NOT NULL,
    course_duration VARCHAR(50),
	instructor_id INT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT course_id_pk PRIMARY KEY (course_id),
    CONSTRAINT instructor_id_fk FOREIGN KEY  (instructor_id) REFERENCES  instructors(instructor_id)
    );
    
    -- Entity to store the ENROLLMENTS 

CREATE TABLE enrollments(
	enrollment_id  INT UNSIGNED AUTO_INCREMENT,
    course_id INT UNSIGNED ,
    student_id INT UNSIGNED ,
    enrollment_date DATE,
    
    CONSTRAINT enrollment_id_pk PRIMARY KEY (enrollment_id),
    CONSTRAINT course_id_fk  FOREIGN KEY  (course_id) REFERENCES  courses(course_id),
    CONSTRAINT student_id_fk FOREIGN KEY  (student_id) REFERENCES  students(student_id)
    );


-- Entity to store the TRACTING informations 

CREATE TABLE course_tracking(
    course_id INT UNSIGNED NOT NULL ,
    student_id INT UNSIGNED NOT NULL,
    status ENUM('NOT STARTED' , 'INPROGRESS', 'COMPLETED'),
	feedback TEXT ,
    
    CONSTRAINT course_tracking_id_pk PRIMARY KEY ( course_id,student_id ),
    CONSTRAINT enrollment_course_fk  FOREIGN KEY  (course_id) REFERENCES  courses(course_id),
    CONSTRAINT  tracking_student_fk FOREIGN KEY  (student_id) REFERENCES  students(student_id)
    );
    
    
SHOW TABLES;

DESCRIBE students;


INSERT INTO students (first_name, second_name, email, password_hash, phone_number, dob, gender, status, last_login)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@email.com', 'hashedpassword1', '9876543210', '2000-02-15', 'MALE', 'ACTIVE', '2025-05-01'),
('Vivaan', 'Patel', 'vivaan.patel@email.com', 'hashedpassword2', '9876543211', '2001-03-20', 'MALE', 'ACTIVE', '2025-05-02'),
('Aditya', 'Iyer', 'aditya.iyer@email.com', 'hashedpassword3', '9876543212', '1999-04-25', 'MALE', 'ACTIVE', '2025-05-03'),
('Sai', 'Reddy', 'sai.reddy@email.com', 'hashedpassword4', '9876543213', '2002-07-10', 'MALE', 'ACTIVE', '2025-05-04'),
('Ishaan', 'Mehta', 'ishaan.mehta@email.com', 'hashedpassword5', '9876543214', '2000-05-22', 'MALE', 'ACTIVE', '2025-05-05'),
('Ananya', 'Nair', 'ananya.nair@email.com', 'hashedpassword6', '9876543215', '2001-06-18', 'FEMALE', 'ACTIVE', '2025-05-06'),
('Priya', 'Deshmukh', 'priya.deshmukh@email.com', 'hashedpassword7', '9876543216', '1998-08-30', 'FEMALE', 'ACTIVE', '2025-05-07'),
('Kiara', 'Verma', 'kiara.verma@email.com', 'hashedpassword8', '9876543217', '2001-09-05', 'FEMALE', 'ACTIVE', '2025-05-08'),
('Rhea', 'Singh', 'rhea.singh@email.com', 'hashedpassword9', '9876543218', '2002-01-10', 'FEMALE', 'ACTIVE', '2025-05-09'),
('Kavya', 'Gupta', 'kavya.gupta@email.com', 'hashedpassword10', '9876543219', '2000-11-22', 'FEMALE', 'ACTIVE', '2025-05-10'),
('Raghav', 'Yadav', 'raghav.yadav@email.com', 'hashedpassword11', '9876543220', '1999-03-15', 'MALE', 'ACTIVE', '2025-05-11'),
('Shivansh', 'Kumar', 'shivansh.kumar@email.com', 'hashedpassword12', '9876543221', '2001-02-28', 'MALE', 'ACTIVE', '2025-05-12'),
('Pranav', 'Bansal', 'pranav.bansal@email.com', 'hashedpassword13', '9876543222', '2000-09-10', 'MALE', 'ACTIVE', '2025-05-13'),
('Meera', 'Sharma', 'meera.sharma@email.com', 'hashedpassword14', '9876543223', '2002-04-25', 'FEMALE', 'ACTIVE', '2025-05-14'),
('Shalini', 'Kaur', 'shalini.kaur@email.com', 'hashedpassword15', '9876543224', '2001-07-02', 'FEMALE', 'ACTIVE', '2025-05-15'),
('Neha', 'Chaudhary', 'neha.chaudhary@email.com', 'hashedpassword16', '9876543225', '1998-05-12', 'FEMALE', 'ACTIVE', '2025-05-16'),
('Mohit', 'Verma', 'mohit.verma@email.com', 'hashedpassword17', '9876543226', '2001-12-15', 'MALE', 'ACTIVE', '2025-05-17'),
('Arjun', 'Joshi', 'arjun.joshi@email.com', 'hashedpassword18', '9876543227', '1999-01-22', 'MALE', 'ACTIVE', '2025-05-18'),
('Sanya', 'Khan', 'sanya.khan@email.com', 'hashedpassword19', '9876543228', '2000-06-05', 'FEMALE', 'ACTIVE', '2025-05-19'),
('Tanya', 'Mehta', 'tanya.mehta@email.com', 'hashedpassword20', '9876543229', '2002-03-30', 'FEMALE', 'ACTIVE', '2025-05-20');

INSERT INTO instructors (instructor_name)
VALUES
('Dr. Ramesh Kumar'),
('Prof. Neelam Gupta'),
('Dr. Vijay Sharma'),
('Prof. Anita Soni'),
('Dr. Amit Patel');

INSERT INTO courses (course_name, course_fee, course_duration, instructor_id)
VALUES
('Data Structures and Algorithms', 15000, '3 Months', 1),
('Web Development with Django', 20000, '4 Months', 2),
('Machine Learning Basics', 18000, '2 Months', 3),
('Introduction to Python', 12000, '3 Months', 4),
('Database Management Systems', 16000, '3 Months', 5),
('Advanced Java Programming', 25000, '4 Months', 1);

INSERT INTO enrollments (course_id, student_id, enrollment_date)
VALUES
(1, 1, '2025-05-01'),
(1, 2, '2025-05-02'),
(1, 3, '2025-05-03'),
(1, 4, '2025-05-04'),
(1, 5, '2025-05-05'),
(2, 6, '2025-05-06'),
(2, 7, '2025-05-07'),
(2, 8, '2025-05-08'),
(2, 9, '2025-05-09'),
(2, 10, '2025-05-10'),
(3, 11, '2025-05-11'),
(3, 12, '2025-05-12'),
(3, 13, '2025-05-13'),
(3, 14, '2025-05-14'),
(3, 15, '2025-05-15'),
(4, 16, '2025-05-16'),
(4, 17, '2025-05-17'),
(4, 18, '2025-05-18'),
(4, 19, '2025-05-19'),
(4, 20, '2025-05-20'),
(5, 1, '2025-05-01'),
(5, 2, '2025-05-02'),
(5, 3, '2025-05-03'),
(5, 4, '2025-05-04'),
(5, 5, '2025-05-05'),
(6, 6, '2025-05-06'),
(6, 7, '2025-05-07'),
(6, 8, '2025-05-08'),
(6, 9, '2025-05-09'),
(6, 10, '2025-05-10'),
(1, 11, '2025-05-11'),
(1, 12, '2025-05-12'),
(1, 13, '2025-05-13'),
(1, 14, '2025-05-14'),
(1, 15, '2025-05-15'),
(2, 16, '2025-05-16'),
(2, 17, '2025-05-17'),
(2, 18, '2025-05-18'),
(2, 19, '2025-05-19'),
(2, 20, '2025-05-20');


INSERT INTO course_tracking (course_id, student_id, status, feedback)
VALUES
(1, 1, 'COMPLETED', '✅ Great course, learned a lot about data structures. 💡'),
(1, 2, 'INPROGRESS', '🚀 Currently learning the basics of data structures.'),
(1, 3, 'NOT STARTED', '🕒 Haven’t started yet, plan to start next week.'),
(1, 4, 'COMPLETED', '💯 This course helped me solidify my foundation in algorithms.'),
(1, 5, 'INPROGRESS', '📚 Going through linked lists and trees.'),
(2, 6, 'COMPLETED', '🔥 Very informative. The Django section was very helpful.'),
(2, 7, 'INPROGRESS', '🧠 Currently exploring Django views and templates.'),
(2, 8, 'NOT STARTED', '🗓️ I plan to start this course after finishing the ML course.'),
(2, 9, 'COMPLETED', '🎓 I learned a lot about web development and Django.'),
(2, 10, 'INPROGRESS', '🛠️ Learning about Django models and migrations.'),
(3, 11, 'NOT STARTED', '📝 Waiting to complete other courses before starting ML.'),
(3, 12, 'COMPLETED', '✅ Completed ML basics, looking forward to advanced topics.'),
(3, 13, 'INPROGRESS', '🤖 Currently working on supervised learning.'),
(3, 14, 'COMPLETED', '🏆 Great intro to ML. Projects were really useful.'),
(3, 15, 'INPROGRESS', '🔍 Starting with linear regression and classification.'),
(4, 16, 'NOT STARTED', '🕒 I’m starting the Python course next week.'),
(4, 17, 'INPROGRESS', '🐍 Learning about Python syntax and data types.'),
(4, 18, 'COMPLETED', '📘 Excellent intro Python course, beginner-friendly.'),
(4, 19, 'NOT STARTED', '📅 Will begin after completing Django.'),
(4, 20, 'INPROGRESS', '🧩 Working through Python’s OOP concepts.'),
(5, 1, 'INPROGRESS', '📊 Exploring relational DBs and SQL queries.'),
(5, 2, 'COMPLETED', '✅ Learned all essentials of DBMS.'),
(5, 3, 'NOT STARTED', '📌 Planning to start DBMS after Java.'),
(5, 4, 'COMPLETED', '🗃️ Solid understanding of normalization and joins.'),
(5, 5, 'INPROGRESS', '🔄 Learning about indexing and transactions.'),
(6, 6, 'NOT STARTED', '📅 Planning to start Advanced Java course.'),
(6, 7, 'INPROGRESS', '⚙️ Learning about multithreading in Java.'),
(6, 8, 'COMPLETED', '🎉 Java course covered OOP and exceptions.'),
(6, 9, 'INPROGRESS', '📦 Learning about collections and generics.'),
(6, 10, 'NOT STARTED', '⏳ I will begin after DBMS.'),
(1, 11, 'COMPLETED', '🏁 Course was amazing. Loved DP and graphs.'),
(1, 12, 'INPROGRESS', '🔁 Working through recursion and trees.'),
(1, 13, 'NOT STARTED', '📌 Plan to start after other courses.'),
(1, 14, 'COMPLETED', '🎯 Hands-on approach was fantastic.'),
(1, 15, 'INPROGRESS', '📂 Working on sorting algorithms.'),
(2, 16, 'NOT STARTED', '📅 Django starts next week.'),
(2, 17, 'COMPLETED', '🌟 Thorough and practical Django course.'),
(2, 18, 'INPROGRESS', '🔗 Learning ORM and migrations.'),
(2, 19, 'COMPLETED', '🎈 Loved building Django apps.'),
(2, 20, 'INPROGRESS', '📝 Finishing forms section of Django.'),
(3, 1, 'COMPLETED', '🎉 ML is much clearer now!'),
(3, 2, 'INPROGRESS', '🌲 Learning decision trees and clustering.'),
(3, 3, 'NOT STARTED', '⏸️ Will start ML after Python.'),
(3, 4, 'COMPLETED', '💼 Practical examples helped a lot.'),
(3, 5, 'INPROGRESS', '📉 Reviewing regression models.'),
(4, 6, 'NOT STARTED', '⌛ Python after DBMS.'),
(4, 7, 'INPROGRESS', '⚡ Exploring Python functions and modules.'),
(4, 8, 'COMPLETED', '🚀 Done! Applying concepts in projects.'),
(4, 9, 'NOT STARTED', '📆 Will start after DBMS.'),
(4, 10, 'INPROGRESS', '📊 Learning Python libraries for DS.');






-- DROP DATABASE edumate;












-- 