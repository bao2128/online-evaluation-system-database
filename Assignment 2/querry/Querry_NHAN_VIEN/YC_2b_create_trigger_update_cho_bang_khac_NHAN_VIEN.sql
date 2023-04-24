

--2b--khi xóa 1 nhân viên trong bảng NHAN_VIEN, cũng sẽ hủy các yêu cầu hỗ trợ (từ người dùng gửi đến) mà nhân viên đó đang xử lý
CREATE TRIGGER trig_update_NHAN_VIEN_and_HO_TRO ON dbo.NHAN_VIEN
AFTER DELETE AS
BEGIN
DECLARE 
	@ID_NV CHAR(10)

	SELECT
		@ID_NV = ID_NV
	FROM Deleted

IF(EXISTS ( SELECT * 
			FROM	dbo.HO_TRO
			WHERE	(ID_NV = @ID_NV) AND (Trang_thai =N'Đang xử lý' OR Trang_thai =N'Đã tiếp nhận')
			))
				BEGIN
					UPDATE dbo.HO_TRO
					SET Trang_thai = N'Đã hủy yêu cầu do không tìm thấy nhân viên '+ @ID_NV
					WHERE ID_NV = @ID_NV
				END
END
