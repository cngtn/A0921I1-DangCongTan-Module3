use furamaresort;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *, Char_length(ho_ten)<=15 from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' having Char_length(ho_ten)<=15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *, (year(curdate()) - year(ngay_sinh) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) as tuoi from khach_hang 
where dia_chi like concat('%',convert('Đà Nẵng',binary)) or dia_chi like concat('%',convert('Quảng Trị',binary))
having tuoi between 18 and 50;

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo 
-- số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select hd.ma_khach_hang, kh.ho_ten, count(hd.ma_khach_hang) as so_luong from khach_hang as  kh join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by hd.ma_khach_hang;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là 
-- từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa 
-- từng đặt phòng cũng phải hiển thị ra).
 select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, dv.chi_phi_thue + sum( hdct.so_luong)*dvdk.gia as tong_tien
 from ((((khach_hang as kh 
 Left join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach )
 left join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang)
 left join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu)
 left Join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong)
 left Join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem group by hd.ma_hop_dong;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)002E
create view da_thue as
select hd.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong from ((dich_vu as dv 
left join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu )
left join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu )
where quarter(hd.ngay_lam_hop_dong) = 1 ;
select hd.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong from ((dich_vu as dv 
left join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu )
left join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu )
where hd.ma_dich_vu not in  (select ma_dich_vu from da_thue) group by hd.ma_dich_vu;
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng 
-- đặt phòng trong năm 2021.

select hd.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu from ((dich_vu as dv 
join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu )
join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu )
where year(hd.ngay_lam_hop_dong) = 2020 and hd.ma_dich_vu not in 
(select hd.ma_dich_vu from hop_dong as hd where year(hd.ngay_lam_hop_dong) = 2021) group by hd.ma_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

Select ho_ten from khach_hang group by ho_ten;
select distinct ho_ten from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng 
-- trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select  month (ngay_lam_hop_dong) as thang, count(ma_khach_hang) from hop_dong where 
year (ngay_lam_hop_dong) =2021 group by month(ngay_lam_hop_dong) order by month(ngay_lam_hop_dong) asc;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem from (hop_dong as hd
left Join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong)
left Join  dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem group by hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là 
-- “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong
Join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
Join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach 
where ten_loai_khach = 'Diamond' 
and ( dia_chi like concat('%',convert('Vinh',binary)) or dia_chi like concat('%',convert('Quãng Ngãi',binary)));

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng 
-- đặt vào 6 tháng đầu năm 2021.
Select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ma_dich_vu,
dv.ten_dich_vu, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from ((((hop_dong as hd 
left Join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang)
left Join nhan_vien as nv on nv.ma_nhan_vien = hd.ma_nhan_vien)
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu)
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong) 
where year(hd.ngay_lam_hop_dong) = 2020 and quarter(hd.ngay_lam_hop_dong) = 4 group by hd.ma_hop_dong ;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

Select dvdk.*, sum(so_luong) as SL 
		from hop_dong_chi_tiet hdct, dich_vu_di_kem dvdk , (Select max(T.SL) as DV_SL_MAX
					from (Select ma_dich_vu_di_kem, sum(so_luong) as SL 
							from hop_dong_chi_tiet 
							Group by ma_dich_vu_di_kem) as T) as F
		where hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        Group by hdct.ma_dich_vu_di_kem
        having SL = (Select max(T.SL) as DV_SL_MAX
					from (Select ma_dich_vu_di_kem, sum(so_luong) as SL 
							from hop_dong_chi_tiet 
							Group by ma_dich_vu_di_kem) as T);


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
--  (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd
Join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
Join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
Join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu group by dvdk.ten_dich_vu_di_kem having so_lan_su_dung = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.