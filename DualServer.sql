<<<<<<< HEAD
=======
create database DualServer;
show tables;

create table reg(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));
select * from reg;
create table assistantServer(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));
insert into assistantServer value ("manjeet","manjeet123","manjeetrajput5555@gmail.com","09082000","male","9891226378","UP","india");

create table testServer(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));

insert into testServer value ("test","test123","test@gmail.com","01012000","male","9876543211","UP","india");

drop table reg;
select * from assistantServer;
select * from testServer;
delete from testServer where name="rohit";

SET SQL_SAFE_UPDATES = 0;

drop table cloudData;
create table cloudData(dataID INT primary key,dataKey TEXT,dataInfo TEXT,
privateKey TEXT,receiverName varchar(100),status varchar(50),testServerApproval int);
select * from cloudData;
create table reg(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20),status varchar(20),role varchar(10));

delete from cloudData where dataId=2 or dataId=4;

insert into cloudData(dataID,dataKey,privateKey,receiverName,dataInfo,status) value(143,"Mank","pKEy","Varsha","This is My Info","Approval Pending");

create table allfile(fileId INT auto_increment primary key,owner varchar(50),receiver varchar(50),filestatus varchar(100));
drop table allfile;
select * from allfile;
update allfile set filestatus='Approved' where fileId=1;
drop table testServerRequest;
create table testServerRequest(dataID int primary key ,publicKey TEXT,receiverName varchar(50),
status varchar(50),constraint dataID foreign key(dataID) references cloudData(dataID));
>>>>>>> 778187b2324ef8dde086cba36ecdb9c2e95fca36
