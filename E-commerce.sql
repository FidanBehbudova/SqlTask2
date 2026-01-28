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


select c.Id,c.Name 'customers name',COUNT(o.CustomerId) 'order count' from Customers c
join Orders o on o.CustomerId=c.Id
group by c.Id,c.Name



select c.Id,c.Name 'customers name',COUNT(o.CustomerId) 'order count' from Customers c
join Orders o on o.CustomerId=c.Id
group by c.Id,c.Name
having COUNT(o.CustomerId)>5



select o.Id as OrderId,sum(oi.Quantity * oi.UnitPrice) as 'umumi sayi',o.TotalAmount from Orders o
join OrderItems oi on oi.OrderId = o.Id
group by o.Id, o.TotalAmount


select c.Id as CategoryId,c.Name as 'category name',sum(oi.Quantity) as 'umumi mehsul sayi', sum(oi.Quantity * oi.UnitPrice) as 'umumi mebleg' from Categories c
join Products p on p.CategoryId = c.Id
join OrderItems oi on oi.ProductId = p.Id
group by c.Id, c.Name


select c.Id as CustomerId,c.Name as 'customer name',cat.Name as 'category name',sum(oi.Quantity) as 'umumi sayi' from Customers c
join Orders o on o.CustomerId = c.Id
join OrderItems oi on oi.OrderId = o.Id
join Products p on p.Id = oi.ProductId
join Categories cat on cat.Id = p.CategoryId
group by c.Id, c.Name,cat.Id, cat.Name


create view CustomerOrderSummary as
select c.Id as CustomerId,c.Name as 'customer name',count(o.Id) as 'sifaris sayi',sum(oi.Quantity * oi.UnitPrice) as 'mebleg' from Customers c
join Orders o on o.CustomerId = c.Id
join OrderItems oi on oi.OrderId = o.Id
group by c.Id, c.Name


select * from CustomerOrderSummary
