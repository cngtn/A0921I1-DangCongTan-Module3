create database QuanLyDonHang;
Use QuanLyDonhang;
create table PHIEUXUAT(
SoPX int Primary key not null,
NgayXuat date
);
create table VATTU(
MaVTU int primary key not null,
TenVTU varchar(50)
);
create table PHIEUNHAP(
	SoPN int primary key not null,
    NgayNhap date
);
create table DONDH(
SoDH int primary key not null,
NgayDH date,
MaNCC_id int,
foreign key(MaNCC_id) references NHACC(MaNCC)
);
create table NHACC(
MaNCC int primary key not null,
TenNCC varchar(50),
DiaChi varchar(50),
SoDT_id int,
foreign key(SoDT_id) references SoDT(id)
);
Create table Xuat(
DGXuat int,
SLXuat int,
SoPX_id int,
MaVTU_id int,
primary key(SoPX_id, MaVTU_id),
foreign key(SoPX_id) references PHIEUXUAT(SoPX),
foreign key(MaVTU_id) references VATTU(MaVTU)
);
Create table Nhap(
DGNhap int,
SLNhap int,
SoPN_id int,
MaVTU_id int,
primary key(SoPN_id, MaVTU_id),
foreign key(SoPN_id) references PHIEUNHAP(SoPN),
foreign key(MaVTU_id) references VATTU(MaVTU)
);
Create table DonHang(
SoDH_id int,
MaVTU_id int,
primary key(SoDH_id, MaVTU_id),
foreign key(SoDH_id) references DONDH(SoDH),
foreign key(MaVTU_id) references VATTU(MaVTU)
);
Create table SoDT(
id int primary key not null,
Sdt varchar(25)
);