/*1. Найдите количество сотрудников мужского пола (M) и женского пола (F) и выведите записи в порядке убывания 
по количеству сотрудников.*/

select gender , count(gender) AS count
from employees
group by gender
order by count desc;

/*2. Найдите среднюю зарплату в разрезе должностей сотрудников (title), округлите эти средние зарплаты
 до 2 знаков после запятой и выведите записи в порядке убывания.*/
 
select t.title, round(avg(s.salary),2) as avg_salary
from titles t
JOIN salaries s
ON t.emp_no = s.emp_no
group by t.title
order by avg_salary desc; 

/* 3. Найдите всех сотрудников, которые работали как минимум в 2 департаментах.
 Вывести их имя, фамилию и количество департаментов, в которых они работали. Показать записи в порядке возрастания.*/
 
 select e.first_name, e.last_name, count(dept_no) 
 from employees e
 JOIN dept_emp d 
 ON e.emp_no =d.emp_no
 group by first_name, last_name
 having count(dept_no)>1
 order by count(dept_no);
  
# 4. Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.

select e.first_name, e.last_name, max(s.salary) 
from employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
group by e.emp_no
order by MAX(s.salary) DESC
LIMIT 1; 

#5. Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.

select month(hire_date) , COUNT(emp_no)
from employees
group by month(hire_date)
order by month(hire_date);

#6. Создайте VIEW на базе 1-го запроса.
drop view if exists employees_v;
create view employees_v as
select gender, count(gender) as count
from employees
group by gender
order by count desc;

select * from employees_v;




