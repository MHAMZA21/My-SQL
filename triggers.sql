create database triggers;
use triggers;
show tables;

create table customers
(cust_id int, age int, name varchar(30));

#delimeter is marker of each command

delimiter //
create trigger age_verify
before insert on customers 
for each row 
if new.age < 0 then set new.age = 0;
end if; // 

insert into customers
value(101,27,'James'),
(102,-40,'Ammy'),
(103,32,'Ben'),
(104,-39,'Angela');

select * from customers;

## After insert trigger;

create table customers1(
id int auto_increment primary key,
name varchar(40) not null,
email varchar(30),birthday date);

create table message (
id int auto_increment,
messageId int,
message varchar(300)not null,
primary key (id,messageId));

delimeter //
create trigger
check_null_dob
after insert 
on customers1
for each row
begin
if new.birthdate is NULL then 
insert into message (messageId, message)
values (new.id, concat('Hi', new.name,' ,please update your date of birth'));
end if;
end //
delimiter ;

insert into customers1 (name, email, birthdate)
values('nancy','nancy@gmail.com',NULL),
('Ronald','ronald@gmail.com','1998-11-16'),
('chris','chris@gmail.com','1997-08-20'),
('Alice','alice@gmail.com',NULL);

select * from message;

## before update trigger works

create table employees
(emp_id int primary key,
emp_name varchar(25),age int, salary float);

insert into employees values
(101,'Jimmy',35,70000),
(102,'Shane',30,55000),
(103,'Marry',28,62000),
(104,'Dwayne',37,57000),
(105,'Sara',32,72000),
(106,'Ammy',35,80000),
(107,'Jack',40,100000);

select * from employees;

delimiter //
create trigger upd_trigger
before update 
on employees
for each row
begin
if new.salary = 10000 then
set new.salary = 85000;
elseif new.salary < 10000 then 
set new.salary = 72000;
end if;
end //
delimiter ;

update employees
set salary = 8000;

select * from employees;

##now we explore how before delete command works
## before delete

create table salaries(
eid int primary key,
validfrom date not null,
amount float not null);

insert into salaries(eid,validfrom,amount)
values(101,'2005-05-01',55000),
(102,'2007-08-01',68000),
(103,'2006-09-01',75000);


select * from salaries; 

delimiter $$
create trigger del_salary
before delete
on salaries
for each row
begin
insert into del_salary(eid,validfrom,amount)
values(old.eid,old.validfrom,old.amount);

end$$
delimiter ;

delete from salaries
where eid = 103;

