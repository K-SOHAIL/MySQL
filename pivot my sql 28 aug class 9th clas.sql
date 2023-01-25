CREATE DATABASE PIVOTE

USE PIVOTE

create table order_table(
orederid int ,
employeeid int ,
vendorid int )

insert into order_table values (1, 258, 1580),
(2, 259, 1581),
(3, 260, 1583),
(4, 261, 1584),
(5, 262, 1585),
(6, 263, 1586)


select * from order_table;

select vendorid,
if(employeeid = 258,1,null) as emp258 ,
if(employeeid = 259,1,null) as emp259 ,
if(employeeid = 260,1,null) as emp260 ,
if(employeeid = 261,1,null) as emp261 ,
if(employeeid = 262,1,null) as emp262 ,
if(employeeid = 263,1,null) as emp263  from
order_table ;

