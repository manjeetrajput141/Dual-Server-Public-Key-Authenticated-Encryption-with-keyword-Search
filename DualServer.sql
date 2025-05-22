create database DualServer;
show tables;

create table reg(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));
select * from reg;
create table assistantServer(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));
insert into assistantServer value ("manjeet","manjeet123","manjeetrajput5555@gmail.com","09082000","male","9891226378","UP","india");
drop table reg;
select * from assistantServer;
drop table cloudData;
create table cloudData(dataID INT auto_increment primary key,dataKey varchar(500),dataInfo varchar(900),privateKey TEXT);
select * from cloudData;
create table reg(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20),status varchar(20),role varchar(10));

delete from cloudData where dataId=2 or dataId=4;


insert into cloudData(dataKey,dataInfo,privateKey) value("Mank","This is My Info","Varsha");
