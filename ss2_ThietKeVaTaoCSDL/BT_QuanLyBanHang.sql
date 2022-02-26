create database QuanLyBanhang;
use QuanLybanHang;
Create table Customer(
cID int primary Key,
cName nvarchar(50),
cAge int 
);
Create table Orders(
oID int primary key,
cID int,
oDate date,
oTotalPrice float
);
Create table Product(
pID int primary key,
pName nvarchar(50),
pPrice float
);
Create table OrderDetail(
oID int,
pID int,
odQTY nvarchar(50),
primary key(oID,pID),
foreign key (oID) references Orders(oID),
foreign key (pID) references Product(pID)
);