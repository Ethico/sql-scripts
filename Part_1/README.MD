## Project Name
Basic sql queries : part 1

## Motivation
Understanding of "Beginning sql queries" book  & execute the script on my sql workbench.

## SQL queries

``` sql
drop schema testschema;
create schema testschema;

create table testschema.member(
	memberid int primary key,
	lastname char(20),
	firstname char(20),
	phone char(20),
	handicap INT,
	joindate DATETIME,
	gender CHAR(1),
	membertype CHAR(20) references type(type));

create table testschema.type(
	type char(20) primary key,
	Fee Int);
    

insert into testschema.type values('Senior',1000);
insert into testschema.type values('Junior',500);
insert into testschema.type values('Social',100);


insert into testschema.member values (1,'Padwal','Hrushikesh','957937353',30,'1999-04-22','M','Senior');

insert into testschema.member(MemberID,LastName,membertype) values(2,'Rahane','Social');


select * from testschema.member;

select firstname,lastname from testschema.member where membertype='Senior';

```