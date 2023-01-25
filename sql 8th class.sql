create database ineron_trigers
use ineron_trigers

create table course1(
course_id int ,
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date)

create table course_update(
course_metor_update varchar(50),
course_pric3e_update int ,
course_discount_update int )

delimiter //
create trigger course_before_insert
before insert
on course1 for each row
begin
   set new.create_date = sysdate();
end; //




insert into course1 (course_id,course_desc,course_mentor,course_price,course_discount)value(101,"FSDA","sudhanshu",4000,10)




create table course2(
course_id int ,
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date,
user_info varchar(50))

delimiter //
create trigger course_before_insert1
before insert
on course2 for each row
begin
	declare user_val varchar(50);
    set new.create_date = sysdate();
	select user() into user_val;
    set new.user_info = user_val;
end; //

insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount)value(101,"FSDA","sudhanshu",4000,10)

select * from course2
select sysdate()

delimiter //
create trigger course_before_insert12
before insert 
on course2 for each row
begin
	declare user_val varchar(50);
	set new.create_date = sysdate();
    select user() into  user_val;
    set new.user_info = user_val;
    
end; //


create table test1(
c1 varchar(50),
c2 date,
c3 int)


create table test2(
c1 varchar(50),
c2 date,
c3 int )


create table test3(
c1 varchar(50),
c2 date,
c3 int )

delimiter //
create trigger to_update_others
before insert on test1 for each row 
begin
	insert into  test2 values("xyz",sysdate(),23354);
	insert into  test3 values("xyz",sysdate(),23354);
end; //


insert into test1 values ("abc",sysdate(),234234)

select * from test1;
select * from test2;
select * from test3;


delimiter //
create trigger to_update_others_table 
after insert on test1 for each row 
begin
	update test2 set c1 = 'abc' where c1 = 'xyz';
	delete from test3 where c1 = 'xyz';
end; //

insert into test1 values ("krish",sysdate(),90077897)

delimiter //
create trigger to_delete_others_table 
after delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //

select * from test1
select * from test2
select * from test3

delete from test1 where c1 = 'sudhanshu'



delimiter //
create trigger to_delete_others_before
before delete on test1 for each row 
begin
	insert into test3 values("after delete" , sysdate(), 435456);
end; //


delimiter //
create trigger to_delete_others_before_observation2
before delete on test1 for each row 
begin
	insert into test2(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //



select * from test1
select * from test2

delete from test1 where c1 = 'abc'


create table test11(
c1 varchar(50),
c2 date,
c3 int)


create table test12(
c1 varchar(50),
c2 date,
c3 int )


create table test13(
c1 varchar(50),
c2 date,
c3 int )

delimiter //
create trigger to_delete_others_before_observation3
before delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //



insert into test11 values("sudh" , sysdate(), 435456);
select * from test11

delete from test11 where c1 = 'sudh'

select * from test12


delimiter //
create trigger to_delete_others_before_observation4
after delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

delete from test11 where c1 = 'sudhanshu'


delimiter //
create trigger to_upate_others
after update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

select * from test11;

insert into test11 values("sudh",sysdate(),234354)

update test11 set c1 = "after update" where c1 = "after delete"

set sql_safe_updates = 0 
select * from  test12;

delimiter //
create trigger to_upate_others_before
before update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(new.c1, new.c2,new.c3);
end; //

update test11 set c1 = "insert new" where c1 = "sudh"

1.create a table col = name , mail_id,phone_number , address , users_sys, time_sys,salary,incentive,final_salary
2.try to time all the time that uses name should start with s for each and every insert op
