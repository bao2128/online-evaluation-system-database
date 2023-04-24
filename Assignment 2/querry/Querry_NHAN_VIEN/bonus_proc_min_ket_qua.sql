
--tạo procedure hiển thị chủ đề có bài kiểm tra thấp điểm nhất
CREATE PROCEDURE proc_min_ket_qua
AS
	BEGIN
		DECLARE @a VARCHAR(10)
		SET @a =(SELECT MIN(Ket_qua)
				 FROM dbo.KET_QUA_LAM_BAI, dbo.BAI_KIEM_TRA
				 )
		SELECT dbo.KET_QUA_LAM_BAI.ID_BKT, dbo.CHU_DE.ID_CD, dbo.CHU_DE.Ten_chu_de, dbo.KET_QUA_LAM_BAI.Ket_qua
		FROM dbo.KET_QUA_LAM_BAI, dbo.CHU_DE , dbo.BAI_KIEM_TRA
		WHERE Ket_qua=@a AND dbo.CHU_DE.ID_CD = BAI_KIEM_TRA.ID_CD AND KET_QUA_LAM_BAI.ID_BKT = BAI_KIEM_TRA.ID_BKT
		
	END

--test procedure
EXECUTE dbo.proc_min_ket_qua