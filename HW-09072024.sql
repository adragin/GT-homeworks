--  Выведите имена всех продавцов. Предусмотрите также в выборке имена их боссов, сформировав атрибут bossname.
--  В выборке должно присутствовать два атрибута — sname, bossname. 

select s1.SNAME as SNAME, s2.SNAME as BOSSNAME
from sellers as s1 
left join sellers as s2 
on s1.boss_id = s2.sell_id;

-- Выведите имена покупателей, которые совершили покупку на сумму больше 1000 условных единиц.
-- В выборке должно присутствовать два атрибута — cname, amt.

select c.CNAME as CNAME, o.AMT as AMT
from customers as c
join orders as o
on c.CUST_ID = o.CUST_ID
where o.AMT > 1000;

-- Выведите имена покупателей, которые сделали заказ.
-- Предусмотрите в выборке также имена продавцов.
-- Примечание: покупатели и продавцы должны быть из разных городов.
-- В выборке должно присутствовать два атрибута — cname, sname.

select c.CNAME as CNAME, s.SNAME as SNAME
from customers as c
join orders as o
on c.CUST_ID = o.CUST_ID
join sellers as s
on o.SELL_ID = s.SELL_ID;

-- Выведите пары покупателей и обслуживших их продавцов из одного города.
-- Вывести: sname, cname, city

select c.CNAME as CNAME, s.SNAME as SNAME
from customers as c
join orders as o
on c.CUST_ID = o.CUST_ID
join sellers as s
on o.SELL_ID = s.SELL_ID
where c.CITY = s.CITY;