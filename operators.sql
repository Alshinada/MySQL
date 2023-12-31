#1. Найти всех женщин, у которых emp_no заканчивается на 7
select * from employees
where emp_no LIKE '%7' 
AND gender = 'F';


#2. Вывести все emp_no сотрудников, кто не работал в департаменте d005 (таблица dept_emp)
select * from dept_emp
where dept_no NOT IN ('d005');/*ne rabotayet*/


#3. Вывести все названия департаментов, где есть буквы ‘u’ и ‘o’
select *from departments
where dept_name LIKE '%u%o%';


#4. Вывести имена всех сотрудников, где есть либо ‘z’ либо ‘t’
select first_name from employees
where first_name LIKE '%z%' OR first_name LIKE '%t%';

#5. Вывести все фамилии сотрудников, которые были наняты на работу между ‘1993-01-15’ и ‘1993-12-31’
select * FROM employees
WHERE hire_date between '1993-01-15' and '1993-12-31';
 

#6. Получить список со всеми сотрудницами, чье имя Kellie
SELECT * FROM employees
WHERE gender = 'F' and first_name ='Kellie' ;

#7. Получить список со всеми сотрудницами, чье имя Kellie или Aruna
SELECT * FROM employees
WHERE gender = 'F' AND first_name IN ('Kellie', 'Aruna');

#8. Выбрать всю информацию из таблицы salaries где зарплаты между 66 000 и 70 000 долларов
select * from salaries
where salary between '66000' and '70000';