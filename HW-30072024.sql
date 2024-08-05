-- 1. Вывести максимальный и минимальный credit_limit.customers
select min(CREDIT_LIMIT), max(CREDIT_LIMIT) 
from customers;

-- 2. Вывести покупателей у которых credit_limit выше среднего credit_limit.
select concat(CUST_FIRST_NAME, ' ', CUST_LAST_NAME) as FULL_NAME
from customers
where CREDIT_LIMIT > (select avg(CREDIT_LIMIT) from customers);

-- 3. Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.
select count(customer_id)
from customers
where CUST_FIRST_NAME like 'D%';

-- 4. Найти среднее значение unit_price
select avg(UNIT_PRICE)
from order_items;

-- 5. Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.
select pi.PRODUCT_NAME, oi.QUANTITY
from order_items as oi
join product_information as pi
on oi.PRODUCT_ID = pi.PRODUCT_ID
where oi.QUANTITY < (select avg(QUANTITY) from order_items);

-- 6. Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).
select c.CUST_FIRST_NAME, c.CUST_LAST_NAME, o.ORDER_TOTAL
from customers as c 
join orders as o
on c.CUSTOMER_ID = o.CUSTOMER_ID
where o.ORDER_TOTAL = (select max(ORDER_TOTAL) from orders); 

-- 7. Найти сумму общей суммы покупок(ORDER_TOTAL) всех мужчин покупателей.
select sum(o.ORDER_TOTAL)
from customers as c 
join orders as o
on c.CUSTOMER_ID = o.CUSTOMER_ID
where c.GENDER = 'M';
