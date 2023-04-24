USE TEST_ONLINE_03
GO
--1--phải vô hiệu hóa FOREIGN KEY trong bảng HO_TRO và GUI_YEU_CAU trước thì mới xóa được Nhân viên trong bảng NHAN_VIEN
ALTER TABLE dbo.HO_TRO
NOCHECK CONSTRAINT FK__HO_TRO__ID_NV__33D4B598;

ALTER TABLE dbo.GUI_YEU_CAU
NOCHECK CONSTRAINT FK__GUI_YEU_C__ID_NV__3C69FB99;

--2--xóa NV04 để test trigger có chạy đúng không
DELETE FROM dbo.NHAN_VIEN
WHERE ID_NV='NV04';

--xóa NV01

/*DELETE FROM dbo.NHAN_VIEN
WHERE ID_NV='NV01';
*/

--xóa NV06

/*DELETE FROM dbo.NHAN_VIEN
WHERE ID_NV='NV06';
*/

/*--3--kích hoạt lại Constraint
ALTER TABLE dbo.HO_TRO
CHECK CONSTRAINT FK__HO_TRO__ID_NV__33D4B598;

ALTER TABLE dbo.GUI_YEU_CAU
CHECK CONSTRAINT FK__GUI_YEU_C__ID_NV__3C69FB99;
*/

/*--4.1--thêm lại NV04 vào bảng NHAN_VIEN
INSERT dbo.NHAN_VIEN (ID_NV, Ho, Ten_dem, Ten, Nam_sinh, Gioi_tinh, Email, SDT_NV, Admin_flag, Luong_NV) 
VALUES (N'NV04', N'Lê', N'Bạch', N'Tuyết', CAST(N'1955-06-14' AS Date), N'Nữ', N'tuyetbach_nv04@gmail.com', N'0348560145', 1, 15000000);

--thêm lại NV04 vào bảng HO_TRO
DELETE FROM dbo.HO_TRO
WHERE ID_NV='NV04';

INSERT [dbo].[HO_TRO] ([ID_NV], [ID_ND], [Noi_dung], [Trang_thai], [Thoi_gian_gui]) 
VALUES (N'NV04', N'ND04', N'Câu hỏi không hợp lý', N'Đang xử lý', CAST(N'2019-12-05' AS Date));
*/

/*--4.2--NV01
INSERT dbo.NHAN_VIEN (ID_NV, Ho, Ten_dem, Ten, Nam_sinh, Gioi_tinh, Email, SDT_NV, Admin_flag, Luong_NV) 
VALUES (N'NV01', N'Nguyễn', N'Hoài', N'Nam', CAST(N'1995-06-12' AS Date), N'Nam', N'nam_nv01@gmail.com', N'0989206589', 1, 15000000)

DELETE FROM dbo.HO_TRO
WHERE ID_NV='NV01';

INSERT [dbo].[HO_TRO] ([ID_NV], [ID_ND], [Noi_dung], [Trang_thai], [Thoi_gian_gui]) 
VALUES (N'NV01', N'ND02', N'Đáp án không đúng', N'Đã xử lý', CAST(N'2019-12-07' AS Date))
*/
/*--4.3--NV06
INSERT dbo.NHAN_VIEN (ID_NV, Ho, Ten_dem, Ten, Nam_sinh, Gioi_tinh, Email, SDT_NV, Admin_flag, Luong_NV) 
VALUES (N'NV06', N'Cao', N'Quốc', N'Huy', CAST(N'1993-06-15' AS Date), N'Nam', N'huy_cao48_nv06@gmail.com', N'0993690666', 1, 15000000)

DELETE FROM dbo.HO_TRO
WHERE ID_NV='NV06';

INSERT [dbo].[HO_TRO] ([ID_NV], [ID_ND], [Noi_dung], [Trang_thai], [Thoi_gian_gui]) 
VALUES (N'NV06', N'ND05', N'Cập nhật câu hỏi', N'Đã tiếp nhận', CAST(N'2019-12-06' AS Date))
GO
*/