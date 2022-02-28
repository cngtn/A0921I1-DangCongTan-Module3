use quanlybanhang;

insert into customer values(1,'Minh Quan',10);
insert into customer values(2,'Ngoc oanh',20);
insert into customer values(3,'Hong Ha',50);
select * from customer;

insert into `orders`(oID,cID,oDate) values(1,1,'2006-03-21');
insert into `orders`(oID,cID,oDate) values(2,2,'2006-03-23');
insert into `orders`(oID,cID,oDate) values(3,1,'2006-03-16');
select * from `orders`;

insert into product values(1,'May Giat',3);
insert into product values(2,'Tu Lanh',5);
insert into product values(3,'Dieu Hoa',7);
insert into product values(4,'Quat',1);
insert into product values(5,'Bep Dien',2);
select * from product;

insert into orderdetail values(1,1,3);
insert into orderdetail values(1,3,7);
insert into orderdetail values(1,4,2);
insert into orderdetail values(2,1,1);
insert into orderdetail values(3,1,8);
insert into orderdetail values(2,5,4);
insert into orderdetail values(2,3,3);
select * from orderdetail;

select oID, oDate, oTotalPrice from `orders`;

select * from customer as c, product as p
where c.cID in (select cID from `orders`)
order by c.cID asc;

select * from customer as c
where c.cID not in (select cID from `orders`);

select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as gia_tien from `orders` as o, orderdetail as od, product as p
where o.oID = od.oID
group by o.oID; 
select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as gia_tien 
from ((orders as o join orderdetail as od on o.oID = od.oID) join product as p on od.pID = p.pID)
group by o.oID;