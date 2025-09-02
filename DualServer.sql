
create database DualServer;
show tables;

create table reg(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));
select * from reg;
create table assistantServer(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));
insert into assistantServer value ("manjeet","********","manjeetrajput5555@gmail.com","09082000","male","9891226378","UP","india");

create table testServer(name varchar(50), pass varchar(20), email varchar(30), dob varchar(50), gen varchar(50), phone varchar(20), state varchar(20), country VARCHAR(20));

insert into testServer value ("test","*******","test@gmail.com","01012000","male","9876543211","UP","india");

#Creating Cloud Server DB
CREATE TABLE `cloudserver` (
  `dataID` varchar(100) NOT NULL,
  `dataKey` text,
  `dataInfo` text,
  `privateKey` text,
  `receiverName` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `testServerApproval` int DEFAULT NULL,
  `ownerName` varchar(30) DEFAULT NULL,
  `randomUUID` text NOT NULL,
  PRIMARY KEY (`dataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
SELECT * FROM dualserver.cloudserver;

#Creating Assistantserverfile
CREATE TABLE `assistantserverfile` (
  `fileId` int NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `filestatus` varchar(100) DEFAULT NULL,
  `dataId` varchar(100) DEFAULT NULL,
  `randomUUID` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#creating testserverrequest

CREATE TABLE `testserverrequest` (
  `dataID` varchar(100) NOT NULL,
  `requestReceiver` varchar(50) DEFAULT NULL,
  `actualReceiver` varchar(50) DEFAULT NULL,
  `ownerName` varchar(30) DEFAULT NULL,
  `Request_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fileStatus` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dataID`)
);
#creating receiverdata
CREATE TABLE `receiverdata` (
  `RID` int NOT NULL AUTO_INCREMENT,
  `receiverName` varchar(50) DEFAULT NULL,
  `ownerName` varchar(50) DEFAULT NULL,
  `dataId` varchar(100) DEFAULT NULL,
  `downloadKey` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

