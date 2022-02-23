create database module3;
Use module3;
-- tạo bảng--
create table module3.bai1(
id int primary key,
name varchar(50),
birthday date,
class varchar(40)
);
-- thêm khoá chính vào cho bảng--
Alter table bai1 add primary key Pk_id(id);
-- thêm cột cho bảng --
Alter table bai1 add column `point` int;
-- lấy toàn bộ dữ liệu trong bảng--
select * from bai1;
-- lấy thông tin theo cột --
Select id as ma_sv, name from bai1;
-- thêm dữ liệu vào bảng --
insert into bai1 values (1, 'Tan', '2001/03/25', 'a09');
Insert into bai1(name, birthday,id) values ('Tann', '2001/03/25', 2);
-- sửa tên sinh viên --
Update bai1 set `name` = 'tannn' where id =1;
-- xoá sinh viên có id 2 --
delete From bai1 where id = 2;
-- xoá toàn bộ dữ liệu trong bảng --
Delete from bai1;
-- xoá bảng student --
drop Table bai1;
-- xoá csdl --
drop database module3