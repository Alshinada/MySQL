# 1a. Выбрать все столбцы из таблицы actor (ограничить по 100 строкам).
select * from actor
Limit 100;

# 1b. Выбрать только last_name из таблицы actor.
select actor_id, last_name from actor;

# 1c. Выбрать только следующие столбцы из таблицы film:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)
select title, description, rental_duration, rental_rate, rental_duration * rental_rate as total_rental_cost from film;

# 2a. Выбрать различные/уникальные фамилии из таблицы actor.
select DISTINCT last_name from actor;

# 2b. Выбрать различные/уникальные почтовые коды из таблицы address.
select distinct postal_code from address;

# 2c. Выбрать различные/уникальные рейтинги из таблицы film.
select distinct rating from film;

# 3a. Выбрать столбцы title, description, rating, length из таблицы film, которые длятся более 3 часа или более.
select title, description, rating, length from film
where length > 180;

# 3b. Выбрать столбцы payment_id, amount, payment_date из таблицы payment, где платежи были сделаны 05/27/2005 или позднее.
select payment_id, amount, payment_date from payment 
where payment_date >= '2005-05-27';

# 3c. Выбрать все столбцы из таблицы customer, где фамилии начинаются на S и имена заканчиваются на N.
select * from customer 
where last_name LIKE 'S%'
AND first_name LIKE  '%N' ;

# 3d. Выбрать все столбцы из таблицы customer, где клиент является неактивным или его фамилия начинается на M.
select * from customer
WHERE last_name LIKE 'M%'
AND active = '0';

# 3e. Выбрать все столбцы из таблицы category, где первичный ключ больше 4 и столбец name начинается на C, S или T.
SELECT * FROM category
WHERE category_id > 4 
AND name LIKE 'C%' 
OR name LIKE 'S%' 
OR name LIKE 'T%'; 

# 3f. Выбрать все столбцы за исключением столбца password из таблицы staff, где имеется значение password.
alter table staff 
drop column password;
select * from staff;

# 4a. Выбрать столбцы phone, district из таблицы address, которые находятся в California, England, Taipei, или West Java.
select phone, district from address
where district IN ('California', 'England', 'Taipei', 'West Java');

# 4c. Выбрать все столбцы из таблицы film, где рейтинг фильма является G, PG-13 или NC-17.
select * from film
WHERE rating IN ('G', 'PG-13', 'NC-17');

# 5a. Выбрать все столбцы из таблицы payment, где платежи были выполнены между 05/25/2005 и 05/26/2005.
select * from payment 
where payment_date between '2005-05-25'and '2005-05-26';

# 5b. Выбрать только следующие столбцы из таблицы film, для фильмов у которых длина description между 100 и 120:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)
select title, description, release_year, rental_duration * rental_rate as total_rental_cost from film
where LENGTH(description) >100 
AND LENGTH(description) < 120;

# 6a. Выбрать только следующие столбцы из таблицы film, где description начинается на "A Thoughtful":
# Title, Description, Release Year
select title, description, release_year from film 
where description LIKE 'A Thoughtful%';

# 6b. Выбрать только следующие столбцы из таблицы film, где description заканчивается на слово "Boat".
# Title, Description, Rental Duration
select title, description, rental_duration from film 
where description LIKE '%Boat';

# 6c. Выбрать только следующие столбцы из таблицы film, где description содержит слово "Database" и длина фильма больше 3-х часов.
# Title, Length, Description, Rental Rate
select title, length, description, rental_rate from film
where description LIKE '%Database%' 
AND length > 180;

# 7a. Выбрать все столбцы из таблицы film и упорядочить строки относительно столбца length по возрастанию.
select * from film 
order by length;

# 7b. Выбрать различные (уникальные) рейтинги из таблицы film, отсортированный по столбцу rating по убыванию.
select DISTINCT rating from film
order by rating DESC;

# 7c. Выбрать столбцы payment_date, amount из таблицы payment (первые 20 строк) отсортированные по столбцу amount по убыванию.
select payment_date, amount from payment
order by amount DESC
LIMIT 20;

# 8a. Выбрать столбцы customer first_name/last_name и actor first_name/last_name используя /left join/ 
select a.first_name, a.last_name from customer a
LEFT JOIN actor b
ON a.first_name = b.first_name;

select a.first_name, a.last_name from customer a
LEFT JOIN actor b
ON a.last_name = b.last_name;

# между таблицами customer и actor (ON имена и фамилии соответсвенных таблиц) 
select a. *  from customer a;
select b. * from actor b;
select a.first_name, a.last_name from customer a
JOIN actor b
ON (a.first_name = b.first_name 
AND a.last_name, b.last_name); /*sootvetsvuyushix stranits net, znachit !!*/

# Переименуйте столбцы customer first_name/last_name как customer_first_name/customer_last_name
ALTER TABLE customer 
CHANGE first_name customer_first_name varchar(20),
CHANGE last_name customer_last_name varchar(20);  
select * from customer;
  
# Переименуйте столбцы actor first_name/last_name в том же стиле как сверху   
ALTER TABLE actor 
CHANGE first_name actor_first_name varchar(20),
CHANGE last_name actor_last_name varchar(20);  
select*from actor;

# Должно быть 599 строк
select * from actor
LIMIT 599;

# 8b. Выполните тоже самое что и в 8а, только используйте /right join/ и посмотрите на разницу
# Должно быть 200 строк
select a.first_name, a.last_name from customer a
RIGHT JOIN actor b
ON a.first_name = b.first_name
LIMIT 200;

select a.first_name, a.last_name from customer a
RIGHT JOIN actor b
ON a.last_name = b.last_name
LIMIT 200;

# 8c. Выбрать те же столбцы что и в 8а, только используйте /inner join/ через фамилию (без имени)
# Должно быть 43 строки
select a.first_name, a.last_name from customer a
INNER JOIN actor b
ON a.last_name = b.last_name
LIMIT 43;

# 8d. Выбрать столбцы city, country из таблицы city, используя left join с таблицей country.
# Должно быть 600 строк
select a.city, a.country_id from city a
LEFT JOIN country b
ON a.country_id = b.country_id
LIMIT 600; 

# 8e. Выбрать столбцы title, description, release_year, и language_name из таблицы film, используя left join с таблицей language.
# Должно быть 1000 строк
SELECT a.title, a.description, a.release_year, b.name FROM film a
LEFT JOIN language b
ON a.language_id = b.language_id
LIMIT 1000;

# 8f. Выбрать столбцы first_name, last_name, address, address2, city name, district, и postal code из таблицы staff, используя 2 left join с таблицей address, а потом также с таблицей city.
# Должно быть 2 строки
select a.first_name, a.last_name, b.address, b.address2, c.city, b.district, b.postal_code from staff a
INNER join address b
ON a.address_id = b.address_id
INNER JOIN city c
ON b.city_id = c.city_id;




















