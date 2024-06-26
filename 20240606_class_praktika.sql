use gt200224;
-- Создайте таблицу с названием Employees, которая будет содержать информацию о сотрудниках компании. Таблица должна иметь следующие поля:

-- employee_id - уникальный идентификатор сотрудника (Primary Key) и автозаполнение
-- first_name - имя сотрудника (Not Null)
-- last_name - фамилия сотрудника (Not Null)
-- email - адрес электронной почты сотрудника (Unique, Not Null)
-- age - возраст сотрудника (в диапазоне от 20 до 50 (вкл.))

create table Employees_2(
	emplyee_id int primary key auto_increment,
    first_name varchar(128) not null,
    last_name varchar(128) not null,
    email varchar(128) unique not null,
    age int  check (age between 20 and 50)
);
-- 2. Заполните таблицу данными с помощью следующих записей:

-- Сотрудник с именем "John", фамилией "Doe", адресом электронной почты "john.doe@example.ge" и возрастом 39 лет.
-- Сотрудник с именем "Jane", фамилией "Smith", адресом электронной почты "jane.smith@example.com" и возрастом 25 лет.
-- Сотрудник с именем "Michael", фамилией "Johnson", адресом электронной почты "michael.johnson@example.am" и возрастом 22 года.
-- Сотрудник с именем "Emily", фамилией "Brown", адресом электронной почты "emily.brown@example.com" и возрастом 29 лет.

insert into Employees_2 (first_name, last_name, email, age) values
    ('John', 'Doe', 'john.doe@example.ge', 39),
    ('Jane', 'Smith', 'jane.smith@example.com', 25),
    ('Michael', 'Johnson', 'michael.johnson@example.am', 22),
    ('Emily', 'Brown', 'emily.brown@example.com', 29);


-- 3. Найти всех сотрудников в возрасте от 25 до 30 лет.
select *
from Employees_2
where age between 25 and 30; 

-- 4. Найти сотрудников с именами "John", "Jane" и "Michael".
select *
from Employees_2
where first_name in ("John", "Jane", "Michael");

-- 5. Найти всех сотрудников, у которых адрес электронной почты заканчивается на ".com".
select *
from Employees_2
where email like '%.com';

-- 6. Добавить столбец department_id для хранения идентификатора отдела, тип integer.
alter table Employees_2
add column department_id int; 


-- 7. Удалить столбец email, который больше не нужен.
alter table Employees_2
drop column email;

-- 8. Добавить столбец salary integer по умолчанию 0.
alter table Employees_2
add column salary int default 0;

 -- 9. Изменить тип данных столбца salary на DECIMAL(10,2), чтобы хранить зарплату с точностью до двух знаков после запятой.
 alter table Employees_2
change column salary salary decimal(10,2);
 
-- 10. Переименовать поле salary на fixed_salary.
alter table Employees_2
change column salary fixed_salary decimal(10,2);
