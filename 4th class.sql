create database sales
use sales

CREATE TABLE sales (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	'year' DECIMAL(38, 0) NOT NULL
);	
set session sql_mode = ''

LOAD DATA INFILE  
'C:/sales_data_final.csv'
into table sales
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

select * from sales;

select str_to_date(order_date,'%m/%d/%Y') from sales 

alter table sales
add column order_date_new date after order_date

update sales
set order_date_new = str_to_date(order_date,'%m/%d/%Y')

alter table sales
add column ship_date_new date after ship_date

update sales
set ship_date_new = str_to_date(ship_date,'%m/%d/%Y')

select * from sales where ship_date_new = '2011-01-05'
select * from sales where ship_date_new > '2011-01-05'
select * from sales where ship_date_new < '2011-01-05'

select * from sales where ship_date_new between '2011-01-05' and '2011-08-30'

select now()
select curdate()
select curtime()

select * from sales where ship_date_new < date_sub(now() , interval 1 week )

select date_sub(now() , interval 1 week )

select date_sub(now() , interval 3 day)

select date_sub(now() , interval 30 day)

select date_sub(now() , interval 30 year)

select year(now())

select dayname(now())

select dayname('2022-07-20 21:10:30')

select dayname('2022-09-20 21:10:30')

alter table sales 
add column flag date after order_id

update sales 
set flag = now()

alter table sales
modify column year datetime;

alter table sales
add column Year_New int;

alter table sales
add column Month_New int;

alter table sales
add column Day_New int;


update sales set Month_new= month(order_date_new)
update sales set day_new= day(order_date_new);
update sales set year_new= year(order_date_new);

select year_new  , avg(sales) from sales group by year_new

select year_new  , sum(sales) from sales group by year_new

select year_new  , min(sales) from sales group by year_new
select year_new  , max(sales) from sales group by year_new

select year_new , sum(quantity) from sales group by year_new





select month(order_date_new) from sales

select year_new , avg(sales) from sales group by year_new

select (sales*discount+shipping_cost) as ctc from sales 

select order_id , discount , if(discount > 0 , 'yes' , 'no') as discount_flag from sales

alter table sales 
add column discount_flag varchar(20) after discount

update sales
set discount_flag = if(discount > 0, 'yes', 'no');

select discount_flag , count(*) from sales group by discount_flag 

select count(*) from  sales where discount > 0.050


set sql_safe_updates = 0;

select * from sales limit 5