CREATE DATABASE iNeuron_SQL_Project


USE iNeuron_SQL_Project

--TASK 1--

CREATE TABLE SHOPPING_HISTORY (
  PRODUCT VARCHAR (45) NOT NULL,
  QUANTITY INT NOT NULL,
  UNIT_PRICE INT NOT NULL
);


INSERT INTO SHOPPING_HISTORY VALUES
('T SHIRT',48,65);
INSERT INTO SHOPPING_HISTORY VALUES
('SHIRT',24,95),
('JEANS',12,455),
('T SHIRT',9,75),
('JACKET',3,550),
('UNDERWEAR',24,255);
 
SELECT * FROM SHOPPING_HISTORY;

INSERT INTO SHOPPING_HISTORY VALUES
('JEANS',24,580),
('JACKET',12,265),
('JEANS',36,780);

SELECT product, SUM(QUANTITY * UNIT_PRICE) as total_price FROM SHOPPING_HISTORY
group by product    
ORDER BY product desc;       


SELECT SUM(UNIT_PRICE) FROM  SHOPPING_HISTORY WHERE PRODUCT = 'SHIRT';

USE iNeuron_SQL_Project

CREATE TABLE PHONES (
    NAME VARCHAR(20) NOT NULL,
    PHONE_NUMBER INTEGER NOT NULL UNIQUE
);

INSERT INTO PHONES(NAME,PHONE_NUMBER) VALUES 
('Jack',1234),
('Lena',3333),
('Mark',9999),
('Anna',7582);

SELECT * FROM PHONES;


CREATE TABLE CALLS (
    ID INTEGER NOT NULL UNIQUE,
    CALLER INTEGER NOT NULL,
    CALLEE INTEGER NOT NULL,
    DURATION INTEGER NOT NULL
)

INSERT INTO CALLS (ID,CALLER,CALLEE,DURATION) VALUES
(25,1234,7582,8),
(7,9999,7582,1),
(18,9999,3333,4),
(2,7582,3333,3),
(3,3333,1234,1),
(21,3333,1234,1);

SELECT * FROM CALLS

with
cte as (
		select caller, sum(duration) as dur from calls group by 1
        union all 
        select callee, sum(duration) from calls group by 1
)
select phones.name as Name
from cte
	inner join phones on phones.phone_number = cte.caller
group by 1
having sum(cte.dur) >= 10;

CREATE TABLE PHONES_2 (
    NAME VARCHAR(20) NOT NULL,
    PHONE_NUMBER INTEGER NOT NULL UNIQUE
);

INSERT INTO PHONES_2(NAME,PHONE_NUMBER) VALUES
('John',6356),
('Addison',4315),
('Kate',8003),
('Ginny',9831);

select * from phones_2;

CREATE TABLE CALLS_2 (
    ID INTEGER NOT NULL UNIQUE,
    CALLER INTEGER NOT NULL,
    CALLEE INTEGER NOT NULL,
    DURATION INTEGER NOT NULL
)

INSERT INTO CALLS_2 (ID,CALLER,CALLEE,DURATION) VALUES
(65,8003,9831,7),
(100,9831,8003,3),
(145,4315,9831,18);

select * from calls_2;

with
cte_1 as (
		select caller, sum(duration) as dur from calls_2 group by 1
        union all 
        select callee, sum(duration) from calls_2 group by 1
)
select phones_2.name as Name
from cte_1
	inner join phones_2 on phones_2.phone_number = cte_1.caller
group by 1
having sum(cte_1.dur) >= 2;

-- Task-3.1
create or replace table transactions (
amount int not null,
'date' date not null);

insert into transactions values(1000,'2020-01-06'),
(-10,'2020-01-14'),
(-75,'2020-01-20'),
(-5,'2020-01-25'),
(-4,'2020-01-29'),
(2000,'2020-03-10'),
(-75,'2020-03-12'),
(-20,'2020-03-15'),
(40,'2020-03-15'),
(200,'2020-10-10'),
(-200,'2020-10-10'),
(-50,'2020-03-17');

select * from transactions;

select a.sum_amount - 5*(12-b.fee_excempted) balance from  
(select sum(amount) as sum_amount, 'a' name from  transactions) a  left join  
(select count(*) fee_excempted, 'a' name from
(select month(date)
from transactions
where amount <0 
group by month(date) 
having (count(amount) >=3 and sum(amount) <=-100))) as b 
on a.name = b.name;

-- Task- 3.2
create or replace table transactions1 (
amount int not null,
date date not null);

insert into transactions1 values(1,'2020-06-29'),
(35,'2020-02-20'),
(-50,'2020-02-03'),
(-1,'2020-02-26'),
(-200,'2020-08-01'),
(-44,'2020-02-07'),
(-5,'2020-02-25'),
(1,'2020-06-29'),
(1,'2020-06-29'),
(-100,'2020-12-29'),
(-100,'2020-12-30'),
(-100,'2020-12-31');

select * from transactions1;

select a.sum_amount - 5*(12-b.fee_excempted) balance from  
(select sum(amount) as sum_amount, 'a' name from  transactions1) a  left join  
(select count(*) fee_excempted, 'a' name from
(select month(date)
from transactions1
where amount <0 
group by month(date) 
having (count(amount) >=3 and sum(amount) <=-100))) as b 
on a.name = b.name;

-- Task- 3.3
create or replace table transactions2 (
amount int not null,
date date not null);

insert into transactions2 values(6000,'2020-04-03'),
(5000,'2020-04-02'),
(4000,'2020-04-01'),
(3000,'2020-03-01'),
(2000,'2020-02-01'),
(1000,'2020-01-01');

select * from transactions2;

select a.sum_amount - 5*(12-b.fee_excempted) balance from  
(select sum(amount) as sum_amount, 'a' name from  transactions2) a  left join  
(select count(*) fee_excempted, 'a' name from
(select month(date)
from transactions2
where amount <0 
group by month(date) 
having (count(amount) >=3 and sum(amount) <=-100))) as b 
on a.name = b.name;
