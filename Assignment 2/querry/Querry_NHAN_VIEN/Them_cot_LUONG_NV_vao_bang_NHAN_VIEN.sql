USE TEST_ONLINE_03
GO
--thêm cột Lương vào bảng NHAN_VIEN
ALTER TABLE dbo.NHAN_VIEN
ADD Luong_NV INT NULL;
GO

--Cập nhật lương
--Lương admin là 15 triệu
UPDATE dbo.NHAN_VIEN
SET Luong_NV = 15000000
WHERE Admin_flag = 1;
GO
--Lương không phải admin là 13 triệu
UPDATE dbo.NHAN_VIEN
SET Luong_NV = 13000000
WHERE Admin_flag = 0;
GO