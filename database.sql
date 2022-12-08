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

INSERT INTO ARTIST(artistName, DoB, DofDeath, country, epoch, style, descr)
VALUES
('Benedetto da Rovezzano','1474','1567','Italy','Renaissance','SCULPTUREures and Statues', ' was an Italian architect and SCULPTUREor who worked mainly in Florence'),
('Francis Albert','1509','1567','England', 'Renaissance', 'Merchant of SCULPTUREures', ' licensed by Henry to import luxury goods, including armor, into England for sale. '),
('Jacob Halder','1557','1609','Germany','Renaissance', 'German Armourer', ' He succeeded John Kelte as Master Workman in 1576'),
('Hieronymus Bosch','1450','1516','Netherlands', 'Renaissance', 'Dutch Painting', ' A truly unique figure in Dutch painting '),
('Joris Hoefnagel','1542','1601','Austria', 'Post-Renaissance', 'Natural History Subjects', ' He is noted for his illustrations of natural history subjects '),
('Pablo Picasso','October 25, 1881','April 8, 1973', 'Spain', 'Modern', 'Abstract', 'One of the most influential artists of the 20th century'),
('Affabel Partidge','1540','1610', 'England', 'Modern', 'Goldsmith', ' He worked at the sign of the Black Bull in Cheapside.'),
('Robert Pruitt','1975',null, 'American', 'Modern', 'Realistic', 'Known for his figurative drawings'),
('Alphonso Davies','1754','1810', 'England', 'Modern', 'Abstract', ' evidence of at least two different sandglasses, each telling a different story.'),
('Georges Braque','1882','1963', 'France', 'Modern', 'Collagist Painter', ' His most notable contributions were in his alliance with fauvism '),
('Woody de Othello','1991',null, 'American', 'Modern', 'Abstract', 'American ceramicist and painter'),
('Juan Gris','1887','1927', 'Spain', 'Renaissance', 'Artistic Genre Painter', ' Closely connected to the innovative artistic genre Cubism, his works are among the movements most distinctive.'),
('Kylian Mbappe',null, null, null, null,'Realistic','Random Value as the artist cannot be identified'),
('Jean Liotard','December 22, 1702', 'June 12, 1789', 'Switzerland', 'Modern','Renaissance',' He is best known for his portraits in pastel, and for the works from his stay in Turkey. '),
('Goncalo Ramos',null, null, 'Portugal', 'Modern','Modern',' Random value as the artist is not found '),
('Collin Rhoades','1826', '1869', 'America', 'Renaissance','Renaissance',' Random Value as description is not found '),
('Antoine-Louis Barye','1826', '1869', 'America', 'Renaissance','Renaissance',' Random Value as description is not found ');




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
INSERT INTO ART_OBJECT (id, artistName, year_, title, descr, country, epoch)
VALUES
('0001','Benedetto da Rovezzano','1554','Angel Bearing Candlestick', ' SCULPTUREure of a person holding a candlestick', 'Italy', 'Renaissance'),
('0002','Francis Albert','1547','Field Armor of King Henry VIII of England',' it was probably worn by the king during his last military campaign ', 'England', 'Renaissance'),
('0003','Jacob Halder','1608','Armor Garniture of George Clifford',' A favorite of Queen Elizabeth','England', 'Renaissance'),
('0004','Hieronymus Bosch','1510','The christ Child passing the Wine', 'The christ Child passing the Wine', 'Netherlands', 'Renaissance'),
('0005','Joris Hoefnagel','1575','Nosuch Palace from the south', 'Nosuch Palace from the south ', 'Austria', 'Renaissance'),
('0006','Pablo Picasso','1914','The Absinthe Glass','Picasso''s life-size rendering of a glass of alcohol was shocking for its banality.', 'Spanish', 'Modern'),
('0007','Affabel Partidge','1579','Tankard','No description', 'England', 'Renaissance'),
('0008','Alphonso Davies','1781','Sandglass', ' A sandglass, more commonly referred to as an hour glass, was an important tool used in 18th-century sailing, the era of the Betsy, a ship scuttled in the York River by the British at Yorktown in 1781.', 'England', 'Post-Renaissance'),
('0009','Georges Braque','1923','Fruit Dish and Glass', ' According to Braque, this was his first papier collé, created in September 1912 ', 'France', 'Modern'),
('0010','Robert Pruitt','2019','Birth and Rebirth and Rebirth', 'Painting of woman', 'American', 'Modern'),
('0011','Juan Gris','1910','Still Life: The Table', ' A book lies open to a verifiable page, but the hefty volume is pure illusion.', 'Spain', 'Modern'),
('0012','Kylian Mbappe','1735','Desert Plate', ' The trompe l’oeil motif of a print attached to wood planking by nails or sealing wax became so popular that during the second half of the eighteenth century many factories imitated it on tableware.', 'France', 'Modern'),
('0013','Woody de Othello','2021','Applying Pressure', 'Vase on Table', 'American', 'Modern'),
('0014','Jean Liotard','1747','Trompe I’Oeil', ' Significantly, the imagery of the reliefs is derived from paintings ', 'Switzerland', 'Renaissance'),
('0015','Goncalo Ramos','1747','Villi(Kongo)', 'Description is not available', 'Portugal', 'Modern'),
('0016','Collin Rhoades','1849','Merchant Jug', 'No description available', 'America', 'Renaissance'),
('0017','Antoine-Louis Barye','1832','Lion au serpent', 'Lion with a snake', 'France', 'Modern');




DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING (
	id				 	  int	not null,
	paint					varchar(20),
	materialUsed			varchar(20),
	style					varchar(20),
    
	primary key (id),
	foreign key (id) REFERENCES ART_OBJECT(id)
	
);
INSERT INTO PAINTING (id, paint, materialUsed, style)
VALUES
('0001','water','watercolor','modern'),
('0002','Oil','wood','modern'),
('0003','silicate','Canvas','modern'),
('0004','Oil','Oil on paper','Abstract'),
('0005','enamel','oil on canvas','Realistic'),
('0006','latex','wood','Abstract'),
('0007','Leaf Gliding','wood','Realistic');





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
INSERT INTO SCULPTURE (id, material, height, weight, style)
VALUES
('0008','Bronze','34cm','11kg','Realistic'),
('0009','wood','390cm','62kg', 'modern'),
('0010','silver','225cm','345','Abstract'),
('0011','copper','4.5cm',null, 'Realistic'),
('0012','stone','128.8cm','34.5kg', 'Abstract');


DROP TABLE IF EXISTS OTHER_ART;
CREATE TABLE OTHER_ART (
    
	id				int not null,
	arttype			varchar(30),
	style			varchar(20),			
	
	primary key (id),
	foreign key (id) REFERENCES ART_OBJECT(id)
	
);
INSERT INTO OTHER_ART (id, arttype, style)
VALUES
('0013','Sketch','Realistic'),
('0014','Text', 'Written'),
('0015','Wallpaper', 'modern'),
('0016','Textile', 'modern'),
('0017',null, 'Realistic');






DROP TABLE IF EXISTS EXHIBITIONS;
CREATE TABLE EXHIBITIONS (
    id				 		int not null,
	exhibition				varchar(100),
	startDate				varchar(30)not null,	
	endDate				varchar(30)not null,
	
	primary key (exhibition, id),
	foreign key (id) REFERENCES ART_OBJECT(id)
	
);

INSERT INTO EXHIBITIONS (id, exhibition, startDate, endDate)
VALUES
('0001','The Tudors: Art and Majesty in Renaissance England', '2021-04-11', '2022-05-11'),
('0002','The Tudors: Art and Majesty in Renaissance England','2021-14-11', '2022-05-11'),
('0003','The Tudors: Art and Majesty in Renaissance England','2021-14-11', '2022-05-11'),
('0004','The Tudors: Art and Majesty in Renaissance England','2021-14-11', '2022-05-11'),
('0005','The Tudors: Art and Majesty in Renaissance England','2021-14-11', '2022-05-11'),
('0006','The Tudors: Art and Majesty in Renaissance England','2021-14-11', '2022-05-11'),

('0007',"Cubism and the Trompe l'Oeil Tradition", '2021-01-20', '2022-01-20'),
('0008',"Cubism and the Trompe l'Oeil Tradition", '2021-01-20', '2022-01-20'),

('0011','Hear Me Now: The Black Potters of Old Edgefield, South Carolina', '2021-07-09', '2022-02-09'),
('0012','Hear Me Now: The Black Potters of Old Edgefield, South Carolina', '2021-07-09', '2022-02-09'),
('0013','Hear Me Now: The Black Potters of Old Edgefield, South Carolina', '2021-07-09', '2022-02-09'),
('0014','Hear Me Now: The Black Potters of Old Edgefield, South Carolina', '2021-07-09', '2022-02-09');



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
INSERT INTO COLLECTIONS(collectionName, collectionType, descr, address, contactNumber, contactPerson)
VALUES
('United States','nation','Random', null,null,null),
('India','nation','Random', null,null,null),
('Egypt','nation','Random', null,null,null);



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
INSERT INTO PERMANENT_COLLECTIONS (id, collectionName, dateAcquired, status_, cost)
VALUES
('0001','Angel Bearing Candlestick', '1997-09-24',' Display','$100'),
('0002','Field Armor of King Henry VIII of England', '2003','Display',null),
('0003','Armor Garniture of George Clifford', '2002-04-03',' Display','$80'),
('0004','The christ Child passing the Wine', '1945','Display','$233'),
('0005','Nosuch Palace from the south','2007',' Display',null),
('0006','The Absinthe Glass', '2002','Display','$2000'),
('0007','	Tankard,', '2001','Display','$34'),
('0008','Sandglass', '1995','Display','$200'),
('0009','Fruit Dish and Glass', '2020','Display',null),
('0010','Birth and Rebirth and Rebirth', '1996','Display','$234'),
('0011','Still Life: The Table', '2014','Display',null),
('0012','Desert Plate', '2014','Display',null),
('0013','Applying Pressure', '2021','Display',null),
('0014','Trompe I’Oeil', '1986','Display','$2344');



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
INSERT INTO BORROWED (id, collectionName, dateBorrowed, dateReturned, rent )
VALUES
('0015','United States','1899','2000','500'),
('0016','India', 1951,'1970','50000'),
('0017','Egypt', 1911,'2001','590');


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