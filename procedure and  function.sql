/*1. Создать процедуру, в которой мы получаем на вход два параметра p_salary, p_dept и на выходе получим:

- Список сотрудников (emp_no, first_name, gender), у которых средняя зарплата больше p_salary
 и которые когда-то работали в департаменте p_dept.*/
 select * from salaries;
 select * from dept_emp;
 select * from employees;
 # Chto ta ne pravilno rabotayet? ili ya ne ponyala vopros?
 delimiter $$
drop procedure if exists getAllsalaries$$
create procedure getAllsalaries(IN p_salary varchar (8), p_dept varchar (20))
BEGIN
select e.emp_no, e.first_name, e.gender, avg(s.salary) into p_salary, d.dept_no into p_dept
from employees e
JOIN salaries s
ON e.emp_no = s.emp_no
JOIN dept_emp d
ON e.emp_no = d.emp_no
where p_salary > avg(s.salary)
and p_dept = dept_no;
end$$

delimiter ; 

call getAllsalaries();

select @result;

/*2. Создать функцию, которая получает на вход f_name и 
выдает максимальную зарплату среди сотрудников с именем f_name.*/

drop function if exists f_max_salary_name;
delimiter $$
create function f_max_salary_name(f_first_name, f_last_name integer) returns decimal (10,2)
deterministic reads sql data
begin
declare f_max_salary decimal(10,2);
select e.first_name, e.last_name, max(s.salary) into f_max_salary
from employees e
JOIN salaries s
ON e.emp_no = s.emp_no
where emp_no = f_emp_name;
return f_max_salary;
end $$

delimiter ;

select f_max_salary_name('alain');

/*Следующие запросы относятся к базе данных World (скачайте ее ниже, и запустите все запросы, 
как мы делали с employees):
1. Посчитайте количество городов в каждой стране, где IndepYear = 1991 (Independence Year).*/

select count(ci.Name) as count, co.Name 
from city ci
JOIN country co
ON ci.CountryCode = co.Code
where co.IndepYear = '1991'
group by co.Name;

/*2. Узнайте, какая численность населения и средняя продолжительность жизни людей в Аргентине (ARG).*/

select Population, LifeExpectancy
from country
where Name LIKE 'Argentina';

/*3. В какой стране самая высокая продолжительность жизни?*/

select Name, max(LifeExpectancy) as max_life from country; # ne pravilno vıxodıt name a jizn pravilno
select * from country order by LifeExpectancy desc; # 2- variant)

/*4. Перечислите все языки, на которых говорят в регионе «Southeast Asia».*/

select cl.Language 
from countrylanguage cl
JOIN country co 
ON co.Code = cl.CountryCode
where co.region LIKE ('Southeast Asia')
group by Language;

/*5. Посчитайте сумму SurfaceArea для каждого континента.*/

select Continent, sum(SurfaceArea) as sum_area from country
group by Continent;










