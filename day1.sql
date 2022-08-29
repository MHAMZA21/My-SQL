show databases;
use sql_intro;
show tables;
select * from c_products;
select * from emp_details;
select * from employees;
select * from sales;

select * from city;	
describe city;
create database sql_intro;
create table emp_details (Name varchar(30), Age int, sex char(1), doj date, city varchar(15), salary float);

## avg,count etc are aggregate functions

use sql_intro;
show tables;
select * from emp_details;	

describe emp_details;
insert into emp_details
values("hamza",35,"M","2005-03-04","Karachi","100000"),
("Shane", 30, "M", "1999-06-25", "Seattle", 55000),
("Marry", 28, "F", "2009-03-10", "Boston", 62000),
("Dwayne", 37, "M", "2011-07-12", "Austin", 57000),
("Sara", 32, "F", "2017-10-27", "New York", 72000),
("Ammy", 35, "F", "2014-12-20", "Seattle", 80000);

select * from emp_details;

select distinct city from emp_details;

select count(Name) from emp_details;
select sum(salary) from emp_details;
select sum(salary) as count_total from emp_details;

select avg(salary) from emp_details;
select name,age,city from emp_details;

select * from emp_details where age>30;
select name,city,age from emp_details where sex = "M";

select * from emp_details where city = "karachi" or city = "austin";
#both queries has same results#
select * from emp_details where 
doj between '2000-04-02' and '2010-04-06';

select * from emp_details where 
age>30 and sex = 'F';

#grouby statement help us like if you find average salary of customers in each department, groupby statement is often used with aggregate function such as sum,count,avg
#based on gender we find avg salary of customers
select sex, sum(salary) as total_salary from emp_details group by sex;

#order set provide keyword order by to sort in asc or desc order 

select * from emp_details order by salary desc;	

select (10+55) as addition;

select length('India') as total_len;

select upper('Pakistan');

#current data and time

select now();


#STRING FUNCTION IN MYSQL

select character_length('Pak');

select city, character_length(city) as total_len from emp_details;

select city,doj,salary, concat(city, " ", 	doj, " ", salary) as concati from emp_details;

# GROUPBY AND HAVING 

# SYNTAX 
# select column name 
# from table_name
# where condition
# group by column name
# order by column name

show tables;

create table employees (Emp_Id int primary key, Emp_name varchar(25),
Age int, Gender char(1), Doj date, Dept varchar(25), City varchar(25), Salary float);

describe employees;

insert into employees values("101","hamza","22","M","1999-02-01","CS","Karachi","1100000"),
("102","junaid","23","M","1992-02-01","CS","Karachi","133000"),
("103","ayesha","24","F","1963-06-03","Marketing","Lahore","10200"),
("104","salma","25","F","1979-09-06","EE","Islamabad","30230"),
("105","shehneel","26","M","1989-05-01","BBA","Pindi","10003"),
("106","sohail","27","M","1977-03-01","BA","Hyderabad","124300");

UPDATE employees
SET Dept = "BA" where Emp_id = 105;

select * from employees;

select distinct City from employees;
##total no of dept

select distinct City from employees;

select avg(age) from employees;

##average age in each dept
select age,Emp_name, round(avg(age),1) as avgerage_age from employees group by age;

select Dept, avg(salary) as Average_Salary from employees group by Emp_name; 

##you can also use order by clause along with group by clause let see if you want to find total number of employees 
## in each city and group it in order of employee id

select City, count(Emp_id) from employees group by City order by count(Emp_id) desc;

##suppose we want to find no of employees that join the company each year you can use year function on date of joining column
## then we can count the emp ids and group the result by each year.

select Emp_id as Employees_id, year(Doj) as year, count(Emp_id) as count
from employees
group by Doj;  
 
## NEW SALES TABLE
create table sales (Product_id int, sell_price float, quantity int, state varchar(20));

insert into sales values
(121,320.0,3,'California'),
(121,320.0,6,'Alaska'),
(121,320.0,4,'Texas'),
(123,290.0,2,'Texas'),
(123,290.00,7,'California'),
(121,320.0,2,'Ohio'),
(121,320.0,7,'Arizone'),
(123,290.00,8,'Colorado'); 


select * from sales;
## suppose you want to find revenue of both ids 
select Product_id, sum(Product_id * quantity) as Revenue from sales group by Product_id;

##profit made from both products 121 and 123
## NEW TABLE COST PRICE OF PRODUCTS

create table c_products (product_id int, cost_price float);
insert into c_products
values(121, 270.0),
(123, 250.0);


select * from c_products;
select * from sales;
## join sales and product cost table
select c.Product_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit from sales as s inner join c_products as c
where c.Product_id = s.product_id
group by product_id;

## HAVING CLAUSE IN SQL
## SYNTAX
## select column name
## from table
## where condition
## group by column name
## having condition
## order by column_name

## the having clause in SQL operated on grouped records and return records where 
## rows where aggregate function results matched with given condition only

## Where and having condition are similiar but where condition not performed on aggregate functions
##find cities where more than 2 employees

select City,count(Emp_id) as employees_id from employees
group by city 
having count(Emp_id) > 2;

## select all dept where sal > 75k
select * from employees;
select Dept,avg(Salary) as avg_salary
from employees group by Dept having avg(Salary)>75000;

## you want to find cities where total salary is > 200000k
select sum(salary) as total_salary, city as cities from employees group by city having sum(salary)>200000;

## find dept who has more than 2 employees
select Dept,count(*) as employee_count
from employees
group by Dept
having count(*) >2;

## suppose I want cities that have more than two employees apart from lahore
select count(*), City as cities 
from employees 
where City !='Lahore'
group by City
having count(*) > 2;

## If I want to find total number of employees for each dept that have average salary > 75k
select * from employees;
select dept, avg(salary) as average_salary, count(Emp_id) as employee_id
from employees
where salary > 75000
group by Dept; 

select dept,count(*) as employee_id
from employees
group by Dept 
having avg(salary) > 75000; 

select dept as department, avg(salary) as average_salary, count(Emp_id) as employees_id
from employees
where dept!= 'CS'
 
group by dept;


