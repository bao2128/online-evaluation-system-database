
--3.a--viết thủ tục hiển thị thông tin của nhân viên hỗ trợ người dùng
CREATE PROCEDURE proc_show_info (@ID_NV CHAR(10))
AS
BEGIN
	SELECT dbo.NHAN_VIEN.ID_NV,Ho,Ten_dem,Ten,SDT_NV,Email
	FROM dbo.NHAN_VIEN JOIN dbo.HO_TRO ON HO_TRO.ID_NV = NHAN_VIEN.ID_NV
	WHERE dbo.NHAN_VIEN.ID_NV=@ID_NV;
END
;
--test
EXECUTE dbo.proc_show_info 'NV04';

EXECUTE dbo.proc_show_info 'NV01';

EXECUTE dbo.proc_show_info 'NV06';