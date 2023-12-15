CREATE DATABASE FAMILY;
CREATE TABLE Family_members
(
member_id INT NOT NULL PRIMARY KEY auto_increment,
status_ VARCHAR(10) NOT NULL,
member_name VARCHAR(20) NOT NULL,
birthdate DATE NOT NULL
);
DROP TABLE familymembers;

select * FROM Family_members;


CREATE TABLE  Payments
(
payment_id INT NOT NULL PRIMARY KEY auto_increment,
good_name varchar(20) NOT NULL,
amount decimal(10,2),
date_of_purchase DATE NOT NULL
);
select *from Payments;


create table FamilyFriends
(
friend_id INT NOT NULL PRIMARY KEY auto_increment,
friend_name varchar(20),
member_name varchar(20),
friend_age decimal(3,0)
);
select*from FamilyFriends;family_members
