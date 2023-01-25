create database key_prim
use key_prim

create table ineuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert into ineuron values(01 , 'FSDA','active',100)
insert into ineuron values(02 , 'FSDs','not-actrive',100)
select * from ineuron

create table studets_ineuron(
student_id int ,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references ineuron(course_id))

insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',05)

insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01)
insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01)
insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01)

select * from studets_ineuron

create table payment(
course_name varchar(60),
course_id int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id))

insert into payment values ('fsda',01,'not-active','7th aug')
insert into payment values ('fsda',01,'not-active','7th aug')
insert into payment values ('fsda',01,'not-active','7th aug')

create table class(
course_id int ,
class_name varchar(60),
class_topic varchar(60),
class_duration int ,
primary key(course_id),
foreign key(course_id) references ineuron(course_id))