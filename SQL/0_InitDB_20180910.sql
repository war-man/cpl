USE [CPL]
GO
/****** Object:  Table [dbo].[Affiliate]    Script Date: 9/10/2018 6:11:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affiliate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tier1DirectRate] [int] NOT NULL,
	[Tier2SaleToTier1Rate] [int] NOT NULL,
	[Tier3SaleToTier1Rate] [int] NOT NULL,
 CONSTRAINT [PK_Affiliate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agency]    Script Date: 9/10/2018 6:11:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tier1DirectRate] [int] NOT NULL,
	[Tier2DirectRate] [int] NOT NULL,
	[Tier3DirectRate] [int] NOT NULL,
	[Tier2SaleToTier1Rate] [int] NOT NULL,
	[Tier3SaleToTier1Rate] [int] NOT NULL,
	[Tier3SaleToTier2Rate] [int] NOT NULL,
	[IsAutoPaymentEnable] [bit] NOT NULL,
	[IsTier2TabVisible] [bit] NOT NULL,
	[IsTier3TabVisible] [bit] NOT NULL,
 CONSTRAINT [PK_Agency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgencyToken]    Script Date: 9/10/2018 6:11:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgencyToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](50) NOT NULL,
	[ExpiredDate] [datetime] NOT NULL,
	[SysUserId] [int] NULL,
 CONSTRAINT [PK_AgencyToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BTCPrice]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[BTCTransaction]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[CoinTransaction]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[Currency]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[ETHTransaction]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[Lang]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[LangContent]    Script Date: 9/10/2018 6:11:05 PM ******/
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
/****** Object:  Table [dbo].[LangDetail]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[LangMsgDetail]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[Lottery]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[LotteryHistory]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[LotteryPrize]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[MobileLangDetail]    Script Date: 9/10/2018 6:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileLangDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_MobileLangDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileLangMsgDetail]    Script Date: 9/10/2018 6:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileLangMsgDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_MobileLangMsgDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[PricePrediction]    Script Date: 9/10/2018 6:11:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePrediction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [ntext] NULL,
	[ResultPrice] [money] NULL,
	[NumberOfPredictors] [int] NULL,
	[Volume] [money] NULL,
	[Coinbase] [nvarchar](10) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[OpenBettingTime] [datetime] NOT NULL,
	[CloseBettingTime] [datetime] NOT NULL,
	[ResultTime] [datetime] NOT NULL,
	[ToBeComparedTime] [datetime] NOT NULL,
	[ToBeComparedPrice] [money] NULL,
 CONSTRAINT [PK_PricePrediction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionHistory]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[Setting]    Script Date: 9/10/2018 6:11:06 PM ******/
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
/****** Object:  Table [dbo].[SysUser]    Script Date: 9/10/2018 6:11:07 PM ******/
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
	[AgencyId] [int] NULL,
	[AffiliateId] [int] NULL,
	[IsIntroducedById] [int] NULL,
	[AffiliateCreatedDate] [datetime] NULL,
	[IsLocked] [bit] NOT NULL,
 CONSTRAINT [PK_SysUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 9/10/2018 6:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
	[Avatar] [nvarchar](150) NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 9/10/2018 6:11:07 PM ******/
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
SET IDENTITY_INSERT [dbo].[BTCPrice] ON 
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1, 6290.2400, 1536572119)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2, 6290.2400, 1536572121)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (3, 6290.2400, 1536572122)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (4, 6290.2400, 1536572124)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (5, 6290.2400, 1536572125)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (6, 6290.2400, 1536572126)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (7, 6290.2400, 1536572127)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (8, 6290.2400, 1536572128)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (9, 6290.2400, 1536572130)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (10, 6292.2000, 1536572131)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (11, 6290.2500, 1536572132)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (12, 6290.2200, 1536572133)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (13, 6290.2200, 1536572134)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (14, 6290.2200, 1536572136)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (15, 6290.2300, 1536572137)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (16, 6290.2300, 1536572138)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (17, 6290.2300, 1536572139)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (18, 6290.2500, 1536572140)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (19, 6290.2500, 1536572142)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (20, 6290.2000, 1536572144)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (21, 6292.1900, 1536572145)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (22, 6292.1900, 1536572146)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (23, 6290.2100, 1536572147)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (24, 6290.2100, 1536572148)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (25, 6291.5000, 1536572151)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (26, 6290.2100, 1536572152)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (27, 6290.2100, 1536572153)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (28, 6290.2100, 1536572154)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (29, 6290.2100, 1536572155)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (30, 6290.2000, 1536572157)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (31, 6290.2100, 1536572158)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (32, 6291.5000, 1536572159)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (33, 6290.2100, 1536572160)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (34, 6290.2100, 1536572161)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (35, 6290.2200, 1536572163)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (36, 6290.2000, 1536572164)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (37, 6292.2000, 1536572165)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (38, 6292.3000, 1536572166)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (39, 6292.3000, 1536572167)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (40, 6290.2000, 1536572169)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (41, 6290.2000, 1536572170)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (42, 6290.2100, 1536572171)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (43, 6290.2100, 1536572172)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (44, 6291.5600, 1536572173)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (45, 6290.2000, 1536572175)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (46, 6292.3100, 1536572176)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (47, 6292.3100, 1536572177)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (48, 6290.2000, 1536572178)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (49, 6290.2100, 1536572179)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (50, 6290.2100, 1536572180)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (51, 6292.0000, 1536572182)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (52, 6286.0200, 1536572183)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (53, 6286.0200, 1536572184)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (54, 6290.2300, 1536572185)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (55, 6286.0900, 1536572186)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (56, 6286.0800, 1536572188)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (57, 6291.1000, 1536572189)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (58, 6284.1900, 1536572190)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (59, 6290.1700, 1536572191)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (60, 6284.1800, 1536572192)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (61, 6284.1800, 1536572194)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (62, 6289.9100, 1536572195)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (63, 6289.9100, 1536572196)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (64, 6289.9100, 1536572197)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (65, 6289.9100, 1536572198)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (66, 6284.3100, 1536572199)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (67, 6284.3100, 1536572201)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (68, 6284.3100, 1536572202)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (69, 6289.4300, 1536572203)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (70, 6285.0200, 1536572204)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (71, 6285.0200, 1536572205)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (72, 6285.0200, 1536572207)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (73, 6289.3200, 1536572208)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (74, 6289.3200, 1536572209)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (75, 6285.0900, 1536572210)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (76, 6289.2500, 1536572212)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (77, 6289.1900, 1536572214)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (78, 6285.1200, 1536572215)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (79, 6285.2500, 1536572216)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (80, 6285.2600, 1536572217)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (81, 6285.2600, 1536572218)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (82, 6285.2600, 1536572220)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (83, 6288.9400, 1536572221)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (84, 6285.0100, 1536572222)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (85, 6285.5000, 1536572223)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (86, 6285.5000, 1536572224)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (87, 6285.5100, 1536572225)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (88, 6285.5000, 1536572227)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (89, 6285.5000, 1536572228)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (90, 6285.5000, 1536572229)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (91, 6287.9700, 1536572230)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (92, 6287.9700, 1536572231)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (93, 6287.9700, 1536572233)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (94, 6287.9700, 1536572234)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (95, 6287.9700, 1536572235)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (96, 6284.0200, 1536572236)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (97, 6287.9300, 1536572237)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (98, 6287.9300, 1536572239)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (99, 6287.9300, 1536572240)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (100, 6284.8200, 1536572241)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (101, 6286.0000, 1536572242)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (102, 6286.0000, 1536572243)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (103, 6286.0000, 1536572245)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (104, 6284.8100, 1536572246)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (105, 6284.8100, 1536572247)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (106, 6284.9000, 1536572248)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (107, 6284.9000, 1536572249)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (108, 6284.2300, 1536572250)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (109, 6284.2300, 1536572252)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (110, 6284.2400, 1536572253)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (111, 6284.2300, 1536572254)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (112, 6284.2300, 1536572255)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (113, 6284.2400, 1536572256)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (114, 6284.2300, 1536572258)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (115, 6284.2400, 1536572259)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (116, 6287.9700, 1536572260)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (117, 6284.2300, 1536572261)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (118, 6287.9600, 1536572262)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (119, 6287.9600, 1536572264)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (120, 6284.2300, 1536572265)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (121, 6284.2400, 1536572266)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (122, 6286.5700, 1536572267)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (123, 6286.5700, 1536572268)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (124, 6284.9200, 1536572270)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (125, 6284.9200, 1536572271)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (126, 6284.9200, 1536572272)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (127, 6285.2400, 1536572273)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (128, 6285.2400, 1536572274)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (129, 6285.2500, 1536572275)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (130, 6285.2500, 1536572277)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (131, 6285.2500, 1536572278)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (132, 6285.2500, 1536572279)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (133, 6284.9200, 1536572280)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (134, 6284.9200, 1536572281)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (135, 6284.9200, 1536572283)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (136, 6284.9200, 1536572284)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (137, 6284.2400, 1536572285)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (138, 6286.0000, 1536572286)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (139, 6286.0000, 1536572287)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (140, 6286.0000, 1536572288)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (141, 6286.0000, 1536572290)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (142, 6286.0000, 1536572291)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (143, 6285.2500, 1536572292)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (144, 6284.2500, 1536572293)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (145, 6284.2500, 1536572294)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (146, 6284.2300, 1536572296)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (147, 6284.2400, 1536572298)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (148, 6286.4100, 1536572299)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (149, 6284.2500, 1536572300)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (150, 6284.2500, 1536572301)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (151, 6284.2500, 1536572303)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (152, 6284.2500, 1536572304)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (153, 6284.3700, 1536572305)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (154, 6284.3700, 1536572306)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (155, 6287.6800, 1536572307)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (156, 6287.6800, 1536572309)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (157, 6287.6800, 1536572310)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (158, 6287.6800, 1536572311)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (159, 6287.6800, 1536572312)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (160, 6287.6800, 1536572313)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (161, 6284.5400, 1536572314)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (162, 6284.5400, 1536572316)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (163, 6286.9900, 1536572317)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (164, 6286.9900, 1536572318)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (165, 6286.9900, 1536572319)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (166, 6286.9900, 1536572320)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (167, 6284.6200, 1536572323)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (168, 6284.6200, 1536572324)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (169, 6284.6200, 1536572325)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (170, 6286.0000, 1536572326)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (171, 6286.0000, 1536572327)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (172, 6284.6300, 1536572329)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (173, 6284.6300, 1536572330)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (174, 6284.6400, 1536572331)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (175, 6286.0000, 1536572332)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (176, 6284.6600, 1536572333)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (177, 6284.6600, 1536572334)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (178, 6284.6600, 1536572336)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (179, 6284.6600, 1536572337)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (180, 6284.6600, 1536572338)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (181, 6284.6600, 1536572339)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (182, 6284.6600, 1536572340)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (183, 6292.3100, 1536572342)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (184, 6284.6500, 1536572343)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (185, 6285.6900, 1536572328)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (186, 6286.0500, 1536572330)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (187, 6286.0500, 1536572331)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (188, 6286.0500, 1536572332)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (189, 6286.1100, 1536572334)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (190, 6286.1200, 1536572335)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (191, 6287.1800, 1536572336)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (192, 6287.1900, 1536572337)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (193, 6287.9300, 1536572338)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (194, 6290.1000, 1536572339)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (195, 6287.9900, 1536572340)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (196, 6288.0100, 1536572341)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (197, 6288.0400, 1536572343)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (198, 6288.0400, 1536572344)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (199, 6288.0400, 1536572345)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (200, 6288.0400, 1536572346)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (201, 6288.0400, 1536572347)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (202, 6288.6700, 1536572348)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (203, 6288.6700, 1536572349)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (204, 6288.6700, 1536572350)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (205, 6288.6700, 1536572352)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (206, 6292.3700, 1536572353)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (207, 6288.8300, 1536572354)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (208, 6289.2900, 1536572355)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (209, 6289.2900, 1536572356)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (210, 6289.3000, 1536572357)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (211, 6292.3700, 1536572358)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (212, 6292.3700, 1536572359)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (213, 6292.3700, 1536572360)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (214, 6292.3700, 1536572361)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (215, 6292.3600, 1536572362)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (216, 6292.3700, 1536572364)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (217, 6292.3700, 1536572365)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (218, 6295.0000, 1536572366)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (219, 6295.0000, 1536572367)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (220, 6296.2400, 1536572368)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (221, 6296.2400, 1536572369)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (222, 6296.2400, 1536572370)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (223, 6296.2400, 1536572371)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (224, 6296.2400, 1536572372)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (225, 6294.1100, 1536572373)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (226, 6294.0100, 1536572375)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (227, 6296.0000, 1536572376)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (228, 6294.1400, 1536572377)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (229, 6296.0000, 1536572378)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (230, 6296.0000, 1536572379)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (231, 6294.1500, 1536572380)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (232, 6294.1500, 1536572381)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (233, 6294.1500, 1536572382)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (234, 6297.1400, 1536572383)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (235, 6295.0700, 1536572384)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (236, 6295.0700, 1536572386)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (237, 6295.0800, 1536572387)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (238, 6295.0800, 1536572388)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (239, 6295.0900, 1536572389)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (240, 6295.0900, 1536572390)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (241, 6295.0900, 1536572391)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (242, 6295.0600, 1536572392)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (243, 6295.0600, 1536572393)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (244, 6295.0900, 1536572395)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (245, 6295.0900, 1536572396)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (246, 6295.0900, 1536572398)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (247, 6295.0900, 1536572400)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (248, 6295.4400, 1536572401)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (249, 6298.0500, 1536572402)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (250, 6298.0500, 1536572403)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (251, 6295.5600, 1536572404)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (252, 6299.9900, 1536572405)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (253, 6299.9900, 1536572406)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (254, 6299.9900, 1536572407)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (255, 6296.7700, 1536572409)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (256, 6296.7700, 1536572410)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (257, 6296.7700, 1536572411)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (258, 6296.8100, 1536572412)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (259, 6296.8400, 1536572413)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (260, 6296.8500, 1536572414)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (261, 6296.8900, 1536572415)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (262, 6296.8900, 1536572416)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (263, 6300.0000, 1536572418)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (264, 6300.0000, 1536572419)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (265, 6300.0000, 1536572420)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (266, 6300.0000, 1536572421)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (267, 6300.0000, 1536572422)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (268, 6300.0000, 1536572423)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (269, 6300.0000, 1536572424)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (270, 6298.8800, 1536572425)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (271, 6298.8900, 1536572426)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (272, 6301.0200, 1536572428)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (273, 6301.0200, 1536572429)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (274, 6301.0200, 1536572430)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (275, 6298.9000, 1536572431)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (276, 6298.9000, 1536572432)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (277, 6298.9100, 1536572433)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (278, 6298.9100, 1536572434)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (279, 6301.0200, 1536572435)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (280, 6299.0700, 1536572437)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (281, 6301.0200, 1536572438)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (282, 6301.0200, 1536572439)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (283, 6301.9600, 1536572440)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (284, 6299.0800, 1536572441)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (285, 6298.9200, 1536572442)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (286, 6298.9200, 1536572443)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (287, 6298.9200, 1536572445)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (288, 6298.9300, 1536572446)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (289, 6298.9300, 1536572447)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (290, 6301.8400, 1536572448)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (291, 6301.0200, 1536572449)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (292, 6301.0200, 1536572450)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (293, 6301.8400, 1536572451)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (294, 6298.9300, 1536572453)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (295, 6298.9300, 1536572454)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (296, 6298.9300, 1536572455)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (297, 6301.0000, 1536572456)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (298, 6301.0000, 1536572457)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (299, 6298.9700, 1536572458)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (300, 6301.0000, 1536572459)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (301, 6301.0000, 1536572460)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (302, 6298.9600, 1536572461)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (303, 6298.9700, 1536572463)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (304, 6298.9700, 1536572464)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (305, 6298.9300, 1536572465)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (306, 6298.9100, 1536572466)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (307, 6298.9100, 1536572467)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (308, 6298.9100, 1536572468)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (309, 6296.8900, 1536572469)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (310, 6296.8900, 1536572470)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (311, 6296.8900, 1536572471)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (312, 6296.8900, 1536572473)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (313, 6296.8900, 1536572474)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (314, 6296.8900, 1536572475)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (315, 6296.8900, 1536572476)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (316, 6296.8900, 1536572477)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (317, 6295.1800, 1536572478)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (318, 6295.1900, 1536572479)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (319, 6295.1900, 1536572480)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (320, 6295.1900, 1536572481)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (321, 6295.0600, 1536572483)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (322, 6295.0600, 1536572484)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (323, 6295.0600, 1536572485)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (324, 6295.0600, 1536572486)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (325, 6295.0600, 1536572487)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (326, 6295.0600, 1536572488)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (327, 6295.0600, 1536572489)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (328, 6295.0500, 1536572490)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (329, 6296.8400, 1536572491)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (330, 6296.8400, 1536572492)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (331, 6296.8900, 1536572494)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (332, 6296.6000, 1536572495)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (333, 6296.8900, 1536572496)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (334, 6295.0500, 1536572497)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (335, 6296.8900, 1536572498)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (336, 6295.0600, 1536572499)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (337, 6296.8900, 1536572500)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (338, 6295.0500, 1536572501)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (339, 6296.8900, 1536572503)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (340, 6295.0500, 1536572504)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (341, 6295.0600, 1536572505)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (342, 6296.8900, 1536572506)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (343, 6295.5100, 1536572507)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (344, 6295.5000, 1536572508)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (345, 6295.5000, 1536572509)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (346, 6296.8900, 1536572511)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (347, 6295.5000, 1536572513)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (348, 6295.5100, 1536572514)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (349, 6296.8900, 1536572515)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (350, 6295.0500, 1536572516)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (351, 6296.8900, 1536572517)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (352, 6296.8900, 1536572518)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (353, 6295.0700, 1536572519)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (354, 6295.0700, 1536572520)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (355, 6296.8900, 1536572522)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (356, 6296.8900, 1536572523)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (357, 6296.8900, 1536572524)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (358, 6295.0700, 1536572525)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (359, 6294.8900, 1536572526)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (360, 6296.8900, 1536572527)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (361, 6296.8900, 1536572528)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (362, 6296.8900, 1536572529)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (363, 6296.8900, 1536572530)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (364, 6295.0600, 1536572531)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (365, 6295.0600, 1536572533)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (366, 6298.7200, 1536572534)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (367, 6298.7200, 1536572535)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (368, 6298.7200, 1536572536)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (369, 6298.7200, 1536572537)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (370, 6298.7200, 1536572538)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (371, 6298.7200, 1536572539)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (372, 6298.7200, 1536572540)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (373, 6298.7200, 1536572542)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (374, 6299.2600, 1536572543)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (375, 6298.9300, 1536572544)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (376, 6298.9300, 1536572545)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (377, 6298.9300, 1536572546)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (378, 6298.9300, 1536572547)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (379, 6298.9300, 1536572548)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (380, 6296.1800, 1536572549)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (381, 6296.1800, 1536572550)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (382, 6296.1800, 1536572551)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (383, 6296.1800, 1536572553)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (384, 6301.0000, 1536572554)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (385, 6301.0000, 1536572555)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (386, 6301.0000, 1536572556)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (387, 6301.8400, 1536572557)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (388, 6301.8400, 1536572558)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (389, 6301.8400, 1536572559)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (390, 6301.8300, 1536572560)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (391, 6301.8400, 1536572561)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (392, 6301.8400, 1536572563)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (393, 6301.8400, 1536572564)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (394, 6301.8400, 1536572565)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (395, 6301.0000, 1536572566)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (396, 6301.0000, 1536572567)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (397, 6299.1300, 1536572568)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (398, 6299.1300, 1536572569)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (399, 6299.1300, 1536572571)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (400, 6299.1300, 1536572572)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (401, 6299.1300, 1536572573)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (402, 6299.1300, 1536572574)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (403, 6299.1300, 1536572575)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (404, 6299.1600, 1536572576)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (405, 6301.0000, 1536572577)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (406, 6301.0000, 1536572578)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (407, 6301.0000, 1536572580)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (408, 6299.2200, 1536572581)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (409, 6299.2400, 1536572582)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (410, 6299.2400, 1536572583)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (411, 6299.2400, 1536572584)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (412, 6299.2400, 1536572585)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (413, 6299.2500, 1536572586)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (414, 6299.2500, 1536572587)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (415, 6300.0800, 1536572588)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (416, 6301.4200, 1536572590)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (417, 6304.0200, 1536572591)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (418, 6304.8500, 1536572592)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (419, 6305.0000, 1536572593)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (420, 6305.0000, 1536572594)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (421, 6305.0000, 1536572595)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (422, 6305.0000, 1536572596)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (423, 6305.0000, 1536572597)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (424, 6305.0000, 1536572598)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (425, 6302.5500, 1536572599)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (426, 6302.5600, 1536572601)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (427, 6302.5600, 1536572602)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (428, 6301.4200, 1536572603)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (429, 6301.4200, 1536572604)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (430, 6301.4200, 1536572605)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (431, 6301.4200, 1536572606)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (432, 6304.9900, 1536572607)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (433, 6304.9900, 1536572610)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (434, 6304.9900, 1536572611)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (435, 6304.9900, 1536572613)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (436, 6304.9700, 1536572614)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (437, 6302.0600, 1536572615)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (438, 6302.0600, 1536572616)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (439, 6303.0700, 1536572618)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (440, 6303.0700, 1536572620)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (441, 6303.0700, 1536572621)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (442, 6303.0700, 1536572622)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (443, 6303.0700, 1536572623)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (444, 6303.0600, 1536572624)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (445, 6303.0900, 1536572625)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (446, 6303.1000, 1536572626)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (447, 6303.0900, 1536572628)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (448, 6304.8600, 1536572629)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (449, 6304.8600, 1536572630)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (450, 6302.5300, 1536572631)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (451, 6302.5300, 1536572632)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (452, 6303.2000, 1536572633)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (453, 6302.0600, 1536572634)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (454, 6302.0600, 1536572635)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (455, 6302.0500, 1536572636)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (456, 6302.0500, 1536572637)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (457, 6305.0000, 1536572639)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (458, 6305.0000, 1536572640)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (459, 6302.0600, 1536572641)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (460, 6302.0600, 1536572642)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (461, 6302.0600, 1536572643)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (462, 6302.0600, 1536572644)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (463, 6302.0600, 1536572645)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (464, 6302.0600, 1536572646)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (465, 6302.0600, 1536572647)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (466, 6302.0600, 1536572649)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (467, 6304.9600, 1536572650)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (468, 6304.9600, 1536572651)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (469, 6304.9600, 1536572652)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (470, 6302.0600, 1536572653)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (471, 6302.0600, 1536572654)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (472, 6302.0600, 1536572655)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (473, 6302.0600, 1536572656)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (474, 6302.0600, 1536572658)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (475, 6302.0600, 1536572659)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (476, 6302.0600, 1536572660)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (477, 6302.0600, 1536572661)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (478, 6302.0600, 1536572662)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (479, 6304.0000, 1536572663)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (480, 6304.0000, 1536572664)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (481, 6302.0600, 1536572665)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (482, 6301.4200, 1536572667)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (483, 6301.4200, 1536572668)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (484, 6301.4200, 1536572669)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (485, 6300.0000, 1536572670)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (486, 6301.4200, 1536572671)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (487, 6301.4200, 1536572672)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (488, 6301.4200, 1536572673)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (489, 6300.0100, 1536572674)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (490, 6300.0100, 1536572675)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (491, 6300.0100, 1536572677)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (492, 6300.0500, 1536572678)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (493, 6300.0100, 1536572679)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (494, 6300.0100, 1536572680)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (495, 6301.4200, 1536572681)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (496, 6301.4200, 1536572682)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (497, 6301.4200, 1536572683)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (498, 6300.1000, 1536572684)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (499, 6300.1000, 1536572685)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (500, 6300.0900, 1536572687)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (501, 6300.0900, 1536572688)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (502, 6300.0800, 1536572689)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (503, 6301.0000, 1536572690)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (504, 6301.0000, 1536572691)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (505, 6300.0300, 1536572692)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (506, 6300.0800, 1536572693)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (507, 6301.0000, 1536572694)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (508, 6300.1000, 1536572696)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (509, 6301.0000, 1536572697)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (510, 6301.0000, 1536572698)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (511, 6300.0900, 1536572699)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (512, 6300.0900, 1536572700)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (513, 6300.0900, 1536572701)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (514, 6300.0900, 1536572703)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (515, 6300.9900, 1536572704)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (516, 6300.9900, 1536572705)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (517, 6300.1000, 1536572706)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (518, 6300.1000, 1536572707)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (519, 6300.1000, 1536572708)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (520, 6300.1000, 1536572709)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (521, 6300.1000, 1536572710)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (522, 6300.1000, 1536572711)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (523, 6300.1000, 1536572712)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (524, 6301.0000, 1536572714)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (525, 6300.1000, 1536572715)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (526, 6300.1000, 1536572716)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (527, 6300.1000, 1536572717)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (528, 6300.1100, 1536572718)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (529, 6300.1000, 1536572719)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (530, 6300.1100, 1536572721)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (531, 6300.1100, 1536572722)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (532, 6300.1200, 1536572723)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (533, 6300.1000, 1536572724)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (534, 6300.1000, 1536572725)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (535, 6300.0900, 1536572726)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (536, 6300.0900, 1536572727)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (537, 6300.0900, 1536572728)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (538, 6300.0900, 1536572729)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (539, 6300.0900, 1536572731)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (540, 6301.0000, 1536572732)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (541, 6300.1000, 1536572733)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (542, 6300.0900, 1536572734)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (543, 6300.0900, 1536572735)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (544, 6300.0900, 1536572736)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (545, 6300.1000, 1536572737)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (546, 6300.1100, 1536572739)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (547, 6300.0900, 1536572740)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (548, 6300.1000, 1536572741)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (549, 6300.1000, 1536572742)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (550, 6300.0900, 1536572743)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (551, 6300.1000, 1536572744)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (552, 6300.1000, 1536572745)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (553, 6300.0900, 1536572746)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (554, 6300.0900, 1536572748)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (555, 6300.1000, 1536572749)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (556, 6301.0000, 1536572750)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (557, 6300.9600, 1536572751)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (558, 6300.9600, 1536572752)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (559, 6300.9600, 1536572753)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (560, 6300.9600, 1536572754)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (561, 6300.9600, 1536572755)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (562, 6301.0000, 1536572756)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (563, 6301.0000, 1536572758)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (564, 6301.0000, 1536572759)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (565, 6301.0000, 1536572760)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (566, 6300.9500, 1536572761)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (567, 6301.0000, 1536572762)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (568, 6300.9600, 1536572763)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (569, 6300.9600, 1536572764)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (570, 6300.9600, 1536572766)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (571, 6300.9600, 1536572767)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (572, 6299.1500, 1536572768)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (573, 6296.8900, 1536572769)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (574, 6296.9000, 1536572770)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (575, 6294.0500, 1536572771)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (576, 6294.0500, 1536572772)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (577, 6299.1500, 1536572773)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (578, 6294.7300, 1536572775)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (579, 6294.0000, 1536572776)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (580, 6294.0100, 1536572777)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (581, 6294.0100, 1536572778)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (582, 6296.2900, 1536572779)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (583, 6296.2900, 1536572780)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (584, 6296.2900, 1536572781)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (585, 6295.1700, 1536572782)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (586, 6296.2900, 1536572783)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (587, 6294.0700, 1536572785)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (588, 6296.2900, 1536572786)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (589, 6294.0700, 1536572787)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (590, 6294.0700, 1536572788)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (591, 6294.0700, 1536572789)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (592, 6294.0700, 1536572790)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (593, 6294.0800, 1536572791)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (594, 6294.0800, 1536572792)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (595, 6296.2800, 1536572793)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (596, 6296.2800, 1536572795)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (597, 6296.2800, 1536572796)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (598, 6294.0600, 1536572797)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (599, 6294.0600, 1536572798)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (600, 6296.3300, 1536572799)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (601, 6294.0600, 1536572800)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (602, 6294.0600, 1536572801)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (603, 6294.0600, 1536572803)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (604, 6294.0800, 1536572804)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (605, 6294.0600, 1536572805)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (606, 6296.3300, 1536572806)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (607, 6296.0000, 1536572807)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (608, 6296.0000, 1536572808)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (609, 6296.0000, 1536572809)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (610, 6294.0800, 1536572811)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (611, 6294.1100, 1536572812)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (612, 6294.1100, 1536572813)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (613, 6294.1100, 1536572814)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (614, 6294.1100, 1536572815)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (615, 6294.1300, 1536572816)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (616, 6296.3300, 1536572818)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (617, 6296.3300, 1536572819)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (618, 6296.3400, 1536572820)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (619, 6296.3300, 1536572821)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (620, 6294.0700, 1536572822)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (621, 6294.0600, 1536572823)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (622, 6294.0600, 1536572824)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (623, 6294.0600, 1536572826)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (624, 6295.0500, 1536572827)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (625, 6295.0500, 1536572828)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (626, 6295.0500, 1536572829)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (627, 6295.0600, 1536572830)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (628, 6295.0600, 1536572831)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (629, 6295.0600, 1536572832)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (630, 6295.0700, 1536572833)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (631, 6295.0700, 1536572834)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (632, 6295.0700, 1536572836)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (633, 6294.0700, 1536572837)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (634, 6294.0700, 1536572838)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (635, 6294.0700, 1536572839)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (636, 6295.8000, 1536572842)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (637, 6295.8000, 1536572843)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (638, 6294.0900, 1536572844)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (639, 6294.0900, 1536572845)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (640, 6294.0800, 1536572846)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (641, 6294.0800, 1536572847)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (642, 6294.0900, 1536572849)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (643, 6294.0900, 1536572850)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (644, 6294.0900, 1536572851)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (645, 6294.0900, 1536572852)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (646, 6294.1000, 1536572853)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (647, 6296.0000, 1536572854)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (648, 6294.0900, 1536572855)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (649, 6294.1000, 1536572856)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (650, 6296.3300, 1536572857)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (651, 6294.1000, 1536572859)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (652, 6294.1000, 1536572860)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (653, 6294.1000, 1536572861)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (654, 6294.1000, 1536572862)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (655, 6294.1000, 1536572863)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (656, 6294.1000, 1536572864)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (657, 6294.1000, 1536572865)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (658, 6296.3300, 1536572868)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (659, 6294.1000, 1536572869)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (660, 6294.1000, 1536572870)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (661, 6294.1000, 1536572871)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (662, 6294.1000, 1536572872)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (663, 6294.1000, 1536572873)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (664, 6294.1000, 1536572874)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (665, 6294.1000, 1536572876)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (666, 6294.1000, 1536572877)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (667, 6294.1000, 1536572878)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (668, 6294.1000, 1536572879)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (669, 6294.1600, 1536572880)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (670, 6294.1600, 1536572881)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (671, 6296.3300, 1536572882)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (672, 6296.3300, 1536572884)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (673, 6294.1600, 1536572885)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (674, 6294.1500, 1536572886)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (675, 6294.1500, 1536572887)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (676, 6294.1500, 1536572888)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (677, 6294.1400, 1536572889)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (678, 6294.1500, 1536572890)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (679, 6294.1500, 1536572891)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (680, 6296.3300, 1536572893)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (681, 6294.1800, 1536572894)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (682, 6294.1800, 1536572895)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (683, 6294.1700, 1536572896)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (684, 6294.2500, 1536572897)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (685, 6294.2500, 1536572898)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (686, 6294.2500, 1536572899)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (687, 6294.2500, 1536572900)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (688, 6294.3700, 1536572902)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (689, 6294.3700, 1536572903)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (690, 6294.1900, 1536572904)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (691, 6296.3300, 1536572905)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (692, 6296.3300, 1536572906)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (693, 6296.3300, 1536572907)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (694, 6296.3300, 1536572909)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (695, 6296.3300, 1536572910)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (696, 6294.2100, 1536572911)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (697, 6294.2100, 1536572912)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (698, 6297.5400, 1536572913)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (699, 6296.3300, 1536572914)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (700, 6296.3300, 1536572915)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (701, 6299.0000, 1536572916)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (702, 6297.0000, 1536572918)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (703, 6296.3300, 1536572919)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (704, 6297.0200, 1536572920)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (705, 6297.0200, 1536572921)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (706, 6297.0200, 1536572922)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (707, 6297.0200, 1536572923)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (708, 6297.0200, 1536572924)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (709, 6297.0100, 1536572925)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (710, 6294.9000, 1536572927)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (711, 6294.9000, 1536572928)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (712, 6294.9000, 1536572929)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (713, 6297.0300, 1536572930)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (714, 6298.9600, 1536572932)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (715, 6297.0300, 1536572933)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (716, 6297.0400, 1536572934)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (717, 6297.0300, 1536572935)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (718, 6295.8000, 1536572936)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (719, 6295.8000, 1536572937)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (720, 6295.8000, 1536572938)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (721, 6295.8000, 1536572939)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (722, 6295.8000, 1536572941)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (723, 6295.8000, 1536572942)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (724, 6295.8800, 1536572943)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (725, 6295.8800, 1536572944)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (726, 6295.8800, 1536572945)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (727, 6295.8800, 1536572946)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (728, 6295.8900, 1536572947)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (729, 6295.8800, 1536572949)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (730, 6295.8800, 1536572950)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (731, 6297.0300, 1536572951)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (732, 6297.0300, 1536572952)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (733, 6295.8900, 1536572953)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (734, 6297.0200, 1536572954)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (735, 6294.2100, 1536572956)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (736, 6294.2100, 1536572957)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (737, 6297.0000, 1536572959)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (738, 6297.0000, 1536572960)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (739, 6297.0000, 1536572961)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (740, 6294.2500, 1536572962)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (741, 6294.2500, 1536572963)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (742, 6294.2500, 1536572964)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (743, 6296.9100, 1536572965)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (744, 6296.9100, 1536572967)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (745, 6296.9100, 1536572968)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (746, 6296.9100, 1536572969)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (747, 6296.9100, 1536572970)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (748, 6296.9100, 1536572971)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (749, 6296.8700, 1536572972)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (750, 6296.8700, 1536572973)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (751, 6296.8700, 1536572974)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (752, 6296.8900, 1536572975)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (753, 6300.0000, 1536572977)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (754, 6296.9800, 1536572978)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (755, 6296.9800, 1536572979)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (756, 6296.9800, 1536572980)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (757, 6299.9900, 1536572981)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (758, 6299.9900, 1536572982)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (759, 6297.2000, 1536572984)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (760, 6297.2000, 1536572985)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (761, 6300.9200, 1536572986)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (762, 6296.9000, 1536572987)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (763, 6296.8700, 1536572988)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (764, 6297.2900, 1536572989)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (765, 6297.2900, 1536572990)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (766, 6296.9800, 1536572992)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (767, 6296.9800, 1536572993)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (768, 6297.3000, 1536572994)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (769, 6297.2700, 1536572995)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (770, 6297.2600, 1536572996)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (771, 6297.2600, 1536572997)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (772, 6297.2600, 1536572998)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (773, 6297.2600, 1536573000)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (774, 6297.2600, 1536573001)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (775, 6298.9400, 1536573002)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (776, 6297.2700, 1536573003)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (777, 6297.2700, 1536573004)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (778, 6298.9400, 1536573005)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (779, 6298.9300, 1536573006)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (780, 6294.0600, 1536573008)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (781, 6294.1100, 1536573009)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (782, 6294.1200, 1536573010)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (783, 6294.1200, 1536573011)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (784, 6294.1200, 1536573012)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (785, 6294.6000, 1536573013)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (786, 6298.9200, 1536573014)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (787, 6298.9300, 1536573015)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (788, 6298.9300, 1536573017)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (789, 6298.9400, 1536573018)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (790, 6299.9500, 1536573019)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (791, 6299.9500, 1536573020)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (792, 6299.9500, 1536573021)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (793, 6299.9500, 1536573022)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (794, 6299.8800, 1536573023)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (795, 6300.0000, 1536573025)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (796, 6299.3600, 1536573026)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (797, 6295.3800, 1536573027)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (798, 6299.9900, 1536573028)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (799, 6299.9900, 1536573030)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (800, 6299.9900, 1536573032)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (801, 6299.9900, 1536573033)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (802, 6299.9900, 1536573035)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (803, 6299.9900, 1536573036)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (804, 6299.9900, 1536573037)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (805, 6299.9900, 1536573038)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (806, 6299.0000, 1536573039)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (807, 6299.8300, 1536573040)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (808, 6299.8300, 1536573041)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (809, 6299.8300, 1536573043)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (810, 6299.8300, 1536573044)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (811, 6295.7300, 1536573045)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (812, 6295.7300, 1536573046)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (813, 6295.7500, 1536573047)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (814, 6299.3600, 1536573049)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (815, 6299.3600, 1536573050)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (816, 6299.3600, 1536573051)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (817, 6299.0000, 1536573052)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (818, 6298.9900, 1536573053)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (819, 6298.9900, 1536573054)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (820, 6298.9900, 1536573055)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (821, 6298.9900, 1536573057)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (822, 6298.9300, 1536573058)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (823, 6298.9300, 1536573059)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (824, 6298.9000, 1536573060)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (825, 6295.7500, 1536573061)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (826, 6298.0600, 1536573062)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (827, 6295.7500, 1536573063)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (828, 6295.7500, 1536573065)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (829, 6298.0600, 1536573066)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (830, 6298.0600, 1536573067)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (831, 6295.7500, 1536573068)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (832, 6295.7500, 1536573069)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (833, 6295.7500, 1536573070)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (834, 6297.9900, 1536573071)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (835, 6297.9900, 1536573073)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (836, 6295.7400, 1536573074)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (837, 6295.7300, 1536573075)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (838, 6295.7300, 1536573076)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (839, 6295.7200, 1536573077)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (840, 6294.6100, 1536573078)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (841, 6294.6100, 1536573079)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (842, 6294.6100, 1536573081)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (843, 6294.6100, 1536573082)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (844, 6294.6100, 1536573083)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (845, 6294.6100, 1536573084)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (846, 6294.6100, 1536573085)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (847, 6294.6100, 1536573086)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (848, 6294.6100, 1536573087)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (849, 6294.0600, 1536573089)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (850, 6294.0600, 1536573090)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (851, 6294.6000, 1536573091)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (852, 6294.0700, 1536573092)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (853, 6294.0700, 1536573093)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (854, 6294.0700, 1536573094)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (855, 6294.0700, 1536573096)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (856, 6294.0700, 1536573097)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (857, 6294.0700, 1536573098)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (858, 6294.0600, 1536573099)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (859, 6294.0700, 1536573100)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (860, 6294.0700, 1536573101)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (861, 6294.0600, 1536573103)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (862, 6294.0700, 1536573104)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (863, 6294.0600, 1536573105)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (864, 6294.0600, 1536573106)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (865, 6294.0600, 1536573107)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (866, 6294.0600, 1536573108)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (867, 6294.0600, 1536573109)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (868, 6294.0600, 1536573111)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (869, 6294.0600, 1536573112)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (870, 6294.0600, 1536573113)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (871, 6294.0700, 1536573114)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (872, 6294.0700, 1536573115)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (873, 6294.0600, 1536573116)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (874, 6294.0700, 1536573117)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (875, 6294.0000, 1536573118)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (876, 6292.3700, 1536573120)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (877, 6294.0300, 1536573121)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (878, 6293.9700, 1536573122)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (879, 6293.9700, 1536573123)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (880, 6293.9600, 1536573124)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (881, 6293.9300, 1536573125)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (882, 6290.4800, 1536573126)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (883, 6290.4800, 1536573128)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (884, 6290.4800, 1536573129)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (885, 6290.4800, 1536573130)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (886, 6293.7900, 1536573131)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (887, 6291.1600, 1536573132)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (888, 6291.1600, 1536573133)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (889, 6291.1500, 1536573134)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (890, 6291.4400, 1536573136)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (891, 6291.4400, 1536573137)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (892, 6291.4400, 1536573138)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (893, 6291.4400, 1536573139)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (894, 6291.1400, 1536573140)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (895, 6291.1400, 1536573142)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (896, 6291.1400, 1536573143)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (897, 6291.1500, 1536573144)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (898, 6291.1500, 1536573145)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (899, 6291.1400, 1536573146)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (900, 6291.1400, 1536573147)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (901, 6291.4400, 1536573149)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (902, 6292.9500, 1536573151)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (903, 6292.9600, 1536573152)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (904, 6290.0000, 1536573154)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (905, 6290.0000, 1536573155)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (906, 6289.9900, 1536573156)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (907, 6289.9900, 1536573158)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (908, 6288.2500, 1536573159)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (909, 6288.2500, 1536573160)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (910, 6289.9900, 1536573161)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (911, 6289.9900, 1536573162)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (912, 6289.9900, 1536573163)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (913, 6289.9900, 1536573164)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (914, 6289.9900, 1536573165)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (915, 6290.0000, 1536573167)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (916, 6287.5000, 1536573168)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (917, 6289.9800, 1536573169)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (918, 6289.9800, 1536573170)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (919, 6289.9700, 1536573171)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (920, 6289.9700, 1536573172)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (921, 6289.9700, 1536573173)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (922, 6289.9700, 1536573175)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (923, 6288.2300, 1536573176)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (924, 6289.9600, 1536573177)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (925, 6289.9600, 1536573178)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (926, 6289.9600, 1536573179)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (927, 6287.8200, 1536573180)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (928, 6287.8200, 1536573181)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (929, 6289.9700, 1536573183)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (930, 6289.9600, 1536573184)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (931, 6289.9600, 1536573185)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (932, 6287.8200, 1536573186)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (933, 6289.9600, 1536573187)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (934, 6289.9800, 1536573188)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (935, 6289.9800, 1536573190)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (936, 6289.9800, 1536573191)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (937, 6290.0000, 1536573192)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (938, 6290.0000, 1536573193)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (939, 6289.9900, 1536573194)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (940, 6290.0000, 1536573196)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (941, 6287.8200, 1536573197)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (942, 6289.9900, 1536573198)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (943, 6289.9900, 1536573199)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (944, 6289.9900, 1536573200)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (945, 6289.9900, 1536573201)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (946, 6289.9900, 1536573203)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (947, 6287.8200, 1536573205)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (948, 6289.9800, 1536573206)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (949, 6289.9900, 1536573207)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (950, 6287.8200, 1536573208)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (951, 6290.0000, 1536573209)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (952, 6289.9900, 1536573211)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (953, 6287.8200, 1536573212)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (954, 6289.9900, 1536573213)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (955, 6286.9900, 1536573214)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (956, 6286.9900, 1536573215)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (957, 6289.9900, 1536573216)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (958, 6289.9900, 1536573217)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (959, 6286.9900, 1536573219)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (960, 6286.9900, 1536573220)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (961, 6289.0000, 1536573221)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (962, 6288.9900, 1536573222)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (963, 6289.0000, 1536573223)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (964, 6289.0000, 1536573224)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (965, 6290.0000, 1536573225)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (966, 6290.0000, 1536573227)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (967, 6290.0000, 1536573228)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (968, 6289.9900, 1536573229)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (969, 6289.9900, 1536573230)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (970, 6289.9900, 1536573231)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (971, 6289.0000, 1536573232)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (972, 6289.0000, 1536573234)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (973, 6289.9900, 1536573235)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (974, 6289.9900, 1536573236)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (975, 6290.0000, 1536573237)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (976, 6289.0000, 1536573238)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (977, 6290.0000, 1536573239)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (978, 6289.0100, 1536573241)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (979, 6289.0100, 1536573242)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (980, 6293.3700, 1536573243)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (981, 6290.0200, 1536573244)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (982, 6290.0200, 1536573245)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (983, 6290.0200, 1536573246)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (984, 6290.0400, 1536573247)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (985, 6290.0400, 1536573249)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (986, 6290.0400, 1536573250)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (987, 6290.0400, 1536573251)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (988, 6290.0400, 1536573252)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (989, 6290.0400, 1536573253)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (990, 6290.0800, 1536573255)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (991, 6290.0800, 1536573256)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (992, 6292.9700, 1536573257)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (993, 6290.1700, 1536573258)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (994, 6290.1700, 1536573259)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (995, 6290.1700, 1536573261)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (996, 6290.1700, 1536573262)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (997, 6290.1700, 1536573263)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (998, 6292.9300, 1536573264)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (999, 6298.0000, 1536573265)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1000, 6297.8300, 1536573266)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1001, 6297.8400, 1536573267)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1002, 6297.8400, 1536573269)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1003, 6297.8300, 1536573270)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1004, 6291.1200, 1536573271)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1005, 6297.8200, 1536573272)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1006, 6292.8500, 1536573274)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1007, 6292.8700, 1536573275)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1008, 6292.8700, 1536573276)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1009, 6296.4000, 1536573277)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1010, 6292.9400, 1536573278)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1011, 6296.3600, 1536573279)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1012, 6296.3400, 1536573280)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1013, 6296.3400, 1536573281)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1014, 6296.3300, 1536573283)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1015, 6296.3300, 1536573284)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1016, 6299.8300, 1536573285)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1017, 6299.8300, 1536573286)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1018, 6296.3200, 1536573287)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1019, 6296.3200, 1536573288)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1020, 6296.3100, 1536573289)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1021, 6293.2600, 1536573291)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1022, 6293.2800, 1536573292)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1023, 6293.3200, 1536573293)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1024, 6293.3200, 1536573294)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1025, 6293.3200, 1536573295)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1026, 6293.3200, 1536573296)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1027, 6293.3200, 1536573298)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1028, 6293.3600, 1536573299)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1029, 6293.3600, 1536573300)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1030, 6296.3000, 1536573301)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1031, 6296.2800, 1536573302)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1032, 6296.2600, 1536573303)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1033, 6296.2600, 1536573305)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1034, 6296.2600, 1536573306)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1035, 6296.2600, 1536573307)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1036, 6296.2600, 1536573308)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1037, 6294.0000, 1536573309)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1038, 6296.2300, 1536573310)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1039, 6294.0000, 1536573312)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1040, 6294.0000, 1536573313)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1041, 6294.0000, 1536573314)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1042, 6296.2200, 1536573315)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1043, 6296.2100, 1536573316)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1044, 6296.2100, 1536573317)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1045, 6296.2100, 1536573318)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1046, 6296.2100, 1536573320)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1047, 6296.2100, 1536573321)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1048, 6296.2000, 1536573322)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1049, 6296.1900, 1536573323)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1050, 6296.1900, 1536573324)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1051, 6299.2400, 1536573326)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1052, 6299.2400, 1536573327)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1053, 6299.1600, 1536573328)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1054, 6299.1600, 1536573329)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1055, 6293.9000, 1536573330)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1056, 6299.2100, 1536573331)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1057, 6299.2100, 1536573332)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1058, 6294.5500, 1536573333)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1059, 6294.5500, 1536573335)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1060, 6299.2200, 1536573336)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1061, 6299.2200, 1536573337)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1062, 6297.9800, 1536573338)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1063, 6295.8600, 1536573339)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1064, 6296.2600, 1536573340)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1065, 6296.3200, 1536573342)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1066, 6296.3300, 1536573343)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1067, 6299.8000, 1536573344)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1068, 6296.2500, 1536573345)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1069, 6295.1900, 1536573346)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1070, 6296.0100, 1536573348)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1071, 6297.9000, 1536573349)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1072, 6296.0000, 1536573350)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1073, 6294.5200, 1536573351)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1074, 6294.5200, 1536573352)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1075, 6294.7000, 1536573353)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1076, 6295.8700, 1536573354)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1077, 6299.0300, 1536573356)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1078, 6299.0300, 1536573357)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1079, 6299.0000, 1536573358)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1080, 6295.9100, 1536573359)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1081, 6295.9100, 1536573360)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1082, 6295.8600, 1536573361)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1083, 6298.9500, 1536573362)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1084, 6295.4000, 1536573364)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1085, 6298.9500, 1536573365)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1086, 6298.9500, 1536573366)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1087, 6298.9500, 1536573367)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1088, 6298.9500, 1536573368)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1089, 6298.8600, 1536573369)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1090, 6296.0300, 1536573371)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1091, 6296.0300, 1536573373)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1092, 6296.0300, 1536573374)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1093, 6296.0300, 1536573375)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1094, 6296.0300, 1536573376)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1095, 6296.0300, 1536573377)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1096, 6296.4000, 1536573379)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1097, 6296.2600, 1536573380)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1098, 6296.2600, 1536573381)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1099, 6296.4000, 1536573382)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1100, 6297.0500, 1536573383)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1101, 6297.0500, 1536573384)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1102, 6296.0000, 1536573385)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1103, 6296.0000, 1536573387)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1104, 6296.0000, 1536573388)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1105, 6296.0000, 1536573389)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1106, 6295.6800, 1536573390)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1107, 6294.0100, 1536573391)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1108, 6295.9900, 1536573392)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1109, 6295.9900, 1536573394)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1110, 6295.9800, 1536573395)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1111, 6295.9800, 1536573396)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1112, 6292.5900, 1536573397)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1113, 6292.5900, 1536573398)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1114, 6292.5900, 1536573400)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1115, 6292.5900, 1536573401)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1116, 6292.5700, 1536573402)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1117, 6295.9700, 1536573403)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1118, 6292.5800, 1536573404)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1119, 6292.5800, 1536573405)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1120, 6295.9700, 1536573406)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1121, 6295.9700, 1536573408)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1122, 6292.6000, 1536573409)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1123, 6292.6000, 1536573410)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1124, 6295.9700, 1536573411)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1125, 6295.9700, 1536573412)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1126, 6295.9700, 1536573413)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1127, 6295.7600, 1536573415)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1128, 6295.9700, 1536573416)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1129, 6295.9700, 1536573417)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1130, 6295.9700, 1536573418)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1131, 6295.9700, 1536573419)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1132, 6295.9700, 1536573420)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1133, 6295.9700, 1536573421)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1134, 6290.9400, 1536573422)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1135, 6290.9400, 1536573424)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1136, 6290.9400, 1536573425)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1137, 6290.9400, 1536573426)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1138, 6295.5000, 1536573427)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1139, 6295.8100, 1536573428)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1140, 6295.8100, 1536573429)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1141, 6295.8100, 1536573431)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1142, 6295.8100, 1536573432)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1143, 6291.5700, 1536573433)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1144, 6291.5700, 1536573434)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1145, 6291.5700, 1536573435)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1146, 6293.9400, 1536573436)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1147, 6295.0000, 1536573437)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1148, 6294.9900, 1536573439)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1149, 6295.0000, 1536573440)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1150, 6295.0000, 1536573441)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1151, 6294.9900, 1536573442)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1152, 6294.9900, 1536573443)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1153, 6294.9900, 1536573444)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1154, 6294.9900, 1536573446)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1155, 6294.9900, 1536573447)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1156, 6294.9900, 1536573448)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1157, 6294.9900, 1536573449)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1158, 6294.9900, 1536573450)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1159, 6294.9900, 1536573451)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1160, 6294.9900, 1536573452)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1161, 6295.8200, 1536573453)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1162, 6295.0000, 1536573455)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1163, 6295.0000, 1536573456)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1164, 6294.9900, 1536573457)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1165, 6294.9900, 1536573458)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1166, 6294.9900, 1536573459)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1167, 6294.9900, 1536573460)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1168, 6292.3100, 1536573462)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1169, 6292.3100, 1536573463)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1170, 6292.3100, 1536573464)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1171, 6292.3100, 1536573465)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1172, 6292.3100, 1536573466)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1173, 6292.5200, 1536573467)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1174, 6292.5200, 1536573469)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1175, 6294.9900, 1536573470)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1176, 6294.9900, 1536573471)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1177, 6295.8100, 1536573472)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1178, 6295.8200, 1536573473)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1179, 6295.8200, 1536573474)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1180, 6295.8200, 1536573476)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1181, 6295.8200, 1536573477)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1182, 6295.8200, 1536573478)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1183, 6295.8200, 1536573479)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1184, 6295.8200, 1536573480)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1185, 6295.8200, 1536573481)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1186, 6295.8200, 1536573483)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1187, 6295.8200, 1536573484)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1188, 6295.8200, 1536573485)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1189, 6295.8200, 1536573486)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1190, 6294.4400, 1536573487)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1191, 6294.4400, 1536573488)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1192, 6294.4500, 1536573490)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1193, 6294.4300, 1536573491)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1194, 6294.4300, 1536573492)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1195, 6299.9800, 1536573493)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1196, 6294.4900, 1536573494)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1197, 6294.4900, 1536573495)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1198, 6294.4900, 1536573496)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1199, 6294.4900, 1536573498)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1200, 6295.0100, 1536573499)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1201, 6295.0300, 1536573500)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1202, 6295.0300, 1536573501)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1203, 6295.0300, 1536573502)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1204, 6298.9000, 1536573504)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1205, 6298.9000, 1536573505)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1206, 6295.2500, 1536573506)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1207, 6298.8600, 1536573507)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1208, 6298.8600, 1536573508)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1209, 6298.8600, 1536573509)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1210, 6298.8600, 1536573510)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1211, 6298.8600, 1536573512)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1212, 6298.8500, 1536573513)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1213, 6298.8600, 1536573514)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1214, 6298.8500, 1536573516)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1215, 6298.8500, 1536573517)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1216, 6298.8500, 1536573518)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1217, 6298.8600, 1536573519)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1218, 6298.8500, 1536573520)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1219, 6298.8500, 1536573521)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1220, 6298.8500, 1536573522)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1221, 6298.8500, 1536573524)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1222, 6297.0100, 1536573525)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1223, 6297.0100, 1536573526)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1224, 6298.7800, 1536573527)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1225, 6297.0200, 1536573528)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1226, 6297.0200, 1536573529)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1227, 6297.0100, 1536573531)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1228, 6297.0200, 1536573532)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1229, 6299.8700, 1536573535)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1230, 6299.8700, 1536573536)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1231, 6299.8700, 1536573537)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1232, 6299.8700, 1536573538)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1233, 6297.1100, 1536573539)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1234, 6297.1100, 1536573540)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1235, 6299.8300, 1536573542)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1236, 6298.0600, 1536573543)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1237, 6298.0000, 1536573544)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1238, 6300.0000, 1536573545)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1239, 6300.0000, 1536573546)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1240, 6298.1200, 1536573547)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1241, 6303.3400, 1536573548)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1242, 6300.0000, 1536573550)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1243, 6300.0000, 1536573551)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1244, 6300.0000, 1536573552)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1245, 6300.0000, 1536573553)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1246, 6299.0000, 1536573554)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1247, 6299.0000, 1536573556)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1248, 6299.0000, 1536573557)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1249, 6299.0000, 1536573558)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1250, 6298.1800, 1536573559)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1251, 6298.2000, 1536573560)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1252, 6303.3400, 1536573562)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1253, 6303.3400, 1536573563)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1254, 6298.2400, 1536573564)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1255, 6298.2600, 1536573565)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1256, 6301.5800, 1536573566)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1257, 6304.4900, 1536573568)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1258, 6304.4900, 1536573569)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1259, 6303.0600, 1536573570)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1260, 6303.0200, 1536573571)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1261, 6303.0200, 1536573572)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1262, 6303.0400, 1536573573)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1263, 6304.4900, 1536573574)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1264, 6304.4900, 1536573576)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1265, 6303.8900, 1536573577)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1266, 6301.0700, 1536573578)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1267, 6303.9500, 1536573579)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1268, 6303.9500, 1536573580)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1269, 6303.9500, 1536573581)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1270, 6303.9500, 1536573583)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1271, 6300.0000, 1536573584)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1272, 6300.0000, 1536573585)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1273, 6300.0000, 1536573586)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1274, 6300.0000, 1536573587)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1275, 6303.9100, 1536573588)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1276, 6303.9100, 1536573589)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1277, 6303.9100, 1536573591)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1278, 6300.0800, 1536573592)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1279, 6303.8300, 1536573593)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1280, 6303.8300, 1536573594)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1281, 6303.8300, 1536573595)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1282, 6300.0900, 1536573596)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1283, 6300.0900, 1536573598)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1284, 6300.0900, 1536573599)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1285, 6300.0800, 1536573600)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1286, 6300.0800, 1536573601)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1287, 6300.0200, 1536573602)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1288, 6300.0200, 1536573603)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1289, 6303.9000, 1536573605)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1290, 6300.0600, 1536573606)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1291, 6297.8000, 1536573607)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1292, 6303.7800, 1536573608)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1293, 6298.2700, 1536573609)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1294, 6302.1100, 1536573610)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1295, 6302.0900, 1536573612)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1296, 6302.0900, 1536573613)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1297, 6302.0600, 1536573614)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1298, 6298.2700, 1536573615)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1299, 6300.0800, 1536573616)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1300, 6298.2700, 1536573617)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1301, 6298.2700, 1536573619)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1302, 6298.2700, 1536573620)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1303, 6298.2600, 1536573621)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1304, 6301.6300, 1536573622)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1305, 6298.2700, 1536573623)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1306, 6298.2600, 1536573624)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1307, 6301.5700, 1536573626)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1308, 6301.5700, 1536573627)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1309, 6301.5700, 1536573628)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1310, 6298.2600, 1536573629)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1311, 6298.2700, 1536573630)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1312, 6298.2600, 1536573632)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1313, 6298.2600, 1536573633)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1314, 6298.2500, 1536573634)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1315, 6294.5900, 1536573635)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1316, 6298.2500, 1536573636)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1317, 6296.4300, 1536573637)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1318, 6294.6200, 1536573639)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1319, 6294.5900, 1536573640)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1320, 6298.2300, 1536573642)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1321, 6298.2300, 1536573643)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1322, 6290.1600, 1536573644)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1323, 6298.1700, 1536573645)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1324, 6297.9900, 1536573646)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1325, 6297.9900, 1536573648)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1326, 6294.2700, 1536573649)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1327, 6294.2700, 1536573650)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1328, 6294.6100, 1536573651)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1329, 6298.1200, 1536573652)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1330, 6299.1900, 1536573653)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1331, 6300.0000, 1536573655)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1332, 6294.3400, 1536573656)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1333, 6300.0600, 1536573657)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1334, 6300.0800, 1536573658)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1335, 6294.2600, 1536573659)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1336, 6300.0400, 1536573660)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1337, 6300.0400, 1536573661)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1338, 6300.0300, 1536573663)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1339, 6300.0300, 1536573664)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1340, 6300.0700, 1536573665)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1341, 6294.4600, 1536573666)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1342, 6299.5100, 1536573667)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1343, 6299.5100, 1536573668)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1344, 6299.5100, 1536573670)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1345, 6299.5100, 1536573671)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1346, 6301.5600, 1536573672)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1347, 6301.5600, 1536573673)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1348, 6300.0700, 1536573674)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1349, 6300.0700, 1536573675)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1350, 6294.9100, 1536573678)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1351, 6294.9700, 1536573679)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1352, 6295.0100, 1536573680)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1353, 6298.3900, 1536573681)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1354, 6291.7700, 1536573682)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1355, 6291.7700, 1536573684)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1356, 6297.1400, 1536573685)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1357, 6297.1400, 1536573686)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1358, 6296.1900, 1536573687)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1359, 6296.1800, 1536573688)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1360, 6296.2100, 1536573689)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1361, 6296.2100, 1536573691)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1362, 6296.2000, 1536573692)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1363, 6296.2200, 1536573693)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1364, 6295.2500, 1536573694)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1365, 6295.2500, 1536573695)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1366, 6297.2000, 1536573696)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1367, 6291.9000, 1536573697)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1368, 6294.7100, 1536573699)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1369, 6294.6800, 1536573700)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1370, 6288.4300, 1536573701)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1371, 6291.6600, 1536573702)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1372, 6291.6600, 1536573703)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1373, 6291.6600, 1536573705)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1374, 6291.6600, 1536573706)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1375, 6294.7200, 1536573707)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1376, 6294.7200, 1536573708)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1377, 6294.7300, 1536573709)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1378, 6294.7300, 1536573710)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1379, 6294.7300, 1536573711)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1380, 6291.7200, 1536573713)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1381, 6288.5200, 1536573714)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1382, 6288.5100, 1536573715)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1383, 6288.5200, 1536573716)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1384, 6288.5100, 1536573717)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1385, 6287.8100, 1536573718)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1386, 6287.8100, 1536573720)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1387, 6288.5200, 1536573721)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1388, 6288.5200, 1536573722)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1389, 6287.9300, 1536573723)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1390, 6287.9300, 1536573724)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1391, 6287.9400, 1536573725)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1392, 6288.5200, 1536573727)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1393, 6288.5200, 1536573728)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1394, 6288.5200, 1536573729)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1395, 6287.9300, 1536573730)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1396, 6287.9300, 1536573731)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1397, 6288.5200, 1536573733)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1398, 6288.5200, 1536573734)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1399, 6288.5200, 1536573735)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1400, 6288.5200, 1536573736)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1401, 6288.5200, 1536573737)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1402, 6288.2500, 1536573738)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1403, 6287.8500, 1536573739)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1404, 6287.8500, 1536573741)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1405, 6288.5100, 1536573742)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1406, 6288.5200, 1536573743)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1407, 6288.5200, 1536573744)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1408, 6287.9100, 1536573745)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1409, 6293.4600, 1536573746)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1410, 6292.5500, 1536573748)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1411, 6292.5500, 1536573749)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1412, 6292.5500, 1536573750)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1413, 6292.5500, 1536573751)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1414, 6288.2700, 1536573752)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1415, 6294.7800, 1536573754)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1416, 6288.3500, 1536573755)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1417, 6288.3500, 1536573756)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1418, 6288.3500, 1536573757)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1419, 6288.3500, 1536573759)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1420, 6288.3500, 1536573760)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1421, 6288.3500, 1536573761)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1422, 6294.4900, 1536573762)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1423, 6294.4900, 1536573763)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1424, 6294.4900, 1536573764)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1425, 6294.4900, 1536573766)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1426, 6292.9900, 1536573767)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1427, 6292.9900, 1536573768)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1428, 6292.9900, 1536573769)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1429, 6292.9900, 1536573770)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1430, 6292.9900, 1536573772)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1431, 6292.9600, 1536573773)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1432, 6290.2100, 1536573774)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1433, 6290.2200, 1536573775)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1434, 6297.2600, 1536573777)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1435, 6297.0100, 1536573778)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1436, 6298.4700, 1536573779)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1437, 6297.9900, 1536573780)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1438, 6297.9900, 1536573781)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1439, 6298.3700, 1536573783)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1440, 6298.7400, 1536573784)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1441, 6298.0000, 1536573785)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1442, 6298.0000, 1536573786)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1443, 6298.0800, 1536573787)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1444, 6298.1100, 1536573788)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1445, 6298.0000, 1536573790)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1446, 6293.2500, 1536573791)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1447, 6293.2500, 1536573792)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1448, 6298.0700, 1536573793)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1449, 6298.0900, 1536573794)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1450, 6293.8500, 1536573795)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1451, 6293.8500, 1536573797)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1452, 6293.8600, 1536573798)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1453, 6293.8000, 1536573799)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1454, 6293.8700, 1536573800)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1455, 6293.8100, 1536573801)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1456, 6292.2200, 1536573803)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1457, 6295.8100, 1536573804)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1458, 6295.7500, 1536573805)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1459, 6295.7500, 1536573806)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1460, 6295.7500, 1536573807)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1461, 6295.7800, 1536573808)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1462, 6295.7800, 1536573809)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1463, 6292.2200, 1536573811)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1464, 6295.8100, 1536573812)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1465, 6295.8100, 1536573813)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1466, 6295.8200, 1536573814)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1467, 6295.8200, 1536573815)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1468, 6295.2900, 1536573816)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1469, 6295.2900, 1536573818)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1470, 6297.3800, 1536573819)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1471, 6293.2900, 1536573820)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1472, 6296.5700, 1536573821)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1473, 6296.5700, 1536573823)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1474, 6299.8400, 1536573824)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1475, 6299.8400, 1536573825)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1476, 6299.8400, 1536573826)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1477, 6299.8400, 1536573827)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1478, 6295.5500, 1536573828)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1479, 6299.6900, 1536573830)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1480, 6296.9700, 1536573831)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1481, 6296.9700, 1536573832)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1482, 6299.6600, 1536573833)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1483, 6299.6600, 1536573835)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1484, 6297.0900, 1536573836)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1485, 6299.6500, 1536573837)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1486, 6299.6500, 1536573838)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1487, 6299.6500, 1536573839)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1488, 6297.1700, 1536573840)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1489, 6297.1700, 1536573842)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1490, 6297.1900, 1536573843)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1491, 6297.1000, 1536573844)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1492, 6297.1600, 1536573845)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1493, 6297.1600, 1536573846)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1494, 6297.1600, 1536573847)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1495, 6295.2900, 1536573849)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1496, 6295.3000, 1536573850)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1497, 6295.3000, 1536573851)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1498, 6293.2800, 1536573852)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1499, 6297.0700, 1536573853)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1500, 6297.0700, 1536573855)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1501, 6293.3400, 1536573856)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1502, 6293.3400, 1536573857)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1503, 6293.3800, 1536573858)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1504, 6293.3700, 1536573859)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1505, 6293.3900, 1536573861)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1506, 6293.3900, 1536573862)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1507, 6294.0300, 1536573863)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1508, 6296.8300, 1536573864)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1509, 6296.8300, 1536573865)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1510, 6296.8300, 1536573867)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1511, 6296.8100, 1536573868)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1512, 6296.8100, 1536573870)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1513, 6296.7700, 1536573871)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1514, 6296.8400, 1536573872)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1515, 6297.1600, 1536573873)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1516, 6297.1600, 1536573874)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1517, 6294.1200, 1536573875)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1518, 6297.1600, 1536573877)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1519, 6297.1600, 1536573878)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1520, 6297.1600, 1536573879)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1521, 6297.1600, 1536573880)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1522, 6297.1600, 1536573881)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1523, 6296.8400, 1536573882)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1524, 6297.1600, 1536573884)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1525, 6296.8300, 1536573885)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1526, 6296.8400, 1536573886)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1527, 6294.2600, 1536573887)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1528, 6294.2600, 1536573888)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1529, 6296.8400, 1536573890)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1530, 6296.8400, 1536573891)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1531, 6297.1500, 1536573892)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1532, 6297.1500, 1536573893)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1533, 6297.1500, 1536573894)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1534, 6297.1500, 1536573896)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1535, 6297.1500, 1536573897)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1536, 6294.3500, 1536573898)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1537, 6293.3000, 1536573899)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1538, 6293.2900, 1536573900)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1539, 6293.2900, 1536573901)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1540, 6294.3400, 1536573903)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1541, 6294.3400, 1536573904)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1542, 6293.2400, 1536573905)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1543, 6293.2400, 1536573906)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1544, 6294.3200, 1536573907)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1545, 6291.2600, 1536573909)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1546, 6294.3400, 1536573910)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1547, 6291.2600, 1536573911)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1548, 6291.2600, 1536573912)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1549, 6291.0100, 1536573913)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1550, 6291.2600, 1536573914)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1551, 6291.2600, 1536573916)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1552, 6291.2600, 1536573917)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1553, 6294.2900, 1536573918)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1554, 6294.2900, 1536573919)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1555, 6294.2900, 1536573920)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1556, 6294.2900, 1536573922)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1557, 6294.2900, 1536573923)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1558, 6294.2900, 1536573924)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1559, 6294.2900, 1536573925)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1560, 6294.2900, 1536573926)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1561, 6294.2900, 1536573928)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1562, 6294.3000, 1536573929)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1563, 6294.3400, 1536573930)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1564, 6294.3400, 1536573931)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1565, 6293.9900, 1536573932)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1566, 6297.1200, 1536573933)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1567, 6297.1000, 1536573935)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1568, 6294.0200, 1536573936)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1569, 6294.0200, 1536573937)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1570, 6294.0400, 1536573938)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1571, 6294.0500, 1536573939)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1572, 6294.0500, 1536573941)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1573, 6294.0500, 1536573942)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1574, 6294.0500, 1536573943)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1575, 6296.5800, 1536573944)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1576, 6296.5800, 1536573945)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1577, 6296.5800, 1536573947)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1578, 6296.5800, 1536573948)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1579, 6296.5800, 1536573950)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1580, 6296.4900, 1536573951)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1581, 6296.4900, 1536573954)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1582, 6296.5700, 1536573955)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1583, 6296.4800, 1536573956)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1584, 6294.2100, 1536573957)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1585, 6294.2100, 1536573958)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1586, 6294.2100, 1536573959)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1587, 6294.2100, 1536573961)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1588, 6294.2000, 1536573962)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1589, 6297.0900, 1536573963)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1590, 6296.3900, 1536573964)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1591, 6297.0900, 1536573965)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1592, 6297.1600, 1536573966)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1593, 6297.1600, 1536573968)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1594, 6294.8500, 1536573969)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1595, 6294.8500, 1536573970)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1596, 6294.8500, 1536573971)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1597, 6294.8500, 1536573972)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1598, 6294.8500, 1536573973)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1599, 6297.1600, 1536573975)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1600, 6294.8700, 1536573976)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1601, 6294.8700, 1536573978)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1602, 6294.8300, 1536573979)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1603, 6294.8400, 1536573980)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1604, 6294.8400, 1536573982)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1605, 6294.8500, 1536573983)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1606, 6295.0000, 1536573984)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1607, 6297.1400, 1536573985)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1608, 6297.1400, 1536573986)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1609, 6297.1400, 1536573987)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1610, 6297.1400, 1536573989)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1611, 6297.1400, 1536573990)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1612, 6297.1400, 1536573991)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1613, 6295.0700, 1536573992)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1614, 6297.1400, 1536573993)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1615, 6297.1300, 1536573994)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1616, 6297.1400, 1536573996)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1617, 6297.1400, 1536573997)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1618, 6297.1400, 1536573998)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1619, 6297.1400, 1536573999)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1620, 6297.1400, 1536574001)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1621, 6297.1400, 1536574002)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1622, 6297.1400, 1536574003)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1623, 6297.1300, 1536574004)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1624, 6297.1300, 1536574005)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1625, 6297.1400, 1536574007)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1626, 6297.1300, 1536574008)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1627, 6297.1300, 1536574009)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1628, 6297.0600, 1536574010)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1629, 6297.0400, 1536574011)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1630, 6297.0200, 1536574013)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1631, 6297.0200, 1536574014)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1632, 6296.8900, 1536574015)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1633, 6296.8600, 1536574016)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1634, 6296.8600, 1536574017)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1635, 6292.5700, 1536574018)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1636, 6292.5700, 1536574020)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1637, 6296.8000, 1536574021)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1638, 6296.8000, 1536574022)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1639, 6296.7900, 1536574023)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1640, 6292.5900, 1536574024)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1641, 6296.7800, 1536574025)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1642, 6292.6000, 1536574027)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1643, 6296.7500, 1536574028)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1644, 6296.7300, 1536574029)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1645, 6296.7300, 1536574030)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1646, 6296.7300, 1536574031)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1647, 6296.7300, 1536574033)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1648, 6296.7100, 1536574034)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1649, 6296.7100, 1536574035)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1650, 6296.7100, 1536574036)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1651, 6296.7100, 1536574037)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1652, 6296.7100, 1536574039)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1653, 6296.7600, 1536574040)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1654, 6296.7600, 1536574041)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1655, 6296.7500, 1536574042)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1656, 6296.7400, 1536574043)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1657, 6296.7400, 1536574044)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1658, 6293.7000, 1536574046)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1659, 6293.7000, 1536574047)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1660, 6296.7400, 1536574048)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1661, 6293.7400, 1536574049)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1662, 6296.7400, 1536574050)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1663, 6296.7400, 1536574051)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1664, 6296.7400, 1536574053)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1665, 6296.7200, 1536574054)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1666, 6293.7800, 1536574055)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1667, 6296.7500, 1536574056)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1668, 6296.7500, 1536574057)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1669, 6296.7500, 1536574059)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1670, 6296.7500, 1536574060)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1671, 6296.7500, 1536574061)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1672, 6296.7500, 1536574062)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1673, 6296.7500, 1536574063)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1674, 6296.7500, 1536574065)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1675, 6296.7500, 1536574066)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1676, 6296.7500, 1536574067)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1677, 6294.0800, 1536574068)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1678, 6296.7500, 1536574069)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1679, 6296.7600, 1536574071)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1680, 6296.7500, 1536574072)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1681, 6296.7500, 1536574073)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1682, 6296.7600, 1536574074)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1683, 6296.7500, 1536574075)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1684, 6296.7500, 1536574077)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1685, 6296.7500, 1536574078)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1686, 6296.7500, 1536574079)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1687, 6296.7500, 1536574080)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1688, 6296.7500, 1536574081)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1689, 6294.1600, 1536574083)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1690, 6294.1600, 1536574084)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1691, 6294.1800, 1536574085)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1692, 6294.1800, 1536574086)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1693, 6296.7500, 1536574087)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1694, 6296.7500, 1536574088)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1695, 6296.7500, 1536574090)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1696, 6297.1400, 1536574091)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1697, 6294.2000, 1536574092)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1698, 6294.2000, 1536574093)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1699, 6294.2000, 1536574094)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1700, 6294.2000, 1536574096)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1701, 6294.2000, 1536574097)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1702, 6294.2000, 1536574098)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1703, 6296.6800, 1536574099)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1704, 6296.6800, 1536574100)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1705, 6294.2900, 1536574102)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1706, 6296.6800, 1536574103)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1707, 6296.6800, 1536574104)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1708, 6296.6800, 1536574105)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1709, 6294.8500, 1536574106)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1710, 6294.8500, 1536574108)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1711, 6294.8500, 1536574109)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1712, 6294.8500, 1536574110)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1713, 6296.6800, 1536574111)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1714, 6296.6800, 1536574112)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1715, 6296.6800, 1536574114)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1716, 6294.8600, 1536574115)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1717, 6294.8400, 1536574116)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1718, 6294.8400, 1536574118)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1719, 6294.8500, 1536574119)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1720, 6294.8500, 1536574120)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1721, 6294.8500, 1536574121)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1722, 6294.8500, 1536574122)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1723, 6294.3800, 1536574123)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1724, 6294.3900, 1536574125)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1725, 6294.3900, 1536574126)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1726, 6295.5400, 1536574127)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1727, 6294.3900, 1536574128)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1728, 6294.3900, 1536574130)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1729, 6293.4100, 1536574131)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1730, 6296.7000, 1536574132)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1731, 6296.6900, 1536574133)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1732, 6296.6900, 1536574134)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1733, 6295.2500, 1536574136)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1734, 6295.2400, 1536574137)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1735, 6295.2400, 1536574138)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1736, 6295.2500, 1536574139)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1737, 6295.2500, 1536574140)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1738, 6294.4200, 1536574142)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1739, 6294.4200, 1536574143)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1740, 6294.4200, 1536574144)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1741, 6294.3900, 1536574145)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1742, 6294.3900, 1536574146)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1743, 6294.4200, 1536574147)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1744, 6294.4200, 1536574149)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1745, 6294.4200, 1536574150)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1746, 6293.4900, 1536574151)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1747, 6293.4900, 1536574152)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1748, 6294.4200, 1536574153)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1749, 6294.4200, 1536574155)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1750, 6294.8800, 1536574156)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1751, 6294.8800, 1536574157)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1752, 6294.8700, 1536574158)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1753, 6294.8700, 1536574160)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1754, 6294.8700, 1536574161)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1755, 6293.4900, 1536574162)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1756, 6293.4900, 1536574163)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1757, 6293.4900, 1536574164)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1758, 6294.8700, 1536574165)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1759, 6294.8700, 1536574167)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1760, 6293.5700, 1536574168)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1761, 6294.8800, 1536574169)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1762, 6294.8800, 1536574170)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1763, 6296.6900, 1536574171)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1764, 6296.6800, 1536574173)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1765, 6296.6800, 1536574174)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1766, 6296.6800, 1536574175)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1767, 6296.6700, 1536574176)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1768, 6296.6700, 1536574177)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1769, 6296.6600, 1536574179)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1770, 6296.6600, 1536574180)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1771, 6296.6600, 1536574181)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1772, 6296.6600, 1536574182)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1773, 6296.6600, 1536574183)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1774, 6296.6600, 1536574185)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1775, 6296.6600, 1536574186)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1776, 6296.5100, 1536574187)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1777, 6296.5100, 1536574188)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1778, 6296.5100, 1536574190)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1779, 6296.5100, 1536574191)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1780, 6296.5100, 1536574192)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1781, 6296.5100, 1536574193)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1782, 6296.5100, 1536574194)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1783, 6296.5100, 1536574196)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1784, 6295.8000, 1536574197)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1785, 6295.8000, 1536574198)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1786, 6295.8000, 1536574199)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1787, 6295.8000, 1536574201)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1788, 6296.6700, 1536574202)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1789, 6296.6600, 1536574203)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1790, 6296.6600, 1536574204)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1791, 6296.6600, 1536574205)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1792, 6296.6600, 1536574207)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1793, 6296.6900, 1536574208)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1794, 6296.6900, 1536574209)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1795, 6296.6900, 1536574210)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1796, 6296.6900, 1536574211)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1797, 6296.6900, 1536574212)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1798, 6296.6900, 1536574214)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1799, 6296.6900, 1536574215)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1800, 6296.6800, 1536574216)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1801, 6296.6800, 1536574217)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1802, 6296.6800, 1536574218)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1803, 6296.6800, 1536574220)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1804, 6296.6800, 1536574221)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1805, 6296.6800, 1536574222)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1806, 6296.6900, 1536574223)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1807, 6296.6800, 1536574224)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1808, 6296.6800, 1536574225)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1809, 6296.6800, 1536574227)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1810, 6296.6800, 1536574228)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1811, 6296.6800, 1536574229)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1812, 6296.6800, 1536574230)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1813, 6296.6800, 1536574232)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1814, 6296.6800, 1536574233)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1815, 6293.8100, 1536574234)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1816, 6293.8100, 1536574235)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1817, 6293.8100, 1536574236)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1818, 6293.8100, 1536574238)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1819, 6293.8100, 1536574239)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1820, 6296.6800, 1536574240)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1821, 6293.9100, 1536574241)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1822, 6293.9100, 1536574243)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1823, 6293.9500, 1536574244)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1824, 6293.9600, 1536574245)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1825, 6293.9600, 1536574246)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1826, 6293.9600, 1536574248)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1827, 6293.9600, 1536574249)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1828, 6296.6400, 1536574250)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1829, 6296.6400, 1536574251)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1830, 6296.6400, 1536574253)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1831, 6293.9600, 1536574254)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1832, 6293.9600, 1536574255)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1833, 6293.9700, 1536574256)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1834, 6293.9800, 1536574257)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1835, 6293.9800, 1536574259)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1836, 6293.9800, 1536574260)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1837, 6296.5600, 1536574261)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1838, 6296.5600, 1536574262)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1839, 6294.0400, 1536574264)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1840, 6294.0400, 1536574265)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1841, 6295.9900, 1536574266)
GO
SET IDENTITY_INSERT [dbo].[BTCPrice] OFF
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (233, 1, N'Up', N'Up')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1699, 1, N'ClickHereToChangeKYC', N'Click <a href="/Profile/Kyc" class="text-primary">here</a> to change.')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1861, 2, N'ClickHereToChangeKYC', N'変更は <a href="/Profile/Kyc" class="text-primary">ココ</a> をクリックしてください。')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2280, 1, N'Affiliate', N'Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2281, 2, N'Affiliate', N'アフェリエイト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2282, 1, N'StandardAffiliate', N'Standard Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2283, 2, N'StandardAffiliate', N'アフェリエイトユーザ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2284, 1, N'AgencyAffiliate', N'Agency Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2285, 2, N'AgencyAffiliate', N'代理店アフィリエイト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2286, 1, N'Today', N'Today')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2287, 2, N'Today', N'今日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2288, 1, N'Yesterday', N'Yesterday')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2289, 2, N'Yesterday', N'昨日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2290, 1, N'Links', N'Links')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2291, 2, N'Links', N'リンク')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2292, 1, N'Slider', N'Slider')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2293, 2, N'Slider', N'スライダー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2294, 1, N'LotteryGame', N'Lottery Game')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2295, 2, N'LotteryGame', N'仮想通貨くじ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2296, 1, N'Banner', N'Banner')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2297, 2, N'Banner', N'バナー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2298, 1, N'Setting', N'Setting')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2299, 2, N'Setting', N'設定')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2300, 1, N'KYCVerificationActivated', N'KYC verification activated')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2301, 2, N'KYCVerificationActivated', N'KYC認証が完了しました')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2302, 1, N'StandardAffiliateTiers', N'Standard Affiliate Tiers')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2303, 2, N'StandardAffiliateTiers', N'標準アフィリエイトティア')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2304, 1, N'AgencyAffiliateTiers', N'Agency Affiliate Tiers')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2305, 2, N'AgencyAffiliateTiers', N'代理店アフィリエイトティア')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2306, 1, N'CookieExpiredInDays', N'Cookie Expired in Days')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2307, 2, N'CookieExpiredInDays', N'Cookieの有効期限')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2308, 1, N'AccountActivationEnable', N'Account activation enable')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2309, 2, N'AccountActivationEnable', N'アカウントアクティベーション有効')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2310, 1, N'AgencyCommissionDirectSaleTier1', N'Commission of direct introduction of TIER 1​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2311, 2, N'AgencyCommissionDirectSaleTier1', N'ティア1の直接紹介コミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2312, 1, N'AgencyCommissionDirectSaleTier2', N'Commission of direct introduction of TIER 2')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2313, 2, N'AgencyCommissionDirectSaleTier2', N'ティア2の直接紹介コミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2314, 1, N'AgencyCommissionDirectSaleTier3', N'Commission of direct introduction of TIER 3')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2315, 2, N'AgencyCommissionDirectSaleTier3', N'ティア3の直接紹介コミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2316, 1, N'AgencyCommissionTier2SaleToTier1', N'Commission of TIER 2 sales received by TIER 1​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2317, 2, N'AgencyCommissionTier2SaleToTier1', N'ティア1が受け取ったティア2からのコミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2318, 1, N'AgencyCommissionTier3SaleToTier1', N'Commission of TIER 3 sales received by TIER 1')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2319, 2, N'AgencyCommissionTier3SaleToTier1', N'ティア1が受け取ったティア3からのコミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2320, 1, N'AgencyCommissionTier3SaleToTier2', N'Commission of TIER 3 sales received by TIER 2​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2321, 2, N'AgencyCommissionTier3SaleToTier2', N'ティア2が受け取ったティア3からのコミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2322, 1, N'StandardCommissionTier1', N'Tier 1 Commission​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2323, 2, N'StandardCommissionTier1', N'ティア1のコミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2324, 1, N'StandardCommissionTier2', N'Tier 2 Commission​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2325, 2, N'StandardCommissionTier2', N'ティア2のコミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2326, 1, N'StandardCommissionTier3', N'Tier 3 Commission​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2327, 2, N'StandardCommissionTier3', N'ティア3のコミッション')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2328, 1, N'On', N'On')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2329, 2, N'On', N'オン')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2330, 1, N'Off', N'Off​')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2331, 2, N'Off', N'オフ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2332, 1, N'BecomeAnAffiliate', N'Do you want to become an affiliate?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2333, 2, N'BecomeAnAffiliate', N'あなたは、アフィリエイトに参加しますか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2334, 1, N'Join', N'Join')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2335, 2, N'Join', N'参加')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2336, 1, N'Affiliate', N'Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2337, 2, N'Affiliate', N'アフィリエイト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2338, 1, N'AffiliateApplicationReceived', N'We have received your affiliate application, please wait for our update.  ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2339, 2, N'AffiliateApplicationReceived', N'あなたのアフィリエイトの申し込みを受け付けました。更新までしばらくお待ちください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2340, 1, N'AffiliateApplicationApproved', N'Your affiliate application is approved.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2341, 2, N'AffiliateApplicationApproved', N'あなたのアフィリエイトの申し込みは承認されました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2342, 1, N'Approved', N'Approved')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2343, 2, N'Approved', N'承認済み')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2344, 1, N'KYCRequiredBeforeAffiliate', N'Please <a href=''/Profile/Kyc''>verify your KYC</a> before submitting affiliate application')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2345, 2, N'KYCRequiredBeforeAffiliate', N'アフィリエイトプログラムに応募する前に、<a href=''/Profile/Kyc''>KYCを提出</a>してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2346, 1, N'NotJoinedYet', N'not joined yet.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2347, 2, N'NotJoinedYet', N'参加していません。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2348, 1, N'ClickHereToChangeAffiliate', N'Click <a href="/Profile/Affiliate" class="text-primary">here</a> to change.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2349, 2, N'ClickHereToChangeAffiliate', N'変更は <a href="/Profile/Affiliate" class="text-primary">ココ</a> をクリックしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2350, 1, N'AffiliateApplicationSubmitted', N'Your affiliate application is submitted successfully.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2351, 2, N'AffiliateApplicationSubmitted', N'あなたの申し込みは完了しました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2352, 1, N'AgencyAffiliateURLGenerated', N'Agency affiliate url is generated successfully.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2353, 2, N'AgencyAffiliateURLGenerated', N'代理店のアフィリエイトのURLが正常に生成されました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2354, 1, N'AgencyURLGenerator', N'Agency URL Generator')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2355, 2, N'AgencyURLGenerator', N'代理店URL生成')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2356, 1, N'AgencyURLGeneratorDesc', N'Please specify how many days that this URL will be expired.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2357, 2, N'AgencyURLGeneratorDesc', N'このURLの有効日数を指定してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2358, 1, N'ExpiredDayFromNow', N'Number of days from now')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2359, 2, N'ExpiredDayFromNow', N'今からの日数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2360, 1, N'NumberOfDaysRequired', N'Please fill in number of days')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2361, 2, N'NumberOfDaysRequired', N'日数を記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2362, 1, N'Generate', N'Generate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2363, 2, N'Generate', N'生成する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2364, 1, N'UrlGenerated', N'URL generated')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2365, 2, N'UrlGenerated', N'生成されたURL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2366, 1, N'AffiliateApprove', N'Affiliate approve')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2367, 2, N'AffiliateApprove', N'アフィリエイト承認')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2368, 1, N'Approve', N'Approve')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2369, 2, N'Approve', N'承認する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2370, 1, N'ListOfAffiliateApplication', N'List of affiliate application')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2371, 2, N'ListOfAffiliateApplication', N'アフィリエイト申込一覧')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2372, 1, N'ApplicationArePending', N'applications are pending')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2373, 2, N'ApplicationArePending', N'アプリケーションは保留中です')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2374, 1, N'AffiliateApplication', N'Affiliate application')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2375, 2, N'AffiliateApplication', N'アフィリエイト申込')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2376, 1, N'AffiliateApprovedDescription', N'Congratulation, your affiliate application is approved.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2377, 2, N'AffiliateApprovedDescription', N'おめでとう、あなたのアフィリエイト申込が承認されました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2378, 1, N'AffiliateIsApproved', N'Affiliate application is approved successfully.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2379, 2, N'AffiliateIsApproved', N'アフィリエイト申込が正常に承認されました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2380, 1, N'AffiliateHasBeenApproved', N'Affiliate application has been approved.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2381, 2, N'AffiliateHasBeenApproved', N'アフィリエイト申込が承認されました。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2382, 1, N'AffliateUrl', N'Affiliate URL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2383, 2, N'AffliateUrl', N'アフィリエイトURL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2384, 1, N'InvalidOrExpiredAgencyToken', N'Invalid or expired agency token.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2385, 2, N'InvalidOrExpiredAgencyToken', N'無効または期限切れの代理店トークン')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2386, 1, N'TotalCPLUsed', N'Total CPL Used')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2387, 2, N'TotalCPLUsed', N'使用された総CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2388, 1, N'TotalCPLAwarded', N'Total CPL Awarded')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2389, 2, N'TotalCPLAwarded', N'合計CPL賞')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2390, 1, N'AffiliateProgram', N'Affiliate program')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2391, 2, N'AffiliateProgram', N'アフィリエイトプログラム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2392, 1, N'IsKYCVerificationActivated', N'Is KYC verification activated?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2393, 2, N'IsKYCVerificationActivated', N'KYC確認は有効になっていますか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2394, 1, N'Authentication', N'Authentication')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2395, 2, N'Authentication', N'認証')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2396, 1, N'StandardCommissionTier1Required', N'Please fill in tier 1 commission rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2397, 2, N'StandardCommissionTier1Required', N'ティア1の報酬パーセンテージをご記入ください(Standard)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2398, 1, N'StandardCommissionTier2Required', N'Please fill in tier 2 commission rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2399, 2, N'StandardCommissionTier2Required', N'ティア2の報酬パーセンテージをご記入ください(Standard)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2400, 1, N'StandardCommissionTier3Required', N'Please fill in tier 3 commission rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2401, 2, N'StandardCommissionTier3Required', N'ティア3の報酬パーセンテージをご記入ください(Standard)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2402, 1, N'AgencyCommissionDirectSaleTier1Required', N'Please fill in tier 1 commission rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2403, 2, N'AgencyCommissionDirectSaleTier1Required', N'ティア1の報酬パーセンテージをご記入ください(Agency)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2404, 1, N'AgencyCommissionDirectSaleTier2Required', N'Please fill in tier 2 commission rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2405, 2, N'AgencyCommissionDirectSaleTier2Required', N'ティア2の報酬パーセンテージをご記入ください(Agency)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2406, 1, N'AgencyCommissionDirectSaleTier3Required', N'Please fill in tier 3 commission rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2407, 2, N'AgencyCommissionDirectSaleTier3Required', N'ティア3の報酬パーセンテージをご記入ください(Agency)')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2408, 1, N'AgencyCommissionTier2SaleToTier1Required', N'Please fill in commission of tier 2 sales received by tier 1')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2409, 2, N'AgencyCommissionTier2SaleToTier1Required', N'ティア1が受け取るティア2のコミッションを記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2410, 1, N'AgencyCommissionTier3SaleToTier1Required', N'Please fill in commission of tier 3 sales received by tier 1')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2411, 2, N'AgencyCommissionTier3SaleToTier1Required', N'ティア1が受け取るティア3のコミッションを記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2412, 1, N'AgencyCommissionTier3SaleToTier2Required', N'Please fill in commission of tier 3 sales received by tier 2')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2413, 2, N'AgencyCommissionTier3SaleToTier2Required', N'ティア2が受け取るティア3のコミッションを記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2414, 1, N'Cookie', N'Cookie')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2415, 2, N'Cookie', N'Cookie')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2416, 1, N'CookieExpirationsRequired', N'Please input value for days when cookies is expired')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2417, 2, N'CookieExpirationsRequired', N'Cookieが期限切れになった日の値を入力してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2418, 1, N'Open', N'Open')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2419, 2, N'Open', N'開く')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2420, 1, N'Close', N'Close')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2421, 2, N'Close', N'閉じる')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2422, 1, N'BTCPricePredictionChartTitle', N'Live BTC/USDT rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2423, 2, N'BTCPricePredictionChartTitle', N'ライブBTC/USDTレート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2424, 1, N'BTCPricePredictionSeriesName', N'BTC/USDT rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2425, 2, N'BTCPricePredictionSeriesName', N'BTC/USDTレート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2426, 1, N'ListOfStandardAffiliate', N'List Of Standard Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2427, 2, N'ListOfStandardAffiliate', N'標準アフィリエイトのリスト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2428, 1, N'ListOfStandardAffiliate', N'List Of Standard Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2429, 2, N'ListOfStandardAffiliate', N'標準アフィリエイトのリスト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2430, 1, N'TotalSaleInCPL', N'Total sale in CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2431, 2, N'TotalSaleInCPL', N'CPLでの総販売額')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2432, 1, N'TotalIntroducer', N'Total introducer')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2433, 2, N'TotalIntroducer', N'トータルイントロデューサ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2434, 1, N'AffiliateCreatedDate', N'Affiliate created date')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2435, 2, N'AffiliateCreatedDate', N'アフィリエイト作成日')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2436, 1, N'Tier1', N'Tier 1')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2437, 2, N'Tier1', N'ティア 1')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2438, 1, N'Tier2', N'Tier 2')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2439, 2, N'Tier2', N'ティア 2')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2440, 1, N'Tier3', N'Tier 3')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2441, 2, N'Tier3', N'ティア 3')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2442, 1, N'Lock', N'Lock')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2443, 2, N'Lock', N'ロック')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2444, 1, N'UnLock', N'UnLock')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2445, 2, N'UnLock', N'アンロック')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2446, 1, N'LockSuccessful', N'Lock Successful')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2447, 2, N'LockSuccessful', N'ロック成功')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2448, 1, N'UnLockSuccessful', N'Unlock Successful')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2449, 2, N'UnLockSuccessful', N'成功したロック解除')
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
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (25, 1, N'AffiliateProgramPolicy', N'Affiliate policy')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (26, 2, N'AffiliateProgramPolicy', N'Affiliate policy')
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
SET IDENTITY_INSERT [dbo].[MobileLangDetail] ON 
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1, 1, N'ChoiceLanguageScreen_Title', N'Language Selection')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2, 2, N'ChoiceLanguageScreen_Title', N'言語の選択')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (3, 1, N'ChoiceLanguageScreen_Button_Choice', N'Choose')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (4, 2, N'ChoiceLanguageScreen_Button_Choice', N'選択')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (5, 1, N'InitalScreen_Button_Login', N'Login')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (6, 2, N'InitalScreen_Button_Login', N'ログイン')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (7, 1, N'InitalScreen_Button_Register', N'Register')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (8, 2, N'InitalScreen_Button_Register', N'登録')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (9, 1, N'InitalScreen_Label_PrivacyPolicy', N'Privacy Policy')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (10, 2, N'InitalScreen_Label_PrivacyPolicy', N'プライバシーポリシー')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (11, 1, N'InitalScreen_Label_TermsOfService', N'Terms Of Service')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (12, 2, N'InitalScreen_Label_TermsOfService', N'利用規約')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (13, 1, N'InitalScreen_Label_Ampersand', N' & ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (14, 2, N'InitalScreen_Label_Ampersand', N'　&　')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (15, 1, N'LoginScreen_Title', N'Please login with your account.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (16, 2, N'LoginScreen_Title', N'あなたのログイン情報を入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (17, 1, N'LoginScreen_Button_Login', N'Login')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (18, 2, N'LoginScreen_Button_Login', N'ログイン')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (19, 1, N'LoginScreen_Button_Register', N'Register')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (20, 2, N'LoginScreen_Button_Register', N'登録')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (21, 1, N'LoginScreen_Label_IfNoAccount', N'Have you created accounts? ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (22, 2, N'LoginScreen_Label_IfNoAccount', N'アカウントを作成したことがありますか？ ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (23, 1, N'LoginScreen_Input_Email', N'Email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (24, 2, N'LoginScreen_Input_Email', N'メールアドレス')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (25, 1, N'LoginScreen_Input_Email_Required', N'Please fill in your email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (26, 2, N'LoginScreen_Input_Email_Required', N'あなたメールアドレスを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (27, 1, N'LoginScreen_Input_Email_Invalid_Format', N'Please fill in your email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (28, 2, N'LoginScreen_Input_Email_Invalid_Format', N'あなたメールアドレスを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (29, 1, N'LoginScreen_Input_Password', N'Password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (30, 2, N'LoginScreen_Input_Password', N'パスワード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (31, 1, N'LoginScreen_Input_Password_Required', N'Please fill in your password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (32, 2, N'LoginScreen_Input_Password_Required', N'あなたのパスワードを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (33, 1, N'LoginScreen_Input_Password_Invalid_MinLength', N'Please fill in your password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (34, 2, N'LoginScreen_Input_Password_Invalid_MinLength', N'あなたのパスワードを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (35, 1, N'RegisterScreen_Title', N'Please fill in your account information.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (36, 2, N'RegisterScreen_Title', N'あなたのアカウント情報を入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (37, 1, N'RegisterScreen_Button_Login', N'Login')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (38, 2, N'RegisterScreen_Button_Login', N'ログイン')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (39, 1, N'RegisterScreen_Button_Register', N'Register')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (40, 2, N'RegisterScreen_Button_Register', N'登録')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (41, 1, N'RegisterScreen_Label_IfCreatedAccount', N'Have you created accounts? ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (42, 2, N'RegisterScreen_Label_IfCreatedAccount', N'アカウントを作成したことがありますか？ ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (43, 1, N'RegisterScreen_Input_Email', N'Email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (44, 2, N'RegisterScreen_Input_Email', N'メールアドレス')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (45, 1, N'RegisterScreen_Input_Email_Required', N'Please fill in your email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (46, 2, N'RegisterScreen_Input_Email_Required', N'あなたメールアドレスを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (47, 1, N'RegisterScreen_Input_Email_Invalid_Format', N'Please fill in your email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (48, 2, N'RegisterScreen_Input_Email_Invalid_Format', N'あなたメールアドレスを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (49, 1, N'RegisterScreen_Input_Password', N'Password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (50, 2, N'RegisterScreen_Input_Password', N'パスワード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (51, 1, N'RegisterScreen_Input_Password_Required', N'Please fill in your password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (52, 2, N'RegisterScreen_Input_Password_Required', N'あなたのパスワードを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (53, 1, N'RegisterScreen_Input_Password_Invalid_MinLength', N'Please fill in your password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (54, 2, N'RegisterScreen_Input_Password_Invalid_MinLength', N'あなたのパスワードを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (55, 1, N'RegisterScreen_Input_Confirmation_Password', N'Confirmation Password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (56, 2, N'RegisterScreen_Input_Confirmation_Password', N'確認パスワード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (61, 1, N'RegisterScreen_Input_Confirmation_Password_NoMatch', N'Mismatch password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (62, 2, N'RegisterScreen_Input_Confirmation_Password_NoMatch', N'あなたの確認パスワードを入力してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (63, 1, N'RegisterScreen_Input_Checkbox_Agree_Rules', N'I have read and agree ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (64, 2, N'RegisterScreen_Input_Checkbox_Agree_Rules', N' に同意します')
GO
SET IDENTITY_INSERT [dbo].[MobileLangDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[MobileLangMsgDetail] ON 
GO
INSERT [dbo].[MobileLangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (1, 1, N'PrivacyPolicy', N'Website of www.cryptolot.com (hereinafter "the service") is operated by A Company (hereinafter "our company").
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
                            </ol>company").')
GO
INSERT [dbo].[MobileLangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (2, 1, N'TermsOfService', N'This Terms of Service (the "Terms of Service") is provided by CRYPTOLOT (hereinafter referred to as "the Service") on the CRYPTOLOT website (hereinafter referred to as "the Website") It defines the usage conditions of the service.
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
INSERT [dbo].[MobileLangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (3, 2, N'PrivacyPolicy', N'運営会社A（以下「当社」）はwww.cryptolot.comのウェブサイト（以下「本サービス」）を運営しています。
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
INSERT [dbo].[MobileLangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (4, 2, N'TermsOfService', N'この利用規約（以下、「本規約」といいます。）は、CRYPTOLOT（以下、「本サービス」といいます。）がCRYPTOLOTウェブサイト上（以下、「本ウェブサイト」といいます。）で提供するサービスの利用条件を定めるものです。登録ユーザーの皆さま（以下、「ユーザー」といいます。）には、本規約に従って本サービスをご利用いただきます。
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
SET IDENTITY_INSERT [dbo].[MobileLangMsgDetail] OFF
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
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (7, N'CPLServiceEndPointUrl', N'http://202.53.150.21/', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (8, N'ResetPasswordExpiredInDays', N'1', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (9, N'ETHNotifyCurrentBlockNo', N'6283603', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (10, N'ActivateExpiredInDays', N'1', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (11, N'IsKYCVerificationActivated', N'false', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (12, N'CookieExpirations', N'60', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (13, N'StandardAffiliate.Tier1DirectRate', N'10', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (14, N'StandardAffiliate.Tier2SaleToTier1Rate', N'5', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (15, N'StandardAffiliate.Tier3SaleToTier1Rate', N'3', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (16, N'AgencyAffiliate.Tier1DirectRate', N'10', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (17, N'AgencyAffiliate.Tier2DirectRate', N'3', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (18, N'AgencyAffiliate.Tier3DirectRate', N'3', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (19, N'AgencyAffiliate.Tier2SaleToTier1Rate', N'3', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (20, N'AgencyAffiliate.Tier3SaleToTier1Rate', N'3', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (21, N'AgencyAffiliate.Tier3SaleToTier2Rate', N'3', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (22, N'NumberOfAgencyAffiliateExpiredDays', N'10', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (23, N'PricePredictionBettingIntervalInHour', N'8', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (24, N'HoldingIntervalInHour', N'1', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (25, N'CompareIntervalInMinute', N'15', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (26, N'DailyStartTimeInHour', N'0', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (27, N'DailyStartTimeInMinute', N'0', NULL)
GO
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[SysUser] ON 
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (1, 1, N'info.cplcoin@gmail.com', N'$2a$10$sBc4BJ8qJ2wVGXnug/3b2ukjxrQlwVWYpeqN/cHlSe60o3zAbih2y', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-28T20:12:59.967' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, 0, N'0x8a5FEED515564fdFaCaC8B75db58b139157EC085', 1, N'17t92cRVHeDyNTnyXnd74hYo9Vm3QbB2Di', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (2, 1, N'k-yamada@famhopper.com', N'$2a$10$Vo9CuPGiwBmgfBfUXAlhlOqY5to2pVzahuZ95qnw.iVs32YgspGwy', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-28T20:17:04.007' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, 0, N'0x9553184D858fBEB494630Ad396AB0f328840bbCC', 2, N'1L2UcET71s5NReu1b5bvLLcYSUkMoNR3Lg', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 1000000000.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (3, 1, N'y.xxx.e0930@gmail.com', N'$2a$10$gCR40f5CawRoCCi91KPWxOJtKvKKFyNujnnGuvN/rj9MvHVv5.Bgy', N'admin', N'ishida', N'+841226666666', NULL, NULL, NULL, CAST(N'2018-08-28T20:29:54.057' AS DateTime), NULL, NULL, NULL, CAST(N'2018-08-28T00:00:00.000' AS DateTime), 3, NULL, 0, N'0x823c19fdF9eB4293086851Ecf0fee4c73a78951c', 3, N'1Pu55Zny1x9sWV7DPKNDt76N81WC3dENqF', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, 1, N'700000', N'Uzbekistan', N'123', N'123', 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (4, 1, N't-kitamura@famhopper.com', N'$2a$10$Rj8FfDB1bGHUs6DSqh3Zs.fnKSTUq5.KyLeIMOfLFXBkYvFHH33XO', N'kit', N'mur', N'+84987654321', NULL, NULL, NULL, CAST(N'2018-08-28T20:31:18.990' AS DateTime), NULL, NULL, NULL, NULL, 4, NULL, 0, N'0xEB8691789fD36FF0A8949413Ad9245855394fAd8', 4, N'13KBMHecERwGzuhBF7CcSAxSCu9D6dphqY', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (5, 0, N'vinh.nguyen2303@outlook.com', N'$2a$10$6OiuEpwf2kfobE24M.CImOF0UBKvIdyexn0nJQV/9mrRQ8gwDkYke', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-29T12:57:32.060' AS DateTime), NULL, NULL, NULL, NULL, 5, NULL, 0, N'0xa8dfc28e2d918eE4504F7e57222935Ba41B56A1d', 5, N'18A1QwBee15EsSHq2H5gzDTVU3BXxRshKb', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (6, 0, N'yi090128@gmail.com', N'$2a$10$TcP9jU2qgZciwBitsxrWC./R6prsFzV70KvkQ2IaNm9dltW3VZrcS', NULL, NULL, NULL, NULL, NULL, N'bbf6604c-4cdd-4526-bd4a-e69d59122fa4', CAST(N'2018-08-29T12:09:07.243' AS DateTime), NULL, NULL, NULL, NULL, 6, NULL, 0, N'0x8De3932834376ab6fB070c580f564F92A84Cf2c5', 6, N'19x1WYyxedxhRA2TBLvoUrzxPofQZainJ9', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (7, 0, N'trieupham2708@gmail.com', N'$2a$10$cxvDAyPJzYB5w7iI/gtFkuCS1oTXJlrSda9TUgBYPIuFIJ3oa0XWe', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-29T14:00:31.317' AS DateTime), NULL, NULL, NULL, NULL, 7, NULL, 0, N'0xC34250CCE5F93f0CBfdeF31575299E9A6Db328bc', 7, N'1EtUqJ3zqSCCES3RAotmkKKfTQhkmrFGye', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (8, 0, N'y-ishida@famhopper.com', N'$2a$10$Z1PYR04Hrvq4Zd7wH/DoC.cgXMduDTMP5d3u5RjavtfgCnmJIBXSu', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-29T14:43:16.843' AS DateTime), NULL, NULL, NULL, NULL, 8, NULL, 0, N'0x4d85ca12A78240AFb89fccCf902C0B244B97C77c', 8, N'1Kug68zWehTTn38KQx8FYZdtTnZjcruHGs', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (9, 0, N'yamagoku2409@gmail.com', N'$2a$10$eC6qcLha.KUyASFmAiB6WuLFYBz5GvdkqeuMx1uDj.xuJts2/54ZW', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-08-30T13:35:46.040' AS DateTime), NULL, NULL, NULL, NULL, 9, NULL, 0, N'0xd5539Dde9253c3a49915C58afeA3EF84195A675C', 9, N'1PDhpvMyXgqm7bTBkuJibXh35yeMfi3GxE', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (10, 0, N'npp.nguyentuan@gmail.com', N'$2a$10$ChznAh3w72kqJGD6mo0JtecKMIs5bMz6q7RGbLlMp55HHpzUYrSSK', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-09-06T09:18:12.563' AS DateTime), NULL, NULL, NULL, NULL, 10, NULL, 0, N'0xbe8537bF9234546C66cC328fcfE61D9aB2fefEF5', 10, N'15RTiH5pBa3bHDTLhKUC6Qo2xNhSrnCWRw', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
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
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (6, N'AffiliateApprove', N'AffiliateApproveEmailTemplate', N'Affiliate application is approved at CPL')
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
ALTER TABLE [dbo].[SysUser] ADD  DEFAULT ((0)) FOR [IsLocked]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTxHashIdToBTCTransaction]    Script Date: 9/10/2018 6:11:07 PM ******/
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
