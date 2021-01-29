CREATE DATABASE db212BITSScreen;

connect db212BITSScreen;

CREATE TABLE Movies (
    MovieID INTEGER PRIMARY KEY,
    MovieName VARCHAR(40) NOT NULL,
    ReleaseYear INTEGER NOT NULL,
    Duration INTEGER,
    Language VARCHAR(15),
    ReleasedDate DATE,
    ReleasedCountry VARCHAR(15)
);

CREATE TABLE Critics (
    CriticID INTEGER PRIMARY KEY,
    Name VARCHAR(20)
);

CREATE TABLE Ratings (
    MovieID INTEGER,
    CriticID INTEGER,
    Rating DECIMAL(2,1),
    NumOfRatings INTEGER,
    PRIMARY KEY (MovieID, CriticID)
);

ALTER TABLE Ratings CHANGE NumOfRatings NumOfReviews INTEGER;

ALTER TABLE Critics MODIFY Name VARCHAR (20) NOT NULL;

ALTER TABLE Ratings MODIFY Rating DECIMAL(6, 2);

INSERT INTO Movies VALUES(
    125, 'Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'
);

INSERT INTO Movies VALUES(
    126, 'Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK'
);

INSERT INTO Movies VALUES(
    127, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'
);

INSERT INTO Movies VALUES(
    128, 'Jurassic Parc', 1993, 128, 'English', '1993-06-09', 'US'
);

INSERT INTO Movies VALUES(
    129, 'Uri: The Surgical Strike', 2019, 139, 'Hindi', '2019-01-11', 'IND'
);

INSERT INTO Critics VALUES(
    500, 'Judith Christ'
);

INSERT INTO Critics VALUES(
    501, 'Roger Ebert'
);

INSERT INTO Critics VALUES(
    502, 'Andrew Sarris'
);

INSERT INTO Critics VALUES(
    503, 'Omar Qureshi'
);

INSERT INTO Ratings VALUES(
    125, 502, 8.4, 26375
);

INSERT INTO Ratings VALUES(
    127, 500, 7.9, 202778
);

INSERT INTO Ratings VALUES(
    129, 501, 8.1, 13091
);

INSERT INTO Ratings VALUES(
    129, 503, 8.6, 81328
);

SELECT ReleaseYear FROM Movies WHERE MovieName='Seven Samurai';

SELECT MovieID, MovieName from Movies WHERE MovieID in (125, 128, 129);

SELECT MovieID, MovieName, ReleaseYear FROM Movies WHERE ReleaseYear < 1990;

SELECT DISTINCT ReleasedCountry FROM Movies;

SELECT DISTINCT Movies.MovieName FROM Movies INNER JOIN Ratings ON Movies.MovieID = Ratings.MovieID WHERE Ratings.Rating > 8;

UPDATE Movies SET Duration = Duration + 60;

SELECT MovieName FROM Movies UNION SELECT Name from Critics;

/* Q13 skipped */

ALTER TABLE Movies ADD COLUMN Age INTEGER DEFAULT(0);

CREATE INDEX Age on Movies(Age);

UPDATE Movies SET Age = YEAR(CURDATE()) - ReleaseYear;
