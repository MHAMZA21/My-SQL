create database sql_joins;
show databases;
use sql_joins;

create table cricket (cricket_id int auto_increment,
name varchar(30), primary key(cricket_id));


create table football (football_id int auto_increment,
name varchar(30), primary key(football_id));

insert into cricket (name)
values ('straut'),('micheal'),('johnson'),('hayden'),('fleming');

select * from cricket;

insert into football (name)
values ('straut'),('langer'),('johnson'),('hayden'),('astlw');

select * from football;

## suppose you want to find players who are part of football and cricket team
##INNER JOIN

select * from cricket as c inner join
football as f on c.name = f.name;

select c.cricket_id, c.name, f.football_id, f.name
from cricket as c inner join football as f on c.name = f.name;

##         NEW DATABASE
create database classicmodels;
use classicmodels;

create table cricket (cricket_id int auto_increment,
name varchar(30), primary key(cricket_id));
insert into cricket (name)
values ('straut'),('micheal'),('johnson'),('hayden'),('fleming');

select * from cricket;

create table football (football_id int auto_increment,
name varchar(30), primary key(football_id));

insert into football (name)
values ('straut'),('langer'),('johnson'),('hayden'),('astlw');

select * from football;

 
create table customers (cust_id int, purchased_at datetime, item varchar(30));
insert into customers values(101, '2018-10-05','Bed'),
(102, '2018-10-07', 'Computer'),
(101, '2018-10-02', 'Phone'),
(103, '2018-10-05', 'Books'),
(102, '2018-10-05', 'Tablet');

select * from customers;

create table email (name varchar(25), email varchar(20));
insert into email values ('Ammy', 'ammy.97@gmail.com'),
('Mack', 'mack_10@yahoo.in'), ('Jim', 'jim7@hotmail.com'), ('Sam', 'sam_1@gmail.com'),
('Mark', 'mark_90@hotmail.com');

select * from email;

create table employee (name varchar(20), age int, salary float);
insert into employee values('Angela', 36, 70000), ('Mike', 30, 80000), 
('Danny', 28, 60000), ('Angela', 36, 70000), ('Karin', 35, 65000), ('Mike', 30, 80000); 

select * from employees;

create table weather (date_id int, date_val date, temperature float);
###drop table weather;
insert into weather values (1, '2020-03-10', 32), (2, '2020-03-11', 31),
(3, '2020-03-12', 30.8), (4, '2020-03-13', 31.5), (5, '2020-03-14', 33), (5, '2020-03-15', 32.7);

select * from weather;

create table author (author_name varchar(30), book_name varchar(50));
insert into author values('author1', 'book1'), ('author1', 'book2'), ('author2', 'book3'),
('author2', 'book4'), ('author2', 'book5'), ('author3', 'book6'), ('author3', 'book7'), ('author3', 'book8');


select * from author;

create table books (book_name varchar(50), copies_sold int); 
insert into books values('book1', 10000), ('book2', 12500), ('book3', 3000), ('book4', 1200),
('book5', 5000), ('book6', 6500), ('book7', 2000), ('book8', 1500);


select * from books;

create table players (player_id int, name varchar(20), country varchar(20), goals int);
 insert into players (player_id, name, country, goals)
 values (101, 'Sam', 'USA', 6),
 (103, 'Daniel', 'England', 7),
 (104, 'Anthony', 'France', 10),
 (102, 'Bruno', 'Sweden', 6),
 (105, 'Alex', 'Wales', 5),
 (106, 'Matt', 'Scotland', 3);


select * from players;
show tables;


## not run because no dataset provide but for practice I write the query, this query has three table which are linked

select o.ordernumber, o.status, p.productname,
sum(quantityordered * priceeach) as revenue
from orders as o
inner join orderdetails as od on
o.ordernumber = od.ordernumber inner join
products as p on p.productcode = od.productcode
group by ordernumber;

## SYNTAX FOR LEFT JOIN IN SQL
## SELECT FIELD LIST FROM TABLE A
##LEFT JOIN TABLE B
##ON A.key  = B.key;

select * from customers;
select * from orders;

## LEFT JOIN
select c.customernumber, c.customername,ordernumber,status
from customers as c left join orders as o
on c.customernumber = o.customernumber;

## so if you find which order number is null values than write condition

select c.customernumber, c.customername,ordernumber,status
from customers as c left join orders as o
on c.customernumber = o.customernumber
where ordernumber is null;

select * from customers;
select * from employee;

# so based on these two table we find customer name ,phone number of the customer and the email address of the employee and join both the tables and join both the table
## that has customers and employees

select c.customername, c.phone, e.employeenumber, e.email
from customer as c right join employees as e
on e.employeenumber = c.salesemployeenumber
order by employeenumber;

## what is sub query
## A sub query is select query that enclosed inside another query
## the inner sub query is usually used to determine the result of outer sub query

## OUTER QUERY select dept from eomloyee
## INNER QUERY where salary = (select max (salary) from employees);


select * from employees;
## Write a query to display department with maximum salary from employee table
select dept from employees
where salary = (select max(salary)from employees);

select City from employees
where City = (select max(City) from employees);

select Gender from employees where
Gender = (select max(Gender) from employees);

## Find the name of the employee with maximum salary in the employee table
select Emp_name from employees 
where salary = (select max(salary) from employees);

select * from employees;

## Types of subqueries 
## select, update, insert, delete
## SQL subquery are majorly used with select statements 

## SYNTAX
## select column_name
## from where table
## column_name OPERATOR
## (select column_name
## from table[where])

## we want to select all the employees who have salary < than average salary for all the employees

select Emp_name,dept, salary from employees
where salary < (select avg(salary)from employees);


## subquery with insert statements
## the insert statements uses the data returned from the sub query to insert into another table
## SYNTAX
## insert into table_name
##select * from table
## where value operator
## (Inner query)



## CREATE NEW TALBE PRODUCTS
create table products
(prod_id int, item varchar(30),sell_price float, product_type varchar(30));
show tables;
insert into products
values(101,'Jewellery',1800,'Luxury'),
(102,'T-shirts',100,'Non-luxury'),
(103,'Laptop',1300,'Luxury'),
(104,'Table',400,'Non-luxury');

select * from products;

create table orders
(order_id int, product_sold varchar(30), selling_price float);

insert into orders
select prod_id,item,sell_price
from products where prod_id in 
(select prod_id from products where sell_price>1000);

select * from orders;

## subqueries with update statements
## the subquery can be used in conjuction with update statements
### either singal or multiple columns in the table can be updated when using a subquery with the UPDATE statement

## SYNTAX
## UPDATE table SET column_name = new_value where OPERATOR value (select column_name from table_name)where
## UPDATE EMPLOYEES SET SALARY = SALARY *0.35
## WHERE AGE IN (SELECT AGE FROM EMPLOYEES_B WHERE  AGE>=27);

##Update subquery
create table employees_b (Emp_Id int primary key, Emp_name varchar(25),
Age int, Gender char(1), Doj date, Dept varchar(25), City varchar(25), Salary float);

describe employees;

insert into employees_b values("101","hamza","22","M","1999-02-01","CS","Karachi","1100000"),
("102","junaid","23","M","1992-02-01","CS","Karachi","133000"),
("103","ayesha","24","F","1963-06-03","Marketing","Lahore","10200"),
("104","salma","25","F","1979-09-06","EE","Islamabad","30230"),
("105","shehneel","26","M","1989-05-01","BBA","Pindi","10003"),
("106","sohail","27","M","1977-03-01","BA","Hyderabad","124300");

select * from employees_b;

##Update subquery

update employees
set salary = salary * 0.35
where age in (select age from employees_b where age >=21);

select * from employees;


##use subqueries with delete statements
## the subqueries can be used in conjuction with the delete statement
## SYNTAX
## DELETE FROM
## TABLE NAME WHERE
## OPERATOR VALUE 
## (INNER QUERY)

delete from employees
where age in (select age from employees_b where age <=25);

select age from employees_b where age <=25;


## TRIGGER IN DBMS
## What are triggers in sql?
## A trigger is user defined SQL command that is invoked automatically in response to an event such as insert, delete, update

##SYNTAX
##Create trigger
## trigger_name trigger time
## trigger event 
## on table name for each row
## begin
## ....
## End

## Trigger Time --------> Before, After
## Trigeer_event -------> Insert, Update, Delete