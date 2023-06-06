-- tạo database/ tạo csdl
CREATE DATABASE quan_ly_khach_san;
-- tạo bảng 
-- Trong csdl khi tạo lập bảng ta cần lưu đến ràng buộc
-- NOT NULL: Không cho phép bỏ trường khi nhập dữ liệu
-- PRIMARY KEY: Khóa chính và dữ liệu trong trường không trùng lặp
-- FOREIGN KEY: Khóa ngoại và tham chiếu đến khóa chính
-- DEFAULT: Đặt giá trị mặc định
-- UNIQUE: dữ liệu trong trường không trùng lặp
CREATE TABLE khach_hang(
	id_khach_hang int IDENTITY(1,1) PRIMARY KEY,
	ho_dem nvarchar(100) NOT NULL,
	ten nvarchar(100) NOT NULL,
	-- Cách 1: đưa thẳng vào trường dữ liệu khi tạo lập bảng
	email varchar(100) NOT NULL UNIQUE,
	so_dien_thoai varchar(11) NOT NULL
);
-- dùng câu lệnh sau
-- ALTER TABLE  TÊN BẢNG ADD CONSTRAINT Tên kết nối Tên ràng buộc (trường dữ liệu)
ALTER TABLE khach_hang ADD CONSTRAINT uni_so_dien_thoai UNIQUE (so_dien_thoai);
CREATE TABLE phong(
	id_phong int IDENTITY(1,1) PRIMARY KEY,
	so_phong nvarchar(50) NOT NULL,
	loai_phong nvarchar(100) NOT NULL,
	gia int NOT NULL
);
CREATE TABLE dat_phong(
	id_dat_phong int IDENTITY(1,1) PRIMARY KEY,
	id_khach_hang int NOT NULL,
	id_phong int NOT NULL,
	ngay_nhan date NOT NULL,
	ngay_tra date NOT NULL
);
-- Tạo liên kết giữa bảng đặt phòng và khách hàng
--ALTER TABLE tên bảng(chứa khóa ngoại) ADD FOREIGN KEY (khóa ngoại) 
--REFERENCES tên bảng(chứa khóa chính)(khóa chính)
ALTER TABLE dat_phong ADD FOREIGN KEY (id_khach_hang) 
REFERENCES khach_hang(id_khach_hang);
-- Tạo liên kết giữa bảng đặt phòng và phòng
ALTER TABLE dat_phong ADD FOREIGN KEY (id_phong) 
REFERENCES phong(id_phong);
CREATE TABLE hoa_don(
	id_hoa_don int IDENTITY(1,1) PRIMARY KEY,
	id_dat_phong int NOT NULL,
	tong_tien int NOT NULL,
	ngay_thanh_toan date NOT NULL,
	trang_thai int DEFAULT 0
);
-- Tạo liên kết giữa bảng hóa đơn và đặt phòng
ALTER TABLE hoa_don ADD FOREIGN KEY (id_dat_phong) 
REFERENCES dat_phong(id_dat_phong);
INSERT INTO khach_hang (ho_dem, ten, email, so_dien_thoai)
VALUES
  (N'Nguyễn', N'Văn A', 'vana@gmail.com', '0123456789'),
  (N'Trần', N'Thị B', 'thib@gmail.com', '0987654321'),
  (N'Lê', N'Văn C', 'vanc@gmail.com', '0123498765'),
  (N'Phạm', N'Tuấn D', 'tuand@gmail.com', '0123456790'),
  (N'Hoàng', N'Thị E', 'thie@gmail.com', '0987654322'),
  (N'Nguyễn', N'Văn F', 'vanf@gmail.com', '0123498766'),
  (N'Trần', N'Thị G', 'thig@gmail.com', '0123456791'),
  (N'Lê', N'Văn H', 'vanh@gmail.com', '0987654323'),
  (N'Phạm', N'Tuấn I', 'tuani@gmail.com', '0123498767'),
  (N'Hoàng', N'Thị J', 'thij@gmail.com', '0123456792');
  SELECT * FROM khach_hang
  INSERT INTO phong(so_phong, loai_phong, gia)
VALUES
  ('101', N'Phòng Đơn', 10000),
  ('202', N'Phòng Đôi', 15000),
  ('303', N'Phòng Gia Đình', 20000),
  ('404', N'Phòng Đơn', 10000),
  ('505', N'Phòng Đôi', 15000),
  ('606', N'Phòng Gia Đình', 20000),
  ('707', N'Phòng Đơn', 10000),
  ('808', N'Phòng Đôi', 15000),
  ('909', N'Phòng Gia Đình', 20000),
  ('1010', N'Phòng Đơn', 10000);
  SELECT * FROM phong
  INSERT INTO dat_phong(id_khach_hang, id_phong, ngay_nhan, ngay_tra)
VALUES
  (1, 1, '2023-01-01', '2023-01-06'),
  (2, 2, '2023-02-10', '2023-02-16'),
  (3, 3, '2023-03-20', '2023-03-25'),
  (4, 4, '2023-04-15', '2023-04-20'),
  (5, 5, '2023-05-05', '2023-05-10'),
  (6, 6, '2023-06-12', '2023-06-17'),
  (7, 7, '2023-07-03', '2023-07-08'),
  (8, 8, '2023-08-22', '2023-08-27'),
  (9, 9, '2023-09-18', '2023-09-23'),
  (10, 10, '2023-10-30', '2023-11-04');
  SELECT * FROM dat_phong
  INSERT INTO hoa_don (id_dat_phong, ngay_thanh_toan, tong_tien, trang_thai)
VALUES
  (1, '2023-05-15', 500000, 0),
  (2, '2023-05-16', 800000, 1),
  (3, '2023-05-17', 1200000, 0),
  (4, '2023-05-18', 650000, 1),
  (5, '2023-05-19', 900000, 0),
  (6, '2023-05-20', 750000, 1),
  (7, '2023-05-21', 1100000, 0),
  (8, '2023-05-22', 480000, 1),
  (9, '2023-05-23', 950000, 0),
  (10, '2023-05-24', 700000, 1);
  -------------------------------Truy vấn cơ bản------------------------------------
  --1.	Hiển thị toàn bộ nội dung của bảng khách hàng
  -- Hiện thị toàn bộ thông tin của bảng
  -- SELECT * FROM tên bảng
	SELECT * FROM khach_hang;
--2.	Hiển thị toàn bộ nội dung của bảng phòng
	SELECT * FROM phong;
--3.	Hiển thị toàn bộ nội dung của bảng đặt phòng
	SELECT * FROM dat_phong;
--4.	Hiển thị toàn bộ nội dung của bảng hóa đơn
	SELECT * FROM hoa_don;
--5.	Đổi tên tất cả các cột của bảng khách hàng sang tiếng việt
-- Đổi tên cột
-- SELECT tên cột 1 AS 'tên thay thế', tên cột 2 AS 'tên thay thế', ..., tên cột n AS 'tên thay thế'
-- FROM Tên bảng
SELECT id_khach_hang AS 'ID Khách Hàng', ho_dem AS 'Họ đệm'
FROM khach_hang
--7.	Thực hiện nối họ đệm và tên khách hàng thành họ và tên khách hàng
-- Nối cột có cùng 1 kiểu dữ liệu
-- SELECT tên côt 1 +''+tên cột 2+''+...+tên cột n FROM tên bảng
-- trong '' thì ghi cũng okla
SELECT ho_dem+' '+ten AS 'Họ và tên' FROM khach_hang
--8.	Thực hiện nối số phòng, loại phòng, già thành dạng phòng(Số phòng – loại phòng - giá)
-- Nối nhiều cột và có nhiều kiểu dữ liệu khác nhau
-- SELECT CONCAT(tên côt 1, '', tên cột 2, '', ..., tên côt n) FROM tên bảng
-- trong '' thì ghi cũng okla
SELECT CONCAT(so_phong, '-', loai_phong, '-', gia) AS 'Phòng' FROM phong
-- 9.	Hiện thị danh sách họ và tên yêu cầu không trùng họ
-- SELECT DISTINCT (tên cột) FROM tên bảng
SELECT DISTINCT(ho_dem) FROM khach_hang
--11.	Hiển thị 5 thông tin khách hàng đầu tiên
-- Hiện thông tin theo số lượng nhất định (lấy từ trên xuống)
--SELECT TOP(số lượng muốn có) tên cột 1, tên cột 2, ..., tên cột n
-- FROM tên bảng
SELECT TOP(5) * FROM khach_hang
--13.	Hiển thị 10% thông tin khách hàng đầu tiên
-- Hiện thông tin theo số lượng % dữ liệu của bảng (lấy từ trên xuống)
-- SELECT TOP(số phần trăm) PERCENT  tên cột 1, tên cột 2, ..., tên cột n
-- FROM tên bảng
SELECT TOP(20) PERCENT * FROM khach_hang
--15.	Hiển thị danh sách khách hàng mang họ nguyễn
-- Truy vấn dữ liệu gần chính xác 
-- SELECT tên cột 1, tên cột 2, ..., tên cột n FROM tên bảng 
-- WHERE tên cột LIKE '%Nôi dung%'
-- Nếu là tiếng việt thêm N và trước '%Nội dung%' 
SELECT * FROM khach_hang WHERE ho_dem LIKE N'%nguyễn%'
-- Truy vấn áp dụng toán tử
--17.	Hiển thị danh sách phòng có mức giá lớn hơn 15000
SELECT * FROM phong WHERE gia > 15000
-- 19.	Hiển thị danh sách hóa đơn có tổng tiền lớn hơn 1000000 hoặc đã thanh toán
-- Sử dụng OR
SElECT * FROM hoa_don WHERE tong_tien > 1000000 OR trang_thai = 1
-- 20.	Hiển thị danh sách hóa đơn có tổng tiền lớn hơn 500000 và đã thanh toán
-- Sử dụng AND
SElECT * FROM hoa_don WHERE tong_tien > 500000 AND trang_thai = 1
--21.	Hiển thị danh sách phòng có giá từ 15000 đến 20000
-- Truy vấn nằm trong khoảng
-- SELECT tên cột 1, tên cột 2, ..., tên cột n FROM tên bảng 
-- WHERE tên cột BETWEEN giá trị min AND giá trị max
SELECT * FROM phong WHERE gia BETWEEN 15000 AND 20000
-- 23.	Hiện thi giá phòng cao nhất
-- Truy vấn lấy max của một cột
-- SELECT MAX(tên cột) FROM tên bảng
SELECT MAX(gia) AS 'Giá phòng cao nhất' FROM phong
-- MIN và AVG(tính trung bình) giống như MAX
-- 29.	Săp xếp hóa đơn theo mức giá giảm dần
-- Sắp xếp tăng giảm
-- ASC là tăng dần 
-- DESC là giảm dần
-- SELECT tên cột 1, tên cột 2, ..., tên cột n FROM tên bảng 
-- WHERE (Tùy vào có điều kiện hay không) ORDER BY  tên cột muốn sắp xếp ASC|DESC
SELECT * FROM hoa_don ORDER BY tong_tien DESC
--33.	Đếm số lượng bản ghi có trong bảng Khách hàng
-- Hàm Đếm: COUNT
-- Đếm tất cả  COUNT(*)
--SELECT COUNT(tên cột) FROM tên bảng
SELECT COUNT(*) FROM khach_hang
-- 35.	Đếm số lượng phòng có giá từ 15000 đến 20000
SELECT COUNT(*) FROM phong WHERE gia BETWEEN 15000 AND 20000
--37.	Hiển thị danh sách khách hàng không phải họ nguyễn 
-- NOT : Phủ định
SELECT * FROM khach_hang WHERE ho_dem NOT LIKE N'%Nguyễn%'
--39.	Hiển thị danh sách khách hàng phải họ nguyễn hoặc trần hoặc lê
SELECT * FROM khach_hang 
WHERE ho_dem LIKE N'%Nguyễn%' OR ho_dem LIKE N'%Trần%' 
OR  ho_dem LIKE N'%Lê%'
-- IN : Tương dương OR
-- NOT IN : Ngược lại của IN
SELECT * FROM khach_hang 
WHERE ho_dem IN (N'Nguyễn', N'Trần', N'Lê')
-- IN không thể thay thế cho LIKE vì 2 đứa khác hoàn toàn nhau
-- IN là phải chính xác
-- LIKE có thể gần giống
--40.	Hiển thị danh sách khách hàng 
--không mang số điện thoại số 098, 766, 791
--42.	Hiển thị tất cả các giá trị null trong bảng khách hàng
-- IS NULL: Lấy giá trị null
-- SELECT  tên cột 1, tên cột 2, ..., tên cột n FROM tên bảng
-- WHERE tên cột 1 IS NULL OR tên cột 2 IS NULL OR ... OR tên cột n IS NULL
-- IS NOT NULL: Lấy giá trị khác null
--SELECT  tên cột 1, tên cột 2, ..., tên cột n FROM tên bảng
-- WHERE tên cột 1 IS NOT NULL AND tên cột 2 IS NOT NULL AND ... AND tên cột n IS NOT NULL
SELECT * FROM khach_hang
WHERE id_khach_hang IS NULL OR ho_dem IS NULL
--44.	Tính trung bình giá thuê của các phòng theo từng loại phòng:
SELECT * FROM phong
-- Nhóm dữ liệu: GROUP BY
-- Thường đi kèm với MAX, MIN, AVG, COUNT
-- GROUP CỘT NÀO THÌ SELECT CỘT ĐÓ
-- SELECT tên cột 1, tên cột 2, ..., tên cột n FROM tên bảng
-- WHERE (có hoặc không)
-- GROUP BY tên cột 1, tên cột 2, ..., tên cột n
-- ORDER BYT tên cột 1, tên cột 2, ..., tên cột n ASC| DESC
SELECT loai_phong, AVG(gia)
FROM phong
GROUP BY loai_phong
--46.	Hiển thị danh sách hóa đơn trong tháng 6.
-- DAY(tên cột| dữ liệu)
-- MONTH(tên cột| dữ liệu)
-- YEAR(tên cột| dữ liệu)
-- dữ liệu dang 'mm-dd-yyyy'
SELECT * FROM hoa_don WHERE MONTH(ngay_thanh_toan) = 5
--49.	Hiển thị thông tin các ĐẶT PHÒNG và tổng số tiền hóa đơn của mỗi khách hàng.
--Chỉ hiển thị những khách hàng có tổng số tiền hóa đơn lớn hơn 500.
SELECT * FROM hoa_don
-- HAVING : LỌC GROUP
-- SELECT tên cột 1, tên cột 2, ..., tên cột n FROM tên bảng
-- WHERE (có hoặc không)
-- GROUP BY tên cột 1, tên cột 2, ..., tên cột n
-- HAVING điều kiên
-- ORDER BYT tên cột 1, tên cột 2, ..., tên cột n ASC| DESC
SELECT id_dat_phong, sum(tong_tien)
FROM hoa_don
GROUP BY id_dat_phong
HAVING sum(tong_tien) > 500000
--50.	Hiển thị thông tin các loại phòng và tổng số lượng phòng của mỗi loại phòng. 
--Chỉ hiển thị những loại phòng có tổng số lượng phòng lớn hơn 10.
SELECT * FROM phong
SELECT loai_phong, COUNT(*)
FROM phong
GROUP BY loai_phong
HAVING COUNT(*) > 3 