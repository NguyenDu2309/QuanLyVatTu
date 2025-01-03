﻿USE [QLVT]
GO
/****** Object:  Table [dbo].[ChiNhanh] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MACN] [nchar](10) NOT NULL,
	[ChiNhanh] [nvarchar](100) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[MACN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_ChiNhanh] UNIQUE NONCLUSTERED 
(
	[ChiNhanh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiNhanh] ([MACN], [ChiNhanh], [DIACHI], [SoDT]) VALUES (N'CN1       ', N'Chi nhánh 1 TP HCM', N'35 Trần Hưng Đạo P1 Q1', N'999111888')
INSERT [dbo].[ChiNhanh] ([MACN], [ChiNhanh], [DIACHI], [SoDT]) VALUES (N'CN2       ', N'Chi nhánh 2 TP Cần Thơ', N'27 Nguyễn Huệ', N'333222111')
/****** Object:  Table [dbo].[Vattu] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vattu](
	[MAVT] [nchar](4) NOT NULL,
	[TENVT] [nvarchar](30) NOT NULL,
	[DVT] [nvarchar](15) NOT NULL,
	[SOLUONGTON] [int] NOT NULL,
 CONSTRAINT [PK_VatTu] PRIMARY KEY CLUSTERED 
(
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TENVT] UNIQUE NONCLUSTERED 
(
	[TENVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'M01 ', N'Máy giặt tự động cửa trước', N'Cái', 0)
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'MU01', N'Máy uốn tóc', N'Cái', 10)
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'MX02', N'Máy sấy', N'Cái', 1)
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'MX07', N'Máy lạnh LG', N'Cái', 4)
INSERT [dbo].[Vattu] ([MAVT], [TENVT], [DVT], [SOLUONGTON]) VALUES (N'TV02', N'Ti vi Sam Sung', N'Cái', 0)
/****** Object:  Table [dbo].[NhanVien]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MANV] [int] NOT NULL,
	[HO] [nvarchar](40) NULL,
	[TEN] [nvarchar](10) NULL,
	[DIACHI] [nvarchar](100) NULL,
	[NGAYSINH] [datetime] NULL,
	[LUONG] [float] NULL,
	[MACN] [nchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (1, N'Lương', N'Trang', N'Thủ Đức', CAST(0x00008F2900000000 AS DateTime), 7000000, N'CN1       ')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (2, N'Nguyễn', N'Hà', N'Quận 9', CAST(0x0000905900000000 AS DateTime), 4000000, N'CN2       ')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (3, N'Trần', N'Thanh', N'Quận 10', CAST(0x000086D500000000 AS DateTime), 5000000, N'CN1       ')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (4, N'Thái', N'Hà', N'Quận 6', CAST(0x000090D400000000 AS DateTime), 7000000, N'CN2       ')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (5, N'Hồ', N'Thái', N'Bình Thạnh', CAST(0x0000903D00000000 AS DateTime), 6000000, N'CN1       ')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (6, N'Hà', N'An', N'Gò Vấp', CAST(0x0000895700000000 AS DateTime), 5000000, N'CN2       ')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (7, N'Lê', N'Trà', N'Phú Nhuận', CAST(0x0000893900000000 AS DateTime), 7000000, N'CN1       ')
INSERT [dbo].[NhanVien] ([MANV], [HO], [TEN], [DIACHI], [NGAYSINH], [LUONG], [MACN]) VALUES (8, N'Nguyễn', N'Hợp', N'Thủ Đức', CAST(0x00008B1F00000000 AS DateTime), 8000000, N'CN2       ')
/****** Object:  Table [dbo].[Kho] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MAKHO] [nchar](4) NOT NULL,
	[TENKHO] [nvarchar](30) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[MACN] [nchar](10) NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MAKHO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_TENKHO] UNIQUE NONCLUSTERED 
(
	[TENKHO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN]) VALUES (N'LP  ', N'LONG PHU', N'127 Ngô Thì Nhậm, Thị xã Long Phú', N'CN2       ')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN]) VALUES (N'TD  ', N'THỦ ĐỨC', N'34,Quang Trung THủ Đức TPHCM', N'CN1       ')
INSERT [dbo].[Kho] ([MAKHO], [TENKHO], [DIACHI], [MACN]) VALUES (N'TK  ', N'TỔNG KHO QUẬN 9', N'134 Đình Phong Phú ,Quận 9,TPHCM', N'CN1       ')
/****** Object:  Table [dbo].[DatHang] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[MasoDDH] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL,
	[NhaCC] [nvarchar](100) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO]) VALUES (N'MDDH01  ', CAST(0x4A3D0B00 AS Date), N'CTY Điện máy xanh', 1, N'TD  ')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO]) VALUES (N'MDDH02  ', CAST(0x4A3D0B00 AS Date), N'CTY Panasonic', 1, N'TD  ')
INSERT [dbo].[DatHang] ([MasoDDH], [NGAY], [NhaCC], [MANV], [MAKHO]) VALUES (N'MDDH03  ', CAST(0x4A3D0B00 AS Date), N'CTY Samsung', 8, N'LP  ')
/****** Object:  Table [dbo].[PhieuXuat] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MAPX] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL,
	[HOTENKH] [nvarchar](100) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NULL,
 CONSTRAINT [PK_PX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDDH]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDDH](
	[MasoDDH] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NULL,
	[DONGIA] [float] NULL,
 CONSTRAINT [PK_CTDDH] PRIMARY KEY CLUSTERED 
(
	[MasoDDH] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PhieuNhap] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MAPN] [nchar](8) NOT NULL,
	[NGAY] [date] NOT NULL,
	[MasoDDH] [nchar](8) NOT NULL,
	[MANV] [int] NOT NULL,
	[MAKHO] [nchar](4) NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_MaSoDDH] UNIQUE NONCLUSTERED 
(
	[MasoDDH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PhieuNhap] ([MAPN], [NGAY], [MasoDDH], [MANV], [MAKHO])
/****** Object:  Table [dbo].[CTPX] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPX](
	[MAPX] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
 CONSTRAINT [PK_CTPX] PRIMARY KEY CLUSTERED 
(
	[MAPX] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPN]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MAPN] [nchar](8) NOT NULL,
	[MAVT] [nchar](4) NOT NULL,
	[SOLUONG] [int] NOT NULL,
	[DONGIA] [float] NOT NULL,
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[MAVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Default [DF_DatHang_MasoDDH] ******/
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_MasoDDH]  DEFAULT (getdate()) FOR [MasoDDH]
GO
/****** Object:  Default [DF_DatHang_NGAY] ******/
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_NGAY]  DEFAULT (getdate()) FOR [NGAY]
GO
/****** Object:  Default [DF_PX_NGAY] ******/
ALTER TABLE [dbo].[PhieuXuat] ADD  CONSTRAINT [DF_PX_NGAY]  DEFAULT (getdate()) FOR [NGAY]
GO
/****** Object:  Default [DF_PhieuNhap_MAPN] ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF_PhieuNhap_MAPN]  DEFAULT (getdate()) FOR [MAPN]
GO
/****** Object:  Default [DF_PhieuNhap_NGAY] ******/
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF_PhieuNhap_NGAY]  DEFAULT (getdate()) FOR [NGAY]
GO
/****** Object:  Check [CK_SOLUONGTON] ******/
ALTER TABLE [dbo].[Vattu]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGTON] CHECK NOT FOR REPLICATION (([SOLUONGTON]>=(0)))
GO
ALTER TABLE [dbo].[Vattu] CHECK CONSTRAINT [CK_SOLUONGTON]
GO
/****** Object:  Check [CK_LUONG] ******/
ALTER TABLE [dbo].[NhanVien]  WITH NOCHECK ADD  CONSTRAINT [CK_LUONG] CHECK NOT FOR REPLICATION (([LUONG]>=(4000000)))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_LUONG]
GO
/****** Object:  Check [CK_DONGIA]   ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIA] CHECK NOT FOR REPLICATION (([DONGIA]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_DONGIA]
GO
/****** Object:  Check [CK_SOLUONG]  ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONG] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [CK_SOLUONG]
GO
/****** Object:  Check [CK_DONGIACTPX] ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPX] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_DONGIACTPX]
GO
/****** Object:  Check [CK_SOLUONGCTPX]  ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPX] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [CK_SOLUONGCTPX]
GO
/****** Object:  Check [CK_DONGIACTPN] ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_DONGIACTPN] CHECK NOT FOR REPLICATION (([DONGIA]>=(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_DONGIACTPN]
GO
/****** Object:  Check [CK_SOLUONGCTPN]  ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [CK_SOLUONGCTPN] CHECK NOT FOR REPLICATION (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [CK_SOLUONGCTPN]
GO
/****** Object:  ForeignKey [FK_NhanVien_ChiNhanh] ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChiNhanh] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChiNhanh]
GO
/****** Object:  ForeignKey [FK_Kho_Kho] ******/
ALTER TABLE [dbo].[Kho]  WITH NOCHECK ADD  CONSTRAINT [FK_Kho_Kho] FOREIGN KEY([MACN])
REFERENCES [dbo].[ChiNhanh] ([MACN])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_Kho]
GO
/****** Object:  ForeignKey [FK_DatHang_Kho]  ******/
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_Kho]
GO
/****** Object:  ForeignKey [FK_DatHang_NhanVien]   ******/
ALTER TABLE [dbo].[DatHang]  WITH NOCHECK ADD  CONSTRAINT [FK_DatHang_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NhanVien]
GO
/****** Object:  ForeignKey [FK_PhieuXuat_Kho]  ******/
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_Kho]
GO
/****** Object:  ForeignKey [FK_PX_NhanVien]  ******/
ALTER TABLE [dbo].[PhieuXuat]  WITH NOCHECK ADD  CONSTRAINT [FK_PX_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PX_NhanVien]
GO
/****** Object:  ForeignKey [FK_CTDDH_DatHang]   ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_DatHang]
GO
/****** Object:  ForeignKey [FK_CTDDH_VatTu]   ******/
ALTER TABLE [dbo].[CTDDH]  WITH NOCHECK ADD  CONSTRAINT [FK_CTDDH_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_VatTu]
GO
/****** Object:  ForeignKey [FK_PhieuNhap_DatHang]  ******/
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_DatHang] FOREIGN KEY([MasoDDH])
REFERENCES [dbo].[DatHang] ([MasoDDH])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_DatHang]
GO
/****** Object:  ForeignKey [FK_PhieuNhap_Kho]  ******/
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Kho] FOREIGN KEY([MAKHO])
REFERENCES [dbo].[Kho] ([MAKHO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Kho]
GO
/****** Object:  ForeignKey [FK_PhieuNhap_NhanVien]  ******/
ALTER TABLE [dbo].[PhieuNhap]  WITH NOCHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MANV])
REFERENCES [dbo].[NhanVien] ([MANV])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
/****** Object:  ForeignKey [FK_CTPX_PX]  ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_PX] FOREIGN KEY([MAPX])
REFERENCES [dbo].[PhieuXuat] ([MAPX])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_PX]
GO
/****** Object:  ForeignKey [FK_CTPX_VatTu]  ******/
ALTER TABLE [dbo].[CTPX]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPX_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_VatTu]
GO
/****** Object:  ForeignKey [FK_CTPN_PhieuNhap]   ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MAPN])
REFERENCES [dbo].[PhieuNhap] ([MAPN])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO
/****** Object:  ForeignKey [FK_CTPN_VatTu]  ******/
ALTER TABLE [dbo].[CTPN]  WITH NOCHECK ADD  CONSTRAINT [FK_CTPN_VatTu] FOREIGN KEY([MAVT])
REFERENCES [dbo].[Vattu] ([MAVT])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_VatTu]
GO

ALTER TABLE NhanVien DROP CONSTRAINT CK_LUONG;
ALTER TABLE NhanVien
DROP COLUMN HO,TEN,LUONG;