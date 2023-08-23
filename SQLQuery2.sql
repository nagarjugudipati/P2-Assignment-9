create database OrdersDB
use OrdersDb

create table Customers
(CustomerId int primary key,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null)

create table Orders
(OrderId int primary key identity,
CustomerId int foreign key references Customers,
OrderDate datetime,
TotalAmount float)

insert into Customers values (1, 'Ajay', 'Kumar')
insert into Customers values (2, 'Janu', 'Dev')
insert into Customers values (3, 'Ravi', 'Kumar')
insert into Customers values (4, 'Dilip', 'Sam')

select * from Customers

create proc PlaceOrder
@customerId int,
@totalAmount float
as 
begin
declare @orderId int
insert into Orders (CustomerId, OrderDate, TotalAmount)
values (@customerId, GETDATE(), @totalAmount)
set @orderId = SCOPE_IDENTITY()
select @orderId as OrderId
end

exec PlaceOrder
@customerId = 4,
@totalAmount = 10000.50

select * from Orders