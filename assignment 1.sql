create database if not exists manufacturerdb;
use manufacturerdb;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

select*from  Manufacturers;
select* from products;
#1
select name from products;
#2
select name, price from products;
#3
select name, price from products where price <=200
order by price ;

#4
select * from products where price between 60 and 120;

#5
select name, concat(price*100, " ","cents") from products;

#6
select avg(price) from products;

#7
select name,avg(price) from products 
group by  manufacturer
having   manufacturer = 2;

#8
select count(*) from products where price >=180;

#9
select name,price from products where price >=180
order by price desc,
 name asc;
 
 #10
select * from products left join manufacturers 
on products.manufacturer=manufacturers.code;

#12
select products.name,price,manufacturers.name from products join  manufacturers
on products.manufacturer=manufacturers.code;


#13
select code,avg(price),manufacturer from products
group by manufacturer;


#13
select avg(price),manufacturers.name from products join manufacturers
on products.manufacturer=manufacturers.code
group by manufacturer; 


#14
select avg(price),manufacturers.name from products join manufacturers
on products.manufacturer=manufacturers.code
group by manufacturer
having avg(price)>=150;


#15
select name,price from products
where price=(select min(price) from products);


#16
select name,price,manufacturer from products
where price=(select max(price) from products);


#17
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(11,'Loudspeakers',70,2);


select * from products;

#18
update products set name="Laser Printer" where code=8;


select* from products;

#19
select price - (price * 0.10) from products;


#20
select price - (price * 0.10) from products
where price >= 120;

