# Actual script executable
# drop schema
drop schema testschema;
# create schema  
create schema testschema;
# create table
create table testschema.member(
	memberid int primary key,
	lastname char(20),
	firstname char(20),
	phone char(20),
	handicap INT,
	joindate DATETIME,
	gender CHAR(1),
	membertype CHAR(20) references type(Type)
);
create table testschema.type(
	type char(20) primary key,
	Fee Int
);

# Insert into type table
insert into testschema.type values('Senior',1000);
insert into testschema.type values('Junior',500);
insert into testschema.type values('Social',100);

# Insert into Member table
INSERT INTO testschema.Member values (1,'Padwal','Hrushikesh','957937353',30,'1999-04-22','M','Senior');

# Insert data with only some attributes having some values
insert into testschema.member(MemberID,LastName,membertype) values(2,'Rahane','Social');

# Retrieve all data from Member table
Select * from testschema.member;

# Retrieve the Names of Senior Members from the Member Table
select firstname,lastname from testschema.member where
membertype='Senior';


