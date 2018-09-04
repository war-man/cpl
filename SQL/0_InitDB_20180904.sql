use CPL;
/****** Object:  Table [dbo].[BTCPrice]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTCPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
	[Time] [bigint] NULL,
 CONSTRAINT [PK_BTCPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTCTransaction]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTCTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TxHashId] [nvarchar](100) NOT NULL,
	[UpdatedTime] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_BTCTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoinTransaction]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoinTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SysUserId] [int] NOT NULL,
	[FromWalletAddress] [nvarchar](100) NULL,
	[ToWalletAddress] [nvarchar](100) NULL,
	[CoinAmount] [decimal](18, 8) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[TokenAmount] [money] NULL,
	[Rate] [float] NULL,
	[TxHashId] [nvarchar](150) NULL,
	[Type] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Category] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Subject] [nvarchar](200) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETHTransaction]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETHTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TxHashId] [nvarchar](100) NOT NULL,
	[UpdatedTime] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_ETHTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lang]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LangContent]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[RowId] [int] NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_LangContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LangDetail]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_LangDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LangMsgDetail]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangMsgDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_LangMsgDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lottery]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lottery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phase] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Volume] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DesktopSlideImage] [nvarchar](200) NULL,
	[DesktopListingImage] [nvarchar](200) NULL,
	[MobileListingImage] [nvarchar](200) NULL,
	[Title] [nvarchar](200) NULL,
	[UnitPrice] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[MobileSlideImage] [nvarchar](200) NULL,
	[PrizeImage] [nvarchar](200) NULL,
 CONSTRAINT [PK_Lottery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryHistory]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LotteryId] [int] NOT NULL,
	[SysUserId] [int] NOT NULL,
	[Result] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[TicketNumber] [nvarchar](6) NULL,
	[UpdatedDate] [datetime] NULL,
	[LotteryPrizeId] [int] NULL,
	[TicketIndex] [int] NOT NULL,
	[TxHashId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LotteryHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryPrize]    Script Date: 04/09/2018 3:08:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryPrize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [money] NOT NULL,
	[LotteryId] [int] NOT NULL,
	[Volume] [int] NOT NULL,
	[Index] [int] NOT NULL,
 CONSTRAINT [PK_LotteryPrize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[ShortDescription] [nvarchar](2000) NOT NULL,
	[Description] [ntext] NOT NULL,
	[Image] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](400) NULL,
	[CreatedDate] [datetime] NULL,
	[LangId] [int] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePrediction]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePrediction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
	[OpenTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[PredictionResultTime] [datetime] NOT NULL,
	[PredictionPrice] [money] NOT NULL,
	[ResultPrice] [money] NULL,
	[NumberOfPredictors] [int] NULL,
	[Volume] [money] NULL,
	[Coinbase] [nvarchar](10) NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PricePrediction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionHistory]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePredictionHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PricePredictionId] [int] NOT NULL,
	[SysUserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[Prediction] [bit] NOT NULL,
	[Result] [nvarchar](20) NULL,
	[Award] [money] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PricePredictionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUser]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Mobile] [nvarchar](20) NULL,
	[ResetPasswordToken] [nvarchar](50) NULL,
	[ResetPasswordDate] [datetime] NULL,
	[ActivateToken] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[KYCVerified] [bit] NULL,
	[FrontSide] [nvarchar](80) NULL,
	[BackSide] [nvarchar](80) NULL,
	[DOB] [datetime] NULL,
	[BTCHDWalletAddressIndex] [int] NOT NULL,
	[KYCCreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ETHHDWalletAddress] [nvarchar](100) NULL,
	[ETHHDWalletAddressIndex] [int] NOT NULL,
	[BTCHDWalletAddress] [nvarchar](100) NULL,
	[BTCAmount] [decimal](18, 8) NULL,
	[ETHAmount] [decimal](18, 8) NULL,
	[TokenAmount] [money] NOT NULL,
	[Gender] [bit] NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](50) NULL,
	[City] [nvarchar](30) NULL,
	[StreetAddress] [nvarchar](100) NULL,
	[TwoFactorAuthenticationEnable] [bit] NOT NULL,
 CONSTRAINT [PK_SysUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Body] [nvarchar](50) NULL,
	[Subject] [nvarchar](200) NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Currency] ON 
GO
INSERT [dbo].[Currency] ([Id], [Name]) VALUES (1, N'ETH')
GO
INSERT [dbo].[Currency] ([Id], [Name]) VALUES (2, N'BTC')
GO
SET IDENTITY_INSERT [dbo].[Currency] OFF
GO
SET IDENTITY_INSERT [dbo].[Lang] ON 
GO
INSERT [dbo].[Lang] ([Id], [Name], [Image]) VALUES (1, N'English', N'flag-icon-us')
GO
INSERT [dbo].[Lang] ([Id], [Name], [Image]) VALUES (2, N'日本語', N'flag-icon-jp')
GO
SET IDENTITY_INSERT [dbo].[Lang] OFF
GO
SET IDENTITY_INSERT [dbo].[LangContent] ON 
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (2, 1, N'Lottery', 1, N'ShortDescription', N'Short description lottery phase 1')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (3, 1, N'Lottery', 2, N'ShortDescription', N'Short description lottery phase 2')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (4, 1, N'Lottery', 3, N'ShortDescription', N'Short description lottery phase 3')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (5, 1, N'Lottery', 4, N'ShortDescription', N'Short description lottery phase 4')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (6, 1, N'Lottery', 5, N'ShortDescription', N'Short description lottery phase 5')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (7, 1, N'Lottery', 6, N'ShortDescription', N'Short description lottery phase 6')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (8, 1, N'Lottery', 7, N'ShortDescription', N'Short description lottery phase 7')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (9, 1, N'Lottery', 8, N'ShortDescription', N'Short description lottery phase 8')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (10, 1, N'Lottery', 9, N'ShortDescription', N'Short description lottery phase 9')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (11, 1, N'Lottery', 10, N'ShortDescription', N'Short description lottery phase 10')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (12, 2, N'Lottery', 1, N'ShortDescription', N'Short description lottery phase 1')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (13, 2, N'Lottery', 2, N'ShortDescription', N'Short description lottery phase 2')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (14, 2, N'Lottery', 3, N'ShortDescription', N'Short description lottery phase 3')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (15, 2, N'Lottery', 4, N'ShortDescription', N'Short description lottery phase 4')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (16, 2, N'Lottery', 5, N'ShortDescription', N'Short description lottery phase 5')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (17, 2, N'Lottery', 6, N'ShortDescription', N'Short description lottery phase 6')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (18, 2, N'Lottery', 7, N'ShortDescription', N'Short description lottery phase 7')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (19, 2, N'Lottery', 8, N'ShortDescription', N'Short description lottery phase 8')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (20, 2, N'Lottery', 9, N'ShortDescription', N'Short description lottery phase 9')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (21, 2, N'Lottery', 10, N'ShortDescription', N'Short description lottery phase 10')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (22, 1, N'Lottery', 1, N'Description', N'Description lottery phase 1')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (23, 1, N'Lottery', 2, N'Description', N'Description lottery phase 2')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (24, 1, N'Lottery', 3, N'Description', N'Description lottery phase 3')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (25, 1, N'Lottery', 4, N'Description', N'Description lottery phase 4')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (26, 1, N'Lottery', 5, N'Description', N'Description lottery phase 5')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (27, 1, N'Lottery', 6, N'Description', N'Description lottery phase 6')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (28, 1, N'Lottery', 7, N'Description', N'Description lottery phase 7')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (29, 1, N'Lottery', 8, N'Description', N'Description lottery phase 8')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (30, 1, N'Lottery', 9, N'Description', N'Description lottery phase 9')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (31, 1, N'Lottery', 10, N'Description', N'Description lottery phase 10')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (32, 2, N'Lottery', 1, N'Description', N'Description  lottery phase 1')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (33, 2, N'Lottery', 2, N'Description', N'Description  lottery phase 2')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (34, 2, N'Lottery', 3, N'Description', N'Description lottery phase 3')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (35, 2, N'Lottery', 4, N'Description', N'Description lottery phase 4')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (36, 2, N'Lottery', 5, N'Description', N'Description lottery phase 5')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (37, 2, N'Lottery', 6, N'Description', N'Description lottery phase 6')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (38, 2, N'Lottery', 7, N'Description', N'Description lottery phase 7')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (39, 2, N'Lottery', 8, N'Description', N'Description lottery phase 8')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (40, 2, N'Lottery', 9, N'Description', N'Description lottery phase 9')
GO
INSERT [dbo].[LangContent] ([Id], [LangId], [TableName], [RowId], [FieldName], [Value]) VALUES (41, 2, N'Lottery', 10, N'Description', N'Description lottery phase 10')
GO
SET IDENTITY_INSERT [dbo].[LangContent] OFF
GO
SET IDENTITY_INSERT [dbo].[LangDetail] ON 
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1, 1, N'TokenSymbol', N'CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2, 1, N'TokenTeam', N'CPL Team')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (3, 1, N'ProfileEdit', N'Edit Profile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (4, 1, N'CredentialEdit', N'Edit Credential')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (5, 1, N'LogOut', N'Log out')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (6, 1, N'LogIn', N'Log in')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (7, 1, N'Email', N'Email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (8, 1, N'EmailRequired', N'Please fill in your email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (9, 1, N'Password', N'Password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (10, 1, N'ForgotPassword', N'Forgot password?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (11, 1, N'PasswordRequired', N'Please fill in your password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (12, 1, N'InvalidEmailPassword', N'Invalid email or password. Please try again.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (13, 1, N'NoAccount', N'Don''t have an account yet?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (14, 1, N'Copyright', N'Copyright')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (15, 1, N'Register', N'Register')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (16, 1, N'CreateAccount', N'Create an account')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (17, 1, N'ChangeLanguage', N'Change Language')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (18, 1, N'EmailInactivatingAccount', N'In-activating account. Please check your email to activate!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (19, 1, N'AccountInfoRequired', N'Please fill in your account information')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (20, 1, N'PasswordConfirm', N'Password confirm')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (21, 1, N'MismatchPassword', N'Mismatch password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (22, 1, N'AlreadyHaveAccount', N'Already have an account?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (23, 1, N'ClickHere', N'Click here')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (24, 1, N'ToLogIn', N'to log in')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (25, 1, N'ResendActivateCodeLinkDesc', N'Click <a href="/Authentication/Resend">here</a> to resend activate email. ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (26, 1, N'Dashboard', N'Dashboard')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (27, 1, N'ErrorOccurs', N'Error occurs')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (28, 1, N'ExistingEmail', N'Existing email, please use another.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (29, 1, N'IsAccountActivationEnable', N'Is account activation enable?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (30, 1, N'RegistrationSuccessful', N'Registration successful')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (31, 1, N'ActivateEmailSent', N'An activate link has been sent to your email. Please check and activate your account.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (32, 1, N'ActivationSuccessful', N'Activation successful')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (35, 1, N'Wallet', N'Wallet')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (36, 1, N'DepositAndWithdraw', N'Deposit / Withdraw')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (37, 1, N'Exchange', N'Exchange')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (38, 1, N'TotalBalance', N'Total Balance')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (39, 1, N'BTCSymbol', N'BTC')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (40, 1, N'ETHSymbol', N'ETH')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (42, 1, N'Home', N'Home')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (44, 1, N'AboutUs', N'About us')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (45, 1, N'ServiceOverview', N'Service overview')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (46, 1, N'PurchaseMethods', N'Purchase methods')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (47, 1, N'FAQ', N'FAQ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (48, 1, N'News', N'News')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (49, 1, N'Date', N'Date')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (50, 1, N'Time', N'Time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (51, 1, N'GameType', N'Game type')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (52, 1, N'Win', N'Win')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (53, 1, N'Loss', N'Loss')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (54, 1, N'Balance', N'Balance')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (55, 1, N'Captcha', N'Captcha')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (56, 1, N'CaptchaMessage', N'Please check the RECAPTCHA')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (58, 1, N'ConfirmLogOut', N'Are you sure you want to log out?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (59, 1, N'Name', N'Name')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (60, 1, N'Male', N'Male')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (61, 1, N'Female', N'Female')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (62, 1, N'DOB', N'Date of birth')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (63, 1, N'Gender', N'Gender')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (64, 1, N'FirstName', N'First name')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (65, 1, N'LastName', N'Last name')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (66, 1, N'Year', N'Year')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (67, 1, N'Month', N'Month')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (68, 1, N'Day', N'Day')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (69, 1, N'StreetAddress', N'Street address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (70, 1, N'Country', N'Country')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (71, 1, N'City', N'City')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (72, 1, N'Address', N'Address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (73, 1, N'PostalCode', N'Postal code')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (74, 1, N'Mobile', N'Mobile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (75, 1, N'Save', N'Save')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (76, 1, N'NonExistingAccount', N'Non-existing account')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (77, 1, N'PersonalInfoUpdated', N'Your account profile is updated!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (78, 1, N'FirstNameRequired', N'Please fill in first name')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (79, 1, N'LastNameRequired', N'Please fill in last name')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (80, 1, N'StreetAddressRequired', N'Please fill in street address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (81, 1, N'CountryRequired', N'Please fill in country')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (82, 1, N'CityRequired', N'Please fill in city')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (85, 1, N'MobileRequired', N'Please fill in mobile number')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (86, 1, N'InvalidDOB', N'Date of birth is invalid')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (87, 1, N'PostalCodeRequired', N'Please fill in postal code')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (88, 1, N'Welcome', N'Welcome to Crypto CPL!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (89, 1, N'EnterLogin', N'Please enter your login details!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (90, 1, N'InvalidMobile', N'Invalid mobile number')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (92, 1, N'EmailUpdated', N'Email is updated successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (94, 1, N'InvalidCurrentPassword', N'Invalid current password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (95, 1, N'PasswordUpdated', N'Password is updated successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (96, 1, N'Amount', N'Amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (97, 1, N'Award', N'Award')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (98, 1, N'Result', N'Result')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (99, 1, N'TransactionHistory', N'Transaction History')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (100, 1, N'HoldingPercentage', N'Holding Percentage')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (101, 1, N'BetStatisticChart', N'Bet Statistic Chart')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (102, 1, N'AllAsset', N'All asset in')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (103, 1, N'Bonus', N'Bonus')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (104, 1, N'ExpireIn', N'expires in')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (105, 1, N'Days', N'days')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (106, 1, N'PlayGame', N'Play Game')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (107, 1, N'Increase', N'Increase')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (108, 1, N'Transactions', N'Transactions')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (109, 1, N'View', N'View')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (110, 1, N'Check', N'Check')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (111, 1, N'GameHistory', N'Game History')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (112, 1, N'EditAccount', N'Edit Account')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (113, 1, N'Profile', N'Profile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (114, 1, N'DepositWarning', N'Remember, deposit is risk-free. If you want to take back your asset, you can withdraw them.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (115, 1, N'Cryptocurrency', N'Cryptocurrency')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (116, 1, N'Available', N'Available')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (117, 1, N'QRCode', N'QR Code')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (118, 1, N'BTCName', N'Bitcoin')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (119, 1, N'ETHName', N'Ethereum')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (120, 1, N'Copy', N'Copy')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (121, 1, N'Withdraw', N'Withdraw')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (122, 1, N'BTCWithdrawWarning', N'You are about to withdraw <span class="text-bold-700 text-uppercase mb-0">BTC</span> from your account')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (123, 1, N'ETHWithdrawWarning', N'You are about to withdraw <span class="text-bold-700 text-uppercase mb-0">ETH</span> from your account')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (124, 1, N'Max', N'Max')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (125, 1, N'TokenName', N'CPL Token')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (126, 1, N'TokenReferral', N'CPL Referral')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (127, 1, N'TokenPrice', N'CPL Price')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (128, 1, N'Raised', N'Raised')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (129, 1, N'USDSymbol', N'USD')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (130, 1, N'EditEmail', N'Edit Email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (131, 1, N'CurrentEmail', N'Current email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (132, 1, N'NewEmail', N'New email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (134, 1, N'NewEmailConfirm', N'New email confirm')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (135, 1, N'MismatchEmail', N'Mismatch email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (136, 1, N'EditPassword', N'Edit Password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (137, 1, N'CurrentPassword', N'Current password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (138, 1, N'NewPassword', N'New password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (139, 1, N'NewPasswordConfirm', N'New password confirm')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (140, 1, N'Yes', N'Yes')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (141, 1, N'Cancel', N'Cancel')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (142, 1, N'LogoutConfirm', N'Are you sure you want to logout?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (143, 1, N'Next', N'Next')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (144, 1, N'InvalidAmount', N'Invalid amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (145, 1, N'TokenAmount', N'CPL Amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (146, 1, N'BTCAmount', N'BTC Amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (147, 1, N'ETHAmount', N'ETH Amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (148, 1, N'Calculator', N'Calculator')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (149, 1, N'Confirm', N'Confirm')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (150, 1, N'ConfirmExchangeWarning', N'Please confirm the transaction!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (151, 1, N'Price', N'Price')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (152, 1, N'TokenToBTCPrice', N'1 CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (153, 1, N'TokenToETHPrice', N'1 CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (154, 1, N'ContactEmailSent', N'Your message has been sent successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (155, 1, N'InsufficientFunds', N'Insufficient funds. Please try another!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (156, 1, N'ExchangedSuccessfully', N'Exchanged successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (159, 1, N'InvalidBTCAddress', N'Invalid BTC address, please try another.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (160, 1, N'InvalidETHAddress', N'Invalid ETH address, please try another.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (161, 1, N'WithdrawedSuccessfully', N'Withdrawed successfully.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (163, 1, N'GeneratedQRCodeSuccessfully', N'Generate qrcode successfully!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (164, 1, N'Play', N'Play')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (165, 1, N'Lottery', N'Lottery')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (166, 1, N'PricePrediction', N'Price prediction')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (167, 1, N'Admin', N'Admin')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (168, 1, N'KYC', N'KYC')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (169, 1, N'KYCVerify', N'KYC Verify')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (170, 1, N'Status', N'Status')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (171, 1, N'Document', N'Document')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (172, 1, N'Action', N'Action')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (173, 1, N'Verify', N'Verify')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (174, 1, N'UsersArePending', N'users are pending')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (175, 1, N'ViewMore', N'View more')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (176, 1, N'ApplicationDate', N'Application date')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (177, 1, N'KYCVerifiedEmailSent', N'KYC is verified successfully. Email has been sent to the user!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (178, 1, N'CancelSuccessfully', N'Cancel successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (179, 1, N'KYCReceived', N'We have received your personal KYC document, please wait for our update.  ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (180, 1, N'Pending', N'Pending')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (181, 1, N'KYCConfirmed', N'Your KYC is successfully confirmed.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (182, 1, N'Verified', N'Verified')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (183, 1, N'MyIdentityDesc', N'Please fill in photo page of your passport or the front side and back side of your driver''s license')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (184, 1, N'SecurityEdit', N'Security Edit')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (185, 1, N'FrontSide', N'Front side')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (186, 1, N'BackSide', N'Back side')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (187, 1, N'EditSecurity', N'Edit Security')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (188, 1, N'YouWin', N'You Win')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (189, 1, N'TwoFactorAuthentication', N'Two-factor authentication')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (190, 1, N'TwoFactorAuthenticationShortDescription', N'Please follow the below steps for two-factor authentication:')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (191, 1, N'TwoFactorAuthenticationStep1', N'Install the authentication application on smartphone:')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (192, 1, N'TwoFactorAuthenticationStep2', N'iOS (App Store)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (193, 1, N'TwoFactorAuthenticationStep3', N'Android (Google Play)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (194, 1, N'TwoFactorAuthenticationStep4', N'Scan the QR code with the authentication application.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (195, 1, N'TwoFactorAuthenticationStep5', N'Enter the 6 digit number displayed in the application and click on activate two-factor verification.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (196, 1, N'TwoFactorAuthenticationStep6', N'Two-step authentication code will be required from the next login.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (197, 1, N'Disable', N'Disable')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (198, 1, N'InvalidPIN', N'Invalid PIN. Please try again!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (199, 1, N'EnterPINToEnable', N'Enter PIN to enable')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (200, 1, N'Enable', N'Enable')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (201, 1, N'TwoFactorAuthenticationUpdated', N'Two-factor authentication setting is updated.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (202, 1, N'PIN', N'PIN')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (203, 1, N'WaitingPIN', N'Waiting for PIN to be input')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (204, 1, N'TicketCollected', N'Ticket collected')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (205, 1, N'LotteryPuchaseNumberSelection', N'Purchase numbers selection')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (206, 1, N'Purchase', N'Purchase')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (207, 1, N'ProbabilityOfWinning', N'Probability of winning')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (212, 1, N'PercentagesInParentheses', N'Percentages in parentheses indicate the dividend payout ratio.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (213, 1, N'NotePrize', N'<span class="font-weight-bold font-italic text-warning">Note: </span> The number in parentheses is the number contained per 5000 pieces')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (214, 1, N'PurchaseLotteryConfirm', N'Please confirm your purchase.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (215, 1, N'TicketPrice', N'Ticket price')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (216, 1, N'TotalOfTickets', N'Total tickets')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (217, 1, N'TotalPrice', N'Total price')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (218, 1, N'PurchaseSuccessfully', N'You purchased successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (219, 1, N'Prize', N'Prize')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (220, 1, N'PurchaseTime', N'Purchase Time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (221, 1, N'Bet', N'Bet')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (222, 1, N'StartRate', N'Start Rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (223, 1, N'ResultRate', N'Result Rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (224, 1, N'ResultTime', N'Result Time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (225, 1, N'PricePredictionHistory', N'Price Prediction History')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (226, 1, N'Phase', N'Phase')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (227, 1, N'CreatedDate', N'Created Date')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (228, 1, N'LotteryTicketNumber', N'Ticket Number')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (229, 1, N'UpdatedDate', N'Updated Date')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (230, 1, N'PurchaseFailed', N'Purchase failed, please try again!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (231, 1, N'LotteryHistory', N'Lottery history')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (232, 1, N'PredictedTrend', N'Predicted trend')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (233, 1, N'Up', N'UP')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (234, 1, N'Down', N'Down')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (235, 1, N'Back', N'Back')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (237, 1, N'BetAmount', N'Bet amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (238, 1, N'BettingSuccessfully', N'Betting successfully!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (462, 1, N'Deposit', N'Deposit')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (466, 1, N'AllRightReserved', N'All rights reserved')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (468, 1, N'ForgotPasswordDesc', N'We will send you a secure link to reset your password shortly.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (470, 1, N'EmailNotExist', N'Email Not Exist!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (472, 1, N'Send', N'Send')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (474, 1, N'ResetYourPassword', N'Reset Your Password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (476, 1, N'NewPasswordDesc', N'Please specify your passwords as below')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (478, 1, N'NewPasswordRequired', N'Please fill in your new password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (482, 1, N'Reset', N'Reset')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (484, 1, N'PasswordResetSuccessfully', N'Password is reset successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (486, 1, N'Click', N'Click')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (488, 1, N'Here', N'here')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (492, 1, N'Hi', N'Hi')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (494, 1, N'ResetPasswordRequest', N'We received a request to reset your password for your CPL account. We''re here to help!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (496, 1, N'ButtonClickBelow', N'Please click on the button below')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (498, 1, N'NotWorkUrl', N'If the above button does not work, you can copy the following address and paste it into your browser''s address bar')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (500, 1, N'NotYourRequest', N'In case you didn''t ask to change your password, don''t worry! Your password is still safe and you can delete this email.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (502, 1, N'Cheers', N'Cheers')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (504, 1, N'ConnectWithUs', N'Connect with Us:')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (506, 1, N'ContactInfo', N'Contact info')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (510, 1, N'Website', N'Website')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (512, 1, N'ExpiredEmail24h', N'This email will be expired in 24 hours! - CPL Team')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (514, 1, N'ResetPasswordEmailSent', N'An email has been sent to your registered email address. Please check your inbox')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (516, 1, N'Contact', N'Contact')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (518, 1, N'Support', N'Support')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (520, 1, N'CategoryRequired', N'Please fill in category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (522, 1, N'Description', N'Description')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (524, 1, N'Subject', N'Subject')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (528, 1, N'DescriptionRequired', N'Please fill in description')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (530, 1, N'AskUsAnything', N'Ask us anything')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (532, 1, N'CPLTeam', N'CPL Team')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (536, 1, N'ThankYouForYourContactMessage', N'Thank you, your message is sent successfully. We will get in touch soon.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (538, 1, N'MessageSentSuccessfully', N'Message is sent successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1516, 1, N'SubjectRequired', N'Please fill in subject')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1518, 1, N'Category', N'Category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1520, 1, N'Submit', N'Submit')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1522, 1, N'MessageFromCustomer', N'Message from customer')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1524, 1, N'ResultTotteryText', N'Result lottery: Win First Prize!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1526, 1, N'PurchasedTickets', N'Purchased tickets')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1528, 1, N'SelectNumberTicket', N'Please select number of ticket')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1530, 1, N'BuyLottery', N'BUY LOTTERY!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1532, 1, N'ConfirmYourTicket', N'Confirm Your Tickets')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1534, 1, N'HintConfirmLottery1', N'All lottery and ticket information on CPL are kept on SmartContract to make it fair and transparent to all users.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1536, 1, N'HintConfirmLottery2', N'Transaction hash will be available for you to check by using Etherscan after clicking on confirm button.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1538, 1, N'HintThankYouLottery1', N'Check transaction on Etherscan:')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1540, 1, N'HintThankYouLottery2', N'Once transaction is successful, ticket number(s) will be available for you. You can check it in the Lottery history as below')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1542, 1, N'ThankYou', N'Thank You')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1544, 1, N'YouBought', N'You Bought')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1546, 1, N'GoToTopPage', N'Go to top page')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1548, 1, N'TicketsLeft', N'{0} tickets left')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1550, 1, N'Buy', N'Buy')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1552, 1, N'GeneratedQRCodeError', N'Invalid QR Code.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1554, 1, N'InvalidWithdrawAmount', N'Input amount need to be larger than 0.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1556, 1, N'InvalidAmountOrInsufficientFunds', N'Invalid amount or insufficient funds.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1558, 1, N'ContinueVerifyKYC', N'Continue to verify KYC')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1560, 1, N'WithdrawRequireProfile', N'Profile Required!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1562, 1, N'WithdrawRequireProfileContent', N'Your profile has not been registered. Please register before withdrawing!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1564, 1, N'WithdrawRequireKYC', N'KYC Required!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1566, 1, N'WithdrawRequireKYCContent', N'Your KYC has not been registered or waiting for approval. Please register and waiting for acceptance before withdrawing!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1568, 1, N'UserManagement', N'User Management')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1570, 1, N'Total', N'Total')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1572, 1, N'Search', N'Search')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1574, 1, N'AllUsers', N'All Users')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1576, 1, N'ETHWalletAddress', N'ETH Wallet Address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1578, 1, N'BTCWalletAddress', N'BTC Wallet Address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1580, 1, N'IsDeleted', N'Is Deleted')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1582, 1, N'User', N'User')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1584, 1, N'AddressRequired', N'Please fill in your address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1586, 1, N'InvalidOrExistingEmail', N'Invalid or existing email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1590, 1, N'IsTwoFactorAuthenticationEnabled', N'Is two-factor authentication enable?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1592, 1, N'Update', N'Update')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1594, 1, N'Delete', N'Delete')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1596, 1, N'DeleteSuccessfully', N'Delete Successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1598, 1, N'UpdateSuccessfully', N'Update Successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1600, 1, N'IsEnabled', N'is enabled')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1602, 1, N'IsNotEnabled', N'is not enabled.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1604, 1, N'SuccessfullyVerified', N'Successfully verified.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1606, 1, N'KYCIsPending', N'KYC Verification is pending')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1608, 1, N'KYCNotVerified', N'Your KYC is not verified.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1610, 1, N'ETHHDWalletAddress', N'ETH Receive Address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1612, 1, N'BTCHDWalletAddress', N'BTC Receive Address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1614, 1, N'History', N'History')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1616, 1, N'AboutCPL', N'About CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1618, 1, N'WhatIsCPL', N'What is CPL?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1620, 1, N'HowToPlay', N'How to play?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1622, 1, N'Game', N'Game')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1624, 1, N'Transaction', N'Transaction')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1626, 1, N'Language', N'Language')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1630, 1, N'ReadMore', N'Read more')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1632, 1, N'NewsDetail', N'News detail')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1634, 1, N'ResetPassword', N'Reset password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1636, 1, N'InvalidAmountOrInsufficientBalance', N'Invalid amount of insufficient balance')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1638, 1, N'ReceiveAddressRequired', N'Please fill in receive address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1640, 1, N'GameManagement', N'Game Management')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1642, 1, N'AllGames', N'All Games')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1644, 1, N'LotteryGames', N'Lottery Games')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1646, 1, N'Active', N'Active')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1648, 1, N'Completed', N'Completed')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1650, 1, N'Volume', N'Volume')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1652, 1, N'SlideImage', N'Slide image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1654, 1, N'DesktopListingImage', N'Desktop listing image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1656, 1, N'MobileListingImage', N'Mobile listing image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1658, 1, N'Title', N'Title')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1660, 1, N'Edit', N'Edit')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1662, 1, N'NumberTicketRequired', N'Invalid number of ticket')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1664, 1, N'CurrentEmailRequired', N'Please fill in current email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1668, 1, N'FrontSideImageRequired', N'Please fil in front side image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1670, 1, N'BackSideImageRequired', N'Please fil in back side image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1673, 1, N'BTCExchangeWarning', N'You are about to exchange <strong>BTC</strong> for <strong>CPL</strong>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1675, 1, N'ETHExchangeWarning', N'You are about to exchange <strong>ETH</strong> for <strong>CPL</strong>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1677, 1, N'Security', N'Security')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1679, 1, N'ShortDescription', N'Short Description')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1681, 1, N'TitleRequired', N'Please fill in title')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1683, 1, N'ShortDescriptionRequired', N'Please fill in short description')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1685, 1, N'Add', N'Add')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1687, 1, N'Image', N'Image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1689, 1, N'AddSuccessfully', N'Add Successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1691, 1, N'NotVerifiedYet', N'Not verified yet.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1693, 1, N'UserProfile', N'User Profile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1695, 1, N'MyProfile', N'My Profile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1697, 1, N'MoreInfo', N'more info')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1699, 1, N'ClickHereToChange', N'Click <a href="/Profile/Kyc" class="text-primary">here</a> to change.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1701, 1, N'ToWalletAddress', N'To wallet address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1703, 1, N'CoinAmount', N'Coin amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1705, 1, N'Currency', N'Currency')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1707, 1, N'Type', N'Type')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1709, 1, N'TransactionDetail', N'Transaction detail')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1711, 1, N'FromWalletAddress', N'From wallet address')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1713, 1, N'Rate', N'Rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1717, 1, N'TeamMemberNow', N'You are now a member at CPL. Hope you enjoy your stay!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1718, 1, N'PlayGameNow', N'Play game now')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1719, 1, N'KYCVerified', N'KYC is verified successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1720, 1, N'KYCVerifiedDescription', N'Congratulation, your KYC is now verified. Please feel free to participate in our affiliate program and withdraw CPL.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1721, 1, N'LotteryTabImage', N'lottery_en.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1723, 1, N'PricePerOneTicket', N'Price per one ticket')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1724, 1, N'TotalAmount', N'Total amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1725, 1, N'NumberOfLotteryTicket', N'Number of lottery tickets')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1727, 1, N'NumberOfLotteryTicketRequired', N'Please fill in number of lottery tickets!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1729, 1, N'TicketPriceRequired', N'Please fill in ticket price!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1731, 1, N'AddAndPublish', N'Add and Publish')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1733, 1, N'PrizeAwardRequired', N'Please fill in award of prize!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1735, 1, N'PrizeNumberOfTicketRequired', N'Please fill in number of ticket winner of prize!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1737, 1, N'SliderImageRequired', N'Please upload slider image for game!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1739, 1, N'DesktopImageRequired', N'Please upload desktop version image for game!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1741, 1, N'MobileImageRequired', N'Please upload mobile version image for game!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1743, 1, N'Activate', N'Activate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1745, 1, N'AddPrizeRequired', N'Please add prize for lottery game!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1747, 1, N'SaveAndPublish', N'Save And Publish')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1749, 1, N'ActivateSuccessfully', N'Activated Successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1751, 1, N'DeleteLotteryGameConfirmation', N'Are you sure you want to delete this game?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1753, 1, N'Accept', N'Accept')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1755, 1, N'ClickHereToEnableTwoFactor', N'Click <a href="/Profile/Security">here</a> to change.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1757, 1, N'KYCWarning', N'Kindly <u><a href="/Profile/Index/"> check your profile </a></u> information carefully. Once your KYC is submitted and verified, you cannot change it !')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1759, 1, N'KYCPendingNote', N'You cannot edit profile because your KYC is successfully verified by us.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1761, 1, N'KYCVerifiedNote', N'You cannot edit profile because your KYC is verifying by us.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1772, 1, N'ComingSoon', N'Coming soon')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1773, 1, N'CopiedSuccessfully', N'Copied successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1774, 1, N'NoAssets', N'No Assets Available')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1775, 1, N'NotEnoughCPL', N'You don''t have enough CPL. Please deposit and exchange')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1776, 1, N'StartDate', N'Start Date')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1777, 1, N'LetBuyLottery', N'Let''s buy lottery!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1778, 1, N'SorryForThisTime', N'Sorry for this time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1779, 1, N'YouHaveANextChance', N'You have a next chance!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1780, 1, N'OtherResult', N'Other results')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1781, 1, N'MobileSlideImage', N'Mobile slide image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1782, 1, N'DesktopSlideImage', N'Desktop slide image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1783, 1, N'PrizeImage', N'Prize image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1784, 1, N'DesktopListingImageRequired', N'Please fill in listing image for desktop')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1785, 1, N'MobileListingImageRequired', N'Please fill in listing image for mobile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1786, 1, N'DesktopSlideImageRequired', N'Please fill in slide image for desktop')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1787, 1, N'MobileSlideImageRequired', N'Please fill in slide image for mobile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1788, 1, N'PrizeImageRequired', N'Please fill in prize image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1789, 1, N'About', N'About')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1790, 1, N'TermsOfService', N'Terms of service')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1791, 1, N'PrivacyPolicy', N'Privacy policy')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1792, 1, N'UnAuthorizedError', N'You are not authorized to do this action')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1793, 1, N'BackToHome', N'Back to home')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1794, 1, N'InternalServerError', N'Internal server error')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1795, 1, N'PricePredictionTabImage', N'price_prediction_en.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1796, 2, N'PricePredictionTabImage', N'price_prediction_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1797, 1, N'SlotTabImage', N'slot_en.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1798, 2, N'SlotTabImage', N'slot_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1799, 1, N'Slot', N'Slot')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1801, 2, N'AboutCPL', N'CPLについて')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1802, 2, N'AboutUs', N'CryptoLotとは？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1803, 2, N'Accept', N'同意する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1804, 2, N'AccountInfoRequired', N'あなたのアカウント情報を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1805, 2, N'Action', N'アクション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1806, 2, N'Activate', N'アクティベート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1807, 2, N'ActivateEmailSent', N'確認メールが送信されました。 リンクをクリックしてアカウントを有効にしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1808, 2, N'ActivateSuccessfully', N'登録されました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1809, 2, N'ActivationSuccessful', N'アクティベーション成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1810, 2, N'Active', N'アクティブ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1811, 2, N'Add', N'追加')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1812, 2, N'AddAndPublish', N'追加と公開')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1813, 2, N'AddPrizeRequired', N'ロッタリーゲームの賞を追加してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1814, 2, N'Address', N'アドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1815, 2, N'AddressRequired', N'あなたのアドレスを追加してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1816, 2, N'AddSuccessfully', N'追加に成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1817, 2, N'Admin', N'管理者')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1818, 2, N'AllAsset', N'すべてのアセット')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1819, 2, N'AllGames', N'すべてのゲーム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1820, 2, N'AllRightReserved', N'All rights reserved')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1821, 2, N'AllUsers', N'すべてのユーザー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1822, 2, N'AlreadyHaveAccount', N'あなたは既にアカウントを持っていますか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1823, 2, N'Amount', N'量')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1824, 2, N'ApplicationDate', N'申込日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1825, 2, N'AskUsAnything', N'問合せ内容を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1826, 2, N'Available', N'利用可能')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1827, 2, N'Award', N'賞')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1828, 2, N'Back', N'戻る')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1829, 2, N'BackSide', N'裏面')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1830, 2, N'BackSideImageRequired', N'裏面の画像をアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1831, 2, N'Balance', N'バランス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1832, 2, N'Bet', N'ベット')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1833, 2, N'BetAmount', N'ベット額')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1834, 2, N'BetStatisticChart', N'統計グラフ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1835, 2, N'BettingSuccessfully', N'ベットに成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1836, 2, N'Bonus', N'ボーナス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1837, 2, N'BTCAmount', N'BTCの数量')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1838, 2, N'BTCExchangeWarning', N'あなたは <strong>BTC</strong> と <strong>CPL</strong>を交換しようとしています。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1839, 2, N'BTCHDWalletAddress', N'BTC受け取りアドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1840, 2, N'BTCName', N'ビットコイン')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1841, 2, N'BTCSymbol', N'BTC')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1842, 2, N'BTCWalletAddress', N'BTC　ウォレットアドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1843, 2, N'BTCWithdrawWarning', N'あなたは <span class="text-bold-700 text-uppercase mb-0">BTC</span>を、 引き出そうとしています。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1844, 2, N'ButtonClickBelow', N'下にあるボタンをクリックしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1845, 2, N'Buy', N'購入')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1846, 2, N'BuyLottery', N'くじを購入する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1847, 2, N'Calculator', N'計算する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1848, 2, N'Cancel', N'キャンセル')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1849, 2, N'CancelSuccessfully', N'キャンセル成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1850, 2, N'Captcha', N'Captcha')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1851, 2, N'CaptchaMessage', N'RECAPTCHAをチェックしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1852, 2, N'Category', N'カテゴリー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1853, 2, N'CategoryRequired', N'カテゴリーを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1854, 2, N'ChangeLanguage', N'言語を変更してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1855, 2, N'Check', N'チェック')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1856, 2, N'Cheers', N'今後とも、何卒よろしくお願い申し上げます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1857, 2, N'City', N'都道府県')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1858, 2, N'CityRequired', N'都道府県を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1859, 2, N'Click', N'クリック')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1860, 2, N'ClickHere', N'ここをクリック')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1861, 2, N'ClickHereToChange', N'変更は <a href="/Profile/Kyc" class="text-primary">ココ</a> をクリックしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1862, 2, N'ClickHereToEnableTwoFactor', N'変更は <a href="/Profile/Security">ココ</a>をクリックしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1863, 2, N'CoinAmount', N'コインの量')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1864, 2, N'ComingSoon', N'Coming soon')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1865, 2, N'Completed', N'完了')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1866, 2, N'Confirm', N'確認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1867, 2, N'ConfirmExchangeWarning', N'トランザクションの確認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1868, 2, N'ConfirmLogOut', N'本当にログアウトしますか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1869, 2, N'ConfirmYourTicket', N'チケット確認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1870, 2, N'ConnectWithUs', N'私たちと連絡をとる')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1871, 2, N'Contact', N'コンタクト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1872, 2, N'ContactEmailSent', N'あなたのメッセージは送ることに成功しました')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1873, 2, N'ContactInfo', N'コンタクト情報')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1874, 2, N'ContinueVerifyKYC', N'KYCの認証を続ける')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1875, 2, N'CopiedSuccessfully', N'コピー成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1876, 2, N'Copy', N'コピー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1877, 2, N'Copyright', N'Copyright')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1878, 2, N'Country', N'国')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1879, 2, N'CountryRequired', N'国名を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1880, 2, N'CPLTeam', N'CPLチーム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1881, 2, N'CreateAccount', N'アカウントを作成する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1882, 2, N'CreatedDate', N'登録日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1883, 2, N'CredentialEdit', N'資格情報の編集')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1884, 2, N'Cryptocurrency', N'仮想通貨')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1885, 2, N'Currency', N'通貨')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1886, 2, N'CurrentEmail', N'現在のメール')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1887, 2, N'CurrentEmailRequired', N'現在のメールアドレスを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1888, 2, N'CurrentPassword', N'現在のパスワード')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1889, 2, N'Dashboard', N'ダッシュボード')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1890, 2, N'Date', N'日付')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1891, 2, N'Day', N'日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1892, 2, N'Days', N'日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1893, 2, N'Delete', N'削除')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1894, 2, N'DeleteLotteryGameConfirmation', N'本当にこのゲームを削除しますか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1895, 2, N'DeleteSuccessfully', N'削除成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1896, 2, N'Deposit', N'入金')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1897, 2, N'DepositAndWithdraw', N'入金/出金')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1898, 2, N'DepositWarning', N'入金した後、資産を引き出したい場合は、出金することができます（KYCが必要です）。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1899, 2, N'Description', N'説明')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1900, 2, N'DescriptionRequired', N'説明を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1901, 2, N'DesktopImageRequired', N'ゲームに関するデスクトップバージョンの画像をアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1902, 2, N'DesktopListingImage', N'デスクトップサムネイルイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1903, 2, N'Disable', N'無効にする')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1904, 2, N'DOB', N'誕生日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1905, 2, N'Document', N'書類')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1906, 2, N'Down', N'下')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1907, 2, N'Edit', N'Edit')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1908, 2, N'EditAccount', N'アカウント　更新')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1909, 2, N'EditEmail', N'メールアドレス更新')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1910, 2, N'EditPassword', N'パスワード　更新')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1911, 2, N'EditSecurity', N'セキュリティ　更新')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1912, 2, N'Email', N'メールアドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1913, 2, N'EmailInactivatingAccount', N'アカウントを有効にするにはメールのリンクをクリックしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1914, 2, N'EmailNotExist', N'メールアドレスが存在しません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1915, 2, N'EmailRequired', N'あなたメールアドレスを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1916, 2, N'EmailUpdated', N'メールアドレスの更新に成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1917, 2, N'Enable', N'有効にする')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1918, 2, N'EnterLogin', N'あなたのログイン情報を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1919, 2, N'EnterPINToEnable', N'PINナンバーを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1920, 2, N'ErrorOccurs', N'エラーが発生しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1921, 2, N'ETHAmount', N'ETHの数量')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1922, 2, N'ETHExchangeWarning', N'あなたは <strong>ETH</strong> と <strong>CPL</strong>を交換しようとしています。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1923, 2, N'ETHHDWalletAddress', N'ETH受け取りアドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1924, 2, N'ETHName', N'イーサリアム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1925, 2, N'ETHSymbol', N'ETH')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1926, 2, N'ETHWalletAddress', N'ETHウォレットアドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1927, 2, N'ETHWithdrawWarning', N'あなたは<span class="text-bold-700 text-uppercase mb-0">ETH</span>を引き出そうとしています。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1928, 2, N'Exchange', N'交換')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1929, 2, N'ExchangedSuccessfully', N'交換に成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1930, 2, N'ExistingEmail', N'メールアドレスは既に存在します。ほかのアドレスを使用してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1931, 2, N'ExpiredEmail24h', N'このメールアドレスは24時間で有効期限が切れます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1932, 2, N'ExpireIn', N'期限が切れる')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1933, 2, N'FAQ', N'FAQ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1934, 2, N'Female', N'女性')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1935, 2, N'FirstName', N'名')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1936, 2, N'FirstNameRequired', N'名前')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1937, 2, N'ForgotPassword', N'パスワードを忘れましたか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1938, 2, N'ForgotPasswordDesc', N'まもなくパスワードをリセットするための安全なリンクが送信されます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1939, 2, N'FromWalletAddress', N'ウォレットアドレスから')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1940, 2, N'FrontSide', N'表面')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1941, 2, N'FrontSideImageRequired', N'表面をアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1942, 2, N'Game', N'ゲーム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1943, 2, N'GameHistory', N'ゲーム履歴')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1944, 2, N'GameManagement', N'ゲームマネジメント')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1945, 2, N'GameType', N'ゲームの種類')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1946, 2, N'Gender', N'性別')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1947, 2, N'GeneratedQRCodeError', N'無効なQRコードです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1948, 2, N'GeneratedQRCodeSuccessfully', N'QRコードの生成に成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1949, 2, N'GoToTopPage', N'トップページへ戻る')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1950, 2, N'Here', N'ここ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1951, 2, N'Hi', N'Hi')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1952, 2, N'HintConfirmLottery1', N'CPLに関するすべてのくじの情報は、すべてのユーザーに公正で透明なものにするためにSmartContractに保持されます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1953, 2, N'HintConfirmLottery2', N'Transaction hashは、確認ボタンをクリックして、Etherscan上で確認することができます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1954, 2, N'HintThankYouLottery1', N'Etherscanのトランザクションをチェックする：')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1955, 2, N'HintThankYouLottery2', N'トランザクションに成功すると、くじの履歴からチケットナンバーを確認することができます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1956, 2, N'History', N'履歴')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1957, 2, N'HoldingPercentage', N'所有比率')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1958, 2, N'Home', N'Home')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1959, 2, N'HowToPlay', N'プレイ方法')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1960, 2, N'Image', N'イメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1961, 2, N'Increase', N'増加')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1962, 2, N'InsufficientFunds', N'残高不足です。もう一度お試しください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1963, 2, N'InvalidAmount', N'無効な金額です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1964, 2, N'InvalidAmountOrInsufficientBalance', N'残高不足')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1965, 2, N'InvalidAmountOrInsufficientFunds', N'無効な金額、もしくは資金が不十分です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1966, 2, N'InvalidBTCAddress', N'BTCアドレスが無効です。もう一度お試しください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1967, 2, N'InvalidCurrentPassword', N'無効なパスワードです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1968, 2, N'InvalidDOB', N'生年月日が無効です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1969, 2, N'InvalidEmailPassword', N'メールアドレス、パスワードが無効です。再度お試しください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1970, 2, N'InvalidETHAddress', N'無効なETHアドレスです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1971, 2, N'InvalidMobile', N'無効な携帯電話番号です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1972, 2, N'InvalidOrExistingEmail', N'無効または既に存在しているメールアドレスです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1973, 2, N'InvalidPIN', N'無効なPINナンバーです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1974, 2, N'InvalidWithdrawAmount', N'入力量は0より大きくする必要があります。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1975, 2, N'IsAccountActivationEnable', N'アカウントの有効/無効')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1976, 2, N'IsDeleted', N'削除')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1977, 2, N'IsEnabled', N'有効になりました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1978, 2, N'IsNotEnabled', N'有効ではありません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1979, 2, N'IsTwoFactorAuthenticationEnabled', N'2段階認証の有効/無効')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1980, 2, N'KYC', N'KYC')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1981, 2, N'KYCConfirmed', N'あなたのKYCは認証に成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1982, 2, N'KYCIsPending', N'KYCは認証中です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1983, 2, N'KYCNotVerified', N'あなたのKYCは認証されませんでした。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1984, 2, N'KYCPendingNote', N'KYCが正常に認証されたため、プロフィールを編集できません。変更を希望される場合はお問合せ下さい。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1985, 2, N'KYCReceived', N'私たちはあなたの身分証明書を受け取りました。認証されるまでしばらくお待ちください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1986, 2, N'KYCVerified', N'KYC認証は成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1987, 2, N'KYCVerifiedDescription', N'おめでとうございます、あなたのKYCは認証されました。 あなたの資産を引き出すことができます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1988, 2, N'KYCVerifiedEmailSent', N'KYCが正常に検証されました。 電子メールがユーザーに送信されました！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1989, 2, N'KYCVerifiedNote', N'あなたのKYCは認証されていないため、プロフィールを変更することはできません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1990, 2, N'KYCVerify', N'KYC認証')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1991, 2, N'KYCWarning', N'あなたの<u><a href="/Profile/Index/"> プロフィール</a></u>を確認してください。一度KYCを提出し、承認されると、プロフィールを変更することはできません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1992, 2, N'Language', N'言語')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1993, 2, N'LastName', N'氏')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1994, 2, N'LastNameRequired', N'氏を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1995, 2, N'LogIn', N'ログイン')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1996, 2, N'LogOut', N'ログアウト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1997, 2, N'LogoutConfirm', N'本当にログアウトしますか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1998, 2, N'Loss', N'ロス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1999, 2, N'Lottery', N'くじ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2000, 2, N'LotteryGames', N'仮想通貨くじ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2001, 2, N'LotteryHistory', N'くじ履歴')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2002, 2, N'LotteryPuchaseNumberSelection', N'購入枚数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2003, 2, N'LotteryTabImage', N'lottery_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2004, 2, N'LotteryTicketNumber', N'チケットNo.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2005, 2, N'Male', N'男性')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2006, 2, N'Max', N'最大')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2007, 2, N'MessageFromCustomer', N'カスタマーからのメッセージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2008, 2, N'MessageSentSuccessfully', N'メッセージを送信しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2009, 2, N'MismatchEmail', N'メールアドレスが正しくありません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2010, 2, N'MismatchPassword', N'パスワードが正しくありません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2011, 2, N'Mobile', N'モバイル')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2012, 2, N'MobileImageRequired', N'モバイル用の画像をアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2013, 2, N'MobileListingImage', N'モバイルサムネイルイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2014, 2, N'MobileRequired', N'携帯電話番号を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2015, 2, N'Month', N'月')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2016, 2, N'MoreInfo', N'more info')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2017, 2, N'MyIdentityDesc', N'パスポートの写真があるページ、もしくは運転免許証の前面、後面をアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2018, 2, N'MyProfile', N'マイプロフィール')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2019, 2, N'Name', N'くじ名')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2020, 2, N'NewEmail', N'新しいメールアドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2021, 2, N'NewEmailConfirm', N'新しいメールアドレスの確認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2022, 2, N'NewPassword', N'新しいパスワード')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2023, 2, N'NewPasswordConfirm', N'新しいパスワードの確認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2024, 2, N'NewPasswordDesc', N'パスワードを指定してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2025, 2, N'NewPasswordRequired', N'新しいパスワードを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2026, 2, N'News', N'ニュース')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2027, 2, N'NewsDetail', N'ニュース詳細')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2028, 2, N'Next', N'次')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2029, 2, N'NoAccount', N'まだアカウントをお持ちではありませんか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2030, 2, N'NoAssets', N'利用可能な資産はありません')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2031, 2, N'NonExistingAccount', N'存在しないアカウントです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2032, 2, N'NotEnoughCPL', N'十分なCPLがありません。入金してCPLに交換してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2033, 2, N'NotePrize', N'<span class="font-weight-bold font-italic text-warning">注意 </span>: カッコ内の数字は5000枚に含まれる数です')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2034, 2, N'NotVerifiedYet', N'認証が終わってません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2035, 2, N'NotWorkUrl', N'上記のボタンが機能しない場合は、次のアドレスをコピーしてブラウザのアドレスバーに貼り付けることができます')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2036, 2, N'NotYourRequest', N'あなたがパスワード変更を依頼しなかった場合でも、心配しないでください。あなたのパスワードは安全であり、このメールを削除することができます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2037, 2, N'NumberOfLotteryTicket', N'くじの枚数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2038, 2, N'NumberOfLotteryTicketRequired', N'くじの枚数を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2039, 2, N'NumberTicketRequired', N'チケット番号が無効です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2040, 2, N'Password', N'パスワード')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2041, 2, N'PasswordConfirm', N'パスワード確認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2042, 2, N'PasswordRequired', N'あなたのパスワードを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2043, 2, N'PasswordResetSuccessfully', N'パスワードはリセットされました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2044, 2, N'PasswordUpdated', N'パスワードの更新に成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2045, 2, N'Pending', N'保留')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2046, 2, N'PercentagesInParentheses', N'括弧内のパーセントは配当率を示しています。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2047, 2, N'PersonalInfoUpdated', N'あなたのアカウントプロフィールは更新しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2048, 2, N'Phase', N'ゲームID')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2049, 2, N'PIN', N'PIN')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2050, 2, N'Play', N'Play')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2051, 2, N'PlayGame', N'ゲームで遊ぶ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2052, 2, N'PlayGameNow', N'今すぐゲームで遊ぶ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2053, 2, N'PostalCode', N'郵便番号')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2054, 2, N'PostalCodeRequired', N'郵便番号を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2055, 2, N'PredictedTrend', N'予想されるトレンド')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2056, 2, N'Price', N'価格')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2057, 2, N'PricePerOneTicket', N'チケット価格')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2058, 2, N'PricePrediction', N'価格予想')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2059, 2, N'PricePredictionHistory', N'価格予想履歴')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2060, 2, N'Prize', N'賞')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2061, 2, N'PrizeAwardRequired', N'商品を記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2062, 2, N'PrizeNumberOfTicketRequired', N'当選賞品本数を記入してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2063, 2, N'ProbabilityOfWinning', N'勝利の確率')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2064, 2, N'Profile', N'プロフィール')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2065, 2, N'ProfileEdit', N'プロフィール変更')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2066, 2, N'Purchase', N'購入')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2067, 2, N'PurchasedTickets', N'チケット販売数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2068, 2, N'PurchaseFailed', N'購入に失敗しました。再度お試しください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2069, 2, N'PurchaseLotteryConfirm', N'購入内容を確認してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2070, 2, N'PurchaseMethods', N'購入方法')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2071, 2, N'PurchaseSuccessfully', N'あなたの購入は成功しました')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2072, 2, N'PurchaseTime', N'購入時間')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2073, 2, N'QRCode', N'QR コード')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2074, 2, N'Raised', N'上昇')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2075, 2, N'Rate', N'レート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2076, 2, N'ReadMore', N'Read more')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2077, 2, N'ReceiveAddressRequired', N'受信アドレスを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2078, 2, N'Register', N'登録')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2079, 2, N'RegistrationSuccessful', N'登録成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2080, 2, N'ResendActivateCodeLinkDesc', N' <a href="/Authentication/Resend">ここ</a>をクリックすると、メールを再送します。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2081, 2, N'Reset', N'リセット')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2082, 2, N'ResetPassword', N'リセットパスワード')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2083, 2, N'ResetPasswordEmailSent', N'登録されたメールアドレスにメールが送信されました。 あなたの受信トレイを確認してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2084, 2, N'ResetPasswordRequest', N'お客様のCPLアカウントのパスワードを再設定するリクエストを受け取りました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2085, 2, N'ResetYourPassword', N'パスワードのリセット')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2086, 2, N'Result', N'結果')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2087, 2, N'ResultRate', N'レート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2088, 2, N'ResultTime', N'完了時間')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2089, 2, N'ResultTotteryText', N'抽選の結果：1等賞を受賞しました！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2090, 2, N'Save', N'保存')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2091, 2, N'SaveAndPublish', N'保存と公開')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2092, 2, N'Search', N'検索')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2093, 2, N'Security', N'セキュリティ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2094, 2, N'SecurityEdit', N'セキュリティの変更')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2095, 2, N'SelectNumberTicket', N'チケット枚数を選択して下さい。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2096, 2, N'Send', N'送信')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2097, 2, N'ServiceOverview', N'サービス全般')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2098, 2, N'ShortDescription', N'要約')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2099, 2, N'ShortDescriptionRequired', N'要約を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2100, 2, N'SlideImage', N'スライダーイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2101, 2, N'SliderImageRequired', N'ゲームのスライダーイメージをアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2102, 2, N'StartDate', N'開始日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2103, 2, N'StartRate', N'開始レート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2104, 2, N'Status', N'状態')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2105, 2, N'StreetAddress', N'住所')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2106, 2, N'StreetAddressRequired', N'住所を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2107, 2, N'Subject', N'件名')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2108, 2, N'SubjectRequired', N'件名を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2109, 2, N'Submit', N'提出')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2110, 2, N'SuccessfullyVerified', N'認証が成功しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2111, 2, N'Support', N'サポート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2112, 2, N'TeamMemberNow', N'あなたは現在CPLのメンバーです。 お楽しみください！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2113, 2, N'ThankYou', N'ありがとうございます')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2114, 2, N'ThankYouForYourContactMessage', N'ありがとうございます。あなたのメッセージは送信に成功しました。回答まで少々お待ちください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2115, 2, N'TicketCollected', N'チケットを集めました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2116, 2, N'TicketPrice', N'チケット価格')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2117, 2, N'TicketPriceRequired', N'チケット価格を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2118, 2, N'TicketsLeft', N'チケット販売数 {0}')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2119, 2, N'Time', N'時間')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2120, 2, N'Title', N'タイトル')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2121, 2, N'TitleRequired', N'タイトルを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2122, 2, N'TokenAmount', N'CPLの数量')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2123, 2, N'TokenName', N'CPLトークン')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2124, 2, N'TokenPrice', N'CPL価格')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2125, 2, N'TokenReferral', N'CPL参照')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2126, 2, N'TokenSymbol', N'CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2127, 2, N'TokenTeam', N'CPLチーム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2128, 2, N'TokenToBTCPrice', N'1 CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2129, 2, N'TokenToETHPrice', N'1 CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2130, 2, N'ToLogIn', N'ログインへ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2131, 2, N'Total', N'合計')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2132, 2, N'TotalAmount', N'総額')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2133, 2, N'TotalBalance', N'合計バランス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2134, 2, N'TotalOfTickets', N'合計チケット数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2135, 2, N'TotalPrice', N'合計金額')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2136, 2, N'ToWalletAddress', N'ウォレットアドレス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2137, 2, N'Transaction', N'取引')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2138, 2, N'TransactionDetail', N'取引詳細')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2139, 2, N'TransactionHistory', N'取引履歴')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2140, 2, N'Transactions', N'取引')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2141, 2, N'TwoFactorAuthentication', N'2段階認証')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2142, 2, N'TwoFactorAuthenticationShortDescription', N'2段階認証の場合は、以下の手順に従ってください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2143, 2, N'TwoFactorAuthenticationStep1', N'スマートフォンに、2段階認証をインストールします。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2144, 2, N'TwoFactorAuthenticationStep2', N'iOS (App Store)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2145, 2, N'TwoFactorAuthenticationStep3', N'Android (Google Play)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2146, 2, N'TwoFactorAuthenticationStep4', N'認証アプリケーションでQRコードをスキャンします。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2147, 2, N'TwoFactorAuthenticationStep5', N'アプリケーションに表示されている6桁の数字を入力し、2段階認証の有効化をクリックします。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2148, 2, N'TwoFactorAuthenticationStep6', N'2段階認証コードは、次のログイン時に必要になります。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2149, 2, N'TwoFactorAuthenticationUpdated', N'2段階認証の設定が更新されました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2150, 2, N'Type', N'タイプ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2151, 2, N'Up', N'上')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2152, 2, N'Update', N'更新')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2153, 2, N'UpdatedDate', N'更新日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2154, 2, N'UpdateSuccessfully', N'更新成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2155, 2, N'USDSymbol', N'USD')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2156, 2, N'User', N'ユーザー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2157, 2, N'UserManagement', N'ユーザーマネジメント')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2158, 2, N'UserProfile', N'ユーザープロフィール')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2159, 2, N'UsersArePending', N'ユーザーは保留中です')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2160, 2, N'Verified', N'承認済み')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2161, 2, N'Verify', N'承認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2162, 2, N'View', N'詳細')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2163, 2, N'ViewMore', N'その他詳細')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2164, 2, N'Volume', N'量')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2165, 2, N'WaitingPIN', N'PINの入力待ち')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2166, 2, N'Wallet', N'ウォレット')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2167, 2, N'Website', N'ウェブサイト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2168, 2, N'Welcome', N'ようこそCRYPTOLOTへ!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2169, 2, N'WhatIsCPL', N'CPLとは？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2170, 2, N'Win', N'当選')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2171, 2, N'Withdraw', N'出金')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2172, 2, N'WithdrawedSuccessfully', N'出金成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2173, 2, N'WithdrawRequireKYC', N'KYCの提出が必要です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2174, 2, N'WithdrawRequireKYCContent', N'あなたのKYCは登録されていないか、承認待ちです。出金前に登録を行ってください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2175, 2, N'WithdrawRequireProfile', N'プロフィールが必要です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2176, 2, N'WithdrawRequireProfileContent', N'あなたのプロフィールは登録されていません。出金前に登録してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2177, 2, N'Year', N'年')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2178, 2, N'Yes', N'はい')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2179, 2, N'YouBought', N'あなたの購入')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2180, 2, N'YouWin', N'あなたの勝利')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2181, 2, N'DesktopListingImageRequired', N'デスクトップのリスティングイメージをアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2182, 2, N'DesktopSlideImage', N'デスクトップスライダーイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2183, 2, N'DesktopSlideImageRequired', N'デスクトップのスライダーイメージをアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2184, 2, N'MobileListingImageRequired', N'モバイルのリスティングイメージを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2185, 2, N'MobileSlideImage', N'モバイルスライダーイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2186, 2, N'MobileSlideImageRequired', N'モバイルスライダーイメージをアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2187, 2, N'OtherResult', N'その他の結果')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2188, 2, N'PrizeImage', N'賞金イメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2189, 2, N'PrizeImageRequired', N'賞金イメージをアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2190, 2, N'YouHaveANextChance', N'次のチャンスに期待しましょう！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2191, 2, N'SorryForThisTime', N'今回は残念でした。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2192, 2, N'LetBuyLottery', N'くじを購入しましょう！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2193, 2, N'About', N'About')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2194, 2, N'TermsOfService', N'利用規約')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2195, 2, N'PrivacyPolicy', N'プライバシーポリシー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2196, 2, N'UnAuthorizedError', N'あなたはこの操作を行う権限がありません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2197, 2, N'BackToHome', N'Homeへ戻る')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2198, 2, N'InternalServerError', N'Internal server error')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2199, 2, N'PricePredictionTabImage', N'price_prediction_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2200, 2, N'PricePredictionTabImage', N'price_prediction_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2201, 2, N'SlotTabImage', N'slot_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2202, 2, N'SlotTabImage', N'slot_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2203, 2, N'Slot', N'スロット')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2204, 1, N'PricePredictionMobileTabImage', N'price_prediction_mobile_en.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2205, 2, N'PricePredictionMobileTabImage', N'price_prediction_jp.png')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2206, 1, N'PleaseSelect', N'Please select')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2207, 2, N'PleaseSelect', N'選択してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2208, 1, N'PricePredictionGame', N'Price Prediction Game')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2209, 2, N'PricePredictionGame', N'価格予測ゲーム​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2210, 1, N'SlotGame', N'Slot Game')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2211, 2, N'SlotGame', N'スロットゲーム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2212, 1, N'SubmitAndPublish', N'Submit & Publish')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2213, 2, N'SubmitAndPublish', N'追加と公開')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2214, 1, N'ContactRegister', N'Register')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2215, 2, N'ContactRegister', N'登録について')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2216, 1, N'ContactLogIn', N'LogIn')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2217, 2, N'ContactLogIn', N'ログインについて')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2218, 1, N'ContactDeposit', N'Deposit')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2219, 2, N'ContactDeposit', N'入金について')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2220, 1, N'ContactWithdraw', N'Withdraw')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2221, 2, N'ContactWithdraw', N'出金について​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2222, 1, N'ContactKYC', N'KYC')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2223, 2, N'ContactKYC', N'KYCについて')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2224, 1, N'ContactLottery', N'Lottery')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2225, 2, N'ContactLottery', N'くじについて')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2226, 1, N'ContactOther', N'Other')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2227, 2, N'ContactOther', N'その他')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2228, 1, N'ProfileRequiredBeforeKYC', N'Please <a href=''/Profile/Index''>fill in the profile</a> before submiting KYC.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2229, 2, N'ProfileRequiredBeforeKYC', N'<a href=''/Profile/Index''>プロフィール</a>をすべて記入して下さい。本人確認書類は、プロフィール入力後にアップロード可能です。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2230, 1, N'KYCSubmitted', N'Your kyc is submitted successfully')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2231, 2, N'KYCSubmitted', N'あなたのkycは正常に送信されました')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2232, 1, N'PrizeNumber', N'Prize #{0}')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2233, 2, N'PrizeNumber', N'{0}等賞')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2234, 1, N'RegisterActivate', N'You are now registered. Please click on the button below to activate your account')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2235, 2, N'RegisterActivate', N'この度はCPLプロジェクトへのご参加誠に有難うございます。    お客様のご登録はまだ完了致しておりません。  以下の「アクティブ化する」をクリックして頂きアカウントの本登録をお願い致します。  ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2236, 1, N'PreviouslyActivated', N'Your account is activated previously.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2237, 2, N'PreviouslyActivated', N'お客様のアカウントは以前に有効化されています。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2238, 1, N'RequestNotExist', N'Request does not exist. Please try again.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2239, 2, N'RequestNotExist', N'リクエストは存在しません。再度お試し下さい。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2240, 1, N'ClickHereToAskResetPassword', N'Click <a href=''/Authentication/ForgotPassword''>here</a> to submit a new request to reset password')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2241, 2, N'ClickHereToAskResetPassword', N'パスワードのリセットは <a href=''/Authentication/ForgotPassword''>こちら</a>をクリック')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2242, 1, N'ExpiredResetPasswordToken', N'Reset password token is expired.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2243, 2, N'ExpiredResetPasswordToken', N'パスワードの確認メールは期限切れです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2244, 1, N'ClickHereToLogIn', N'Click <a href=''/Authentication/LogIn''>here</a> to log in')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2245, 2, N'ClickHereToLogIn', N'ログインは<a href=''/Authentication/LogIn''>こちら</a>をクリック')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2246, 1, N'ExpiredActivateToken', N'Activate link is expired.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2247, 2, N'ExpiredActivateToken', N'アクティベートトークンは期限切れです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2248, 1, N'AccountIsActivated', N'Account is activated successfully.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2249, 2, N'AccountIsActivated', N'アカウントは、有効になりました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2250, 1, N'ClickHereToReturnToTopPage', N'Click <a href=''/Home/Index''>here</a> to return to top page')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2251, 2, N'ClickHereToReturnToTopPage', N'トップページに<a href=''/Home/Index''>戻る</a>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2252, 1, N'ClickHereToRequestNewActivateToken', N'Click <a href=''/Authentication/Resend''>here</a> to request a new activate link')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2253, 2, N'ClickHereToRequestNewActivateToken', N'確認メールの再送信は<a href=''/Authentication/Resend''>こちら</a>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2254, 1, N'InvalidToken', N'Invalid token. Please try again.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2255, 2, N'InvalidToken', N'無効なトークンです。再度お試しください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2256, 1, N'ResendActivateCode', N'Resend activate link')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2257, 2, N'ResendActivateCode', N'確認メールを再送信する。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2258, 1, N'ResendActivateCodeDesc', N'We will send a new link to activate your account')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2259, 2, N'ResendActivateCodeDesc', N'アカウントの確認メールを送ります。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2260, 1, N'InvalidOrNonExistingEmail', N'Invalid or non-existing email')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2261, 2, N'InvalidOrNonExistingEmail', N'無効、もしくは存在しないメールアドレスです。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2262, 1, N'Resend', N'Resend')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2263, 2, N'Resend', N'再送信')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2264, 1, N'NewActivateCodeSent', N'New activate link has been sent to your email. Please check and activate your account.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2265, 2, N'NewActivateCodeSent', N'新しいアカウント確認メールが送信されました。メールを確認して、アカウントを有効にしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2266, 1, N'HowToRegister', N'How To Register')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2267, 2, N'HowToRegister', N'登録方法')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2268, 1, N'HowToDepositAndExchange', N'Deposit & Exchange')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2269, 2, N'HowToDepositAndExchange', N'入金＆CPL交換方法')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2270, 1, N'HowToPlayLottery', N'How to play')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2271, 2, N'HowToPlayLottery', N'遊び方')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2272, 1, N'HowToWithDraw', N'Withdraw')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2273, 2, N'HowToWithDraw', N'出金方法')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2274, 1, N'HowToPlayDesktopVersion', N'Desktop Version')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2275, 2, N'HowToPlayDesktopVersion', N'デスクトップ版')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2276, 1, N'HowToPlayMobileVersion', N'Mobile Version')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2277, 2, N'HowToPlayMobileVersion', N'モバイル版')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2278, 1, N'NoTicketsLeft', N'There are {0} tickets left!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2279, 2, N'NoTicketsLeft', N'{0}個のチケットが残っています！')
GO
SET IDENTITY_INSERT [dbo].[LangDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[LangMsgDetail] ON 
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (1, 1, N'LotteryDescription', N'<p>When the number of purchased lottery tickets reach the upper limit, we will make a lottery by Smart Contract.​</p>
<p>Lottery will be held at 0:00 am in Japan time and will be announced on the user''s management screen at 10 AM in the next morning.​</p>
<p>If the number of purchases does not reach the upper limit, it will be carried over to the next day until the upper ​limit is reached.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (2, 2, N'LotteryDescription', N'<p>仮想通貨くじの購入数が上限に達した段階で、スマートコントラクトによる抽選を行います。​</p>  <p>抽選時間は日本時間午前0時に行われ、翌朝10時にユーザー様の管理画面上で発表されます。​</p>  <p>（購入数が上限に達しない場合は、上限に達するまで翌日に持ち越されます。)</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (3, 1, N'WhatIsCPL', N'<p>CRYPTOLOT is a lottery web service that player can join by using Bitcoin (BTC) or Ethereum (ETH).</p>
<p>You can enjoy the lottery game by converting the Bitcoin or the Ethereum to token named CPL.</p>
<p>Everyone can feel free to join, and a large prize money that can be expected!</p>
<p>How to play is also very easy.</p>
<p>Based on the CPL token purchased by user, this game will lottery on Ethereum Smart Contract.</p>
<p>So you can participate in the game without fraud by fair lottery.</p>
<p>We prepare lotteries with a high probability of winning, and high prize of winning!</p>
<p>CPL can be exchanged to ETH, BTC at any time.</p>
<p>There is no limit on the number of purchases Lottery.</p>
<p>In the future, we also have plan to make more game such as currency price prediction etc,</p>
<p>We are going to have a lot of games that anyone have Cryptocurrency can easily enjoy.</p>
<p>Let''s do it!</p>
<p>We look forward to your continued join of CRYPTOLOT, thank you for your continued support.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (4, 2, N'WhatIsCPL', N'<p>CRYPTOLOT（クリプトロト）は、ビットコインやイーサリアムで参加できるロト(仮想通貨くじ）サイトです。<br />ビットコインやイーサリアムをCPLと名付けられたトークンに変換して、仮想通貨くじを楽しむことができます。<br />CRYPTOLOTでは、仮想通貨くじにイーサリアムのスマートコントラクト上での抽選を採用しています。この抽選方法により、不正が行われる心配なく、安心してゲームに参加できます。</p>
<p>賞金として受け取ったCPLは、ビットコイン、イーサリアムへの交換がいつでも可能です。</p>
<p>CRYPTOLOTでは、当選確率の高いくじや、一攫千金を期待できる高額賞金もご用意しています。また、今後当サイトでは仮想通貨くじだけでなく、仮想通貨の価格予想など、仮想通貨をお持ちの方であれば、誰でも簡単に楽しむことのできるエンターテイメントを多数揃えて参ります。<br /> <br />Let''s do it!</p>
<p>CRYPTOLOTでは、ユーザー様が常にドキドキすることができる新しい企画を提供してまいります。<br />今後とも、CRYPTOLOTをご愛顧のほど、何卒よろしくお願い申し上げます。</p>
<p>&nbsp;</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (5, 1, N'PrivacyPolicy', N'Website of www.cryptolot.com (hereinafter "the service") is operated by A Company (hereinafter "our company").
                                In this page we will inform you of the policies concerning the collection, use and disclosure of personal information when using this service and the policy of data handling by customers using this service (hereinafter "user").
                                We will use your data to provide and improve our services. By using this service, you agree to collect and use information in accordance with this policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meaning as our terms of service accessible from www.cryptolot.com.
                                <ol class="text-justify pl-1">
                                    <li>
                                        <h5 class="font-weight-bold">Scope of this policy</h5>
                            <p>We handle customer''s personal information for achieving its purpose of use in various services provided by our company. We will not use your personal information beyond the purpose of use indicated to you unless it falls under the exception specified by the Personal Information Protection Act.</p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Types of personal data to be collected</h5>
                                <p>
                                    While using this service you may ask us to provide specific personal identification information ("Personal Data") that we can use to contact you or verify your identity. Personally identifiable information includes (but is not limited to): e-mail address, last name and first name, phone number, address (state, province, zip code, city), driver''s license number, passport number, cookies and usage data.
                                </p>
                                <ol class="pl-1">
                                    <li>
                                        <h6>Collection of use data of this service</h5>
                                        <p>This service may collect information on how the service is accessed and used ("usage data"). This usage data includes the internet protocol address (IP address, etc.) of your computer, the type of browser, the browser version, the page of the accessed service, the date and time of visit, the time spent on those pages, the device identifier and other Contains diagnostic data.</p>
                                    </li>
                                    <li>
                                        <h6>Tracking & cookie data</h5>
                                        <p>
                                            We use cookies and similar tracking techniques to keep track of user activity and maintain certain information.
                                            A cookie is a file that contains a small amount of data that may contain anonymous unique identifiers. Cookies are sent from the website to the browser and stored on the device. The user can tell the browser to deny all cookies and to indicate that the cookie has been sent. However, if you do not accept cookies, you may not be able to use some of our services.
                                        </p>
                                    </li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">About the use of collected personal data</h5>
                                <p>With this service, we will use personal information acquired within the scope of the following purpose of use.</p>
                                <ol class="pl-1">
                                    <li>Maintaining the quality of services provided by us</li>
                                    <li>Notice about change of service provided by our company</li>
                                    <li>Permission to participate in interactive functions of services provided by us</li>
                                    <li>Providing support services to users</li>
                                    <li>Collect opinions for improving services provided by the Company</li>
                                    <li>Monitor usage of services provided by the Company</li>
                                    <li>Detect and cope with technical problems, create preventive measures</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Data transfer</h5>
                                <p>
                                    Your information, including personal data, may be transferred and maintained to computers outside the state, country or other jurisdiction where the data protection law may differ from your jurisdictional area.
                                    Please be aware that if you choose to migrate outside and choose to provide information to us, you may transfer data including personal data to other countries and process it.
                                    The consent to this privacy policy and the submission of personal information represent the user''s consent to the transfer.
                                    This service will take all necessary measures to ensure that your data is safely handled in accordance with this Privacy Policy.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Disclosure of data</h5>
                                <p>This service may disclose your personal information for the following purposes.</p>
                                <ul class="pl-1">
                                    <li>To comply with legal obligations and to protect legal liability</li>
                                    <li>To prevent or investigate cheating related to this service</li>
                                    <li>To protect personal safety of this service or user </li>
                                </ul>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Data security</h5>
                                <p>The security of your data is important to us, but the sending method and electronic storage method on the Internet are not 100% secure. We strive to protect your personal data by using commercially acceptable measure, but do not guarantee absolute safety.</p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Service Provider</h5>
                                <p>
                                    This service is intended to enable third party companies and individuals to collect data for the purpose of facilitating the service, providing services acting on behalf of the service, implementing related services, or analyzing how to use the service It may be used.
                                    These third parties are obliged to access your personal data only to do these work for us and not disclose or use it for other purposes.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Link to another site</h5>
                                <p>We do not install any of our products which require this (osCommerce templates, Zen Cart templates, etc.). Installation is a paid service which is not included in the package price.</p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Children''s privacy</h5>
                                <p>
                                    Our service does not deal with those under the age of 18 ("children").
                                    We will deliberately never collect personal information from those under the age of 18. If you know that you are a parent or guardian and your child is providing us with personal information, please contact us. If you notice that collecting personal data from your child without confirming your parent''s consent, follow the procedure to remove that information from the server.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Changes to this privacy policy</h5>
                                <p>From time to time, we may update our privacy policy. By posting a new privacy policy on this page we will inform you of changes.</p>
                            </li>
                            </ol>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (6, 1, N'TermsOfService', N'This Terms of Service (the "Terms of Service") is provided by CRYPTOLOT (hereinafter referred to as "the Service") on the CRYPTOLOT website (hereinafter referred to as "the Website") It defines the usage conditions of the service.
                                <ol class="text-justify pl-1">
                                    <li>
                                        <h5 class="font-weight-bold">Application</h5>
                            <p>This terms apply to all relationships of users involved in using this service.</p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Regarding usage registration</h5>
                                <ol class="pl-1">
                                    <li>Registration applicant applies for registration for use according to the method defined by this service, and this service approves this and registration of use will be completed.</li>
                                    <li>This service may not approve the application for use registration when judging that the applicant for use registration has the following reasons and does not undertake any disclosure obligation for the reason.</li>
                                    <ol class="pl-2">
                                        <li>the user submit a false information upon applying for registration of use</li>
                                        <li>If it is an application from a person who has violated these terms</li>
                                        <li>Other cases when this service judging that the user is not suit to use registration</li>
                                    </ol>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">User ID and password management</h5>
                                <ol class="pl-1">
                                    <li>The user manage the user ID and password of this service at its own risk.</li>
                                    <li>In no case can the user transfer or rent a user ID and password to a third party. If this user is logged in as a combination of user ID and password in accordance with the registration information, this service is considered to be used by the user who registered the user ID.</li>
                                    <li>Each player is allowed only one account. Users with many accounts, players using scripts and the like for the purpose of interfering with the service''s system are automatically blocked. Blocked players can not withdraw the crypto currency.</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Managing tokens</h5>
                                <ol class="pl-1">
                                    <li>Tokens used in the lottery purchase of this service and used for exchanging crypto currency in this service are called CPL (hereinafter referred to as "token"). The tokens described in this agreement will indicate this CPL.</li>
                                    <li>This service reserves the right to close accounts that have not been active for more than 6 months and to retain related tokens. Your token is stored safely, but we do not recommend long-term storage. It is also recommended that you download the desktop wallet to store the crypto currency used to exchange tokens.</li>
                                    <li>The user exchanges the crypto currency and tokens according to the usage rate displayed separately on this website separately as a consideration for using this service. In addition, exchange of the crypto currency and the token shall be carried out by the method specified by this service.</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Prohibitions</h5>
                                    <p>Users should not perform the following acts in using this service.</p>
                                    <ol class="pl-1">
                                        <li>Acts that violate laws or public order and morals</li>
                                        <li>Acts related to criminal acts</li>
                                        <li>Actions that destroy or interfere with the function of the server or network of this service</li>
                                        <li>Acts that may interfere with the operation of this service</li>
                                        <li>Acts of collecting or accumulating personal information etc. concerning other users</li>
                                        <li>Impersonating other users</li>
                                        <li>Acts of directly or indirectly giving profits to antisocial forces in connection with this service</li>
                                        <li>Other acts that the Service deems inappropriate</li>
                                    </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Stopping the provide of this service, etc.</h5>
                                <ol class="pl-1">
                                    <li>This Service may stop of all or part of the Service without notifying the User in advance if it determines that there is any of the following reasons.</li>
                                    <ol class="pl-2">
                                        <li>When performing maintenance, inspection, or updating of the computer system related to this service</li>
                                        <li>When it becomes difficult to provide this service due to accidental force act such as earthquake, lightning strike, fire, blackout or natural disaster</li>
                                        <li>When a computer or a communication line stops due to an accident</li>
                                        <li>In addition, when judging that it is difficult to provide this service</li>
                                    </ol>
                                    <li>This service shall not be liable for any reason whatsoever for any disadvantage or damage suffered by the user or a third party due to suspension or interruption of the provision of this service.</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Restrict usage and deregister</h5>
                                <ol class="pl-1">
                                    <li>This service reserves the right to change the system specification requirements necessary for changing the website, service, software without prior notice and accessing and using the service.</li>
                                    <li>This service may restrict the use of all or part of this service to the user, or may cancel the registration as a user, in the following cases without prior notice.</li>
                                    <ol class="pl-2">
                                        <li>In the event of violating any provision of these Terms</li>
                                        <li>When it is found that there is a false fact in the registration matter</li>
                                        <li>In addition, if we determine that this service is not appropriate for using this service</li>
                                    </ol>
                                    <li>This service is not responsible for any damage to the user caused by the actions performed by this service under this section.</li>
                                    <li>Use or access of this service by users under the age of 18 is prohibited. If you are under 18 years of age please do not use or provide information on this service.</li>
                                    <li>This Service exclusively reserves the right to refuse, cancel service, and / or refuse to distribute profits for good reason.</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Deposit with crypto currency</h5>
                                <p>
                                    This service does not accept cash or payment. Only Bitcoin and Ethereum is accepted.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Withdrawal by crypto currency</h5>
                                <ol class="pl-1">
                                    <li>This service will withdraw Bitcoin and Ethereum. cash withdrawal is not possible. Also, when withdrawing crypto currency, you will need to prove your identity.</li>
                                    <li>Users are responsible for the validity of the information provided during identification.</li>
                                    <li>This service reserves the right to restrict or refuse withdrawal if false information is included in the user identification information.</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Disclaimer</h5>
                                <ol class="pl-1">
                                    <li>This service will not refund anything due to malfunctioning of the game, server failure or malfunction, or loss caused as a result of the lottery purchase by the user. Moreover, we are not responsible for compensation.</li>
                                    <li>If the game malfunctions, all game play during the malfunction period will be invalid.</li>
                                    <li>When a user conducts cheating, using multiple accounts or misdemeaning, your account will be closed and your cryptocurrency and tokens, including investments, will be confiscated. Continued withdrawal of revenue is prohibited and user''s account is blocked.</li>
                                    <li>This service is not responsible for defects caused by increased traffic on the telephone network, line, computer online system, server or provider, hardware, software, technical problems or the Internet, website, service.</li>
                                    <li>This service is not responsible for data mistake, data storage and processing, damage caused by incompleteness and inaccuracy of transmitted data.</li>
                                    <li>This service is not responsible for transactions, contacts, disputes, etc. arising between users related to this service and other users or third parties.</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">Change of service contents</h5>
                                <p>
                                    This service shall be able to change the contents of this service or cancel the provision of this service without notifying the user and will not bear any responsibility for damage caused to the user by this.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Change of terms of service</h5>
                                <p>
                                    If we decide that this service is necessary, we may change this Terms at any time without notifying the user.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Notification or contact</h5>
                                <p>
                                    Notification or communication between the user and this service will be made according to the method specified by this service.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Prohibition of assignment of rights and duties</h5>
                                <p>
                                    You may not transfer the status under the contract or the rights or obligations under this Agreement to a third party without prior consent of the Service in writing and can not be used as collateral.
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">Governing Law · Jurisdiction</h5>
                                <p>
                                    In the event of a dispute with respect to this service, the court having jurisdiction over the location of the head office of this service shall be subject to exclusive agreement jurisdiction.
                                </p>
                            </li>
                            </ol>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (7, 2, N'PrivacyPolicy', N'運営会社A（以下「当社」）はwww.cryptolot.comのウェブサイト（以下「本サービス」）を運営しています。
                                このページでは、本サービスを利用する際の個人情報の収集、使用、開示に関する方針、および本サービスを利用されるお客様(以下「ユーザー」)のデータの取り扱いの方針についてお知らせします。
                                当社はあなたのデータを使用してサービスを提供し改善します。本サービスを使用することにより、ユーザーは本ポリシーに従って情報の収集および使用に同意するものとします。このプライバシーポリシーで別途定義されていない限り、このプライバシーポリシーで使用される用語は、www.cryptolot.comからアクセス可能な当社の利用規約と同じ意味を持ちます。
                                <ol class="text-jutify pl-1">
                                    <li>
                                        <h5 class="font-weight-bold">本ポリシー適用範囲</h5>
                            <p>当社は、当社が提供する各種サービスにおいて、お客様の個人情報を、その利用目的の達成に必要な範囲において取り扱います。当社は、個人情報保護法で定める例外に該当する場合を除き、お客様に示した利用目的を超えてお客様の個人情報を利用いたしません。</p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">収集される個人データの種類</h5>
                                <p>
                                    本サービスを利用している間は、あなたに連絡したり身元を確認するために使用できる特定の個人識別情報（以下「個人データ」）を私たちに提供するよう求める場合があります。個人を特定できる情報には、以下が含まれます（これらに限定されない場合があります: 電子メールアドレス, 姓と名, 電話番号, 住所、州、県、郵便番号、市区町村, 運転免許証番号, パスポート番号, Cookieおよび使用状況データ
                                </p>
                                <ol pl-1>
                                    <li>
                                        <h5>本サービスの使用データの収集</h5>
                                        <p>本サービスは、本サービスがどのようにアクセスされ、使用されているかの情報（以下「使用データ」）も収集することがあります。この使用データには、お使いのコンピュータのインターネットプロトコルアドレス（IPアドレスなど）、ブラウザの種類、ブラウザのバージョン、アクセスしたサービスのページ、訪問日時、それらのページに費やした時間、デバイス識別子および他の診断データを含みます。 </p>
                                    </li>
                                    <li>
                                        <h5>トラッキング＆クッキーデータ</h5>
                                        <p>
                                            当社は、ユーザーの活動を追跡し、一定の情報を保持するためにCookieおよび類似の追跡技術を使用しています。
                                            Cookieは、匿名の一意の識別子を含む可能性のある少量のデータを含むファイルです。クッキーはWebサイトからブラウザに送信され、デバイスに保存されます。
                                            ユーザーはブラウザにすべてのCookieを拒否したり、Cookieが送信されたことを示すように指示することができます。ただし、Cookieを受け入れない場合は、当社のサービスの一部を使用することができない場合があります。
                                        </p>
                                    </li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">収集した個人データの使用について </h5>
                                <p>本サービスでは、以下の利用目的の範囲内で取得した個人情報を利用いたします。</p>
                                <ul pl-1>
                                    <li>当社が提供するサービスの品質の維持</li>
                                    <li>当社が提供するサービスの変更について通知 </li>
                                    <li>当社が提供するサービスの対話型機能への参加への許可 </li>
                                    <li>ユーザーに対するサポートサービスの提供</li>
                                    <li>当社が提供するサービス改善のための意見の収集</li>
                                    <li>当社が提供するサービスの使用状況の監視</li>
                                    <li>技術的な問題への検出や対処、防止策の作成</li>
                                </ul>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">データの転送 </h5>
                                <p>
                                    個人データを含むユーザーの情報は、データ保護法がお客様の管轄区域と異なる場合がある州、国またはその他の管轄区域外にあるコンピュータに転送され、維持管理されることがあります。
                                    国外に移住し、私たちに情報を提供することを選択した場合は、個人データを含むデータを国外に移管して処理する可能性があることに注意してください。
                                    この個人情報保護方針への同意と個人情報の提出は、その譲渡に対するユーザーの同意を表します。
                                    本サービスは、お客様のデータが本プライバシーポリシーに従って安全に取り扱われることを確実にするために必要なすべての措置を講じます。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">データの開示</h5>
                                <p>本サービスは、お客様の個人情報を以下の目的で開示することがあります。 </p>
                                <ul pl-1>
                                    <li>法的義務の遵守、及び法的責任を守るため </li>
                                    <li>本サービスに関連する不正行為を防止または調査するため</li>
                                    <li>本サービスまたは一般のユーザーの個人的安全を守るため</li>
                                </ul>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">データのセキュリティ </h5>
                                <p>あなたのデータのセキュリティは私たちにとって重要ですが、インターネット上での送信方法や電子記憶方法は100％安全ではありません。商業上許容される手段を使用してお客様の個人データを保護するよう努めていますが、絶対的な安全性を保証するものではありません。</p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">サービスプロバイダ </h5>
                                <p>
                                    本サービスは、本サービスの円滑化、本サービスを代行するサービスの提供、関連サービスの実施、またはサービスの使用方法の分析における本サービスの支援のために、第三者の企業および個人がデータを使用することがあります。
                                    これらの第三者は、私たちのためにこれらの作業を実行するためにのみあなたの個人データにアクセスし、他の目的のためにそれを開示または使用しないように義務付けられています。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">他のサイトへのリンク </h5>
                                <p>
                                    当社のサービスには、当社が運営していない他のサイトへのリンクが含まれている場合があります。サードパーティのリンクをクリックすると、そのサードパーティのサイトに移動します。訪問するすべてのサイトのプライバシーポリシーを確認することを強くお勧めします。
                                    当社は、第三者のサイトまたはサービスのコンテンツ、プライバシーポリシー、または慣行を管理することはできません。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">子供のプライバシー </h5>
                                <p>
                                    私たちのサービスは、18歳未満の人（「子供」）には対処していません。
                                    私たちは故意に18歳未満の方から個人情報を収集することはありません。あなたが親または保護者であり、あなたの子供が私たちに個人情報を提供していることをご存知の場合は、私たちに連絡してください。親の同意を確認せずに子供から個人データを収集したことに気がついた場合、その情報をサーバーから削除する手順を実行します。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">このプライバシーポリシーの変更 </h5>
                                <p>当社は時々、当社のプライバシーポリシーを更新する可能性があります。このページに新しいプライバシーポリシーを掲載することにより、変更のお知らせをいたします。</p>
                            </li>
                            </ol>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (8, 2, N'TermsOfService', N'この利用規約（以下、「本規約」といいます。）は、CRYPTOLOT（以下、「本サービス」といいます。）がCRYPTOLOTウェブサイト上（以下、「本ウェブサイト」といいます。）で提供するサービスの利用条件を定めるものです。登録ユーザーの皆さま（以下、「ユーザー」といいます。）には、本規約に従って本サービスをご利用いただきます。
                                <ol class="text-jutify pl-1">
                                    <li>
                                        <h5 class="font-weight-bold">適用について</h5>
                            <p>本規約は，ユーザーと本サービスの利用に関わる一切の関係に適用されるものとします。</p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">利用登録について</h5>
                                <ol pl-1>
                                    <li>登録希望者が本サービスの定める方法によって利用登録を申請し、本サービスがこれを承認することによって、利用登録が完了するものとします。</li>
                                    <li>本サービスは、利用登録の申請者に以下の事由があると判断した場合、利用登録の申請を承認しないことがあり、その理由については一切の開示義務を負わないものとします。</li>
                                    <ol pl-2>
                                        <li>利用登録の申請に際して虚偽の事項を届け出た場合</li>
                                        <li>本規約に違反したことがある者からの申請である場合</li>
                                        <li>その他，本サービスが利用登録を相当でないと判断した場合</li>
                                    </ol>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">ユーザーIDおよびパスワードの管理</h5>
                                <ol pl-1>
                                    <li>ユーザーは自己の責任において、本サービスのユーザーIDおよびパスワードを管理するものとします。 </li>
                                    <li>ユーザーはいかなる場合にも、ユーザーIDおよびパスワードを第三者に譲渡または貸与することはできません。本サービスは，ユーザーIDとパスワードの組み合わせが登録情報と一致してログインされた場合には，そのユーザーIDを登録しているユーザー自身による利用とみなします。 </li>
                                    <li>各プレイヤーは1つのアカウントのみを許可されます。多くのアカウントを持つユーザー、本サービスのシステムを妨害する目的でスクリプトなどを使用するプレーヤーは自動的にブロックされます。ブロックされたプレイヤーは、仮想通貨の出金を行うことはできません。 </li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">トークンの管理</h5>
                                <ol pl-1>
                                    <li>本サービスのくじ購入で使用され、本サービス内で仮想通貨の交換等に使用されるトークンはCPL（以下トークン）と呼称されます。本規約中に記載されるトークンとは、このCPLを差し示します。</li>
                                    <li>本サービスは、6ヶ月以上継続して活動していないアカウントを閉鎖し、関連するトークンを保持する権利を留保しています。あなたのトークンは安全に保存されますが、長期保管はお勧めしません。また、トークンの交換に使用する仮想通貨を保管するためのデスクトップウォレットをダウンロードすることをお勧めします。</li>
                                    <li>ユーザーは本サービス利用の対価として、本サービスが別途定め本ウェブサイトに表示する利用レートに応じて、仮想通貨とトークンを交換します。また、その仮想通貨とトークンの交換は本サービスが指定する方法により行うものとします。</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">禁止事項</h5>
                                    <p>ユーザーは、本サービスの利用にあたり、以下の行為をしてはなりません。</p>
                                    <ol pl-1>
                                        <li>法令または公序良俗に違反する行為</li>
                                        <li>犯罪行為に関連する行為</li>
                                        <li>本サービスのサーバーまたはネットワークの機能を破壊したり，妨害したりする行為</li>
                                        <li>本サービスの運営を妨害するおそれのある行為</li>
                                        <li>他のユーザーに関する個人情報等を収集または蓄積する行為</li>
                                        <li>他のユーザーに成りすます行為</li>
                                        <li>本サービスに関連して，反社会的勢力に対して直接または間接に利益を供与する行為</li>
                                        <li>その他、本サービスが不適切と判断する行為</li>
                                    </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">本サービスの提供の停止等</h5>
                                <ol pl-1>
                                    <li>本サービスは、以下のいずれかの事由があると判断した場合，ユーザーに事前に通知することなく本サービスの全部または一部の提供を停止または中断することができるものとします。</li>
                                    <ol pl-2>
                                        <li>本サービスにかかるコンピュータシステムの保守点検または更新を行う場合</li>
                                        <li>地震、落雷、火災、停電または天災などの不可抗力により、本サービスの提供が困難となった場合</li>
                                        <li>コンピュータまたは通信回線等が事故により停止した場合</li>
                                        <li>その他、本サービスが本サービスの提供が困難と判断した場合</li>
                                    </ol>
                                    <li>本サービスは、本サービスの提供の停止または中断により、ユーザーまたは第三者が被ったいかなる不利益または損害について、理由を問わず一切の責任を負わないものとします。</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">利用制限および登録抹消</h5>
                                <ol pl-1>
                                    <li>本サービスは、事前に予告なくウェブサイト、サービス、ソフトウェアを変更したり、サービスにアクセスして使用するために必要なシステム仕様要件を変更する権利を留保します。</li>
                                    <li>本サービスは、以下の場合には事前の通知なく、ユーザーに対して、本サービスの全部もしくは一部の利用を制限し、またはユーザーとしての登録を抹消することができるものとします。</li>
                                    <ol pl-2>
                                        <li>本規約のいずれかの条項に違反した場合</li>
                                        <li>登録事項に虚偽の事実があることが判明した場合</li>
                                        <li>その他、本サービスが本サービスの利用を適当でないと判断した場合</li>
                                    </ol>
                                    <li>本サービスは、本条に基づき本サービスが行った行為によりユーザーに生じた損害について、一切の責任を負いません。</li>
                                    <li>18歳未満のユーザーによる本サービスの使用またはアクセスは禁止されています。 18歳未満の場合は、本サービスの情報を使用したり提供したりしないでください。</li>
                                    <li>本サービスは正当な理由により、拒否、サービスのキャンセル、および/または利益の分配を拒否する権利を独占的に留保します。</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">暗号通貨による入金について</h5>
                                <p>
                                    本サービスは現金または入金を受け付けていません。ビットコイン、イーサリアムのみが受け入れられます。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">暗号通貨による出金について</h5>
                                <ol pl-1>
                                    <li>本サービスはビットコイン、イーサリアムによって出金を行います。その際、現金による出金はできません。また、出金の際には、ユーザーの身分証明をして頂く必要があります。</li>
                                    <li>ユーザーは、身分証明時に提供される情報の妥当性と有効性について責任を負います。</li>
                                    <li>本サービスは、ユーザーの身分証明の情報に虚偽がある場合、出金を制限、拒否する権利を有します。</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">免責事項</h5>
                                <ol pl-1>
                                    <li>本サービスは，ゲームの誤動作、オンラインシステム、サーバーの障害、誤動作、また、ユーザーによるくじ購入の結果、起こった損失による返金は一切行いません。また、賠償の責任も負いません。</li>
                                    <li>ゲームが誤動作した場合、誤動作期間中のすべてのゲームプレイは無効になります。</li>
                                    <li>ユーザーが不正行為をしたり、複数のアカウントを使用したり、出金を悪用したりすると、あなたのアカウントは閉鎖され、投資を含むあなたの仮想通貨及びトークンは没収されます。継続的に収益の引き出しは禁止され、ユーザーのアカウントはブロックされます。</li>
                                    <li>本サービスは、電話網や回線、コンピュータのオンラインシステム、サーバーまたはプロバイダ、ハードウェア、ソフトウェア、技術的な問題やインターネット、ウェブサイト、サービス上のトラフィック増大による不具合や技術的不具合については一切責任を負いません。</li>
                                    <li>本サービスは、データの入力ミス、データの保存と処理、送信されたデータの不完全性と不正確さに起因する損害については責任を負いません。</li>
                                    <li>本サービスは、本サービスに関するユーザーと他のユーザーまたは第三者との間において生じた取引，連絡または紛争等について一切責任を負いません。</li>
                                </ol>
                            </li>
                            <li>
                                <h5 class="font-weight-bold mt-1">サービス内容の変更等</h5>
                                <p>
                                    本サービスは、ユーザーに通知することなく、本サービスの内容を変更しまたは本サービスの提供を中止することができるものとし、これによってユーザーに生じた損害について一切の責任を負いません。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">利用規約の変更</h5>
                                <p>
                                    本サービスは、必要と判断した場合には、ユーザーに通知することなくいつでも本規約を変更することができるものとします。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">通知または連絡</h5>
                                <p>
                                    ユーザーと本サービスとの間の通知または連絡は、本サービスの定める方法によって行うものとします。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">権利義務の譲渡の禁止</h5>
                                <p>
                                    ユーザーは、本サービスの書面による事前の承諾なく、利用契約上の地位または本規約に基づく権利もしくは義務を第三者に譲渡し、または担保に供することはできません。
                                </p>
                            </li>
                            <li>
                                <h5 class="font-weight-bold">準拠法・裁判管轄</h5>
                                <p>
                                    本サービスに関して紛争が生じた場合には、本サービスの本店所在地を管轄する裁判所を専属的合意管轄とします。
                                </p>
                            </li>
                            </ol>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (9, 1, N'HowToRegisterDesktop', N'<p>CRYPTOLOT is a game site that anyone can participate using a cryptocurrency.</p>
                                        <p>We are currently opening a crypto lottery game. You can withdraw cryptocurrency if you win the lottery game.</p>
                                        <p>CRYPTOLOT can be enjoyed in the following way.</p>
                                        <br />
                                        <p><span class="font-weight-bold">1-1.</span> CRYPTOLOT''s User registration is simple.</p>
                                        <p class="ml-2">- Click "Register" on the top page.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/1-1.png" />

                                        <p><span class="font-weight-bold">1-2.</span> The member registration screen will be displayed,</p>
                                        <p class="ml-2">- Please enter your email address and password.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/1-2.png" />

                                        <p><span class="font-weight-bold">1-3.</span> A confirmation email will be sent to your email address.</p>
                                        <p class="ml-2">- Please click the link included.</p>
                                        <p><span class="font-weight-bold">1-4．</span>Registration is completed. Please login from the top page.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (10, 2, N'HowToRegisterDesktop', N'<p>CRYPTOLOTは、仮想通貨をお持ちの方ならだれでも手軽に遊ぶことのできるゲームサイトです。 </p>
                                        <p>現在、仮想通貨くじをオープンしています。くじで当選した賞金は、ビットコイン、イーサリアムで引き出すことが可能です。 </p>
                                        <p>CRYPTOLOTは以下の方法で楽しむことができます。 </p>
                                        <br />
                                        <p><span class="font-weight-bold">1-1.</span> CRYPTOLOTの会員登録は簡単です。 </p>
                                        <p class="ml-2">- トップページの「登録」をクリックします。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/1-1.png" />

                                        <p><span class="font-weight-bold">1-2.</span> 会員登録画面が表示されますので、お客様のメールアドレス、 </p>
                                        <p class="ml-2">- ご希望のパスワードを入力してください。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/1-2.png" />

                                        <p><span class="font-weight-bold">1-3.</span> フォームに入力されたメールアドレスに登録確認用のメールが届きます。 </p>
                                        <p class="ml-2">- その中のリンクをクリックしてください。 </p>
                                        <p><span class="font-weight-bold">1-4．</span>登録が完了いたしました。トップページのログインフォームからログインしてください。 </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (11, 1, N'HowToDepositAndExchangeDesktop', N'<p><span class="font-weight-bold">2-1.</span> Deposit</p>
                                        <p>CRYPROLOT can be deposited by BTC, ETH.</p>
                                        <p>Enter the BTC and ETH you want to deposit in to amount in the BTC or ETH amount field, please deposit to the displayed address.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/2-1.png" />

                                        <p><span class="font-weight-bold">2-2.</span> Exchange.</p>
                                        <p>The user can participate in the game by exchanging BTC or ETH to CPL.</p>
                                        <p>The user can exchange BTC or ETH to CPL in exchange page.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/2-2.png" />

                                        <p>In the "BTC amount", please input the amount of BTC you want to exchange. In the same way, in the "ETH amount", please input the amount of ETH you wish to exchange and click the "next" button.</p>
                                        <p>Exchange from CPL to BTC, ETH is also possible at any time.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (12, 2, N'HowToDepositAndExchangeDesktop', N'<p><span class="font-weight-bold">2-1.</span> 入金 </p>
                                        <p>CRYPROLOTは、BTC、ETHによる入金が可能です。 </p>
                                        <p>
                                            ログイン後、メニューの入金/出金の中から入金を選択し、ご希望のBTC、ETH入金金額を入力後、
                                            表示されているアドレスに入金してください。
                                        </p>
                                        <p>（下のキャプチャーはモザイクがかかっていますが、実際にはアドレスが表示されます。） </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/2-1.png" />

                                        <p><span class="font-weight-bold">2-2.</span> 交換.</p>
                                        <p>CRYPTOLOTは、入金頂いたBTC、ETHをCPLに交換することによってゲームに参加することができます。 </p>
                                        <p>BTC,ETHからCPLへの交換は、ログイン後のメニューの「交換」をクリックして行います。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/2-2.png" />

                                        <p>「BTCの数量」の部分には交換を希望するBTC量、「ETHの数量」の部分には交換を希望するETH量を入力して、「次」ボタンをクリックしてください。 </p>
                                        <p>なお、CPLからBTC、ETHへの交換も、上のキャプチャーの矢印ボタンをクリックすることによって可能です。 </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (13, 1, N'HowToPlayLotteryDesktop', N'<p>If you can exchange for CPL, let''s purchase lottery.</p>
                                        <p class="font-weight-bold">* The above screen is a screen under development version, some specifications may have changed.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/3(1).png" />

                                        <p>When user enters the number of tickets to purchase, the necessary CPL amount is calculated.</p>
                                        <p>Let''s click and check the contents of the lottery game to be purchased.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/3(2).png" />

                                        <p>When user enters the number of tickets to purchase, the necessary CPL amount is calculated.</p>
                                        <p>Let''s click and check the contents of the lottery game to be purchased.</p>
                                        <p>Purchase is confirmed.</p>
                                        <p>We make a lottery on the ETH Smart Contract from midnight on the day when the maximum number was reached the sales maximum number,</p>
                                        <p>The results will be announced at 10 o''clock the next morning.</p>
                                        <br />
                                        <p>You can check the results on the menu.</p>
                                        <p>You can check the result on the "History" -> "Game" page of the menu.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/3(3).png" />')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (14, 2, N'HowToPlayLotteryDesktop', N'<p>CPLに交換できたら、仮想通貨くじを購入してみましょう！ </p>
                                        <p class="font-weight-bold">※ 画面は開発中の画面のため、一部仕様が変更になっている場合があります。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/3(1).png" />

                                        <p>購入する枚数を入力すると、購入に必要なCPL量が計算されます。 </p>
                                        <p>クリックして、購入するくじの内容を確認しましょう。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/3(2).png" />

                                        <p>購入が確定されました。 </p>
                                        <p>仮想通貨くじは、１つのくじごとに販売上限枚数に達すると、</p>
                                        <p>上限枚数に達した日の午前０時からETHスマートコントラクト上で抽選を行い、 </p>
                                        <p>翌朝の10時に結果が発表されます。 </p>
                                        <br />
                                        <p>結果は、メニューの「履歴」->「ゲーム」ページの下部分でご確認いただけます。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/3(3).png" />')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (15, 1, N'HowToWithDrawDesktop', N'<p>You need to submit your identification (KYC) to withdraw.</p>
                                        <p>After KYC approved by the administration, you can withdraw BTC or ETH.</p>
                                        <br />
                                        <p><span class="font-weight-bold">4-1.</span> How to submit identification</p>
                                        <p>CRYPTOLOT accepts KYC by using passport or driver''s license.</p>
                                        <p>Please confirm from the following screen to submit.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/4-1(1).png" />

                                        <p>Please submit it from the following screen.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/4-1(2).png" />

                                        <p>Please allow 1-2 business days to confirm your identity.</p>
                                        <p>After KYC approval, BTC, ETH can be withdrawn from the payment / withdrawal menu of the dashboard.</p>

                                        <br />
                                        <p><span class="font-weight-bold">4-2.</span> How to withdraw</p>
                                        <p>Please input that you desire withdrawal amount in field of "amount" and input in your BTC or ETH address in the field of "address", and then click the withdraw button.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-en/4-2.png" />

                                        <p>Regarding the BTC or ETH address, please input correct address. If you send it to the wrong address, please notice that the asset may be lost.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (16, 2, N'HowToWithDrawDesktop', N'<p>出金には、お客様の身分証明書の提出（KYC）が必要です。 </p>
                                        <p>身分証明書の提出は以下の通りです。 </p>
                                        <br />
                                        <p><span class="font-weight-bold">4-1.</span> 身分証明書のご提出方法 </p>
                                        <p>CRYPTOLOTでは、パスポートまたは運転免許証によるお客様確認を受け付けています。 </p>
                                        <p>ユーザー名をクリックするとプルダウンメニューに「KYC」の項目が表示されます。このリンクをクリックすると、KYCのページが表示されます。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/4-1(1).png" />

                                        <p>ご提出は、以下の画面からご確認ください。 </p>
                                        <p>（上記のような表示にならない場合には、ユーザープロフィールを入力していない可能性があります。ユーザープロフィールを入力後、再度このページ訪れると正しく表示されます。） </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/4-1(2).png" />

                                        <p>身分証明書の確認には1-2日営業日を頂きます。 </p>
                                        <p>KYC承認後、ダッシュボードの入金/出金メニューからお客様のBTC、ETHを出金することができます。 </p>

                                        <br />
                                        <p><span class="font-weight-bold">4-2.</span> 出金方法 </p>
                                        <p>

                                            ご希望の出金量を「量」の項目に、お客様のBTCまたはETHアドレスをいずれかの「アドレス」欄に入力して、出金ボタンをクリックしてください。
                                        </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/desktop-jp/4-2.png" />

                                        <p>上記のアドレスは、必ず正しいアドレスを入力してください。間違ったアドレスに送ると、資産が失われる場合がありますので、ご注意ください。 </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (17, 1, N'HowToRegisterMobile', N'<p>CRYPTOLOT is a game site that anyone can participate using a cryptocurrency.</p>
                                        <p>We are currently opening a crypto lottery game. You can withdraw cryptocurrency if you win the lottery game.</p>
                                        <p>CRYPTOLOT can be enjoyed in the following way.</p>
                                        <br />
                                        <p><span class="font-weight-bold">1-1.</span> CRYPTOLOT''s User registration is easy.</p>
                                        <p class="ml-2">- Click "Register" on the top page.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-en/1-1.png" />

                                        <p><span class="font-weight-bold">1-2.</span> The member registration screen will be displayed,</p>
                                        <p class="ml-2">- Please enter your email address and password.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-en/1-2.png" />

                                        <p><span class="font-weight-bold">1-3.</span> A confirmation email will be sent to your email address.</p>
                                        <p class="ml-2">- Please click the link included.</p>
                                        <p><span class="font-weight-bold">1-4．</span>Registration is completed. Please login from the top page.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (18, 2, N'HowToRegisterMobile', N'<p><span class="font-weight-bold">1-1.</span> CRYPTOLOTの会員登録は簡単です。</p>
                                        <p class="ml-2">- トップページの「登録」をタップします。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/1-1.png" />

                                        <p><span class="font-weight-bold">1-2.</span> 会員登録画面が表示されますので、お客様のメールアドレス、ご希望のパスワードを入力してください。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/1-2.png" />

                                        <p><span class="font-weight-bold">1-3.</span>  フォームに入力されたメールアドレスに登録確認用のメールが届きます。 </p>
                                        <p class="ml-2">- その中のリンクをタップしてください。 </p>
                                        <p><span class="font-weight-bold">1-4．</span>登録完了画面が表示されると、登録は完了です。トップページのログインフォームからログインしてください。 </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (19, 1, N'HowToDepositAndExchangeMobile', N'<p><span class="font-weight-bold">2-1.</span> Deposit</p>
                                        <p>CRYPROLOT can be deposited by BTC, ETH.</p>
                                        <p>Enter the BTC and ETH you want to deposit in to amount in the BTC or ETH amount field, please deposit to the displayed address.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-en/2-1(1).png" />
                                        <br />
                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-en/2-1(2).png" />

                                        <p><span class="font-weight-bold">2-2.</span> Exchange.</p>
                                        <p>The user can participate in the game by exchanging BTC or ETH to CPL.</p>
                                        <p>The user can exchange BTC or ETH to CPL in exchange page.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-en/2-2(1).png" />
                                        <br />
                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-en/2-2(2).png" />

                                        <p>In the "BTC amount", please input the amount of BTC you want to exchange. In the same way, in the "ETH amount", please input the amount of ETH you wish to exchange and click the "next" button.</p>
                                        <p>Exchange from CPL to BTC, ETH is also possible at any time.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (20, 2, N'HowToDepositAndExchangeMobile', N'<p><span class="font-weight-bold">2-1.</span> 入金 </p>
                                        <p>CRYPROLOTは、BTC、ETHによる入金が可能です。 </p>
                                        <p>ログイン後、メニューの入金/出金の中から入金を選択し、ご希望のBTCまたはETH入金金額を入力後、表示されているアドレスに入金してください。 </p>
                                        <p>（以下のキャプチャーはモザイクがかかっていますが、実際にはアドレスが表示されます。） </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/2-1(1).png" />
                                        <br />
                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/2-1(2).png" />

                                        <p><span class="font-weight-bold">2-2.</span> 交換.</p>
                                        <p>CRYPTOLOTでは、入金頂いたBTC、ETHをCPLに交換することによってゲームに参加することができます。 </p>
                                        <p>BTC,ETHからCPLへの交換は、ログイン後のメニューの「交換」をタップして行います。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/2-2(1).png" />
                                        <br />
                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/2-2(2).png" />

                                        <p>「BTCの数量」の部分には交換を希望するBTC量、「ETHの数量」の部分には交換を希望するETH量を入力して、「次」ボタンをタップしてください。 </p>
                                        <p>なお、CPLからBTC、ETHへの交換も、上のキャプチャーの矢印ボタンをタップすることによって可能です。 </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (21, 1, N'HowToPlayLotteryMobile', N'<p>If you can exchange for CPL, let''s purchase lottery.</p>
                                        <p class="font-weight-bold">* The above screen is a screen under development version, some specifications may have changed.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-en/3-1.png" />

                                        <p>When user enters the number of tickets to purchase, the necessary CPL amount is calculated.</p>
                                        <p>Let''s click and check the contents of the lottery game to be purchased.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-en/3-2.png" />

                                        <p>When user enters the number of tickets to purchase, the necessary CPL amount is calculated.</p>
                                        <p>Let''s click and check the contents of the lottery game to be purchased.</p>
                                        <p>Purchase is confirmed.</p>
                                        <p>We make a lottery on the ETH Smart Contract from midnight on the day when the maximum number was reached the sales maximum number,</p>
                                        <p>The results will be announced at 10 o''clock the next morning.</p>
                                        <br />
                                        <p>You can check the results on the menu.</p>
                                        <p>You can check the result on the "History" -> "Game" page of the menu.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-en/3-3.png" />')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (22, 2, N'HowToPlayLotteryMobile', N'<p>CPLに交換できたら、仮想通貨くじを購入してみましょう！ </p>
                                        <p>トップページから、購入したいくじのバナーをタップします。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/3(1).png" />

                                        <p class="font-weight-bold">※画面は開発中の画面のため、一部仕様が変更になっている場合があります。ご注意ください。 </p>
                                        <br />
                                        <p>購入画面移動後、フォームより購入したい枚数を入力すると、購入に必要なCPL量が計算されます。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/3(2).png" />

                                        <p>入力後、「購入」をタップして購入するくじの内容を確認しましょう。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/3(3).png" />

                                        <p>
                                            購入が確定されました。
                                        </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/3(4).png" />

                                        <p>仮想通貨くじは、１つのくじごとに販売上限枚数に達すると、上限枚数に達した日の午前０時からETHスマートコントラクト上で抽選を行い、翌朝の10時に結果が発表されます。 </p>
                                        <p>結果は、メニューの「履歴」->「ゲーム」ページでご確認いただけます。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/3(5).png" />
                                        <br />
                                        <img class="img-fluid img-thumbnail border-0 my-1" src="/images/howtoplay/mobile-jp/3(6).png" />')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (23, 1, N'HowToWithDrawMobile', N'<p>You need to submit your identification (KYC) to withdraw.</p>
                                        <p>After KYC approved by the administration, you can withdraw BTC or ETH.</p>
                                        <br />
                                        <p><span class="font-weight-bold">4-1.</span> How to submit identification</p>
                                        <p>CRYPTOLOT accepts KYC by using passport or driver''s license.</p>
                                        <p>Please confirm from the following screen to submit.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-en/4-1(1).png" />

                                        <p>Please submit it from the following screen.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-en/4-1(2).png" />

                                        <p>Please allow 1-2 business days to confirm your identity.</p>
                                        <p>After KYC approval, BTC, ETH can be withdrawn from the payment / withdrawal menu of the dashboard.</p>

                                        <br />
                                        <p><span class="font-weight-bold">4-2.</span> How to withdraw</p>
                                        <p>Please input that you desire withdrawal amount in field of "amount" and input in your BTC or ETH address in the field of "address", and then click the withdraw button.</p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-en/4-2.png" />

                                        <p>Regarding the BTC or ETH address, please input correct address. If you send it to the wrong address, please notice that the asset may be lost.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (24, 2, N'HowToWithDrawMobile', N'<p>出金には、お客様の身分証明書の提出（KYC）が必要です。 </p>
                                        <p>身分証明書の提出は以下の通りです。 </p>
                                        <br />
                                        <p><span class="font-weight-bold">4-1.</span> 身分証明書のご提出方法 </p>
                                        <p>CRYPTOLOTでは、パスポートまたは運転免許証によるお客様確認を受け付けています。 </p>
                                        <p>ユーザー名をタップするとプルダウンメニューに「KYC」の項目が表示されますので、タップするとKYCのページにリンクされます。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-jp/4-1(1).png" />

                                        <p>ご提出は、以下の画面で行ってください。身分証明書の確認には2-3営業日を頂きます。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-jp/4-1(2).png" />

                                        <p>運営事務局によるKYC承認後、ダッシュボードの入金/出金メニューからお客様のBTC、ETHを出金することができます。 </p>

                                        <br />
                                        <p><span class="font-weight-bold">4-2.</span> 出金方法 </p>
                                        <p>ご希望の出金量を「量」の項目に、お客様のBTCまたはETHアドレスをいずれかの「アドレス」欄に入力して、入金/出金ボタンをタップしてください。 </p>

                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-jp/4-2(1).png" />
                                        <br />
                                        <img class="img-fluid img-thumbnail border-0 my-1"src="/images/howtoplay/mobile-jp/4-2(2).png" />

                                        <p>アドレス欄に入力するアドレスは、必ず正しいアドレスを入力してください。間違ったアドレスに送ると、資産が失われる場合がありますのでご注意ください。 </p>
                                        <p>上記の内容についてご質問がある場合には、コンタクトフォームよりお問い合わせください。 </p>')
GO
SET IDENTITY_INSERT [dbo].[LangMsgDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Lottery] ON 
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [DesktopSlideImage], [DesktopListingImage], [MobileListingImage], [Title], [UnitPrice], [UpdatedDate], [MobileSlideImage], [PrizeImage]) VALUES (1, 1, CAST(N'2018-08-28T20:22:42.890' AS DateTime), 5000, 2, N'1_ds_20180828082242_desktop slider.jpg', N'1_dl_20180828082242_thumb-game_08.jpg', N'1_ml_20180828082242_thumb-game_17.jpg', N'1BTC宝くじ', 500, NULL, N'1_ms_20180828082242_mobile banner.jpg', N'1_p_20180828082242_prize.jpg')
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [DesktopSlideImage], [DesktopListingImage], [MobileListingImage], [Title], [UnitPrice], [UpdatedDate], [MobileSlideImage], [PrizeImage]) VALUES (2, 2, CAST(N'2018-08-28T20:26:40.453' AS DateTime), 5000, 2, N'2_ds_20180828082640_desktop slider.jpg', N'2_dl_20180828082640_thumb-game_08.jpg', N'2_ml_20180828082640_thumb-game_17.jpg', N'2BTC宝くじ', 1000, NULL, N'2_ms_20180828082640_mobile banner.jpg', N'2_p_20180828082640_prize.jpg')
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [DesktopSlideImage], [DesktopListingImage], [MobileListingImage], [Title], [UnitPrice], [UpdatedDate], [MobileSlideImage], [PrizeImage]) VALUES (3, 3, CAST(N'2018-08-28T20:31:25.240' AS DateTime), 5000, 2, N'3_ds_20180828083125_desktop slider.jpg', N'3_dl_20180828083125_thumb-game_08.jpg', N'3_ml_20180828083125_thumb-game_17.jpg', N'0.5BTC宝くじ', 300, NULL, N'3_ms_20180828083125_mobile banner.jpg', N'3_p_20180828083125_prize.jpg')
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [DesktopSlideImage], [DesktopListingImage], [MobileListingImage], [Title], [UnitPrice], [UpdatedDate], [MobileSlideImage], [PrizeImage]) VALUES (4, 4, CAST(N'2018-08-28T20:33:58.593' AS DateTime), 5000, 2, N'4_ds_20180828083358_desktop slider.jpg', N'4_dl_20180828083358_thumb-game_08.jpg', N'4_ml_20180828083358_thumb-game_17.jpg', N'1BTC宝くじ', 300, NULL, N'4_ms_20180828083358_mobile banner.jpg', N'4_p_20180828083358_prize.jpg')
GO
SET IDENTITY_INSERT [dbo].[Lottery] OFF
GO
SET IDENTITY_INSERT [dbo].[LotteryPrize] ON 
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (1, 1000000.0000, 1, 1, 1)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (2, 100000.0000, 1, 5, 2)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (3, 10000.0000, 1, 25, 3)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (4, 500.0000, 1, 500, 4)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (5, 2000000.0000, 2, 1, 1)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (6, 200000.0000, 2, 5, 2)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (7, 20000.0000, 2, 40, 3)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (8, 1000.0000, 2, 200, 4)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (9, 500000.0000, 3, 1, 1)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (10, 50000.0000, 3, 10, 2)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (11, 5000.0000, 3, 25, 3)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (12, 300.0000, 3, 500, 4)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (13, 1000000.0000, 4, 1, 1)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Value], [LotteryId], [Volume], [Index]) VALUES (14, 300.0000, 4, 500, 2)
GO
SET IDENTITY_INSERT [dbo].[LotteryPrize] OFF
GO
SET IDENTITY_INSERT [dbo].[Setting] ON 
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (1, N'IsOnMaintenance', N'false', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (2, N'IsAccountActivationEnable', N'true', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (3, N'FHCoreServiceEndPointUrl', N'http://api.famhopperchain.com/', N'Local FHCore')
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (4, N'BTCToTokenRate', N'1000000', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (5, N'LotteryGameDrawingTimeInHour', N'12:00', N'Time to drawing lottery. From 0 to 24')
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (6, N'GCaptchaKey', N'6LcmwmAUAAAAAOaDjdjGVgSHYj9fzZH-1-U8Ffd4', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (7, N'CPLServiceEndPointUrl', N'http://202.53.150.20/', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (8, N'ResetPasswordExpiredInDays', N'1', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (9, N'ETHNotifyCurrentBlockNo', N'2893803', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (10, N'ActivateExpiredInDays', N'1', NULL)
GO
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[SysUser] ON 
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable]) VALUES (5, 1, N'info.cplcoin@gmail.com', N'$2y$10$Sh.jL/v.yLPKj.2VqOrABOIwRvjCMKKpIWjFmRP9vyEwFgdvG9KhW', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-29T08:52:24.417' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, 0, N'0x37bd726d30e87040ce4e309a322914a1AFe0F2c4', 1, N'mrmdob16nnxGRfbC9jb683WiwaE1DTYEvA', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable]) VALUES (6, 1, N'abc@gmail.com', N'$2y$10$Sh.jL/v.yLPKj.2VqOrABOIwRvjCMKKpIWjFmRP9vyEwFgdvG9KhW', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-29T08:52:24.417' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, 0, N'0x37bd726d30e87040ce4e309a322914a1AFe0F2c4', 1, N'mrmdob16nnxGRfbC9jb683WiwaE1DTYEvA', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[SysUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Template] ON 
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (1, N'Activate', N'ActivateEmailTemplate', N'Activate your account at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (2, N'Member', N'MemberEmailTemplate', N'Account is activated successfully at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (3, N'Contact', N'ContactEmailTemplate', N'Contact #{0} from customer at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (4, N'KYCVerify', N'KYCVerifyEmailTemplate', N'KYC is verified successfully at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (5, N'ForgotPassword', N'ForgotPasswordEmailTemplate', N'Reset your password at CPL')
GO
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('0') FOR [Volume]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('1') FOR [Status]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('') FOR [DesktopSlideImage]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('') FOR [DesktopListingImage]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('') FOR [MobileListingImage]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('0') FOR [UnitPrice]
GO
ALTER TABLE [dbo].[LotteryHistory] ADD  DEFAULT ('') FOR [TxHashId]
GO
ALTER TABLE [dbo].[LotteryPrize] ADD  DEFAULT ('0') FOR [Volume]
GO
ALTER TABLE [dbo].[LotteryPrize] ADD  DEFAULT ((0)) FOR [Index]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_BTCHDWalletAddressIndex]  DEFAULT ((0)) FOR [BTCHDWalletAddressIndex]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_ETHHDWalletAddressIndex]  DEFAULT ((0)) FOR [ETHHDWalletAddressIndex]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF__SysUser__TwoFact__6C190EBB]  DEFAULT ((0)) FOR [TwoFactorAuthenticationEnable]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTxHashIdToBTCTransaction]    Script Date: 04/09/2018 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertTxHashIdToBTCTransaction]
	-- Add the parameters for the stored procedure here
	@TxHashId nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if ((select count(*) from [dbo].[BTCTransaction] where TxHashId = @TxHashId) = 0)
		INSERT INTO [dbo].[BTCTransaction]([TxHashId],[UpdatedTime],[CreatedDate]) VALUES (@TxHashId, NULL, GETDATE());
END
GO
