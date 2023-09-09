show databases;
create database Restaurant;
use Restaurant;
create table Menu(
id int auto_increment primary key,
name varchar(20),
price int
);
create table Members(
id int auto_increment primary key,
first_name varchar(30),
last_name varchar(30),
gender enum('m','f'),
phone_number varchar(11)
);
create table orders(
id int auto_increment primary key,
Menu_id int,
Members_id int,
order_time datetime
);
show tables;
use Restaurant;
select * from Menu;
insert into Menu( name, price)
values('Pizza', 6.67$);
alter table food_items
add column food_origin varchar(30);
show tables;
select*from food_items;
alter table food_items
drop column food_origin;
select*from food_items;
create database example;
use example;
create table test(
id int auto_increment primary key,
name varchar(30),
age int
);
drop table test;
show tables;
select*from test;
truncate table test;
select*from test;

CREATE DATABASE tesy;

USE tesy; 

CREATE TABLE addresses (

	id INT,
    house_number INT,
	city VARCHAR(20),
    postcode VARCHAR(7)
);

CREATE TABLE people (

	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
); 

CREATE TABLE pets (

	id INT,
    name VARCHAR(20),
    species VARCHAR(20), 
    owner_id INT
); 

SHOW TABLES;
describe addresses;
describe people;
alter table addresses
add primary key(id);
alter table people
add primary key(id);
alter table people
add constraint fk_peopleadresses
foreign key(address_id) references addresses(id);
select * from pets;
alter table pets
add constraint u_species unique(species);
alter table pets
drop index u_species;
select * from pets;
alter table pets change `species` `_breeds_` varchar(20);
 describe addresses;
 alter table addresses modify postcode int;
 describe addresses;
 alter table addresses modify postcode varchar(30);
alter table pets
add primary key(id);
alter table pets
add constraint fk_petspeople
foreign key (owner_id) references people(id);
select*from people;
alter table people
drop column surname;

alter table people
add column surname varchar(20);
select *from people;
alter table people
add constraint u_first_name unique (first_name);

alter table pets change `name` `first_name` varchar(20);
alter table addresses modify postcode char(7);


select *from food_items;
set sql_safe_updates=0;
update food_items
set price=65,name='latte'
where id=7;
update food_items
set food_origin='anakapalli'
where food_origin='america';


select *from members
where gender='m' and phone_number= null;
use cafe;
select *from food_items
where price between 100 and 200;
select*from food_items
where name like '%i%';
select name,price from food_items
where food_origin in ( 'anakapalli', 'india')
order by name ;
select*from food_items
limit 2 offset 4;


select*from orders;
update orders
set members_id =null
where id=1;



use cafe;
select *from orders;
select f.food_origin,f.price, o.order_time from food_items f
join orders o on o.food_items_id = f.id
where o.food_items_id=1
order by o.order_time;

select o.id,m.phone_number,m.last_name,o.order_time from orders o
right join members m on m.id=o.members_id
order by order_time
limit 4;