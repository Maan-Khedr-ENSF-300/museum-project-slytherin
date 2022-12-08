-- QUERY 2
USE museumFp;
SELECT * FROM ARTIST;

-- QUERY 3
USE museumFp;
SELECT * FROM ARTIST ORDER BY artistName;

-- QUERY 4
USE museumFp;
SELECT * FROM ARTIST WHERE artistName in (select artistName from SCULPTURE);

-- QUERY 5
USE museumFp;
SELECT ART_OBJECT.artistName, id, ARTIST.country
From(( ARTIST JOIN ART_OBJECT ON ART_OBJECT.artistName= ARTIST.artistName))
ORDER BY id;

-- QUERY 6
USE museumFp;
drop trigger if exists birth;
create trigger birth
before update on ARTIST
for each row
set new.dob = if(new.dob < '2010', new.dob, old.dob);
update ARTIST;
set dob = '2000' where artistName = 'Affabel Partidge';

-- QUERY 7
use museumFp;
  delimiter $$	
drop TRIGGER if exists before_delete_rent ;
CREATE TRIGGER before_delete_rent  
BEFORE DELETE  
ON borrowed FOR EACH ROW  
begin
    INSERT INTO borrowed (id,collectionName, dateBorrowed, dateReturned,rent)  
    VALUES(OLD.id,OLD.collectionName, OLD.dateBorrowed, OLD.dateReturned,OLD.rent);  
end$$	
delimiter ;		
	DELETE FROM borrowed WHERE rent = '590';
    SELECT * FROM borrowed;  