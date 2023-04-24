--3.b--viết thủ tục đếm số nhân viên hỗ trợ có lương >=15 triệu
CREATE PROCEDURE proc_show_count_Luong_NV_and_HO_TRO(@Gioi_tinh NCHAR(10) , @Luong_NV INT)
AS
BEGIN
	SELECT COUNT(*) AS Count_result
	FROM dbo.NHAN_VIEN JOIN dbo.HO_TRO ON HO_TRO.ID_NV = NHAN_VIEN.ID_NV
	WHERE Luong_NV=@Luong_NV AND Gioi_tinh=@Gioi_tinh
END

--test
EXECUTE dbo.proc_show_count_Luong_NV_and_HO_TRO N'Nam', 15000000;

EXECUTE dbo.proc_show_count_Luong_NV_and_HO_TRO N'Nữ', 15000000;
