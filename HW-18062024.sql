-- 1. В таблице employees создать новое поле salary_with_comm numeric(10, 3) и заполнить формулой: salary + salary * 15 / 100.

set sql_safe_updates=0;
select * from employees;

alter table employees
add salary_with_comm numeric(10, 3);

update employees
set salary_with_comm = salary + salary * 15 / 100;

-- 2. Вывести из таблицы employees поля first_name и last_name как full_name, salary и salary_with_comm(округлить в большую сторону).

select concat(first_name, " ", last_name) as full_name, salary, ceiling(salary_with_comm)
from employees;

-- 3. В таблице employees создать новое поле chk_email типа varchar(128).

alter table employees
add chk_email varchar(128);

-- 4. Заполнить поле chk_email.
--    Если длина email меньше 25, значением chk_email будет 'Введите больше символов',
--    если длина email больше/равно 25 и меньше 30,  значением chk_email будет 'Кол/во символов совпадает',
--    если длина email больше/равно 30,  значением chk_email будет 'Введите меньше символов'.

update employees
set chk_email = case
		    when length(email) < 25 then 'Введите больше символов'
                    when length(email) between 25 and 30 then 'Кол/во символов совпадает'
                    else 'Введите меньше символов'
		end;

-- 5. Из таблицы countries получить список стран с указанием количества символов в их названиях.

select country_name, length(country_name) 
from countries;

-- 6. Из таблицы countries получить список стран и их первые три символа в названии

select country_name, left(country_name, 3) 
from countries;

-- 7. Из таблицы employees получить список сотрудников с заменой в email слово "sqltutorial" на "Confidential".

select concat(first_name, " ", last_name) as full_name, replace(email, 'sqltutorial', 'Confidential')
from employees;

-- 8. Из таблицы employees получить список сотрудников и последние четыре символа phone_number.

select concat(first_name, " ", last_name) as full_name, right(phone_number, 4) as last_4_digits_of_phone
from employees;




-- End of file!  :)
