create database homeworks;
use homeworks;
-- Создать таблицу employees ;
-- employeeid целое число первичный ключ автоинкремент;
-- fname строка не null,
-- lastname строка не null,
-- email строка не null,
-- phone строка не null
create table employees(
	id int primary key auto_increment,
    fname varchar(128) not null,
    lastname varchar(128) not null,
    email varchar(64) not null,
    phone varchar(64) not null
);
-- Ой, забыли про зарплату)) Добавить поле salary numeric(9, 2)
alter table employees
add column salary numeric(9,2);
-- Ойййй, нет, зарплата должна быть целым числом. Изменить тип salary на integer 
alter table employees
change column salary salary int;
-- Переименовать поле fname на first_name
alter table employees
change fname first_name varchar(128);
-- Удалить поле phone
alter table employees
drop column phone;
-- Добавить поле department строка не null 
alter table employees
add column department varchar(128) not null;
-- Заполнить таблицу (7 строк)
insert into employees (first_name, lastname, email, salary, department)
values
	('John'   , 'Doe'     , 'john.doe@example.com'      , 50000, 'Engineering'),
	('Jane'   , 'Smith'   , 'jane.smith@example.com'    , 60000, 'Marketing'),
	('Emily'  , 'Johnson' , 'emily.johnson@example.com' , 55000, 'Sales'),
	('Michael', 'Brown'   , 'michael.brown@example.com' , 70000, 'Finance'),
	('Sarah'  , 'Davis'   , 'sarah.davis@example.com'   , 65000, 'HR'),
	('David'  , 'Wilson'  , 'david.wilson@example.com'  , 62000, 'IT'),
	('Laura'  , 'Martinez', 'laura.martinez@example.com', 68000, 'Operations');