show databases
create database if not exists mysql_project
use mysql_project

DROP TABLE m_details

create table if not exists m_details(
RowNumber int,
CustomerId int,
Surname varchar(30),
CreditScore int,
Geography varchar(30),
Gender varchar(30),
Age int,
Tenure int,
Balance int,
NumOfProducts int,
HasCrCard int,
IsActiveMember int,
EstimatedSalary int,
Exited int)

select * from  m_details

insert into m_details values(1,15634602,"Hargrave",619,"France","Female",42,2,0,1,1,1,101348.88,1)

LOAD DATA INFILE  
'C:/MYSQLPROJECT.csv'
into table m_details
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

select surname,creditscore,balance from m_details LIMIT 10

select * from m_details where age < 60

select * from m_details where age > 60

select * from m_details where age = 60

select surname,customerid,creditScore,balance,Estimatedsalary from m_details order by customerid

select * from m_details remove duplicate ROWS

 DESC m_details ;
 


 