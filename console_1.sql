SELECT * FROM artist;


SELECT first_name, last_name, email FROM customer;


SELECT album.title AS album_title, artist.name AS artist_name
FROM album
JOIN artist ON album.artist_id = artist.artist_id;

SELECT * FROM track LIMIT 5;


SELECT * FROM genre;
