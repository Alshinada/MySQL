CREATE DATABASE University;
CREATE TABLE Address(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Country VARCHAR (20) NOT NULL,
City VARCHAR (20) NOT NULL,
Street VARCHAR (20) NOT NULL,
Number_ VARCHAR (10) NOT NULL
);
SELECT * FROM Address;  

INSERT INTO Address ( Country, City, Street, Number_) VALUES ('Kazakhstan', 'Nur-Sultan', 'Petrova', '32');
INSERT INTO Address ( Country, City, Street, Number_) VALUES ('Kazakhstan', 'Almaty', 'Zheltoqsan', '10');
INSERT INTO Address ( Country, City, Street, Number_) VALUES ('Kazakhstan', 'Nur-Sultan', 'Zhubanova', '45/3');
INSERT INTO Address ( Country, City, Street, Number_) VALUES ('Kyrgyzstan', 'Bishkek', 'Satybaldeev', '13/8');
INSERT INTO Address ( Country, City, Street, Number_) VALUES ('Turkey', 'Istambul', 'Toros 801', '25.10');

CREATE TABLE Person(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
First_name VARCHAR (20) NOT NULL,
Last_name VARCHAR (20) NOT NULL,
Phone_number VARCHAR(12),
Birth_Date DATE,
Address_ID INT,
FOREIGN KEY (Address_ID) references Address (ID) ON DELETE CASCADE
);
SELECT * FROM Person;

INSERT INTO Person(First_name, Last_name, Phone_number, Birth_Date, Address_ID) VALUES ('Darikha', 'Akhmedova', '77783993978', '1992-05-20', 1);
INSERT INTO Person(First_name, Last_name, Phone_number, Birth_Date, Address_ID) VALUES ('Madey', 'Akhmedov', '87783993978', '1990-12-28', 2);
INSERT INTO Person(First_name, Last_name, Phone_number, Birth_Date, Address_ID) VALUES ('Zhanar', 'Zhubanova', '77782563149', '2001-10-15', 3);
INSERT INTO Person(First_name, Last_name, Phone_number, Birth_Date, Address_ID) VALUES ('Murat', 'Ablay', '09928569214', '1999-03-01', 4);
INSERT INTO Person(First_name, Last_name, Phone_number, Birth_Date, Address_ID) VALUES ('Ablay', 'Azhar', '0905431327339', '2005-04-18', 5);

CREATE TABLE Student (
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Person_ID INT,
Description VARCHAR (10),
FOREIGN KEY (Person_ID) REFERENCES Person (ID)ON DELETE CASCADE
);
SELECT * FROM Student;

INSERT INTO Student (Person_ID, Description) VALUES (1, '1-course');
INSERT INTO Student (Person_ID, Description) VALUES (2, '2-course');
INSERT INTO Student (Person_ID, Description) VALUES (3, '3-course');
INSERT INTO Student (Person_ID, Description) VALUES (4, '4-course');
INSERT INTO Student (Person_ID, Description) VALUES (5, '5-course');

CREATE TABLE Teacher (
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Position VARCHAR (10),
Person_ID INT,
FOREIGN KEY (Person_ID) REFERENCES Person (ID)ON DELETE CASCADE
);
SELECT * FROM Teacher;

INSERT INTO Teacher (Position, Person_ID) VALUES ('Teacher', '1');
INSERT INTO Teacher (Position, Person_ID) VALUES ('1-kathegory', '2');
INSERT INTO Teacher (Position, Person_ID) VALUES ('Laborant', '18');
INSERT INTO Teacher (Position, Person_ID) VALUES ('Professor', '21');
INSERT INTO Teacher (Position, Person_ID) VALUES ('Teacher', '3');

CREATE TABLE Course(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NAME_ VARCHAR (20) NOT NULL,
Credids VARCHAR (10),
Description VARCHAR (10),
Teacher_ID INT ,
FOREIGN KEY (Teacher_ID) REFERENCES Teacher (ID) ON DELETE CASCADE
);
SELECT * FROM Course;
INSERT INTO Course (Name_, Credids, Description, Teacher_ID) VALUES ('Microbiology', '123', 'Good', 1);
INSERT INTO Course (Name_, Credids, Description, Teacher_ID) VALUES ('IT', '456', 'MYSQL', 2);
INSERT INTO Course (Name_, Credids, Description, Teacher_ID) VALUES ('Therapy', '789', 'Manual', 3);
INSERT INTO Course (Name_, Credids, Description, Teacher_ID) VALUES ('Bank', '147', 'Credits', 4);
INSERT INTO Course (Name_, Credids, Description, Teacher_ID) VALUES ('Tourism', '258', '5*family hotel', 5);

select * from address;
select * from Course;
select * from person;
select * from student;
select * from teacher;
