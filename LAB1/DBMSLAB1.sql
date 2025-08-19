-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: ANANYA R
-- USN: 1RUA24BCA0011
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'RVU-PC-042', '8.4.6', '2025-08-18 11:36:58'

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database DBLab001;
use DBLab001;
-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
create table students
(studentID varchar(10) Primary Key,
firstname varchar(10),
lastname varchar(10),
email varchar (12) unique,
dob date );

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
-- 'studentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(10)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(10)', 'YES', '', NULL, ''
-- 'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
-- 'dob', 'date', 'YES', '', NULL, ''

-- Alter the table and 2 new columns
alter table students
add(gender varchar(2), age int);
desc students;
-- 'studentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(10)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(10)', 'YES', '', NULL, ''
-- 'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
-- 'dob', 'date', 'YES', '', NULL, ''
-- 'gender', 'varchar(2)', 'YES', '', NULL, ''
-- 'age', 'int', 'YES', '', NULL, ''

-- Modify a column data type
alter table students
modify lastname varchar(15);
-- Rename a column
alter table students
RENAME COLUMN studentID to registerID;
desc students;
-- 'registerID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(10)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(15)', 'YES', '', NULL, ''
-- 'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
-- 'dob', 'date', 'YES', '', NULL, ''
-- 'gender', 'varchar(2)', 'YES', '', NULL, ''
-- 'age', 'int', 'YES', '', NULL, ''

-- Drop a column
alter table students
drop column gender;
-- Rename the table
alter table students
rename to studentdetails; 
desc studentdetails;
-- 'registerID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(10)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(15)', 'YES', '', NULL, ''
-- 'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
-- 'dob', 'date', 'YES', '', NULL, ''
-- 'age', 'int', 'YES', '', NULL, ''


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table courses
(courseID varchar (10) primary key,
coursename varchar (10),
credits int );
DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :

-- 'courseID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'coursename', 'varchar(10)', 'YES', '', NULL, ''
-- 'credits', 'int', 'YES', '', NULL, ''

-- Alter the table and 2 new columns
alter table courses
add(courseincharge varchar (10), venue varchar(10));
-- Modify a column data type
alter table courses
modify credits varchar(10);
-- Rename a column
alter table courses 
rename column coursename to subjectname;
-- Drop a column
alter table courses
drop column venue;
-- Rename the table
alter table courses
rename to subjects;
desc subjects;
-- 'courseID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'subjectname', 'varchar(10)', 'YES', '', NULL, ''
-- 'credits', 'varchar(10)', 'YES', '', NULL, ''
-- 'courseincharge', 'varchar(10)', 'YES', '', NULL, ''


-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table enrollments
(enrollmentID varchar (10) primary key,
registerID varchar(10),
courseID varchar(10),
foreign key(registerID) references studentdetails(registerID),
foreign key(courseID) references subjects(courseID)
);

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
-- 'enrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'registerID', 'varchar(10)', 'YES', 'MUL', NULL, ''
-- 'courseID', 'varchar(10)', 'YES', 'MUL', NULL, ''

-- Alter the table and 2 new columns
alter table enrollments
add(enrollmentdate date , coursename varchar(10));
-- Modify a column data type
alter table enrollments
modify enrollmentID int;
-- Rename a column
alter table enrollments
rename column coursename to subjectname;

-- Drop a column
alter table enrollments
drop column enrollmentID;
-- Rename the table
alter table enrollments
rename to admissions;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table studentdetails
add(phonenumber int);
DESC STUDENTdetails; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- 'registerID', 'varchar(10)', 'NO', 'PRI', NULL, ''
-- 'firstname', 'varchar(10)', 'YES', '', NULL, ''
-- 'lastname', 'varchar(15)', 'YES', '', NULL, ''
-- 'email', 'varchar(12)', 'YES', 'UNI', NULL, ''
-- 'dob', 'date', 'YES', '', NULL, ''
-- 'age', 'int', 'YES', '', NULL, ''
-- 'phonenumber', 'int', 'YES', '', NULL, ''

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

alter table subjects
modify credits DECIMAL(10,2);
-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table subjects;
drop table admissions;
SHOW TABLES; -- After dropping the table Enrollement and Course
-- 'studentdetails'
-- 'subjects'

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
