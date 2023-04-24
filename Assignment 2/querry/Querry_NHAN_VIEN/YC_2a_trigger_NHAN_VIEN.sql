USE TEST_ONLINE_03
GO
--tạo trigger kiểm tra tuổi nhân viên lớn hơn 18
CREATE TRIGGER trig_insert_NHAN_VIEN ON dbo.NHAN_VIEN
AFTER INSERT, UPDATE AS
BEGIN
	DECLARE 
	@ID_NV CHAR(10),
	@HO NVARCHAR(20),
	@TEN_DEM NVARCHAR(20),
	@TEN NVARCHAR(20),
	@NAM_SINH DATETIME,
	@GIOI_TINH NVARCHAR(10),
	@EMAIL NVARCHAR(100),
	@SDT_NV VARCHAR(10),
	@ADMIN_FLAG BIT

	SELECT 
			@ID_NV = Inserted.ID_NV,
			@HO =Inserted.Ho,
			@TEN_DEM = Inserted.Ten_dem,
			@TEN = Inserted.Ten,
			@Nam_sinh = Inserted.Nam_sinh,
			@GIOI_TINH = Inserted.Gioi_tinh,
			@EMAIL = Inserted.Email,
			@SDT_NV = Inserted.SDT_NV,
			@ADMIN_FLAG = Inserted.Admin_flag
	FROM Inserted, NHAN_VIEN
	WHERE NHAN_VIEN.ID_NV = Inserted.ID_NV
	IF((YEAR(GETDATE())) - YEAR(@Nam_sinh) < 18)
		BEGIN
			PRINT N'Nhân viên phải từ 18 tuổi trở lên';
			PRINT N'Thực hiện không thành công';
			ROLLBACK TRAN
		END
END
GO

INSERT dbo.NHAN_VIEN (ID_NV, Ho, Ten_dem, Ten, Nam_sinh, Gioi_tinh, Email, SDT_NV, Admin_flag) 
VALUES (N'NV099', N'Ngô', N'Lộc', N'Xuân', CAST(N'2003-06-13' AS Date), N'Nữ', N'loc_xuan20_nv09@gmail.com', N'0999888888', 0);

UPDATE dbo.NHAN_VIEN
SET Nam_sinh = CAST(N'2003-06-13' AS Date)
WHERE ID_NV='NV01';