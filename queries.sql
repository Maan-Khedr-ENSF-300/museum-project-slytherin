QUERY 2
USE museumFp;
SELECT * FROM ARTIST;

QUERY 3
USE museumFp;
SELECT * FROM ARTIST ORDER BY artistName;

QUERY 4
USE museumFp;
SELECT * FROM ARTIST WHERE artistName in (select artistName from SCULPTURE);

QUERY 5
USE museumFp;
SELECT ART_OBJECT.artistName, id, ARTIST.country
From(( ARTIST JOIN ART_OBJECT ON ART_OBJECT.artistName= ARTIST.artistName))
ORDER BY id;