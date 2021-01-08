create table Orders (
    OrderId int Identity(1,1) primary key,
    PlacementDate Datetime,
    CustomerName Varchar(200)
)

create table Items (
    ItemId int Identity(1,1) primary key,
    ItemName Varchar(200),
    ItemCost Decimal (8,2),    
)

create table OrderItems (
    OrderItemId int Identity(1,1) primary key,
    OrderId int foreign key references Orders(OrderId),
    ItemId int foreign key references Items(ItemId),
    ItemCount int
)

-----------------------------------//----------------------------------------------

Insert into [dbo].[Orders] Values (
    getdate(),
    'Silvio Santos'
),
(
    getdate(),
    'Roque'
)
------------------
insert into [dbo].[Items] Values 
(
    'Microfone',
     1.200
),
(
    'Camera',
     3.600
)
------------------
insert into [dbo].[OrderItems] Values 
(
    1,
    2,
    2
),
(
    1,
    1,
    10
),
(
    2,
    1,
    1
),
(
    2,
    2,
    1
)

-----------------------------------//----------------------------------------------

select o.CustomerName, o.PlacementDate, i.ItemName, oi.ItemCount, i.ItemCost, i.ItemCost * oi.ItemCount from [dbo].[Orders] o 
    join [dbo].[OrderItems] oi on oi.OrderId = o.OrderId
    Join [dbo].[Items] i on i.ItemId = oi.ItemId
where 1 = 1