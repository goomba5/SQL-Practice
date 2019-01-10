CREATE DATABASE music_db;
USE music_db;

DROP TABLE IF EXISTS Music;

CREATE TABLE Music (
	ID					INT							PRIMARY KEY AUTO_INCREMENT,
    Artist				VARCHAR(100)		NULL,
    Album				VARCHAR(50)		NULL,
    Song				VARCHAR(50)		NULL
);

INSERT INTO Music VALUES
(1, 'Flying Lotus', 'Los Angeles', 'Golden Diva'),
(2, 'Anderson .Paak', 'Malibu', 'Parking Lot'),
(3, 'The Roots', 'Things Fall Apart', 'Stay Cool'),
(4, 'The White Stripes', 'Elephant', 'Little Acorns');

-- CREATE USER dj@localhost identified by 'passmeby';
GRANT SELECT, INSERT, DELETE, UPDATE ON music_db.* TO dj@localhost;