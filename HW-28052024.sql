-- Создать базу данных homeworks 
create database homeworks;


use homeworks;

-- В этой базе создать таблицу staff с полями:
-- • id – integer - уникальное значение, не пустое, с автозаполнением 
-- • firstname - varchar - не пустое
-- • lastname - varchar - не пустое
-- • position - varchar
-- • age - integer - от 0 до 110(вкл.)
-- • has_child – char только один символ, по умолчанию 'N' 
-- • username - varchar - уникальный
create table staff(
	id int unique auto_increment not null,
    firstname varchar(64) not null,
    lastname varchar(128) not null,
    position varchar(64),
    age int check(age between 0 and 110),
    has_child char(1) default 'N',
    username varchar(64) unique
);

-- Добавить 5 строк.
insert into staff (firstname, lastname, position, age, has_child, username)
values 
('John', 'Doe', 'Manager', 35, 'Y', 'jdoe'),
('Jane', 'Smith', 'Developer', 28, 'N', 'jsmith'),
('Emily', 'Johnson', 'Designer', 42, 'Y', 'ejohnson'),
('Michael', 'Brown', 'Analyst', 30, 'N', 'mbrown'),
('Jessica', 'Davis', 'Consultant', 50, 'Y', 'jdavis');

-- Удалить таблицу staff
drop table staff;

-- Удалить бд homeworks
drop database homeworks;

-- Создать бд tasks и в этой базе создать таблицу Staff используя скрипт: https://github.com/annykh/genTech/blob/main/staff.txt
create database tasks;
use tasks;

CREATE TABLE Staff (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    position VARCHAR(128),
    age INTEGER,
    has_child CHAR(1),
    username VARCHAR(128) unique
  );

INSERT INTO Staff(firstname, lastname, position, age, has_child, username)
VALUES 
('Anna'      , 'Daniels'    , 'Senior Teacher'           , 22 , 'N' , 'annakhach5' ),
('Tom'       , 'Austin'     , 'Junior Blogger'           , 25 , 'Y' , 'tom12345' ),
('Bill'      , 'Lorentz'    , 'Junior Web Developer'     , 40 , 'Y' , 'billt1' ),
('Lily'      , 'May'        , 'Junior Backend Developer' , 25 , 'Y' , 'lil12' ),
('Nona'      , 'Lucky'      , 'Junior Teacher'           , 20 , 'N' , 'LuckyNona' ),
('Nancy'     , 'Greenberg'  , 'Middle UI Designer'       , 32 , 'Y' , 'nancy1' ),
('Daniel'    , 'Faviet'     , 'Senior UX Designer'       , 43 , 'Y' , 'favietD' ),
('Ally'      , 'Austin'     , 'Junior UI Designer'       , 28 , 'N' , 'ally1' ),
('Lily'      , 'Chen'       , 'Senior Teacher'           , 25 , 'Y' , 'lilychen' ),
('Anna'      , 'Austin'     , 'Middle Teacher'           , 34 , 'Y' , 'anna28' ),
('Alexander' , 'Lorentz'    , 'Junior Backend Developer' , 25 , 'N' , 'alex12345' ),
('Ashley'    , 'Lorentz'    , 'Junior UX Designer'       , 18 , 'N' , 'lorentz99' ),
('Tom'       , 'Lucky'      , 'Middle Blogger'           , 34 , 'Y' , 'lucky78' ),
('Ashley'    , 'Weiss'      , 'Junior Blogger'           , 18 , 'N' , 'weiss11' ),
('Tom'       , 'Weiss'      , 'Junior UI Designer'       , 18 , 'N' , 'tom222' ),
('Anna'      , 'Bloom'      , 'Middle UX Designer'       , 20 , 'N' , 'bloom5' ),
('Tom'       , 'Berg'       , 'Middle Teacher'           , 34 , 'N' , 'tommy1' ),
('Ashley'    , 'Berg'       , 'Senior Teacher'           , 37 , 'N' , 'ash89' ),
('Lily'      , 'Weiss'      , 'Middle Blogger'           , 45 , 'N' , 'lilyW1' ),
('Anna'      , 'Lorentz'    , 'Senior UX Designer'       , 31 , 'N' , 'annlo1' ),
('Ashley'    , 'Weiss'      , 'Middle UX Designer'       , 18 , 'N' , 'weiss1' ),
('Anna'      , 'Keren'      , 'Junior UX Designer'       , 34 , 'N' , 'annaK1' );

-- Из таблицы вывести работников, которым больше 20 и меньше 40.
select * from staff where age > 20 and age < 40;

-- Вывести только уникальные имена сотрудников. 
select distinct firstname from staff;

-- Вывести имена, фамилии и возраст тех сотрудников, у которых id либо 3, либо 7, либо 10.
select firstname, lastname, age from staff where id in (3,7,10); 

-- Вывести сотрудников у которых имя начинается на букву 'A',  а фамилия заканчивается на букву 'S'.
select * from staff where firstname like 'A%' and lastname like '%S';
