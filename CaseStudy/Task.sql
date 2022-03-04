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
select ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu from dich_vu as dv 
join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu;
