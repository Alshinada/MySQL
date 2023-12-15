/*1. Выведите список всех менеджеров, а именно их emp_no, имена/фамилии, номер департамента, который они курируют, и дату найма в компанию.
 (именно менеджером, то есть подсказка dept_manager)*/
 
 select a. * from dept_manager a;
 select b. * from employees b;
 select a.emp_no, b.first_name, b.last_name, a.dept_no, a.from_date, a.to_date
 from dept_manager a
 JOIN employees b
 ON a.emp_no = b.emp_no
 order by emp_no;
 
/*2. Существует ли сотрудник по фамилии Markovitch, который когда-то был менеджером департамента. Может быть таких сотрудников несколько?
 (именно менеджером, то есть подсказка dept_manager)*/
 
 select a. * from dept_manager a;
 select b. * from employees b;
 select a.emp_no, a.dept_no, b.first_name, b.last_name, b.gender, a.from_date, a.to_date
 from dept_manager a
 JOIN employees b
 ON a.emp_no = b.emp_no
 where b.last_name LIKE 'Markovitch'
 order by emp_no;
 
/*3. Вывести список сотрудников, имена/фамилии, дату найма, должность в компании, у которых имя начинается на М, а фамилия заканчивается на H.*/
select a. * from employees a;
select b. * from titles b;
select a.first_name, a.last_name, a.hire_date, b.title
from employees a
JOIN titles b
ON a.emp_no = b.emp_no
where a.first_name LIKE 'M%' and a.last_name LIKE '%N'
order by first_name;

/*4. Создайте временную таблицу на основе salaries, где у вас будет emp_no и его/ее максимальная и минимальная зарплата за весь 
период работы в компании. 
Далее сделайте JOIN используя эту временную таблицу и таблицу employees чтобы получить список сотрудников, их имена/фамилии, и их мин/макс зарплат.
.*/
drop temporary table if exists salaries_s;
create temporary table salaries_s 
select * from salaries  ;
select emp_no, max(salary) as max_s, min(salary) as min_s
from salaries_s
group by emp_no;
select a. * from salaries_s; /*Unknown table a vıxodıt. Pochemu?*/
select b. * from employees b;
select a.emp_no, b.first_name, b.last_name, a.max_s, a.min_s
from salaries_s a
JOIN employees b
ON a.emp_no = b.emp_no
order by emp_no;




