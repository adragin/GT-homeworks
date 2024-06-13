create database tasks;

use tasks;

 create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department)
values
("Steven"       ,   "King"    , "SKING"     , 24000 , "Sales"),
("Neena"        , "Kochhar"   , "NKOCHHAR"  , 17000 , "Sales"),
("Lex"          , "De Haan"   , "LDEHAAN"   , 17000 , "Sales"),
("Alexander"    , "Hunold"    , "AHUNOLD"   , 9000  , "Finance"),
("Bruce"        , "Ernst"     , "BERNST"    , 6000  , "Finance"),
("Valli"        , "Pataballa" , "VPATABAL"  , 4800  , "Finance"),
("Diana"        , "Lorentz"   , "DIANALO"   , 8800  , "Finance"),
("Nancy"        , "Greenberg" , "NGREENBE"  , 12008 , "Shipping"),
("Daniel"       , "Faviet"    , "DFAVIET"   , 9000  , "Shipping"),
("Jose Manuel"  , "Urman"     , "JMURMAN"   , 7800  , "Shipping"),
("Luis"         , "Popp"      , "LPOPP"     , 6900  , "Shipping"),
("Den"          , "Raphaely"  , "DRAPHEAL"  , 11000 , "Marketing"),
("Alexander"    , "Khoo"      , "AKHOO"     , 3100  , "Marketing"),
("Shelli"       , "Baida"     , "SBAIDA"    , 2900  , "Marketing"),
("Sigal"        , "Tobias"    , "STOBIAS"   , 2800  , "Marketing"),
("Matthew"      , "Weiss"     , "MWEISS"    , 8000  , "Human Resources"),
("Adam"         , "Fripp"     , "AFRIPP"    , 8200  , "Human Resources"),
("Payam"        , "Kaufling"  , "PKAUFLIN"  , 7900  , "Human Resources"),
("Shanta"       , "Vollman"   , "SVOLLMAN"  , 6500  , "Human Resources"),
("Kevin"        , "Mourgos"   , "KMOURGOS"  , 5800  , "Human Resources"),
("Julia"        , "Nayer"     , "JNAYER"    , 3200  , "Human Resources"),
("Adam"         , "Markle"    , "SMARKLE"   , 2200  , "Human Resources"),
("Laura"        , "Bissot"    , "LBISSOT"   , 3300  , "Human Resources"),
("Mozhe"        , "Atkinson"  , "MATKINSO"  , 2800  , "Human Resources"),
("Joshua"       , "Pat 	el"   , "JPATEL"    , 2500  , "Human Resources"),
("Trenna"       , "Rajs"      , "TRAJS"     , 3500  , "Human Resources"),
("John"         , "Russell"   , "JRUSSEL"   , 14000 , "IT"),
("Karen"        , "Partners"  , "KPARTNER"  , 13500 , "IT"),
("Alberto"      , "Errazuriz" , "AERRAZUR"  , 12000 , "IT"),
("Gerald"       , "Cambrault" , "GCAMBRAU"  , 11000 , "IT"),
("Eleni"        , "Zlotkey"   , "EZLOTKEY"  , 10500 , "IT"),
("Adam"         , "Vargas"    , "PVARGAS"   , 2500  , "Human Resources"),
("Laura"        , "Errazuriz" , "AERRAZUR"  , 12000 , "IT");

-- 1. Повысить зарплаты для отдела sales на 20%,  для finance 15%, для shipping 10%, для marketing 25%, для Human Resources 20% и для IT 35%.
--    Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 

select * , case 
	        when department like 'Sales' then salary + salary * 0.20
		when department like 'Finance' then salary + salary * 0.15
		when department like 'Shipping' then salary + salary * 0.10
		when department like 'Marketing' then salary + salary * 0.25
		when department like 'Human Resources' then salary + salary * 0.20
		when department like 'IT' then salary = salary + salary * 0.35
	   end as new_salary
from employees;

-- 2. Создать поле new_salary типа numeric(7, 2).
alter table employees
add new_salary numeric(7,2);

-- 3. Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для Human Resources 20% и для IT 35%
set sql_safe_updates=0;

update employees 
set new_salary = case 
			when department like 'Sales' then salary * 1.20
			when department like 'Finance' then salary * 1.15
			when department like 'Shipping' then salary * 1.10
			when department like 'Marketing' then salary * 1.25
			when department like 'Human Resources' then salary * 1.20
			when department like 'IT' then salary = salary * 1.35
		end;  
                 
-- 4. Вывести из таблицы employees firstname как name, lastname как surname и salary как total_salary.
select first_name as name, last_name as surname, salary as total_salary
from employees;

-- 5. Вывести новое поле commission (через AS), которое будет null, если зарплата сотрудника меньше 3000,
--    будет 10, если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.
select *, case 
		when salary < 3000 then null
		when salary < 6000 then 10
		when salary < 9000 then 15
		else 20
	  end as comission
from employees;

-- 6. Создать новое поле commission и соответственно заполнить.
alter table employees
add comission int;

update employees 
set comission = case 
		  when salary < 3000 then null
		  when salary < 6000 then 10
		  when salary < 9000 then 15
		  else 20
	        end;
                
-- 7. Создать поле finalsalary и заполнить формулой salary + salary * commission / 100. 
--    Проверить commission на null, так чтобы в случае неопределенности finalprice принимал значение salary.                 
alter table employees
add final_salary numeric(7,2);

update employees
set final_salary = case
			when comission is null then salary 
                        else salary + salary * comission / 100
		   end;
-- 8. Удалить из таблицы сотрудников, у которых commission меньше 15.
delete from employees 
where comission < 15 or comission is null;
