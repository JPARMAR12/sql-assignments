create database hr;
use hr;


create table emp_data(
Emp_id int,
Hire_date date,
Resignation_date date);

insert into emp_data (Emp_id,Hire_date,Resignation_date) values (1,'2000-01-01','2013-10-07');
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (2,'2003-12-04','2017-08-03');
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (3,'2012-09-22','2015-06-21');
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (4,'2015-04-13',NULL);
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (5,'2016-06-03',NULL);
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (6,'2017-08-08',NULL);
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (7,'2016-11-13',NULL);

select * from emp_data;

#1
select Emp_id,datediff(Resignation_Date,Hire_date)/365 as years,(datediff(Resignation_Date,hire_date)%365/30) as months,
datediff(Resignation_Date,Hire_date) as days
from emp_data;


#2
select date_format(hire_date,"%m/%d/%Y") as hire_date,
case
	when resignation_date is null then "DEC 01, 1900"
    when resignation_date is not null then date_format(resignation_date,"%M %d,%Y")
end as resignation_date    
from emp_data;


#3
select Emp_ID,concat(coalesce(datediff(Resignation_Date,hire_date)/365,0),' ','years(s)',
abs(coalesce(datediff(Resignation_Date,hire_date)%365/30,0)),' ','months(s)') as Experience
from Emp_Data;

#4
select day("2023-07-31") + day("2023-08-31") + day("2023-09-30") as count_days;




