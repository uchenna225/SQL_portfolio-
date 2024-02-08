--CREATING 3 TABLES FOR UniversityDB

CREATE TABLE Students(
students_id int Primary Key,
first_name varchar(20),
last_name varchar(20),
date_of_birth Date,
major varchar(20)
);

CREATE TABLE Courses(
course_id int Primary Key,
course_name varchar(20),
department varchar(20),
credit_hours varchar(20)
);

CREATE TABLE Enrollments(
enrollment_id int Primary Key,
students_id int REFERENCES Students(students_id),
course_id int REFERENCES Courses(course_id),
enrollment Date
);

--I WANT TO ADD AN EMAIL COLUMN IN ORDER TO BE ABLE TO REACH THE STUDENTS

ALTER TABLE Students
ADD email varchar(20);

--I WANT TO MODIFY THE COURSES TABLE AND CHANGE CREDIT_HOURS TO INT
ALTER TABLE Courses
ALTER COLUMN credit_hours int;

--I WANT DROP THE DATE_OF_BIRTH COLUMN IN THE STUDENTS TABLE

ALTER TABLE STUDENTS
DROP COLUMN date_of_birth

--I WANT DROP THE ENROLLMENT TABLE

DROP TABLE Enrollments

--I WANT DROP THE UNIVERSITYDB

USE master;
DROP DATABASE UniversityDB;