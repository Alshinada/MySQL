create database final_project;
create table uk_bank (
Customer_ID INT NOT NULL, 
Name VARCHAR (20) NOT NULL,
Surname VARCHAR (20) NOT NULL, 
Gender VARCHAR (6) NOT NULL,
Age  INT NOT NULL,
Region VARCHAR (20) NOT NULL, 
Job_Classification VARCHAR (20) NOT NULL, 
Date_Joined Date,
Balance INT
);
select * from uk_bank;
drop table uk_bank;
select * from uk_bank;