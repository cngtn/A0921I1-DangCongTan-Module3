create database demo;
use demo;

create table products(
id int primary key auto_increment,
productCode varchar(15),
productName varchar(50),
productPrice double,
productAmount int,
productDesciption varchar(200),
productStatus varchar(50)
);

insert into products(productCode,productName,productPrice,productAmount,productDesciption,productStatus)
values('CPC001','Keo deo ChupaChups',30000,5,'90g','Còn hàng'),
('VNM231','Sua tuoi VinaMilk',32000,7,'loc 4 hop','Còn hàng'),
('CSY235','Banh Cosy',72000,5,'546g','Còn hàng'),
('ORO009','Banh Orio',34000,3,'140g','Hết hàng');

select productCode from products;
alter table products add index idx_productCode(productCode);
explain select productCode from products;

select productName,productPrice from products;
alter table products add index idx_productDetail(productName,productPrice);
explain select productName,productPrice from products;

alter table products drop index idx_productCode;
alter table products drop index idx_productDetail;

create view product_views as
select productCode, productName, productPrice,productStatus
from products;
select * from product_views;

create or replace view product_view as
select productCode, productName, productPrice,productStatus
from products
where productStatus = 'Còn hàng';
select * from product_views;

drop view product_views;

DELIMITER $$
CREATE PROCEDURE getProduct()
BEGIN
  SELECT * FROM products;
END $$
DELIMITER ;
call getProduct();

DELIMITER $$
CREATE PROCEDURE insertProduct()
BEGIN
insert into products(productCode,productName,productPrice,productAmount,productDesciption,productStatus)
values('BQP064','Bánh quy bơ',34000,6,'250g','Hết hàng');
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE updateProduct()
BEGIN
  update products set productAmount=5 where id=2;
END $$
DELIMITER ;
call updateProduct();

DELIMITER $$
CREATE PROCEDURE deleteProduct()
BEGIN
  delete from products where id=3;
END $$
DELIMITER ;
call deleteProduct();
