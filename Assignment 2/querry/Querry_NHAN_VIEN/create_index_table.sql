--tạo index cho bảng NHAN_VIEN
CREATE INDEX idx_NHAN_VIEN ON dbo.NHAN_VIEN(ID_NV, Gioi_tinh, Luong_NV);

--tạo index cho bảng NGUOI_DUNG
CREATE INDEX idx_NGUOI_DUNG ON dbo.NGUOI_DUNG(ID_ND);

--tạo index cho bảng CHU_DE
CREATE INDEX idx_CHU_DE ON dbo.CHU_DE(ID_CD);

--tạo index cho bảng BAI_KIEM_TRA
CREATE INDEX idx_BAI_KIEM_TRA ON dbo.BAI_KIEM_TRA(ID_BKT);

--tạo index cho bảng CAU_HOI_TRAC_NGHIEM
CREATE INDEX idx_CAU_HOI_TRAC_NGHIEM ON dbo.CAU_HOI_TRAC_NGHIEM(ID_CH,ID_BKT);

--tạo index cho bảng KET_QUA_LAM_BAI
CREATE INDEX idx_KET_QUA_LAM_BAI ON dbo.KET_QUA_LAM_BAI(ID_ND,ID_BKT);

--tạo index cho bảng HO_TRO
CREATE INDEX idc_HO_TRO ON dbo.HO_TRO(ID_NV,ID_ND);

--tạo index cho bảng TRA_LOI
CREATE INDEX idx_TRA_LOI ON dbo.TRA_LOI(ID_ND,ID_CH);

--tạo index cho bảng GUI_YEU_CAU
CREATE INDEX idx_GUI_YEU_CAU ON dbo.GUI_YEU_CAU(ID_NV_GUI_YC,ID_NV_NHAN_YC);

