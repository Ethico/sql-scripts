## Project Name
Basic sql queries : part 3

## Motivation
Understanding  joins 

## SQL queries

DDL statements for creating schema and tables.

Visual table structure : 
> Member -> Entry <- Tour

``` sql
create schema if not exists club ;
create table if not exists club.member(
	memberid int primary key,
	firstname char(20),
	lastname  char(20)
);
create table if not exists club.entry(
	memberid int references member(memberid),
	tourid int references tour(tourid),
	year  int 
);
create table if not exists club.tour(
	tourid int primary key,
	tourname char(20),
	tourtype char(10)
);
```
DML statements : Inserting records into tables.

``` sql
insert into club.member values(1,'hrushi','padwal');
insert into club.member values(2,'sarang','padwal');
insert into club.member values(3,'abhi','padwal');
insert into club.member values(4,'anu','padwal');
insert into club.member values(5,'prayag','padwal');
insert into club.member values(6,'rahi','padwal');

insert into club.tour values(11,'pune','social');
insert into club.tour values(22,'mumbai','open');
insert into club.tour values(33,'nagar','social');

insert into club.entry values(1,11,2005);
insert into club.entry values(2,33,2006);
insert into club.entry values(3,22,2006);
insert into club.entry values(4,22,2006);
insert into club.entry values(5,11,2006);
insert into club.entry values(6,11,2005);

```


Cartesian product (no rows in table 1 * no rows in table 2)
``` sql
select * from club.member cross join club.entry;
```
Another alternative for above query

``` sql
select * from club.member , club.entry;
```

## Questions
What are the names of people who entered an Open tournament in 2006?
``` sql
select m.firstname, m.lastname from club.member m where m.memberid 
in (select e.memberid from club.entry e 
 inner join club.tour t 
 on e.tourid = t.tourid 
 and t.tourtype='Open' 
 and e.year = 2006);
```

Alternative for above query : joining 3 tables
``` sql
select m.firstname , m.lastname from club.member 
m inner join ( club.entry e inner join club.tour t on e.tourid=t.tourid ) 
on m.memberid=e.memberid and t.tourtype='Open' and e.year =2006;  
```

Another alternative : similar to join only differ in syntax
``` sql
select m.LastName, m.FirstName
from club.member m, club.entry e, club.tour t
where m.MemberID = e.MemberID
and e.TourID = t.TourID
and t.TourType = 'Open' and e.Year = 2006;
```
