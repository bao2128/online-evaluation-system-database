

--4.2--viết hàm tính lương trung bình của loại nhân viên nhập vào
CREATE FUNCTION func_calc_avg_Luong_NV(@AD_flag BIT)
RETURNS FLOAT
AS
BEGIN

DECLARE @AVG_Luong_NV FLOAT

SELECT @AVG_Luong_NV = AVG(dbo.NHAN_VIEN.Luong_NV)
FROM dbo.NHAN_VIEN
WHERE Admin_flag = @AD_flag;
RETURN @AVG_Luong_NV

END

--test function
SELECT dbo.func_calc_avg_Luong_NV(0);

SELECT dbo.func_calc_avg_Luong_NV(1);
