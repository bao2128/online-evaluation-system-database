--4--viết hàm
--4.1--viết hàm nhập vào tên nhân viên, cho biết tuổi của nhân viên này
CREATE FUNCTION func_Tinh_Tuoi_NV(@ten_NV NVARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @Tuoi INT
    SELECT @Tuoi = DATEDIFF(yyyy, Nam_sinh, GETDATE())
    FROM dbo.NHAN_VIEN
    WHERE Ten=@ten_NV;
	RETURN @Tuoi
END

--test function
SELECT dbo.func_Tinh_Tuoi_NV(N'Nam');

