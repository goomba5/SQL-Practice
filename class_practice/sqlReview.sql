-- CRUD Review Script

-- select statement
SELECT * FROM movie;

SELECT * FROM actor;

-- insert statement
INSERT INTO movie (title, rating, year, director)
VALUES('Spiderman: Into the SpiderVerse', 'PG', 2018, 'Phil Miller');

SELECT * FROM movie
WHERE year = 2018;

-- update statement
UPDATE movie
SET director = 'Peter Ramsey'
WHERE id = 5;

SELECT * FROM movie
WHERE id = 5;

-- HOOOORAYYYYYYYYY
