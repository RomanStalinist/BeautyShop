/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [char](7) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 01.12.2021 12:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'Natura Siberica', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'Биопин ФАРМА', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'Milotto', CAST(N'2016-06-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'Лаборатория натуральной косметики MIXIT', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'Малавит', CAST(N'2017-09-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (6, N'ANDALOU', CAST(N'2015-11-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (7, N'Agent Netty PRO', CAST(N'2016-03-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (8, N'ЕвроТек', CAST(N'2017-10-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (9, N'Blue Beautifly', CAST(N'2017-01-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (10, N'MATSESTA', CAST(N'2018-04-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (11, N'АЙРОН БАРБЕР', CAST(N'2018-04-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (12, N'РУСХИМТЕХ', CAST(N'2017-07-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (13, N'НИКОЛЬ', CAST(N'2017-02-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (14, N'Аравия', CAST(N'2015-06-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (15, N'Алтэя', CAST(N'2018-05-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (16, N'SHELK Cosmetics', CAST(N'2017-01-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (17, N'Русская косметика', CAST(N'2015-07-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (18, N'MAGIC HERBS', CAST(N'2016-02-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (19, N'Natura Botanica', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (20, N'Bel Savon', CAST(N'2015-04-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (21, N'ИРИДА-НЕВА', CAST(N'2017-05-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (22, N'Славяна', CAST(N'2015-03-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (23, N'АЛВА', CAST(N'2016-08-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (24, N'Альпика', CAST(N'2018-05-31' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (25, N'Жерминаль', CAST(N'2017-04-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (26, N'Арт-Визаж', CAST(N'2018-04-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (27, N'Валери-Д', CAST(N'2018-06-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (28, N'Мастерская Fitoland Organic', CAST(N'2017-07-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (29, N'ДОМ ПРИРОДЫ', CAST(N'2015-11-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (30, N'Флора', CAST(N'2016-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (31, N'ЭКО ТАВРИДА', CAST(N'2016-06-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (32, N'АлтайЯ', CAST(N'2015-07-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (33, N'Weleda', CAST(N'2015-04-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (34, N'ANTI AGE', CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (35, N'Колорит', CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (36, N'SATIVA', CAST(N'2017-01-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (37, N'Фитокосметик', CAST(N'2016-03-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (38, N'Клеона', CAST(N'2017-10-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (39, N'Живая косметика Сибири', CAST(N'2015-03-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (40, N'SLAVIC HAIR Company', CAST(N'2015-12-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (41, N'Green era', CAST(N'2017-07-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (42, N'SIBERINA', CAST(N'2015-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (43, N'Green Mama', CAST(N'2016-11-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (44, N'Altanya', CAST(N'2015-03-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (45, N'Черный бриллиант', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (46, N'BIOSelect', CAST(N'2016-12-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (47, N'АромаВятка', CAST(N'2016-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (48, N'VIQQO — производитель инновационной уходовой косметики', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (49, N'DIONY', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (50, N'AMSARVEDA', CAST(N'2015-12-11' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (1, N'Ирисовый освежающий увлажняющий крем', 720.0000, N'', N'Товары салона красоты\1953276-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (2, N'Сыворотка для кожи вокруг глаз с гиалуроновой кислотой', 690.0000, N'', N'Товары салона красоты\9631447-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (3, N'Тоник для лица дневной, Витаминный', 800.0000, N'', N'Товары салона красоты\7293278-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (4, N'Массажный крем для лица с увлажняющим и тонизирующим эффектом', 740.0000, N'', N'Товары салона красоты\6556449-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (5, N'Маска-пленка отшелушивающая с лифтинг-эффектом', 860.0000, N'', N'Товары салона красоты\6556452-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (6, N'Специальный крем для клеточного восстановления', 920.0000, N'', N'Товары салона красоты\6556466-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (7, N'Увлажняющий крем', 730.0000, N'', N'Товары салона красоты\1781678-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (8, N'Восстанавливающая маска для лица', 630.0000, N'', N'Товары салона красоты\3432465-1.jpg', 0, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (9, N'Крем SILK для чувствительной кожи лица натуральный', 740.0000, N'', N'Товары салона красоты\9939701-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (10, N'Подарочный набор Сияние', 630.0000, N'', N'Товары салона красоты\6964198-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (11, N'Пена для бритья Натуральная, Лимон и Корица', 470.0000, N'', N'Товары салона красоты\7528034-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (12, N'Крем питательный тонизирующий ночной', 950.0000, N'', N'Товары салона красоты\3388879-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (13, N'Подарочный набор Супер Увлажнение', 830.0000, N'', N'Товары салона красоты\6964197-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (14, N'Подарочный набор Глубокое Очищение', 860.0000, N'', N'Товары салона красоты\6964196-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (15, N'Тоник ACTIVE для возрастной кожи лица натуральный', 720.0000, N'', N'Товары салона красоты\9939709-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (16, N'Эфирное масло мелиссы', 380.0000, N'', N'Товары салона красоты\7064333-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (17, N'Увлажняющая эмульсия для лица', 910.0000, N'', N'Товары салона красоты\6556463-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (18, N'Масло персиковое', 280.0000, N'', N'Товары салона красоты\6691688-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (19, N'Очищающая коллекция Ночной восстанавливающий крем для лица', 570.0000, N'', N'Товары салона красоты\3432453-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (20, N'Подарочный набор For HIM, Сильный мужчина', 900.0000, N'', N'Товары салона красоты\7299377-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (21, N'Антивозрастная коллекция Освежающий тоник Цветочный', 940.0000, N'', N'Товары салона красоты\3432442-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (22, N'Розовый разглаживающий увлажняющий крем', 890.0000, N'', N'Товары салона красоты\1781679-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (23, N'Деликатный питательный крем', 890.0000, N'', N'Товары салона красоты\1781676-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (24, N'Масло сладкого миндаля', 250.0000, N'', N'Товары салона красоты\6691687-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (25, N'Эфирное масло жасмин', 610.0000, N'', N'Товары салона красоты\7064330-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (26, N'Натуральная пенка для умывания, с ароматом розового дерева', 750.0000, N'', N'Товары салона красоты\6953177-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (27, N'Тоник для лица, для сухой и нормальной кожи', 490.0000, N'', N'Товары салона красоты\9631443-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (28, N'Эфирное масло лемонграсс', 380.0000, N'', N'Товары салона красоты\7064323-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (29, N'Ирисовый освежающий ночной крем', 840.0000, N'', N'Товары салона красоты\1781674-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (30, N'Деликатное очищающее молочко', 680.0000, N'', N'Товары салона красоты\1781675-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (31, N'Эфирное масло корицы', 370.0000, N'', N'Товары салона красоты\7064335-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (32, N'Очищающий гель для умывания', 720.0000, N'', N'Товары салона красоты\7847906-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (33, N'Солнцезащитный лосьон для лица и тела', 830.0000, N'', N'Товары салона красоты\6556469-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (34, N'Коллекция Кокосовая, Очищающая пенка для лица с экстрактами кактуса', 540.0000, N'', N'Товары салона красоты\3472602-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (35, N'S.O.S. средство против локальных несовершенств кожи', 870.0000, N'', N'Товары салона красоты\7847905-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (36, N'Коллекция Сияние, Очищающая крем-пенка Лимон Мейера', 750.0000, N'', N'Товары салона красоты\3472591-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (37, N'Подарочный набор Сияние и Красота', 570.0000, N'', N'Товары салона красоты\6964199-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (38, N'Маска-пленка для глубокого очищения пор', 920.0000, N'', N'Товары салона красоты\6556453-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (39, N'Ирисовый освежающий дневной крем', 740.0000, N'', N'Товары салона красоты\1781693-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (40, N'Деликатный увлажняющий крем', 940.0000, N'', N'Товары салона красоты\1781680-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (41, N'Ухаживающее масло, против сухости кожи', 410.0000, N'', N'Товары салона красоты\6953160-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (42, N'Розовое растительное мыло', 470.0000, N'', N'Товары салона красоты\1781711-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (43, N'Гранатовый дневной крем-лифтинг', 800.0000, N'', N'Товары салона красоты\1781695-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (44, N'Тонизирующее очищающее средство 2 в 1', 640.0000, N'', N'Товары салона красоты\2008488-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (45, N'Сыворотка для лица с гиалуроновой кислотой, для сухой и чувствительной кожи', 590.0000, N'', N'Товары салона красоты\9631448-1.jpg', 0, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (46, N'Эфирное масло лимона', 330.0000, N'', N'Товары салона красоты\7064322-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (47, N'Эфирное масло розовое дерево', 510.0000, N'', N'Товары салона красоты\7064326-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (48, N'Мягкая пенка для умывания', 680.0000, N'', N'Товары салона красоты\5625224-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (49, N'Сыворотка для лица с гиалуроновой кислотой, для нормальной кожи', 560.0000, N'', N'Товары салона красоты\9631445-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (50, N'Тоник для лица, для жирной и проблемной кожи', 600.0000, N'', N'Товары салона красоты\9631442-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (51, N'Пенка для умывания, для сухой и чувствительной кожи', 440.0000, N'', N'Товары салона красоты\9631439-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (52, N'Антивозрастной крем для лица с органическими ягодами годжи', 990.0000, N'', N'Товары салона красоты\6433981-1.jpg', 0, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (53, N'Эфирное масло эвкалипт', 410.0000, N'', N'Товары салона красоты\7064320-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (54, N'Сыворотка PERFECT SERUM депигментирующая натуральная', 710.0000, N'', N'Товары салона красоты\9939719-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (55, N'Крем для лица с антиоксидантами органической клюквы', 980.0000, N'', N'Товары салона красоты\6433979-1.jpg', 0, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (56, N'Пенка для лица для чувствительной кожи', 630.0000, N'', N'Товары салона красоты\3472601-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (57, N'Коллекция Кокосовая, Укрепляющая сыворотка с экстрактами кактуса', 680.0000, N'', N'Товары салона красоты\3472604-1.jpg', 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (58, N'Крем-маска WOW EFFECT омолаживающая для лица натуральная', 950.0000, N'', N'Товары салона красоты\9939704-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (59, N'Подарочный набор For MEN', 840.0000, N'', N'Товары салона красоты\7299378-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (60, N'Очищающий гель для нормальной и сухой кожи лица', 720.0000, N'', N'Товары салона красоты\6556458-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (61, N'Лифтинг-сыворотка для лица', 930.0000, N'', N'Товары салона красоты\6556462-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (62, N'Тоник для ухода за сухой и нормальной кожей', 990.0000, N'', N'Товары салона красоты\6556459-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (63, N'Питательный крем для лица', 800.0000, N'', N'Товары салона красоты\6556464-1.jpg', 0, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (64, N'Крем против морщин для глаз', 570.0000, N'', N'Товары салона красоты\5427580-1.jpg', 0, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (65, N'Лифтинг-сыворотка для лица с гиалуроновой кислотой', 610.0000, N'', N'Товары салона красоты\9631446-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (66, N'Деликатное питательное масло для лица', 930.0000, N'', N'Товары салона красоты\2262226-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (67, N'Тонизирующая сыворотка для лица', 780.0000, N'', N'Товары салона красоты\6556461-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (68, N'Масло праймер для лица (основа под макияж), Выравнивание', 530.0000, N'', N'Товары салона красоты\6953159-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (69, N'Сыворотка COUPEROSE укрепляющая сосуды натуральная', 590.0000, N'', N'Товары салона красоты\9939714-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (70, N'Органический тонер с экстрактом Розы', 960.0000, N'', N'Товары салона красоты\7889950-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (71, N'Пенка для умывания, для жирной и комбинированной кожи', 780.0000, N'', N'Товары салона красоты\9631437-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (72, N'Маска для лица увлажняющая и тонизирующая', 860.0000, N'', N'Товары салона красоты\6556451-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (73, N'Эфирное масло чайного дерева', 410.0000, N'', N'Товары салона красоты\7064334-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (74, N'Очищающий гель для комбинированной и жирной кожи лица', 980.0000, N'', N'Товары салона красоты\6556457-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (75, N'Масло после бритья Натуральное, Лимон и Корица', 300.0000, N'', N'Товары салона красоты\7528031-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (76, N'Ухаживающее масло для лица, восстанавливает кожу', 420.0000, N'', N'Товары салона красоты\6953176-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (77, N'Подарочный набор Мягкое Очищение', 850.0000, N'', N'Товары салона красоты\6964195-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (78, N'Гранатовый ночной крем-лифтинг', 560.0000, N'', N'Товары салона красоты\1781696-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (79, N'Живительный тоник для лица', 770.0000, N'', N'Товары салона красоты\2008486-1.jpg', 0, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (80, N'Универсальный питательный крем SKIN FOOD', 640.0000, N'', N'Товары салона красоты\2351755-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (81, N'Органическое 100% аргановое масло', 760.0000, N'', N'Товары салона красоты\6433982-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (82, N'Пенка для умывания, для нормальной кожи', 400.0000, N'', N'Товары салона красоты\9631438-1.jpg', 1, 49)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (83, N'Крем PERFECT выравнивающий тон лица натуральный', 780.0000, N'', N'Товары салона красоты\9939700-1.jpg', 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (84, N'Чистящая пена-гель для лица', 550.0000, N'', N'Товары салона красоты\2697586-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (85, N'Пенка для умывания Натуральная, Лимон и корица', 280.0000, N'', N'Товары салона красоты\7528032-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (86, N'Масло для лица массажное, с эффектом Лифтинга', 500.0000, N'', N'Товары салона красоты\6953169-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (87, N'Увлажняющий 24-часовой крем против морщин', 910.0000, N'', N'Товары салона красоты\2697576-1.jpg', 1, 46)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (88, N'Подарочный набор Travel, в Командировку, мужской', 880.0000, N'', N'Товары салона красоты\7299376-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (89, N'Тоник для ухода за жирной и комбинированной кожей', 800.0000, N'', N'Товары салона красоты\6556460-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (90, N'Тонизирующий крем для лица', 800.0000, N'', N'Товары салона красоты\6556465-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (91, N'Восстанавливающий крем для лица с органическим шиповником', 960.0000, N'', N'Товары салона красоты\6433984-1.jpg', 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (92, N'Эфирное масло перечной мяты', 390.0000, N'', N'Товары салона красоты\7064324-1.jpg', 0, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (93, N'Тоник для лица, Успокаивающий, для всех типов кожи', 410.0000, N'', N'Товары салона красоты\6953158-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (94, N'Эфирное масло бергамота', 380.0000, N'', N'Товары салона красоты\7064315-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (95, N'Гималайская грязевая маска восстанавливающая', 640.0000, N'', N'Товары салона красоты\6556455-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (96, N'Эфирное масло лаванды', 570.0000, N'', N'Товары салона красоты\7064314-1.jpg', 1, 19)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (97, N'Гималайская грязевая маска антиоксидантная', 660.0000, N'', N'Товары салона красоты\6556454-1.jpg', 1, 50)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (98, N'Гранатовая интенсивная сыворотка-лифтинг', 720.0000, N'', N'Товары салона красоты\1781670-1.jpg', 1, 33)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (99, N'Коллекция Кокосовая, Увлажняющий ночной крем с экстрактами кактуса', 700.0000, N'', N'Товары салона красоты\3472608-1.jpg', 1, 6)
GO
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (100, N'Тоник-пилинг для лица EXFOLIANT на основе фруктовых кислот натуральный', 660.0000, N'', N'Товары салона красоты\9939710-1.jpg', 1, 10)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (1, CAST(N'2019-09-29T08:59:00.000' AS DateTime), 44, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (2, CAST(N'2019-12-15T19:02:00.000' AS DateTime), 21, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (3, CAST(N'2019-02-17T11:39:00.000' AS DateTime), 97, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (4, CAST(N'2019-04-01T08:42:00.000' AS DateTime), 36, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (5, CAST(N'2019-01-01T15:08:00.000' AS DateTime), 88, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (6, CAST(N'2019-05-25T08:08:00.000' AS DateTime), 42, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (7, CAST(N'2019-07-29T13:37:00.000' AS DateTime), 4, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (8, CAST(N'2019-03-27T12:18:00.000' AS DateTime), 43, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (9, CAST(N'2019-10-23T18:53:00.000' AS DateTime), 76, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (10, CAST(N'2019-03-03T08:32:00.000' AS DateTime), 87, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (11, CAST(N'2019-02-18T14:44:00.000' AS DateTime), 86, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (12, CAST(N'2019-10-03T19:54:00.000' AS DateTime), 96, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (13, CAST(N'2019-11-12T18:41:00.000' AS DateTime), 22, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (14, CAST(N'2019-02-12T17:09:00.000' AS DateTime), 80, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (15, CAST(N'2019-11-01T15:39:00.000' AS DateTime), 93, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (16, CAST(N'2019-06-10T11:07:00.000' AS DateTime), 90, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (17, CAST(N'2019-06-22T12:07:00.000' AS DateTime), 7, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (18, CAST(N'2019-07-16T11:31:00.000' AS DateTime), 14, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (19, CAST(N'2019-01-07T11:22:00.000' AS DateTime), 86, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (20, CAST(N'2019-07-14T10:29:00.000' AS DateTime), 58, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (21, CAST(N'2019-11-17T17:57:00.000' AS DateTime), 67, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (22, CAST(N'2019-08-25T18:00:00.000' AS DateTime), 32, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (23, CAST(N'2019-06-07T10:05:00.000' AS DateTime), 86, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (24, CAST(N'2019-02-08T16:40:00.000' AS DateTime), 76, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (25, CAST(N'2019-01-12T15:11:00.000' AS DateTime), 12, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (26, CAST(N'2019-05-16T10:42:00.000' AS DateTime), 98, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (27, CAST(N'2019-05-25T15:29:00.000' AS DateTime), 58, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (28, CAST(N'2019-12-26T19:39:00.000' AS DateTime), 95, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (29, CAST(N'2019-07-29T13:38:00.000' AS DateTime), 46, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (30, CAST(N'2019-12-31T16:42:00.000' AS DateTime), 28, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (31, CAST(N'2019-03-08T10:24:00.000' AS DateTime), 25, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (32, CAST(N'2019-08-12T09:17:00.000' AS DateTime), 45, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (33, CAST(N'2019-11-18T08:33:00.000' AS DateTime), 23, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (34, CAST(N'2019-08-06T13:21:00.000' AS DateTime), 82, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (35, CAST(N'2019-02-25T16:25:00.000' AS DateTime), 66, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (36, CAST(N'2019-05-28T09:56:00.000' AS DateTime), 35, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (37, CAST(N'2019-11-24T13:21:00.000' AS DateTime), 41, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (38, CAST(N'2019-10-03T11:04:00.000' AS DateTime), 96, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (39, CAST(N'2019-10-11T13:27:00.000' AS DateTime), 70, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (40, CAST(N'2019-11-23T16:12:00.000' AS DateTime), 33, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (41, CAST(N'2019-07-25T18:52:00.000' AS DateTime), 58, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (42, CAST(N'2019-08-21T10:39:00.000' AS DateTime), 12, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (43, CAST(N'2019-04-09T12:02:00.000' AS DateTime), 97, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (44, CAST(N'2019-10-10T11:39:00.000' AS DateTime), 99, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (45, CAST(N'2019-07-03T16:52:00.000' AS DateTime), 86, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (46, CAST(N'2019-03-25T09:35:00.000' AS DateTime), 78, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (47, CAST(N'2019-09-22T16:57:00.000' AS DateTime), 50, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (48, CAST(N'2019-03-03T18:35:00.000' AS DateTime), 69, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (49, CAST(N'2019-08-21T17:01:00.000' AS DateTime), 76, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (50, CAST(N'2019-03-11T17:02:00.000' AS DateTime), 94, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (51, CAST(N'2019-04-28T08:46:00.000' AS DateTime), 83, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (52, CAST(N'2019-12-27T16:58:00.000' AS DateTime), 41, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (53, CAST(N'2019-12-09T11:56:00.000' AS DateTime), 16, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (54, CAST(N'2019-10-02T17:30:00.000' AS DateTime), 89, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (55, CAST(N'2019-11-18T17:32:00.000' AS DateTime), 83, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (56, CAST(N'2019-01-28T17:01:00.000' AS DateTime), 30, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (57, CAST(N'2019-10-22T12:34:00.000' AS DateTime), 23, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (58, CAST(N'2019-09-06T12:57:00.000' AS DateTime), 32, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (59, CAST(N'2019-12-04T13:10:00.000' AS DateTime), 84, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (60, CAST(N'2019-04-10T13:43:00.000' AS DateTime), 19, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (61, CAST(N'2019-02-13T16:49:00.000' AS DateTime), 49, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (62, CAST(N'2019-08-12T09:33:00.000' AS DateTime), 92, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (63, CAST(N'2019-02-05T10:48:00.000' AS DateTime), 49, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (64, CAST(N'2019-11-02T16:32:00.000' AS DateTime), 78, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (65, CAST(N'2019-11-03T13:25:00.000' AS DateTime), 26, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (66, CAST(N'2019-02-25T18:04:00.000' AS DateTime), 15, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (67, CAST(N'2019-05-15T15:17:00.000' AS DateTime), 6, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (68, CAST(N'2019-02-03T08:37:00.000' AS DateTime), 34, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (69, CAST(N'2019-08-06T14:38:00.000' AS DateTime), 17, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (70, CAST(N'2019-01-09T10:46:00.000' AS DateTime), 92, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (71, CAST(N'2019-04-08T08:45:00.000' AS DateTime), 82, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (72, CAST(N'2019-06-10T15:57:00.000' AS DateTime), 13, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (73, CAST(N'2019-11-06T10:21:00.000' AS DateTime), 96, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (74, CAST(N'2019-05-16T16:19:00.000' AS DateTime), 50, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (75, CAST(N'2019-11-27T17:14:00.000' AS DateTime), 85, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (76, CAST(N'2019-12-23T09:03:00.000' AS DateTime), 38, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (77, CAST(N'2019-06-23T14:33:00.000' AS DateTime), 58, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (78, CAST(N'2019-06-19T15:28:00.000' AS DateTime), 10, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (79, CAST(N'2019-11-29T15:53:00.000' AS DateTime), 91, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (80, CAST(N'2019-12-26T08:06:00.000' AS DateTime), 72, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (81, CAST(N'2019-07-08T15:21:00.000' AS DateTime), 20, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (82, CAST(N'2019-06-10T19:54:00.000' AS DateTime), 53, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (83, CAST(N'2019-03-01T12:00:00.000' AS DateTime), 91, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (84, CAST(N'2019-01-11T12:11:00.000' AS DateTime), 29, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (85, CAST(N'2019-12-08T16:58:00.000' AS DateTime), 13, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (86, CAST(N'2019-08-18T17:09:00.000' AS DateTime), 19, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (87, CAST(N'2019-07-10T17:54:00.000' AS DateTime), 17, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (88, CAST(N'2019-09-08T11:52:00.000' AS DateTime), 50, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (89, CAST(N'2019-07-16T09:44:00.000' AS DateTime), 100, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (90, CAST(N'2019-07-18T14:32:00.000' AS DateTime), 26, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (91, CAST(N'2019-03-31T14:53:00.000' AS DateTime), 55, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (92, CAST(N'2019-07-25T16:30:00.000' AS DateTime), 61, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (93, CAST(N'2019-07-11T16:30:00.000' AS DateTime), 63, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (94, CAST(N'2019-07-16T13:09:00.000' AS DateTime), 38, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (95, CAST(N'2019-11-23T12:58:00.000' AS DateTime), 6, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (96, CAST(N'2019-08-08T18:37:00.000' AS DateTime), 43, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (97, CAST(N'2019-03-20T18:47:00.000' AS DateTime), 25, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (98, CAST(N'2019-01-29T19:09:00.000' AS DateTime), 100, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (99, CAST(N'2019-10-18T18:40:00.000' AS DateTime), 63, 2, NULL)
GO
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (100, CAST(N'2019-07-05T16:03:00.000' AS DateTime), 61, 3, NULL)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
