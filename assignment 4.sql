create database moviesdb;
use moviesdb;

CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
 select * from movies;
 select * from movietheaters;
 
 #1
 select title from movies;
 
 #2
 select distinct(rating) from movies;
 
 #3
 select title from movies where rating is null;
 
 #4
 select * from movietheaters where movie is null;
 
 #5
 select * from movietheaters left join movies
 on movies.code=movietheaters.movie;
 
 #6
  SELECT *FROM MovieTheaters  right join Movies
   ON MovieTheaters.Movie = Movies.Code;
   
   #7
   SELECT Movies.Title
   FROM MovieTheaters RIGHT JOIN Movies
   ON MovieTheaters.Movie = Movies.Code
   WHERE MovieTheaters.Movie IS NULL;
   
 #8
 INSERT INTO Movies(code,Title,Rating) VALUES(9,'One, Two, Three',NULL);
 
 select * from movies;
 
#9 
UPDATE Movies SET Rating='G' WHERE Rating IS NULL;
select * from movies;
select* from movietheaters;


#10
 

