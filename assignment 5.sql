create database wallmartdb;
use wallmartdb;


CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
 
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
 
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 
-- alternative one for SQLite
  /* 
 CREATE TABLE Provides (
 Piece INTEGER,
 Provider VARCHAR(40),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
 */
 
 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);

select * from pieces;
select * from providers;
select* from provides;

#1
select name from pieces;

#2
select * from providers;

#3
select piece,avg(price) from provides
group by piece;

#4
select providers.name,piece from providers join provides
on providers.code=provides.provider
group by providers.name 
having piece = 1;

#5
select * from provides;
select * from Pieces;
select * from providers;

select  Name from provides join pieces
on provides.piece = pieces.Code
where provider = "HAL";

#6
select pieces.name ,price,providers.name from pieces join provides
on pieces.code=provides.provider 
join providers
on providers.code=provides.provider
where price = (select max(price) from provides);

#7



