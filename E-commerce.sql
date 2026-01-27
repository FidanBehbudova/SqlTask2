create database EcommerceDB

use EcommerceDB

create table Customers(
Id int primary key identity,
Name nvarchar(30),
Email varchar(50) unique,
Phone int
)

create table Orders(
Id int primary key identity,
OrderDate DateTime,
Status varchar(20),
CustomerId int foreign key references Customers(Id)
)

create table OrderItems(
Id int primary key identity,
Quantity int,
UnitPrice decimal,
OrderId int foreign key references Orders(Id),
ProductId int foreign key references Products(Id)
)

create table Products(
Id int primary key identity,
Name nvarchar(30),
Description nvarchar(50),
Price decimal,
CategoryId int foreign key references Categories(Id)
)

create table Categories(
Id int primary key identity,
Name nvarchar(30),
Description nvarchar(50),
)

create table Suppliers(
Id int primary key identity,
Name nvarchar(30),
ContactInfo varchar(30)
)

create table ProductSuppliers(
Id int primary key identity,
ProductId int foreign key references Products(Id),
SupplierId int foreign key references Suppliers(Id)
)