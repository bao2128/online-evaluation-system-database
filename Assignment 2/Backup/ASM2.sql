USE [master]
GO
/****** Object:  Database [TEST_ONLINE_03]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE DATABASE [TEST_ONLINE_03]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST_ONLINE_03', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TEST_ONLINE_03.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TEST_ONLINE_03_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TEST_ONLINE_03_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TEST_ONLINE_03] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST_ONLINE_03].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST_ONLINE_03] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST_ONLINE_03] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST_ONLINE_03] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TEST_ONLINE_03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST_ONLINE_03] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET RECOVERY FULL 
GO
ALTER DATABASE [TEST_ONLINE_03] SET  MULTI_USER 
GO
ALTER DATABASE [TEST_ONLINE_03] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST_ONLINE_03] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST_ONLINE_03] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST_ONLINE_03] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEST_ONLINE_03] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TEST_ONLINE_03', N'ON'
GO
ALTER DATABASE [TEST_ONLINE_03] SET QUERY_STORE = OFF
GO
USE [TEST_ONLINE_03]
GO
/****** Object:  UserDefinedFunction [dbo].[func_calc_avg_Luong_NV]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--4.2--viết hàm tính lương trung bình của loại nhân viên nhập vào
CREATE FUNCTION [dbo].[func_calc_avg_Luong_NV](@AD_flag BIT)
RETURNS FLOAT
AS
BEGIN

DECLARE @AVG_Luong_NV FLOAT

SELECT @AVG_Luong_NV = AVG(dbo.NHAN_VIEN.Luong_NV)
FROM dbo.NHAN_VIEN
WHERE Admin_flag = @AD_flag;
RETURN @AVG_Luong_NV

END

GO
/****** Object:  UserDefinedFunction [dbo].[func_Tinh_Tuoi_NV]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--4.1--viết hàm nhập vào tên của nhân viên, trả về tuổi của nhân viên
CREATE FUNCTION [dbo].[func_Tinh_Tuoi_NV](@ten_NV NVARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @Tuoi INT
    SELECT @Tuoi = DATEDIFF(yyyy, Nam_sinh, GETDATE())
    FROM dbo.NHAN_VIEN
    WHERE Ten=@ten_NV;
	RETURN @Tuoi
END
GO
/****** Object:  Table [dbo].[BAI_KIEM_TRA]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAI_KIEM_TRA](
	[ID_BKT] [char](10) NOT NULL,
	[ID_CD] [char](10) NOT NULL,
	[Ten_BKT] [nvarchar](100) NOT NULL,
	[Thoi_gian_lam_bai] [int] NOT NULL,
	[Tong_so_cau_hoi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_BKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAU_HOI_TRAC_NGHIEM]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAU_HOI_TRAC_NGHIEM](
	[ID_CH] [char](10) NOT NULL,
	[ID_BKT] [char](10) NOT NULL,
	[Noi_dung_CH] [nvarchar](max) NOT NULL,
	[Dap_an_dung] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHU_DE]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHU_DE](
	[ID_CD] [char](10) NOT NULL,
	[Ten_chu_de] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GUI_YEU_CAU]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GUI_YEU_CAU](
	[ID_NV_GUI_YC] [char](10) NOT NULL,
	[ID_NV_NHAN_YC] [char](10) NOT NULL,
	[Noi_dung] [nvarchar](100) NOT NULL,
	[Trang_thai] [nvarchar](100) NOT NULL,
	[Thoi_gian_gui_yc] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NV_GUI_YC] ASC,
	[ID_NV_NHAN_YC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HO_TRO]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HO_TRO](
	[ID_NV] [char](10) NOT NULL,
	[ID_ND] [char](10) NOT NULL,
	[Noi_dung] [nvarchar](100) NOT NULL,
	[Trang_thai] [nvarchar](100) NOT NULL,
	[Thoi_gian_gui] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC,
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KET_QUA_LAM_BAI]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KET_QUA_LAM_BAI](
	[ID_ND] [char](10) NOT NULL,
	[ID_BKT] [char](10) NOT NULL,
	[Thoi_gian_lam] [date] NOT NULL,
	[Ket_qua] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC,
	[ID_BKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOI_DUNG]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOI_DUNG](
	[ID_ND] [char](10) NOT NULL,
	[Ho] [nvarchar](20) NOT NULL,
	[Ten_dem] [nvarchar](20) NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[Nam_sinh] [date] NULL,
	[Gioi_tinh] [nvarchar](10) NULL,
	[Dia_chi] [nvarchar](200) NULL,
	[Email] [varchar](100) NULL,
	[SDT_ND] [varchar](10) NULL,
	[Lan_truy_cap_gan_nhat] [date] NOT NULL,
	[Nguoi_ra_de_flag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHAN_VIEN]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHAN_VIEN](
	[ID_NV] [char](10) NOT NULL,
	[Ho] [nvarchar](20) NOT NULL,
	[Ten_dem] [nvarchar](20) NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[Nam_sinh] [date] NULL,
	[Gioi_tinh] [nvarchar](10) NULL,
	[Email] [varchar](100) NULL,
	[SDT_NV] [varchar](10) NULL,
	[Admin_flag] [bit] NOT NULL,
	[Luong_NV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRA_LOI]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRA_LOI](
	[ID_ND] [char](10) NOT NULL,
	[ID_CH] [char](10) NOT NULL,
	[Dap_an_cua_ND] [char](1) NOT NULL,
	[Dung_Sai] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC,
	[ID_CH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_BAI_KIEM_TRA]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_BAI_KIEM_TRA] ON [dbo].[BAI_KIEM_TRA]
(
	[ID_BKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_CAU_HOI_TRAC_NGHIEM]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_CAU_HOI_TRAC_NGHIEM] ON [dbo].[CAU_HOI_TRAC_NGHIEM]
(
	[ID_CH] ASC,
	[ID_BKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_CHU_DE]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_CHU_DE] ON [dbo].[CHU_DE]
(
	[ID_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_GUI_YEU_CAU]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_GUI_YEU_CAU] ON [dbo].[GUI_YEU_CAU]
(
	[ID_NV_GUI_YC] ASC,
	[ID_NV_NHAN_YC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idc_HO_TRO]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idc_HO_TRO] ON [dbo].[HO_TRO]
(
	[ID_NV] ASC,
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_KET_QUA_LAM_BAI]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_KET_QUA_LAM_BAI] ON [dbo].[KET_QUA_LAM_BAI]
(
	[ID_ND] ASC,
	[ID_BKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_NGUOI_DUNG]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_NGUOI_DUNG] ON [dbo].[NGUOI_DUNG]
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_NHAN_VIEN]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_NHAN_VIEN] ON [dbo].[NHAN_VIEN]
(
	[ID_NV] ASC,
	[Gioi_tinh] ASC,
	[Luong_NV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_TRA_LOI]    Script Date: 12/12/2019 2:56:58 AM ******/
CREATE NONCLUSTERED INDEX [idx_TRA_LOI] ON [dbo].[TRA_LOI]
(
	[ID_ND] ASC,
	[ID_CH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BAI_KIEM_TRA]  WITH CHECK ADD FOREIGN KEY([ID_CD])
REFERENCES [dbo].[CHU_DE] ([ID_CD])
GO
ALTER TABLE [dbo].[CAU_HOI_TRAC_NGHIEM]  WITH CHECK ADD FOREIGN KEY([ID_BKT])
REFERENCES [dbo].[BAI_KIEM_TRA] ([ID_BKT])
GO
ALTER TABLE [dbo].[GUI_YEU_CAU]  WITH CHECK ADD FOREIGN KEY([ID_NV_GUI_YC])
REFERENCES [dbo].[NHAN_VIEN] ([ID_NV])
GO
ALTER TABLE [dbo].[GUI_YEU_CAU]  WITH NOCHECK ADD FOREIGN KEY([ID_NV_NHAN_YC])
REFERENCES [dbo].[NHAN_VIEN] ([ID_NV])
GO
ALTER TABLE [dbo].[HO_TRO]  WITH CHECK ADD FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOI_DUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[HO_TRO]  WITH NOCHECK ADD FOREIGN KEY([ID_NV])
REFERENCES [dbo].[NHAN_VIEN] ([ID_NV])
GO
ALTER TABLE [dbo].[KET_QUA_LAM_BAI]  WITH CHECK ADD FOREIGN KEY([ID_BKT])
REFERENCES [dbo].[BAI_KIEM_TRA] ([ID_BKT])
GO
ALTER TABLE [dbo].[KET_QUA_LAM_BAI]  WITH CHECK ADD FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOI_DUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[TRA_LOI]  WITH CHECK ADD FOREIGN KEY([ID_CH])
REFERENCES [dbo].[CAU_HOI_TRAC_NGHIEM] ([ID_CH])
GO
ALTER TABLE [dbo].[TRA_LOI]  WITH CHECK ADD FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOI_DUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[NGUOI_DUNG]  WITH CHECK ADD CHECK  (([Gioi_tinh]=N'Nam' OR [Gioi_tinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[NHAN_VIEN]  WITH CHECK ADD CHECK  (([Gioi_tinh]=N'Nam' OR [Gioi_tinh]=N'Nữ'))
GO
/****** Object:  StoredProcedure [dbo].[INSERT_NHAN_VIEN]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--tạo procedure insert cho bảng NHAN_VIEN
CREATE PROCEDURE [dbo].[INSERT_NHAN_VIEN]
	@ID_NV CHAR(10),
	@HO NVARCHAR(20),
	@TEN_DEM NVARCHAR(20),
	@TEN NVARCHAR(20),
	@NAM_SINH DATETIME,
	@GIOI_TINH NVARCHAR(10),
	@EMAIL NVARCHAR(100),
	@SDT_NV VARCHAR(10),
	@ADMIN_FLAG BIT
AS
BEGIN
	IF(EXISTS(SELECT * FROM dbo.NHAN_VIEN WHERE ID_NV = @ID_NV))
		BEGIN
			RAISERROR (N'ID Nhân viên đã tồn tại',16,1);
			PRINT ' ';
		END
	ELSE
		BEGIN
			IF(@ID_NV NOT LIKE 'NV[0-9][0-9][0-9]%')
				BEGIN
					RAISERROR (N'ID Nhân viên không hợp lệ, phải bắt đầu bằng NV + 3 số, vd: NV009, NV029, NV123',16,1);
					PRINT ' ';
				END
			ELSE
				BEGIN
					IF(@GIOI_TINH NOT LIKE N'Nam'AND @GIOI_TINH NOT LIKE N'Nữ')
						BEGIN
							RAISERROR (N'Giới tính phải là "Nam" hoặc "Nữ"',16,1);
							PRINT ' ';
						END
					ELSE
						BEGIN
							IF(@SDT_NV NOT LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')
								BEGIN
									RAISERROR(N'Số điện thoại phải có 10 số, là các số từ 0 đến 9 và bắt đầu bằng số 0',16,1);
									PRINT ' ';
								END
									ELSE
										BEGIN
											INSERT INTO dbo.NHAN_VIEN
											(
												ID_NV, Ho, Ten_dem, Ten, Nam_sinh, 
												Gioi_tinh, Email, SDT_NV, Admin_flag
											)
											VALUES
											(   
												@ID_NV,@HO,@TEN_DEM,@TEN, CAST(@NAM_SINH AS DATE), 
												@GIOI_TINH, @EMAIL, @SDT_NV, @ADMIN_FLAG
											)
											PRINT N'Thêm thành công Nhân viên mới có ID_NV: ' + CAST(@ID_NV AS VARCHAR(10));
											PRINT ' ';
										END
						END
				END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_min_ket_qua]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_min_ket_qua]
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
GO
/****** Object:  StoredProcedure [dbo].[proc_show_count_Luong_NV_and_HO_TRO]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_show_count_Luong_NV_and_HO_TRO](@Gioi_tinh NCHAR(10) , @Luong_NV INT)
AS
BEGIN
	SELECT COUNT(*) AS Count_result
	FROM dbo.NHAN_VIEN JOIN dbo.HO_TRO ON HO_TRO.ID_NV = NHAN_VIEN.ID_NV
	WHERE Luong_NV=@Luong_NV AND Gioi_tinh=@Gioi_tinh
END
GO
/****** Object:  StoredProcedure [dbo].[proc_show_info]    Script Date: 12/12/2019 2:56:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_show_info] (@ID_NV CHAR(10))
AS
BEGIN
	SELECT dbo.NHAN_VIEN.ID_NV,Ho,Ten_dem,Ten,SDT_NV,Email
	FROM dbo.NHAN_VIEN JOIN dbo.HO_TRO ON HO_TRO.ID_NV = NHAN_VIEN.ID_NV
	WHERE dbo.NHAN_VIEN.ID_NV=@ID_NV;
END
GO
USE [master]
GO
ALTER DATABASE [TEST_ONLINE_03] SET  READ_WRITE 
GO
