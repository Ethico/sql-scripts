## Project Name
Basic sql queries : part 2

## Pre-requsite
Execute part_1.sql script for creating schema , tables as well as populating data.

## Motivation
Understanding of "Beginning sql queries" book  & execute the script on sql workbench.

## SQL queries

``` sql
# Retrieve All the Men from the Member Table
select * from testschema.member where gender='M';

# Use of alias
select m.firstname,m.lastname from testschema.member m;

# Retrieve Handicaps of Junior Members
select firstname,lastname,handicap from testschema.member where membertype='Junior';

# Creating a View So You Can Use the Same Query Many Times
create view testschema.phonelist as
select m.firstname,m.lastname,m.phone from testschema.member m;

# Adding some more data to table
insert into testschema.member(memberid,firstname,lastname) values(222,'sarang','padwal');

# view becomes virtual table
# we can query the view
select * from testschema.phonelist;

# Case sensativity 
select * from testschema.member where upper(membertype)='SENIOR';

# Logical operators
# And operator
select * from testschema.member where upper(membertype)='SENIOR' and handicap >12;

# Select members where membertype is null
select * from testschema.member where membertype is null;

# information of members who have a handicap
select * from testschema.member where handicap is not null;

# Removing duplicates
select distinct membertype from testschema.member ;

# Ordering output
select * from testschema.member order by lastname;

# Simple count
select count(*) from testschema.member;
select count(*) from testschema.member where membertype='Senior';

# not null value for handicap
select count(handicap) from testschema.member;

 # number of different values of handicap
select count(distinct handicap) from testschema.member;

```