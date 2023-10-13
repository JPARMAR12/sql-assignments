create database warehousedb;
use warehousedb;


CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);
 
 select * from warehouses;
 select* from boxes;
 #1
 select * from warehouses;
 
 #2
 select * from boxes where value >150;
 
 #3
 select distinct(contents) from boxes;
 
 #4
 select avg(value) from boxes;
 
 
 #5
 select warehouse,avg(value) from boxes
 group by warehouse;
 
 
 #6
 select warehouse,avg(value) from boxes 
 group by warehouse
 having avg(value) >150;
 
 
 #7
 select boxes.code,location from  warehouses join boxes
 on boxes.warehouse=warehouses.code;
 
 
 #8
 select warehouse,count(*) from boxes
 group by warehouse;
 
 #9


 
 #10
 select boxes.code from boxes left join warehouses
 on boxes.warehouse=warehouses.code
 where location = "Chicago";
 
#11
 INSERT INTO Warehouses(code,Location,Capacity)VALUES (6,'New York',3);
 select* from warehouses;
 
 #12
 INSERT INTO Boxes
   VALUES('H5RT','Papers',200,2);
   select*from boxes;
   
   #13
  select value-(value*0.85) from boxes;
  
  #14
  select avg(value) from boxes;
  select value - (value*0.80) from boxes;
  
  
  #15
  
  
  


   
   