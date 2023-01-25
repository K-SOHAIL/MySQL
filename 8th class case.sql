use ineuron_partition

SELECT * FROM ineuron_partition.ineuron_course;

select * ,
case 
	when course_name = 'fsda' then sysdate()
    when course_name = 'fsds' then system_user()
    else "this is not your batch"
end as statement 
from ineuron_course

select * ,
case 
	when length(course_name) = 4  then "len 4"
    when length(course_name)= 2  then "len 2"
    else "other lenght"
end as statement 
from ineuron_course


update ineuron_course set course_name = case 
when course_name = 'RL' then 'reinforcement learing'
when course_name = 'dl' then 'deep learning'
end 

select * from ineuron_course