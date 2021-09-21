create database PracticeMakesPerfect
go
create table Users(
Id int not null primary key identity (1,1),
Username varchar(30) not null unique,
Password varchar(30) not null,
Firstname varchar(30) not null,
Lastname varchar(30) not null,
Phone varchar(12) null,
Email varchar(255),
IsReviewer bit not null default 0,
IsAdmin bit not null default 0
);
go
insert into Users
(Username, Password, Firstname,Lastname,IsReviewer,IsAdmin)
values
('Lindlolo25', 'Sql124', 'Lindsey', 'Lohan', 0, 0),
('hilt060par', 'Sql124', 'Paris', 'Hilton', 0,1),
('Simpliferich08', 'Sql124', 'Nichole', 'Richie', 0, 0),
('kkwbeauty', 'Sql124', 'Kim', 'Kardashian', 1,0);
go 
Create table Vendors(
Id int not null primary key identity (1,1),
code varchar(30) not null unique,
Name varchar(30) not null,
Address varchar(30) not null, 
City varchar(30) not null,
State varchar(2) not null,
Zip varchar(5) not null,
Phone varchar(12) null,
email varchar(255) null,
); 
go
insert into vendors
(code,name,Address,City,State,Zip)
values
('LV1', 'Louis Vuitton', '295 N Rodeo Dr', 'Beverly Hills', 'CA', 90210),
('Vers23', 'Versace', '248 N Rodeo Dr', 'Beverly Hills', 'CA', 90210),
('redb', 'Christian Louboutin', '155 NE 40th St', 'Miami', 'FL', 33137)
go
create table products(
Id int not null primary key identity (1,1),
PartNbm varchar(30) not null unique,
Name varchar(30) not null,
Price decimal (9,2) not null default 0 check( price >=0),
Unit varchar(30) not null default 'Each',
PhotoPath varchar(255) null,
VendorId int not null 
foreign key references Vendors(Id),
);
go
insert into products
(PartNbm, Name, Price, VendorId)
values
('lw34', 'RedbottomHeels', 2999.99, 3),
('topw3', 'SilkTank', 399.50, 2),
('MGM3', 'LargeTote', 1990.02, 1),
('mei3', 'umbrellaSALE', 50.99, 1),
('sal99', 'sungCatEye', 25.99,2),
('diej', 'RedCoat', 599.99, 3),
('cli', 'Broach', 23.76,1);
go
Create table Requests(
Id int not null primary key identity (1,1),
Description varchar(80) not null,
Justification varchar(80) null,
RejectionReason varchar(80),
DeliveryMode varchar(80) not null,
Status varchar(110) not null default'New',
Total decimal(11,2) not null default 0,
UserId int not null 
foreign key references Users(Id)
); 
go
select * from Users
insert into Requests
(Description, DeliveryMode, UserId)
Values
('shoes', 'pickup', 1),
('bags', 'online', 3),
('shoes', 'online', 4),
('accessories', 'pickup', 2),
('outdoor', 'online', 2);
go  
select* from products; select * from Requests;
go
Create table RequestLines(
Id int not null primary key identity (1,1),
RequestId int not null
foreign key references Requests(Id),
ProductId int not null 
foreign key references Products(Id),
Quantity int not null default 1
);
go
insert into RequestLines
(RequestId,ProductId)
Values
(1,1),
(1,5),
(2,3),
(4,4),
(4,7),
(4,5),
(3,1),
(5,4),
(3,3);
go
select * from Users; select * from Vendors; select * from products; select * from Requests; select * from RequestLines;