-- 1. Посчитать количество рейсов по каждой модели самолета. Вывести model_name и flight_count.
select t1.model_name, count(t2.id) as flight_count
from airliners as t1
join trips as t2
on t1.id = t2.airliner_id
group by t1.model_name;

-- 2. Вычислить среднюю стоимость билета по классам обслуживания. Вывести service_class и average_price.
select t2.service_class, avg(t2.price) as average_price
from trips as t1
join tickets as t2
on t1.id = t2.trip_id
group by t2.service_class;

-- 3. Определить средний возраст клиентов, сгруппированных по классу обслуживания. Вывести service_class и average_age.
select t2.service_class, avg(t1.age) as average_age
from clients as t1
join tickets as t2
on t1.id = t2.client_id
group by t2.service_class;

-- 4. Получить общее количество билетов, купленных каждым клиентом. Вывести name и ticket_count.
select t1.name, count(t2.id) as ticket_count
from clients as t1
join tickets as t2
on t1.id = t2.client_id
group by t1.name;

-- 5. Определить количество рейсов, отправленных из каждого аэропорта. Вывести departure и departure_count.
select departure, count(departure) as departure_count
from trips
group by departure;

-- 6. Вычислить общий доход от продажи билетов для каждой страны производителя самолетов. Вывести country и total_sum.
select t1.country, sum(t3.price) as total_sum
from airliners as t1
join trips as t2
on t1.id = t2.airliner_id
join tickets as t3
on t2.id = t3.trip_id
group by t1.country;