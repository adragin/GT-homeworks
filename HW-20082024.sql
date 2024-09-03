-- 1. Определить какие из покупок были совершены в июне
select *
from orders
where month(odate) = 6;

-- 2. Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года
select *
from orders
where ( (month(odate) = 4 AND day(odate) >= 10)
	OR (month(odate) = 5 AND day(odate) <= 10) 
);

-- 3. Определить сколько покупок было совершено в марте
select count(*)
from orders
where MONTH(odate) = 3;

-- 4. Определить среднюю стоимость покупок в марте
select avg(amt)
from orders
where MONTH(odate) = 3;

-- 5. Выведите минимальный рейтинг(rating) покупателя среди сделавших заказ в апреле 2022 года. 
select min(rating)
from customers as c 
join (select *
	from orders
	where month(odate) = 4) as o4
on c.CUST_ID = o4.CUST_ID;

-- 6. Выведите продавцов, которые оформили заказ на наибольшую сумму в период с 1 марта по 1 май 2022 года.
--    Вывести : sell_id, amt
select s.SELL_ID, s.SNAME, o.AMT
from sellers as s
join orders as o
on s.SELL_ID = o.SELL_ID
where o.AMT = (select max(o.amt)
		from sellers as s
		join orders as o
		on s.SELL_ID = o.SELL_ID
		where month(o.odate) in (3,4) );
