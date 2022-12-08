DROP DATABASE IF EXISTS museumFp;
CREATE DATABASE museumFp; 
USE museumFp;
DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST (
	artistName			varchar(50) not null,
	DoB				    varchar(20),
	DofDeath			varchar(20),	
	country			    varchar(15),
	epoch				varchar(20),
	style				varchar(45),
	descr				text,
	primary key (artistName)
	
);






DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT (
	id					int  not null,
	artistName			varchar(30),
	year_				varchar(10),
    title				varchar(100) not null,
	descr				text not null,
	epoch				varchar(30),
	country				varchar(30),
	
	primary key (id),
	foreign key (artistName) REFERENCES ARTIST(artistName)
);





DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING (
	id				 	  int	not null,
	paint					varchar(20),
	materialUsed			varchar(20),
	style					varchar(20),
    
	primary key (id),
	foreign key (id) REFERENCES ART_OBJECT(id)
	
);






DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE (

id				   int not null,
material				varchar(30),
height					varchar(30),
weight					varchar(30),
style					varchar(20),
  
primary key (id),
foreign key (id) REFERENCES ART_OBJECT(id)
	
 );



DROP TABLE IF EXISTS OTHER_ART;
CREATE TABLE OTHER_ART (
    
	id				int not null,
	arttype			varchar(30),
	style			varchar(20),			
	
	primary key (id),
	foreign key (id) REFERENCES ART_OBJECT(id)
	
);






DROP TABLE IF EXISTS EXHIBITIONS;
CREATE TABLE EXHIBITIONS (
    id				 		int not null,
	exhibition				varchar(100),
	startDate				varchar(30)not null,	
	endDate				varchar(30)not null,
	
	primary key (exhibition, id),
	foreign key (id) REFERENCES ART_OBJECT(id)
	
);





DROP TABLE IF EXISTS COLLECTIONS;
CREATE TABLE  COLLECTIONS(
	collectionName				varchar(100) not null,
	collectionType				varchar(30),
	descr						text,			
    address						text,
	contactNumber				integer,
	contactPerson				varchar(30),
	
	primary key (collectionName)
);



DROP TABLE IF EXISTS PERMANENT_COLLECTIONS;
CREATE TABLE PERMANENT_COLLECTIONS(
	id						int not null,
    collectionName			varchar(100) not null,
	dateAcquired			varchar(20) not null,
	status_					varchar(20) not null,			
    cost					varchar(10),
	primary key (id),
	foreign key(id) REFERENCES ART_OBJECT(id)
);



DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED (
	id						int not null,
	collectionName			varchar(100) not null,
	dateBorrowed			varchar(20),			
      dateReturned			Varchar(20),
      rent                    int,
	
	primary key (id, collectionName),
	foreign key(id) REFERENCES ART_OBJECT(id),
	foreign key(collectionName) REFERENCES COLLECTIONS(collectionName)

);


DROP ROLE IF EXISTS databaseAdmin@localhost, guestAccess@localhost, modifier@localhost;

CREATE ROLE databaseAdmin@localhost, guestAccess@localhost, modifier@localhost;
GRANT ALL PRIVILEGES ON museumFp.*TO databaseAdmin@localhost;
GRANT Select ON museumFp.* TO guestAccess@localhost;
GRANT Select ON	museumFp.* TO modifier@localhost;
GRANT Insert ON museumFp.*	TO modifier@localhost;
GRANT Update ON museumFp.*	TO modifier@localhost;


DROP USER IF EXISTS adminUser@localhost;
DROP USER IF EXISTS guestUser@localhost;
DROP USER IF EXISTS dataEntryUser@localhost;

CREATE USER adminUser@localhost IDENTIFIED  BY 'passcodeAdmin';
CREATE USER guestUser@localhost;
CREATE USER	dataEntryUser@localhost IDENTIFIED  BY 'passcodeModify';
GRANT databaseAdmin@localhost TO adminUser@localhost;
GRANT guestAccess@localhost to guestUser@localhost;
GRANT	modifier@localhost	TO	dataEntryUser@localhost;

SET DEFAULT ROLE ALL TO adminUser@localhost;
SET DEFAULT ROLE ALL TO guestUser@localhost;
SET DEFAULT ROLE ALL TO dataEntryUser@localhost;