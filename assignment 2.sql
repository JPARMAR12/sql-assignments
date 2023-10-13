create database companydb;
use companydb;



CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

select * from departments;
select*from employees;

#1
select lastname from employees;

#2
select distinct(lastname) from employees;

#3
select * from employees where lastname="Smith";

#4
select * from employees where lastname="Smith"or lastname="Doe";

#5
select* from employees where department=14;

#6
select* from employees where department=37 or department=77;

#7
select * from employees where lastname like "S%";

#8
select sum(budget) from departments;


select*from departments;
select * from employees;

#9
select department,count(*)from employees
group by department;

#10
select * from employees join departments
on departments.code=employees.department;

#11
select employees.name,lastname,departments.name,budget from employees join departments
on employees.department=departments.code;

#12
select employees.name,lastname,budget from employees join departments 
on  employees.department=departments.code
where budget >60000;

#13
select * from departments where budget > (select avg(budget) from departments);


#14
select departments.name ,count(*)  from  employees join departments
on employees.department=departments.code
group by departments.name
having count(*) >2;

#15
select budget from departments
group by budget 
order by budget limit 1,1;

select employees.name,lastname from employees join departments
on employees.department=departments.code
where departments.budget = (select budget from departments order by budget limit 1,1);

#16
INSERT INTO Departments(Code,Name,Budget) VALUES(11,'Quality Assurance',40000);

select * from departments;

#16
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('847219811','Mary','Moore',11);
select* from employees;

#17
select budget - (budget*0.9) from departments;

#18
update employees set department =14 where department = 77;
select * from employees;

#19
delete from employees where department =14;
select * from employees;

#20
select * from departments where budget >= 60000;
select * from  departments;


select employees.name,budget from employees  join departments 
on employees.department=departments.code
where budget >= 60000;

select code from departments where budget >=60000;

delete name from employees where (select *from departments where budget>=60000);
