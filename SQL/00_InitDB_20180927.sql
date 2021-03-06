USE [CPL]
GO
/****** Object:  Table [dbo].[Lottery]    Script Date: 10/15/2018 10:30:20 AM ******/
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
	[Title] [nvarchar](200) NULL,
	[UnitPrice] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[LotteryCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Lottery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryHistory]    Script Date: 10/15/2018 10:30:20 AM ******/
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
/****** Object:  Table [dbo].[LotteryPrize]    Script Date: 10/15/2018 10:30:20 AM ******/
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
/****** Object:  Table [dbo].[PricePrediction]    Script Date: 10/15/2018 10:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePrediction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
	[PricePredictionCategoryId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DividendRate] [int] NOT NULL,
 CONSTRAINT [PK_PricePrediction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionHistory]    Script Date: 10/15/2018 10:30:20 AM ******/
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
	[TotalAward] [money] NULL,
 CONSTRAINT [PK_PricePredictionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUser]    Script Date: 10/15/2018 10:30:20 AM ******/
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
/****** Object:  View [dbo].[IntroducedUsers]    Script Date: 10/15/2018 10:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IntroducedUsers] AS
(SELECT 
		Id, 
		-- Direct introduced users
		(SELECT STRING_AGG(Id, ',') AS DirectIntroducedUsers
		FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id) as DirectIntroducedUsers,

		(SELECT COUNT(*) AS TotalDirectIntroducedUsers
		FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id) as TotalDirectIntroducedUsers,

		-- Tier 2 introduced users
		(SELECT STRING_AGG(Id, ',') AS Tier2IntroducedUsers
		FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
			(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)) as Tier2IntroducedUsers,

		(SELECT COUNT(*) AS TotalTier2IntroducedUsers
		FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
			(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)) as TotalTier2IntroducedUsers,

		-- Tier 3 introduced users
		(SELECT STRING_AGG(Id, ',') AS Tier3IntroducedUsers
		FROM SysUser Tier3 WHERE Tier3.IsIntroducedById in 
					(SELECT Id FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
						(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id))) as Tier3IntroducedUsers,

		(SELECT COUNT(*) AS TotalTier3IntroducedUsers
		FROM SysUser Tier3 WHERE Tier3.IsIntroducedById in 
					(SELECT Id FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
						(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id))) as TotalTier3IntroducedUsers,

		-- Affiliate sale
		---------------------------
		-- Direct affiliate sale --
		---------------------------
		----- Lottery
		ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
			FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.SysUserId in (SELECT Id AS DirectIntroducedUsers
													 FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)),0)
		-
		ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
			FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.SysUserId in (SELECT Id AS DirectIntroducedUsers
													 FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)),0)
		-- Plus Price prediction
			+
		ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
			FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
			WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
					and PricePredictionHistory.SysUserId in (SELECT Id AS DirectIntroducedUsers
													 FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)),0)
		-
		ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
			FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
			WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
					and PricePredictionHistory.SysUserId in (SELECT Id AS DirectIntroducedUsers
													 FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)),0)
		as DirectAffiliateSale,
		---------------------------
		-- Tier 2 affiliate sale --
		---------------------------
		----- Lottery
		ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
			FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.SysUserId in (SELECT Id AS Tier2IntroducedUsers
													 FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
															(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id))),0)
		-
		ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
			FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.SysUserId in (SELECT Id AS Tier2IntroducedUsers
													 FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
															(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id))),0)
		-- Plus Price prediction
			+
		----- Price prediction
		ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
			FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
			WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
					and PricePredictionHistory.SysUserId in (SELECT Id AS Tier2IntroducedUsers
													 FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
															(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id))),0)
		-
		ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
			FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
			WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
					and PricePredictionHistory.SysUserId in (SELECT Id AS Tier2IntroducedUsers
													 FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
															(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id))),0)
		as Tier2AffiliateSale,
		---------------------------
		-- Tier 3 affiliate sale --
		---------------------------
		----- Lottery
		ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
			FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.SysUserId in (SELECT Id AS Tier3IntroducedUsers
													 FROM SysUser Tier3 WHERE Tier3.IsIntroducedById in 
																(SELECT Id FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
																	(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)))),0)
		-
		ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
			FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
								join Lottery on LotteryHistory.LotteryId = Lottery.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.SysUserId in (SELECT Id AS Tier3IntroducedUsers
													 FROM SysUser Tier3 WHERE Tier3.IsIntroducedById in 
																(SELECT Id FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
																	(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)))),0)
		-- Plus Price prediction
			+
		----- Price prediction
		ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
			FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
			WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
					and PricePredictionHistory.SysUserId in (SELECT Id AS Tier3IntroducedUsers
													 FROM SysUser Tier3 WHERE Tier3.IsIntroducedById in 
																(SELECT Id FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
																	(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)))),0)
		-
		ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
			FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
			WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
					and PricePredictionHistory.SysUserId in (SELECT Id AS Tier3IntroducedUsers
													 FROM SysUser Tier3 WHERE Tier3.IsIntroducedById in 
																(SELECT Id FROM SysUser Tier2 WHERE Tier2.IsIntroducedById in 
																	(SELECT Id FROM SysUser Tier1 WHERE Tier1.IsIntroducedById = su.Id)))),0)
	As Tier3AffiliateSale

	FROM SysUser su
	WHERE AffiliateId is not null and AffiliateId > 0)
GO
/****** Object:  View [dbo].[Tier1Agencies]    Script Date: 10/15/2018 10:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Tier1Agencies] AS
(SELECT Id 
	FROM SysUser 
	WHERE AffiliateId is not null and AffiliateId > 0 and AgencyId is not null and IsIntroducedById is null)

GO
/****** Object:  View [dbo].[Tier2Agencies]    Script Date: 10/15/2018 10:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Tier2Agencies] AS
(SELECT Id 
	FROM SysUser 
	WHERE AffiliateId is not null and AffiliateId > 0 and AgencyId is not null and IsIntroducedById in (select Id from Tier1Agencies))

GO
/****** Object:  View [dbo].[Tier3Agencies]    Script Date: 10/15/2018 10:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Tier3Agencies] AS
(SELECT Id 
	FROM SysUser 
	WHERE AffiliateId is not null and AffiliateId > 0 and AgencyId is not null and IsIntroducedById in (select Id from Tier2Agencies))

GO
/****** Object:  Table [dbo].[Affiliate]    Script Date: 10/15/2018 10:30:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affiliate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tier1DirectRate] [int] NOT NULL,
	[Tier2SaleToTier1Rate] [int] NOT NULL,
	[Tier3SaleToTier1Rate] [int] NOT NULL,
	[IsAutoPaymentEnable] [bit] NOT NULL,
	[IsTier2TabVisible] [bit] NOT NULL,
	[IsTier3TabVisible] [bit] NOT NULL,
 CONSTRAINT [PK_Affiliate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agency]    Script Date: 10/15/2018 10:30:20 AM ******/
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
/****** Object:  Table [dbo].[AgencyToken]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[BTCPrice]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[BTCTransaction]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[CoinTransaction]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[Currency]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[ETHTransaction]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[FAQ]    Script Date: 10/15/2018 10:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](200) NULL,
	[Answer] [nvarchar](500) NULL,
	[LangId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 10/15/2018 10:30:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Filter] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lang]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[LangContent]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[LangDetail]    Script Date: 10/15/2018 10:30:21 AM ******/
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
/****** Object:  Table [dbo].[LangMsgDetail]    Script Date: 10/15/2018 10:30:22 AM ******/
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
/****** Object:  Table [dbo].[LotteryCategory]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [ntext] NULL,
	[ViewId] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LotteryCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryDetail]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LotteryId] [int] NOT NULL,
	[LangId] [int] NOT NULL,
	[DesktopTopImage] [nvarchar](200) NOT NULL,
	[DesktopListingImage] [nvarchar](200) NOT NULL,
	[MobileListingImage] [nvarchar](200) NOT NULL,
	[MobileTopImage] [nvarchar](200) NOT NULL,
	[PrizeImage] [nvarchar](200) NOT NULL,
	[Description] [ntext] NOT NULL,
	[ShortDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_LotteryDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileLangDetail]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileLangDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_MobileLangDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileLangMsgDetail]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileLangMsgDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_MobileLangMsgDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 10/15/2018 10:30:22 AM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 10/15/2018 10:30:22 AM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SysUserId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[Tier1DirectSale] [money] NOT NULL,
	[Tier2SaleToTier1Sale] [money] NOT NULL,
	[Tier3SaleToTier1Sale] [money] NOT NULL,
	[Tier1DirectRate] [int] NOT NULL,
	[Tier2SaleToTier1Rate] [int] NOT NULL,
	[Tier3SaleToTier1Rate] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionCategory]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePredictionCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PricePredictionCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionCategoryDetail]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePredictionCategoryDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [ntext] NULL,
	[PricePredictionCategoryId] [int] NOT NULL,
	[LangId] [int] NOT NULL,
 CONSTRAINT [PK_PricePredictionCategoryDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionDetail]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePredictionDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[LangId] [int] NOT NULL,
	[PricePredictionId] [int] NOT NULL,
 CONSTRAINT [PK_PricePredictionDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionSetting]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePredictionSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OpenBettingTime] [time](7) NOT NULL,
	[CloseBettingTime] [time](7) NOT NULL,
	[HoldingTimeInterval] [int] NOT NULL,
	[ResultTimeInterval] [int] NOT NULL,
	[DividendRate] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PricePredictionCategoryId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PricePredictionSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionSettingDetail]    Script Date: 10/15/2018 10:30:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePredictionSettingDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[LangId] [int] NOT NULL,
	[PricePredictionSettingId] [int] NOT NULL,
 CONSTRAINT [PK_PricePredictionSettingDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 10/15/2018 10:30:23 AM ******/
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
/****** Object:  Table [dbo].[Slider]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Url] [nvarchar](200) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SliderDetail]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SliderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesktopImage] [nvarchar](200) NOT NULL,
	[MobileImage] [nvarchar](200) NOT NULL,
	[LangId] [int] NOT NULL,
	[SliderId] [int] NOT NULL,
 CONSTRAINT [PK_SliderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 10/15/2018 10:30:23 AM ******/
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
/****** Object:  Table [dbo].[Template]    Script Date: 10/15/2018 10:30:23 AM ******/
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
SET IDENTITY_INSERT [dbo].[Affiliate] ON 
GO
INSERT [dbo].[Affiliate] ([Id], [Tier1DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (1, 10, 5, 3, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Affiliate] OFF
GO
SET IDENTITY_INSERT [dbo].[Agency] ON 
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (1, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (2, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (3, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (4, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (5, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (6, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (7, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
INSERT [dbo].[Agency] ([Id], [Tier1DirectRate], [Tier2DirectRate], [Tier3DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate], [Tier3SaleToTier2Rate], [IsAutoPaymentEnable], [IsTier2TabVisible], [IsTier3TabVisible]) VALUES (8, 10, 3, 3, 3, 3, 3, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Agency] OFF
GO
SET IDENTITY_INSERT [dbo].[AgencyToken] ON 
GO
INSERT [dbo].[AgencyToken] ([Id], [Token], [ExpiredDate], [SysUserId]) VALUES (1, N'3d8f52f1-78d0-4258-a007-6de200a6afc6', CAST(N'2018-10-10T18:36:39.437' AS DateTime), NULL)
GO
INSERT [dbo].[AgencyToken] ([Id], [Token], [ExpiredDate], [SysUserId]) VALUES (2, N'37c6a1ca-1392-4f79-9103-26091bbcdb04', CAST(N'2018-10-10T18:42:01.133' AS DateTime), NULL)
GO
INSERT [dbo].[AgencyToken] ([Id], [Token], [ExpiredDate], [SysUserId]) VALUES (3, N'5c985f13-2e16-4de0-8048-8d6a6c9f4685', CAST(N'2018-10-10T18:44:42.447' AS DateTime), NULL)
GO
INSERT [dbo].[AgencyToken] ([Id], [Token], [ExpiredDate], [SysUserId]) VALUES (4, N'0053bb1e-4112-43c7-8447-c74795b33245', CAST(N'2018-10-11T15:14:33.743' AS DateTime), NULL)
GO
INSERT [dbo].[AgencyToken] ([Id], [Token], [ExpiredDate], [SysUserId]) VALUES (5, N'8aec58aa-474e-4e25-9907-c75a4785456f', CAST(N'2018-10-11T15:38:11.117' AS DateTime), 11)
GO
SET IDENTITY_INSERT [dbo].[AgencyToken] OFF
GO
SET IDENTITY_INSERT [dbo].[BTCPrice] ON 
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1, 6336.6000, 1539564566)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2, 6338.2500, 1539564568)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (3, 6338.2500, 1539564569)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (4, 6338.2500, 1539564570)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (5, 6339.3300, 1539564571)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (6, 6338.2600, 1539564572)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (7, 6338.2600, 1539564573)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (8, 6340.9900, 1539564574)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (9, 6340.0600, 1539564575)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (10, 6340.0600, 1539564577)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (11, 6341.5800, 1539564578)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (12, 6341.3300, 1539564579)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (13, 6341.3300, 1539564580)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (14, 6341.3500, 1539564581)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (15, 6341.3500, 1539564582)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (16, 6341.3500, 1539564583)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (17, 6342.5100, 1539564585)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (18, 6341.3700, 1539564586)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (19, 6342.4900, 1539564587)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (20, 6342.4900, 1539564588)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (21, 6342.4900, 1539564589)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (22, 6342.4900, 1539564590)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (23, 6342.0200, 1539564591)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (24, 6342.4900, 1539564592)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (25, 6342.4900, 1539564594)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (26, 6342.4900, 1539564595)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (27, 6342.4900, 1539564596)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (28, 6342.0400, 1539564597)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (29, 6342.0400, 1539564598)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (30, 6342.0400, 1539564599)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (31, 6342.0400, 1539564600)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (32, 6342.0600, 1539564602)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (33, 6342.0600, 1539564603)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (34, 6342.0600, 1539564604)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (35, 6342.0600, 1539564605)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (36, 6342.0600, 1539564606)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (37, 6342.6400, 1539564607)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (38, 6342.8000, 1539564608)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (39, 6342.8000, 1539564610)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (40, 6342.8000, 1539564611)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (41, 6342.5400, 1539564612)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (42, 6342.8000, 1539564613)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (43, 6342.8000, 1539564614)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (44, 6342.8000, 1539564615)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (45, 6342.8300, 1539564616)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (46, 6342.8300, 1539564618)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (47, 6342.8300, 1539564619)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (48, 6342.8300, 1539564620)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (49, 6344.0000, 1539564621)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (50, 6344.0000, 1539564622)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (51, 6344.0100, 1539564623)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (52, 6344.0200, 1539564624)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (53, 6344.0200, 1539564626)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (54, 6345.7500, 1539564627)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (55, 6346.5700, 1539564628)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (56, 6345.5700, 1539564629)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (57, 6345.5700, 1539564630)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (58, 6345.5900, 1539564631)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (59, 6345.5900, 1539564632)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (60, 6345.5600, 1539564634)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (61, 6345.5900, 1539564635)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (62, 6345.5900, 1539564636)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (63, 6345.5900, 1539564637)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (64, 6345.5900, 1539564638)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (65, 6345.5900, 1539564639)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (66, 6346.6000, 1539564640)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (67, 6345.5900, 1539564642)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (68, 6345.5900, 1539564643)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (69, 6345.5900, 1539564644)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (70, 6345.5900, 1539564645)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (71, 6345.5900, 1539564646)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (72, 6345.5900, 1539564647)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (73, 6345.5900, 1539564648)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (74, 6346.6200, 1539564649)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (75, 6346.7200, 1539564651)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (76, 6346.6300, 1539564652)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (77, 6346.7200, 1539564653)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (78, 6350.0000, 1539564654)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (79, 6352.5400, 1539564655)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (80, 6350.0200, 1539564656)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (81, 6351.4500, 1539564658)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (82, 6351.4500, 1539564659)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (83, 6351.4500, 1539564660)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (84, 6350.0600, 1539564661)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (85, 6350.0700, 1539564662)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (86, 6352.0000, 1539564663)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (87, 6350.0900, 1539564665)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (88, 6350.0900, 1539564666)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (89, 6351.2800, 1539564667)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (90, 6351.2800, 1539564668)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (91, 6351.2800, 1539564669)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (92, 6351.2800, 1539564670)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (93, 6351.2700, 1539564671)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (94, 6352.4900, 1539564673)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (95, 6351.2800, 1539564674)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (96, 6351.2800, 1539564675)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (97, 6351.2800, 1539564676)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (98, 6351.4500, 1539564677)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (99, 6351.2700, 1539564678)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (100, 6351.4500, 1539564679)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (101, 6350.1100, 1539564681)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (102, 6350.1100, 1539564682)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (103, 6350.1100, 1539564683)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (104, 6350.1200, 1539564684)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (105, 6350.1300, 1539564685)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (106, 6350.1200, 1539564686)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (107, 6351.4400, 1539564687)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (108, 6351.4400, 1539564688)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (109, 6351.4400, 1539564690)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (110, 6351.4400, 1539564691)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (111, 6350.1400, 1539564692)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (112, 6350.1400, 1539564693)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (113, 6350.1400, 1539564694)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (114, 6350.1400, 1539564695)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (115, 6350.1400, 1539564696)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (116, 6350.1400, 1539564698)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (117, 6350.1400, 1539564699)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (118, 6351.3200, 1539564700)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (119, 6351.3200, 1539564701)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (120, 6351.3200, 1539564702)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (121, 6352.4800, 1539564703)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (122, 6352.4800, 1539564704)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (123, 6352.4800, 1539564706)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (124, 6352.4800, 1539564707)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (125, 6352.4800, 1539564708)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (126, 6352.4800, 1539564709)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (127, 6352.4800, 1539564710)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (128, 6350.1900, 1539564711)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (129, 6352.4300, 1539564712)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (130, 6352.4300, 1539564713)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (131, 6352.4300, 1539564715)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (132, 6352.4300, 1539564716)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (133, 6350.2000, 1539564717)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (134, 6350.0000, 1539564718)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (135, 6350.2300, 1539564719)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (136, 6350.0000, 1539564720)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (137, 6348.0400, 1539564721)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (138, 6346.3500, 1539564723)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (139, 6346.3500, 1539564724)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (140, 6346.3400, 1539564725)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (141, 6346.3400, 1539564726)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (142, 6346.3300, 1539564727)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (143, 6346.3500, 1539564728)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (144, 6346.3500, 1539564729)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (145, 6346.3500, 1539564731)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (146, 6346.3400, 1539564732)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (147, 6346.3400, 1539564733)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (148, 6345.0100, 1539564734)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (149, 6345.0000, 1539564735)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (150, 6345.0000, 1539564736)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (151, 6345.0000, 1539564737)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (152, 6345.0200, 1539564739)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (153, 6346.3500, 1539564740)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (154, 6346.3500, 1539564741)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (155, 6345.0000, 1539564742)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (156, 6346.3500, 1539564743)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (157, 6345.0300, 1539564744)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (158, 6345.0300, 1539564745)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (159, 6345.0300, 1539564747)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (160, 6345.0600, 1539564748)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (161, 6346.3500, 1539564749)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (162, 6348.0200, 1539564750)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (163, 6346.2400, 1539564751)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (164, 6348.1900, 1539564752)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (165, 6348.1900, 1539564753)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (166, 6348.1900, 1539564755)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (167, 6348.1900, 1539564756)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (168, 6348.1900, 1539564757)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (169, 6346.2400, 1539564758)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (170, 6348.1700, 1539564759)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (171, 6348.1700, 1539564760)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (172, 6346.2400, 1539564761)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (173, 6346.2400, 1539564763)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (174, 6348.1300, 1539564764)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (175, 6348.1300, 1539564765)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (176, 6348.1300, 1539564766)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (177, 6346.2400, 1539564767)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (178, 6348.1100, 1539564768)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (179, 6348.1400, 1539564769)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (180, 6348.1400, 1539564771)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (181, 6348.1400, 1539564772)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (182, 6348.1400, 1539564773)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (183, 6348.1400, 1539564774)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (184, 6348.1400, 1539564775)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (185, 6350.0100, 1539564776)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (186, 6348.1900, 1539564777)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (187, 6348.2400, 1539564779)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (188, 6351.0000, 1539564780)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (189, 6350.9900, 1539564781)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (190, 6352.9900, 1539564782)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (191, 6353.8400, 1539564783)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (192, 6350.0900, 1539564785)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (193, 6350.0900, 1539564786)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (194, 6353.5700, 1539564787)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (195, 6354.2100, 1539564788)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (196, 6354.2100, 1539564789)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (197, 6354.2100, 1539564790)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (198, 6353.6000, 1539564791)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (199, 6354.9900, 1539564793)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (200, 6354.9900, 1539564794)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (201, 6355.0000, 1539564795)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (202, 6355.0000, 1539564796)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (203, 6355.0000, 1539564797)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (204, 6355.0000, 1539564798)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (205, 6355.0000, 1539564800)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (206, 6355.0000, 1539564801)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (207, 6354.3200, 1539564802)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (208, 6355.0000, 1539564803)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (209, 6355.0000, 1539564804)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (210, 6355.0000, 1539564805)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (211, 6355.0500, 1539564806)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (212, 6355.0500, 1539564807)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (213, 6355.0600, 1539564809)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (214, 6355.0600, 1539564810)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (215, 6355.0600, 1539564811)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (216, 6356.4500, 1539564812)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (217, 6355.0700, 1539564813)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (218, 6355.0700, 1539564814)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (219, 6355.1200, 1539564815)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (220, 6355.1200, 1539564817)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (221, 6355.0000, 1539564818)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (222, 6368.2700, 1539564819)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (223, 6368.2700, 1539564820)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (224, 6355.1400, 1539564821)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (225, 6355.1500, 1539564822)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (226, 6359.9100, 1539564824)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (227, 6359.9100, 1539564825)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (228, 6359.8800, 1539564826)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (229, 6359.8800, 1539564827)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (230, 6359.3500, 1539564828)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (231, 6356.0000, 1539564829)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (232, 6356.0100, 1539564830)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (233, 6355.1500, 1539564832)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (234, 6355.0000, 1539564833)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (235, 6355.0000, 1539564834)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (236, 6358.8100, 1539564835)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (237, 6358.8100, 1539564836)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (238, 6355.0800, 1539564837)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (239, 6355.0700, 1539564838)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (240, 6355.0700, 1539564840)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (241, 6357.0000, 1539564841)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (242, 6355.0700, 1539564842)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (243, 6355.0700, 1539564843)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (244, 6350.4900, 1539564844)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (245, 6350.4900, 1539564845)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (246, 6350.4900, 1539564846)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (247, 6350.5000, 1539564848)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (248, 6350.5600, 1539564849)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (249, 6353.3500, 1539564850)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (250, 6350.5600, 1539564851)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (251, 6356.9800, 1539564852)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (252, 6356.9700, 1539564853)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (253, 6356.9700, 1539564855)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (254, 6351.5400, 1539564856)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (255, 6351.5400, 1539564857)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (256, 6358.9800, 1539564858)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (257, 6359.2600, 1539564859)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (258, 6357.0100, 1539564860)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (259, 6357.0200, 1539564861)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (260, 6357.0200, 1539564863)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (261, 6357.0200, 1539564864)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (262, 6356.9900, 1539564865)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (263, 6356.9900, 1539564866)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (264, 6356.9900, 1539564867)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (265, 6356.9900, 1539564868)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (266, 6356.9900, 1539564869)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (267, 6356.9800, 1539564871)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (268, 6355.0100, 1539564872)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (269, 6355.0100, 1539564873)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (270, 6353.4000, 1539564874)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (271, 6353.3500, 1539564875)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (272, 6353.3500, 1539564876)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (273, 6356.8200, 1539564877)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (274, 6356.7800, 1539564879)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (275, 6355.7700, 1539564880)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (276, 6355.7700, 1539564881)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (277, 6351.4100, 1539564882)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (278, 6351.4100, 1539564883)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (279, 6351.4100, 1539564884)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (280, 6351.4100, 1539564886)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (281, 6350.3600, 1539564887)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (282, 6350.3600, 1539564888)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (283, 6350.3700, 1539564889)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (284, 6350.3700, 1539564890)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (285, 6350.3700, 1539564891)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (286, 6350.3700, 1539564892)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (287, 6350.3700, 1539564894)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (288, 6350.3700, 1539564895)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (289, 6350.3700, 1539564896)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (290, 6350.3700, 1539564897)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (291, 6350.5100, 1539564898)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (292, 6355.1200, 1539564899)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (293, 6355.1200, 1539564901)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (294, 6355.0600, 1539564903)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (295, 6350.5100, 1539564904)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (296, 6350.5100, 1539564905)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (297, 6350.5100, 1539564906)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (298, 6350.5100, 1539564908)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (299, 6350.5100, 1539564909)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (300, 6350.5100, 1539564910)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (301, 6351.2700, 1539564911)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (302, 6352.6200, 1539564912)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (303, 6352.6200, 1539564913)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (304, 6354.2900, 1539564914)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (305, 6354.2900, 1539564916)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (306, 6355.3400, 1539564917)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (307, 6354.2800, 1539564918)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (308, 6354.2800, 1539564919)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (309, 6359.3400, 1539564920)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (310, 6353.1500, 1539564922)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (311, 6353.1500, 1539564923)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (312, 6353.1500, 1539564924)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (313, 6353.1000, 1539564925)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (314, 6358.4800, 1539564926)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (315, 6358.4800, 1539564927)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (316, 6353.1000, 1539564928)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (317, 6358.3500, 1539564930)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (318, 6358.3500, 1539564931)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (319, 6353.1100, 1539564932)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (320, 6353.1100, 1539564933)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (321, 6353.1100, 1539564934)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (322, 6353.1100, 1539564935)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (323, 6353.1100, 1539564936)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (324, 6353.1100, 1539564938)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (325, 6353.1100, 1539564939)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (326, 6353.1100, 1539564940)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (327, 6353.1100, 1539564941)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (328, 6353.1100, 1539564942)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (329, 6353.1100, 1539564943)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (330, 6353.1100, 1539564945)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (331, 6353.1100, 1539564946)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (332, 6356.8900, 1539564947)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (333, 6353.1100, 1539564948)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (334, 6353.1100, 1539564949)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (335, 6353.1100, 1539564950)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (336, 6353.1200, 1539564952)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (337, 6356.8100, 1539564953)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (338, 6356.8100, 1539564954)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (339, 6356.8100, 1539564955)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (340, 6354.9900, 1539564956)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (341, 6354.9700, 1539564957)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (342, 6354.9700, 1539564959)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (343, 6354.9700, 1539564960)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (344, 6354.9700, 1539564961)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (345, 6353.1200, 1539564962)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (346, 6353.1200, 1539564963)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (347, 6353.1200, 1539564964)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (348, 6353.1200, 1539564965)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (349, 6353.1200, 1539564967)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (350, 6354.9500, 1539564968)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (351, 6354.9500, 1539564969)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (352, 6354.9500, 1539564970)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (353, 6353.1300, 1539564971)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (354, 6353.1300, 1539564972)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (355, 6356.7900, 1539564974)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (356, 6354.9600, 1539564975)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (357, 6354.9500, 1539564976)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (358, 6354.9500, 1539564977)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (359, 6353.1200, 1539564978)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (360, 6353.1200, 1539564979)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (361, 6353.1200, 1539564980)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (362, 6353.1200, 1539564982)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (363, 6353.1200, 1539564983)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (364, 6353.1200, 1539564984)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (365, 6353.1200, 1539564985)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (366, 6353.1200, 1539564986)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (367, 6353.1200, 1539564987)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (368, 6353.1200, 1539564989)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (369, 6353.1200, 1539564990)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (370, 6353.1200, 1539564991)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (371, 6351.2700, 1539564992)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (372, 6353.1200, 1539564993)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (373, 6353.1200, 1539564994)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (374, 6353.1200, 1539564995)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (375, 6353.1200, 1539564997)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (376, 6353.1200, 1539564998)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (377, 6353.1200, 1539564999)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (378, 6353.1200, 1539565000)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (379, 6351.2700, 1539565001)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (380, 6351.2700, 1539565002)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (381, 6351.2700, 1539565004)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (382, 6351.2700, 1539565005)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (383, 6351.2700, 1539565006)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (384, 6351.2800, 1539565007)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (385, 6351.2800, 1539565008)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (386, 6351.2800, 1539565009)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (387, 6350.5000, 1539565011)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (388, 6350.5000, 1539565012)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (389, 6350.5000, 1539565013)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (390, 6350.5000, 1539565014)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (391, 6350.5000, 1539565015)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (392, 6350.5000, 1539565016)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (393, 6350.5000, 1539565017)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (394, 6348.3300, 1539565019)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (395, 6347.6700, 1539565020)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (396, 6347.6700, 1539565021)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (397, 6348.3300, 1539565022)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (398, 6348.3300, 1539565023)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (399, 6348.3300, 1539565024)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (400, 6348.3300, 1539565026)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (401, 6348.3300, 1539565027)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (402, 6348.3300, 1539565028)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (403, 6348.3300, 1539565029)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (404, 6348.3300, 1539565030)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (405, 6348.3300, 1539565031)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (406, 6348.3300, 1539565033)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (407, 6348.3300, 1539565034)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (408, 6348.3300, 1539565035)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (409, 6348.3300, 1539565036)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (410, 6348.3300, 1539565037)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (411, 6347.3700, 1539565038)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (412, 6347.3700, 1539565039)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (413, 6347.3700, 1539565041)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (414, 6348.3300, 1539565042)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (415, 6348.3300, 1539565043)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (416, 6348.3300, 1539565044)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (417, 6348.3300, 1539565045)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (418, 6348.3300, 1539565046)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (419, 6348.3300, 1539565048)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (420, 6348.3300, 1539565049)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (421, 6348.3300, 1539565050)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (422, 6348.3300, 1539565051)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (423, 6347.3800, 1539565052)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (424, 6347.3800, 1539565053)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (425, 6347.3800, 1539565055)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (426, 6347.3800, 1539565056)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (427, 6347.3800, 1539565057)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (428, 6347.3800, 1539565058)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (429, 6347.3700, 1539565059)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (430, 6346.2400, 1539565060)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (431, 6346.2400, 1539565061)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (432, 6346.2400, 1539565063)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (433, 6348.0000, 1539565064)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (434, 6346.2400, 1539565065)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (435, 6346.2400, 1539565066)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (436, 6346.2400, 1539565067)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (437, 6347.9900, 1539565068)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (438, 6348.3300, 1539565070)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (439, 6348.3300, 1539565071)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (440, 6347.9900, 1539565072)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (441, 6347.9900, 1539565073)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (442, 6347.9900, 1539565074)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (443, 6347.9900, 1539565075)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (444, 6347.9900, 1539565077)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (445, 6348.3300, 1539565078)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (446, 6349.0000, 1539565079)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (447, 6349.0000, 1539565080)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (448, 6348.3500, 1539565081)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (449, 6348.0100, 1539565082)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (450, 6349.0000, 1539565084)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (451, 6349.0000, 1539565085)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (452, 6349.0000, 1539565086)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (453, 6349.6600, 1539565087)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (454, 6349.6600, 1539565088)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (455, 6349.6600, 1539565089)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (456, 6351.3000, 1539565091)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (457, 6349.0300, 1539565092)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (458, 6351.2900, 1539565093)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (459, 6349.0300, 1539565094)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (460, 6349.0300, 1539565095)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (461, 6349.0500, 1539565096)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (462, 6349.0500, 1539565098)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (463, 6351.2400, 1539565099)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (464, 6349.0600, 1539565100)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (465, 6351.2300, 1539565101)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (466, 6351.1900, 1539565102)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (467, 6351.1900, 1539565103)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (468, 6351.1900, 1539565104)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (469, 6349.1200, 1539565106)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (470, 6349.1200, 1539565107)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (471, 6349.1200, 1539565108)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (472, 6349.1200, 1539565109)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (473, 6349.1200, 1539565111)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (474, 6349.1200, 1539565112)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (475, 6349.1200, 1539565114)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (476, 6350.9800, 1539565115)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (477, 6350.9800, 1539565116)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (478, 6350.9800, 1539565117)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (479, 6350.9800, 1539565118)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (480, 6349.0000, 1539565119)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (481, 6349.0000, 1539565121)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (482, 6349.0100, 1539565122)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (483, 6349.0100, 1539565123)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (484, 6349.0100, 1539565124)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (485, 6348.9900, 1539565125)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (486, 6348.9900, 1539565126)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (487, 6348.9700, 1539565128)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (488, 6348.9700, 1539565129)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (489, 6348.9700, 1539565130)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (490, 6348.9700, 1539565131)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (491, 6348.9700, 1539565132)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (492, 6348.9700, 1539565133)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (493, 6348.9600, 1539565135)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (494, 6348.9600, 1539565136)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (495, 6348.9600, 1539565137)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (496, 6348.9400, 1539565138)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (497, 6346.2500, 1539565139)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (498, 6348.9300, 1539565140)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (499, 6347.9800, 1539565142)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (500, 6347.9800, 1539565143)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (501, 6347.9800, 1539565144)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (502, 6347.9800, 1539565145)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (503, 6347.9800, 1539565146)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (504, 6347.9900, 1539565148)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (505, 6347.9900, 1539565149)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (506, 6348.9200, 1539565150)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (507, 6348.9200, 1539565151)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (508, 6347.8500, 1539565152)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (509, 6347.9900, 1539565153)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (510, 6347.9800, 1539565155)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (511, 6347.9800, 1539565156)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (512, 6346.2500, 1539565157)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (513, 6346.2500, 1539565158)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (514, 6346.2500, 1539565159)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (515, 6346.2500, 1539565160)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (516, 6346.2500, 1539565162)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (517, 6346.2500, 1539565163)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (518, 6346.2500, 1539565164)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (519, 6346.2500, 1539565165)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (520, 6348.9000, 1539565167)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (521, 6346.2900, 1539565168)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (522, 6346.2900, 1539565169)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (523, 6346.2900, 1539565171)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (524, 6346.2900, 1539565172)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (525, 6348.8900, 1539565173)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (526, 6346.2900, 1539565174)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (527, 6348.9000, 1539565175)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (528, 6348.9000, 1539565176)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (529, 6348.9000, 1539565178)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (530, 6348.9000, 1539565179)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (531, 6348.9000, 1539565180)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (532, 6348.9000, 1539565181)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (533, 6348.9000, 1539565182)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (534, 6348.9000, 1539565184)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (535, 6348.9000, 1539565185)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (536, 6348.9000, 1539565186)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (537, 6348.9100, 1539565187)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (538, 6348.9100, 1539565188)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (539, 6348.9100, 1539565189)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (540, 6349.9900, 1539565191)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (541, 6346.5100, 1539565192)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (542, 6346.5100, 1539565193)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (543, 6346.5100, 1539565194)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (544, 6346.5200, 1539565195)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (545, 6346.5200, 1539565196)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (546, 6346.5200, 1539565198)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (547, 6346.5200, 1539565199)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (548, 6346.5200, 1539565200)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (549, 6346.5200, 1539565201)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (550, 6346.5600, 1539565202)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (551, 6346.5600, 1539565203)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (552, 6349.9400, 1539565205)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (553, 6346.6000, 1539565206)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (554, 6346.6000, 1539565207)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (555, 6346.6000, 1539565208)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (556, 6349.9100, 1539565209)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (557, 6349.9900, 1539565210)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (558, 6350.0000, 1539565212)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (559, 6350.8700, 1539565213)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (560, 6350.0100, 1539565214)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (561, 6350.0100, 1539565215)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (562, 6350.0100, 1539565216)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (563, 6350.0100, 1539565217)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (564, 6350.0100, 1539565219)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (565, 6350.1500, 1539565220)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (566, 6352.1000, 1539565221)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (567, 6353.1300, 1539565222)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (568, 6353.8800, 1539565223)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (569, 6353.8800, 1539565224)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (570, 6354.5900, 1539565226)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (571, 6351.4300, 1539565227)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (572, 6351.4300, 1539565228)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (573, 6351.4300, 1539565229)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (574, 6354.6500, 1539565230)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (575, 6353.4700, 1539565231)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (576, 6353.4700, 1539565233)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (577, 6353.4700, 1539565234)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (578, 6355.4600, 1539565235)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (579, 6355.4600, 1539565236)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (580, 6355.4600, 1539565237)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (581, 6355.5100, 1539565238)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (582, 6355.5100, 1539565240)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (583, 6356.7300, 1539565241)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (584, 6357.2000, 1539565242)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (585, 6356.7300, 1539565243)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (586, 6355.0900, 1539565244)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (587, 6355.1300, 1539565246)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (588, 6355.1200, 1539565247)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (589, 6356.8800, 1539565248)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (590, 6356.8800, 1539565249)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (591, 6356.8800, 1539565250)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (592, 6353.7000, 1539565251)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (593, 6353.7000, 1539565253)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (594, 6355.5100, 1539565254)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (595, 6355.5100, 1539565255)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (596, 6356.8100, 1539565256)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (597, 6356.8100, 1539565257)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (598, 6356.8200, 1539565258)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (599, 6356.8200, 1539565260)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (600, 6356.8200, 1539565261)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (601, 6356.8100, 1539565262)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (602, 6356.8100, 1539565263)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (603, 6356.8100, 1539565264)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (604, 6356.8100, 1539565266)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (605, 6356.8100, 1539565267)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (606, 6356.8100, 1539565268)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (607, 6356.8200, 1539565269)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (608, 6356.8200, 1539565270)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (609, 6356.8100, 1539565271)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (610, 6357.6200, 1539565273)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (611, 6360.0000, 1539565274)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (612, 6360.0000, 1539565275)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (613, 6357.0100, 1539565276)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (614, 6357.0400, 1539565277)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (615, 6357.0700, 1539565278)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (616, 6357.1800, 1539565280)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (617, 6357.1800, 1539565281)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (618, 6357.1800, 1539565282)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (619, 6357.1800, 1539565283)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (620, 6357.1800, 1539565284)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (621, 6357.1800, 1539565286)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (622, 6359.0000, 1539565287)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (623, 6359.0000, 1539565288)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (624, 6359.0000, 1539565289)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (625, 6358.1900, 1539565290)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (626, 6356.8200, 1539565292)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (627, 6356.8200, 1539565293)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (628, 6356.8200, 1539565294)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (629, 6356.8200, 1539565295)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (630, 6358.2000, 1539565296)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (631, 6355.1200, 1539565298)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (632, 6355.1200, 1539565299)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (633, 6355.1200, 1539565300)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (634, 6358.0500, 1539565301)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (635, 6353.6100, 1539565302)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (636, 6353.6100, 1539565303)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (637, 6353.6100, 1539565305)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (638, 6356.2000, 1539565306)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (639, 6352.8000, 1539565307)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (640, 6352.8000, 1539565308)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (641, 6352.8000, 1539565309)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (642, 6352.8000, 1539565310)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (643, 6352.8000, 1539565312)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (644, 6352.8000, 1539565313)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (645, 6352.8000, 1539565314)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (646, 6352.8000, 1539565315)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (647, 6352.8100, 1539565316)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (648, 6354.8800, 1539565317)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (649, 6352.8100, 1539565319)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (650, 6357.0000, 1539565320)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (651, 6357.0000, 1539565321)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (652, 6357.0000, 1539565322)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (653, 6357.0000, 1539565323)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (654, 6357.0000, 1539565324)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (655, 6357.0000, 1539565326)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (656, 6357.0000, 1539565327)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (657, 6357.0000, 1539565328)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (658, 6357.0000, 1539565329)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (659, 6357.0000, 1539565330)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (660, 6357.0000, 1539565331)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (661, 6357.0000, 1539565333)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (662, 6357.0000, 1539565334)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (663, 6357.0000, 1539565335)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (664, 6357.0000, 1539565336)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (665, 6357.0000, 1539565337)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (666, 6357.9800, 1539565338)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (667, 6358.2000, 1539565340)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (668, 6358.2000, 1539565341)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (669, 6357.0000, 1539565342)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (670, 6357.0000, 1539565343)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (671, 6357.0000, 1539565344)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (672, 6357.0000, 1539565346)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (673, 6357.0000, 1539565347)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (674, 6357.8000, 1539565348)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (675, 6357.0000, 1539565350)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (676, 6357.0000, 1539565351)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (677, 6357.0000, 1539565353)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (678, 6357.0000, 1539565354)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (679, 6357.0000, 1539565355)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (680, 6357.0000, 1539565356)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (681, 6357.0000, 1539565357)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (682, 6357.0000, 1539565359)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (683, 6357.0000, 1539565360)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (684, 6357.0000, 1539565361)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (685, 6357.0000, 1539565362)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (686, 6357.0000, 1539565363)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (687, 6357.0000, 1539565364)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (688, 6357.7800, 1539565366)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (689, 6357.7800, 1539565367)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (690, 6357.7800, 1539565368)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (691, 6357.7800, 1539565369)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (692, 6357.0000, 1539565370)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (693, 6357.0000, 1539565371)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (694, 6357.0000, 1539565373)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (695, 6357.0000, 1539565374)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (696, 6357.0000, 1539565375)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (697, 6353.0400, 1539565376)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (698, 6355.2400, 1539565377)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (699, 6355.2400, 1539565379)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (700, 6355.2400, 1539565380)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (701, 6355.2400, 1539565381)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (702, 6357.3300, 1539565382)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (703, 6355.2400, 1539565383)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (704, 6357.2800, 1539565384)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (705, 6355.2400, 1539565386)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (706, 6355.2400, 1539565387)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (707, 6355.2300, 1539565388)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (708, 6355.2300, 1539565389)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (709, 6354.0000, 1539565391)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (710, 6354.0000, 1539565392)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (711, 6355.2300, 1539565393)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (712, 6354.0000, 1539565394)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (713, 6353.0400, 1539565395)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (714, 6353.0400, 1539565396)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (715, 6353.0400, 1539565398)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (716, 6353.0400, 1539565399)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (717, 6353.0300, 1539565400)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (718, 6353.0300, 1539565401)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (719, 6353.0300, 1539565402)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (720, 6353.0300, 1539565403)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (721, 6353.0300, 1539565405)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (722, 6353.0300, 1539565406)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (723, 6353.0300, 1539565407)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (724, 6354.3700, 1539565408)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (725, 6354.3700, 1539565409)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (726, 6354.3700, 1539565410)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (727, 6353.0300, 1539565412)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (728, 6353.0300, 1539565413)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (729, 6353.0300, 1539565414)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (730, 6353.0300, 1539565415)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (731, 6353.0300, 1539565416)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (732, 6353.0300, 1539565418)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (733, 6353.0300, 1539565419)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (734, 6353.0300, 1539565420)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (735, 6353.0400, 1539565421)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (736, 6353.0400, 1539565422)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (737, 6353.0400, 1539565423)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (738, 6353.0400, 1539565425)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (739, 6353.0300, 1539565426)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (740, 6352.8000, 1539565427)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (741, 6352.8000, 1539565428)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (742, 6352.8000, 1539565429)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (743, 6352.8000, 1539565430)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (744, 6351.2600, 1539565432)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (745, 6351.2600, 1539565433)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (746, 6351.2600, 1539565434)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (747, 6352.9100, 1539565435)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (748, 6352.9100, 1539565436)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (749, 6351.2500, 1539565437)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (750, 6351.2500, 1539565439)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (751, 6351.2500, 1539565440)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (752, 6351.2500, 1539565441)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (753, 6351.2500, 1539565442)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (754, 6351.2600, 1539565443)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (755, 6351.2600, 1539565444)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (756, 6351.2500, 1539565447)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (757, 6351.2500, 1539565448)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (758, 6351.2500, 1539565449)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (759, 6351.2600, 1539565450)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (760, 6351.2600, 1539565451)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (761, 6351.2500, 1539565453)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (762, 6351.2500, 1539565454)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (763, 6351.2500, 1539565455)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (764, 6351.2500, 1539565456)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (765, 6351.2600, 1539565457)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (766, 6351.2500, 1539565458)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (767, 6351.2500, 1539565460)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (768, 6351.2500, 1539565461)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (769, 6351.2500, 1539565462)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (770, 6351.2500, 1539565463)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (771, 6351.2500, 1539565464)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (772, 6351.2500, 1539565465)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (773, 6350.0000, 1539565467)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (774, 6350.0000, 1539565468)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (775, 6350.0000, 1539565469)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (776, 6350.0000, 1539565470)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (777, 6348.9400, 1539565471)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (778, 6348.9400, 1539565472)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (779, 6348.9400, 1539565474)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (780, 6348.9400, 1539565475)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (781, 6348.8900, 1539565476)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (782, 6348.8900, 1539565477)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (783, 6348.8900, 1539565478)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (784, 6348.8900, 1539565480)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (785, 6348.8900, 1539565481)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (786, 6348.8900, 1539565482)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (787, 6348.8900, 1539565483)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (788, 6348.8900, 1539565484)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (789, 6348.8900, 1539565485)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (790, 6348.8900, 1539565487)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (791, 6348.8900, 1539565488)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (792, 6348.8900, 1539565489)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (793, 6350.0000, 1539565490)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (794, 6350.0000, 1539565491)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (795, 6348.8900, 1539565492)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (796, 6350.0000, 1539565495)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (797, 6350.0000, 1539565496)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (798, 6350.0000, 1539565497)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (799, 6350.0000, 1539565498)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (800, 6350.0000, 1539565499)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (801, 6350.0000, 1539565501)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (802, 6348.9000, 1539565502)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (803, 6350.0000, 1539565503)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (804, 6350.0000, 1539565504)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (805, 6350.0000, 1539565505)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (806, 6350.0000, 1539565507)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (807, 6350.0000, 1539565508)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (808, 6350.0000, 1539565509)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (809, 6350.0000, 1539565510)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (810, 6348.9000, 1539565511)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (811, 6348.9000, 1539565513)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (812, 6348.9000, 1539565514)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (813, 6348.9000, 1539565515)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (814, 6350.0000, 1539565516)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (815, 6350.0000, 1539565517)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (816, 6350.0000, 1539565518)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (817, 6350.0000, 1539565520)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (818, 6350.0000, 1539565521)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (819, 6348.9100, 1539565522)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (820, 6348.9100, 1539565523)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (821, 6348.9100, 1539565524)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (822, 6350.0000, 1539565525)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (823, 6350.0000, 1539565527)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (824, 6350.0000, 1539565528)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (825, 6350.0000, 1539565529)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (826, 6350.0000, 1539565530)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (827, 6348.9100, 1539565531)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (828, 6348.9100, 1539565533)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (829, 6350.0000, 1539565534)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (830, 6350.0000, 1539565535)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (831, 6350.0000, 1539565536)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (832, 6348.9100, 1539565537)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (833, 6350.0000, 1539565538)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (834, 6350.0000, 1539565540)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (835, 6350.0300, 1539565541)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (836, 6350.0300, 1539565542)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (837, 6350.0400, 1539565543)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (838, 6350.0500, 1539565544)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (839, 6352.0000, 1539565545)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (840, 6352.0000, 1539565547)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (841, 6353.7700, 1539565548)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (842, 6352.0400, 1539565549)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (843, 6352.0400, 1539565550)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (844, 6352.0400, 1539565551)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (845, 6353.9900, 1539565552)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (846, 6353.9900, 1539565554)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (847, 6353.9900, 1539565555)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (848, 6353.9900, 1539565556)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (849, 6353.9900, 1539565557)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (850, 6353.9900, 1539565558)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (851, 6352.0800, 1539565560)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (852, 6352.0800, 1539565561)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (853, 6353.9900, 1539565562)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (854, 6352.0800, 1539565563)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (855, 6352.0800, 1539565564)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (856, 6354.0000, 1539565565)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (857, 6355.0000, 1539565567)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (858, 6355.0000, 1539565568)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (859, 6355.0000, 1539565569)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (860, 6355.0000, 1539565570)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (861, 6352.5400, 1539565571)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (862, 6352.5400, 1539565573)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (863, 6355.0000, 1539565574)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (864, 6356.0000, 1539565575)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (865, 6356.2600, 1539565576)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (866, 6356.7900, 1539565577)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (867, 6355.0300, 1539565578)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (868, 6355.0300, 1539565580)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (869, 6355.0300, 1539565581)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (870, 6355.0300, 1539565582)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (871, 6355.0300, 1539565583)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (872, 6355.0300, 1539565584)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (873, 6356.7500, 1539565586)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (874, 6356.7500, 1539565588)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (875, 6356.7500, 1539565589)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (876, 6356.7500, 1539565590)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (877, 6356.7500, 1539565591)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (878, 6356.7500, 1539565592)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (879, 6356.7500, 1539565593)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (880, 6356.7500, 1539565595)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (881, 6356.7500, 1539565596)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (882, 6356.7500, 1539565597)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (883, 6357.0000, 1539565598)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (884, 6357.0000, 1539565599)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (885, 6356.7500, 1539565601)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (886, 6356.0000, 1539565602)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (887, 6356.0000, 1539565603)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (888, 6356.0000, 1539565604)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (889, 6356.0000, 1539565605)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (890, 6356.0000, 1539565606)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (891, 6356.0000, 1539565608)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (892, 6356.0000, 1539565609)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (893, 6356.0700, 1539565610)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (894, 6358.3200, 1539565611)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (895, 6356.1800, 1539565612)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (896, 6357.7100, 1539565614)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (897, 6356.4900, 1539565615)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (898, 6356.0900, 1539565616)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (899, 6355.8600, 1539565617)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (900, 6355.8600, 1539565618)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (901, 6359.6800, 1539565620)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (902, 6353.8600, 1539565621)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (903, 6353.8600, 1539565622)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (904, 6359.5000, 1539565623)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (905, 6359.5000, 1539565624)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (906, 6359.5000, 1539565625)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (907, 6359.5000, 1539565627)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (908, 6358.9100, 1539565628)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (909, 6358.9100, 1539565629)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (910, 6358.9100, 1539565630)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (911, 6353.4200, 1539565632)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (912, 6353.4200, 1539565633)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (913, 6358.7800, 1539565634)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (914, 6358.7800, 1539565635)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (915, 6358.7800, 1539565636)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (916, 6358.7800, 1539565637)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (917, 6354.0000, 1539565639)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (918, 6354.0000, 1539565640)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (919, 6354.0000, 1539565641)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (920, 6354.0100, 1539565642)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (921, 6356.0000, 1539565644)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (922, 6356.0000, 1539565645)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (923, 6356.0000, 1539565646)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (924, 6356.0000, 1539565647)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (925, 6356.0000, 1539565648)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (926, 6356.0000, 1539565650)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (927, 6356.0000, 1539565651)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (928, 6355.7400, 1539565652)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (929, 6355.7400, 1539565653)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (930, 6355.7400, 1539565654)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (931, 6354.0000, 1539565656)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (932, 6354.0000, 1539565657)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (933, 6352.0000, 1539565658)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (934, 6355.5400, 1539565659)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (935, 6355.5400, 1539565660)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (936, 6352.0200, 1539565662)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (937, 6353.9900, 1539565663)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (938, 6353.9900, 1539565664)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (939, 6353.9900, 1539565665)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (940, 6353.9600, 1539565666)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (941, 6355.6700, 1539565668)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (942, 6352.1400, 1539565669)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (943, 6352.1400, 1539565670)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (944, 6352.1400, 1539565671)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (945, 6355.6400, 1539565672)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (946, 6357.8300, 1539565674)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (947, 6357.8300, 1539565675)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (948, 6357.7600, 1539565676)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (949, 6357.7600, 1539565677)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (950, 6357.7600, 1539565678)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (951, 6357.7100, 1539565680)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (952, 6357.7100, 1539565681)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (953, 6353.4200, 1539565682)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (954, 6353.4700, 1539565683)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (955, 6357.7100, 1539565684)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (956, 6357.7800, 1539565686)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (957, 6357.7800, 1539565687)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (958, 6355.6700, 1539565688)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (959, 6355.6700, 1539565689)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (960, 6357.7800, 1539565690)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (961, 6355.6700, 1539565692)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (962, 6355.6700, 1539565693)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (963, 6355.6700, 1539565694)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (964, 6357.7500, 1539565695)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (965, 6357.7800, 1539565696)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (966, 6357.7800, 1539565697)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (967, 6357.7800, 1539565699)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (968, 6357.7800, 1539565700)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (969, 6357.7800, 1539565701)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (970, 6355.6700, 1539565702)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (971, 6355.6700, 1539565703)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (972, 6355.6700, 1539565705)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (973, 6355.6700, 1539565706)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (974, 6355.6700, 1539565707)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (975, 6355.6700, 1539565708)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (976, 6355.6700, 1539565709)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (977, 6355.6700, 1539565711)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (978, 6355.6700, 1539565712)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (979, 6355.6700, 1539565713)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (980, 6355.6700, 1539565714)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (981, 6355.6700, 1539565715)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (982, 6355.6700, 1539565716)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (983, 6355.6700, 1539565718)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (984, 6355.6900, 1539565719)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (985, 6357.7000, 1539565720)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (986, 6357.7000, 1539565721)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (987, 6357.7400, 1539565722)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (988, 6357.8000, 1539565724)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (989, 6357.8500, 1539565725)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (990, 6359.4200, 1539565726)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (991, 6359.4500, 1539565727)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (992, 6359.4300, 1539565728)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (993, 6359.4300, 1539565730)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (994, 6359.4300, 1539565731)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (995, 6357.8900, 1539565732)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (996, 6357.8900, 1539565733)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (997, 6357.9200, 1539565734)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (998, 6357.9200, 1539565735)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (999, 6357.9200, 1539565737)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1000, 6357.9400, 1539565738)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1001, 6357.9900, 1539565739)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1002, 6357.9900, 1539565740)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1003, 6357.9900, 1539565741)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1004, 6361.3400, 1539565743)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1005, 6359.9900, 1539565744)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1006, 6357.9900, 1539565745)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1007, 6357.9900, 1539565746)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1008, 6357.9900, 1539565747)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1009, 6357.9900, 1539565749)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1010, 6357.9900, 1539565750)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1011, 6357.9900, 1539565751)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1012, 6358.0100, 1539565752)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1013, 6358.0100, 1539565753)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1014, 6359.0000, 1539565755)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1015, 6359.0000, 1539565756)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1016, 6359.0000, 1539565757)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1017, 6359.0000, 1539565758)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1018, 6359.0000, 1539565759)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1019, 6359.0100, 1539565761)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1020, 6359.0300, 1539565762)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1021, 6358.0000, 1539565763)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1022, 6358.0000, 1539565764)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1023, 6357.9300, 1539565765)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1024, 6357.9400, 1539565767)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1025, 6357.9400, 1539565768)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1026, 6357.9400, 1539565769)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1027, 6356.0000, 1539565770)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1028, 6356.0300, 1539565771)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1029, 6356.0300, 1539565773)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1030, 6356.0300, 1539565774)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1031, 6357.9300, 1539565775)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1032, 6357.9300, 1539565776)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1033, 6357.9300, 1539565777)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1034, 6356.0400, 1539565779)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1035, 6357.8200, 1539565780)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1036, 6357.9200, 1539565781)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1037, 6357.9200, 1539565782)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1038, 6357.9200, 1539565783)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1039, 6357.9200, 1539565785)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1040, 6357.9300, 1539565786)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1041, 6357.9300, 1539565787)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1042, 6357.9300, 1539565788)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1043, 6357.9300, 1539565789)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1044, 6357.9300, 1539565791)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1045, 6357.9300, 1539565792)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1046, 6357.9400, 1539565793)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1047, 6357.9300, 1539565794)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1048, 6357.9200, 1539565795)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1049, 6357.9300, 1539565796)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1050, 6357.9300, 1539565798)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1051, 6357.9300, 1539565799)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1052, 6356.1200, 1539565800)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1053, 6356.1200, 1539565801)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1054, 6356.1200, 1539565803)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1055, 6356.1200, 1539565804)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1056, 6356.1200, 1539565805)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1057, 6356.1200, 1539565806)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1058, 6356.1200, 1539565807)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1059, 6357.9300, 1539565809)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1060, 6357.9300, 1539565810)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1061, 6357.9400, 1539565811)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1062, 6357.9400, 1539565812)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1063, 6357.9400, 1539565814)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1064, 6357.9400, 1539565815)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1065, 6359.0100, 1539565816)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1066, 6357.9300, 1539565817)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1067, 6357.3400, 1539565818)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1068, 6357.3400, 1539565820)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1069, 6357.3400, 1539565821)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1070, 6356.3300, 1539565822)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1071, 6356.3300, 1539565823)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1072, 6356.3300, 1539565824)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1073, 6356.3300, 1539565826)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1074, 6357.3400, 1539565827)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1075, 6357.3400, 1539565828)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1076, 6357.3400, 1539565829)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1077, 6357.3400, 1539565830)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1078, 6357.3400, 1539565831)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1079, 6356.3400, 1539565833)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1080, 6356.3400, 1539565834)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1081, 6356.3400, 1539565835)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1082, 6356.3500, 1539565836)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1083, 6356.3400, 1539565837)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1084, 6356.3400, 1539565839)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1085, 6356.3400, 1539565840)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1086, 6356.3400, 1539565841)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1087, 6356.3400, 1539565842)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1088, 6357.3400, 1539565843)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1089, 6356.3400, 1539565845)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1090, 6356.3400, 1539565846)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1091, 6356.3400, 1539565847)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1092, 6356.3400, 1539565848)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1093, 6357.3400, 1539565849)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1094, 6357.3400, 1539565851)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1095, 6356.3400, 1539565852)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1096, 6357.9400, 1539565853)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1097, 6357.9400, 1539565854)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1098, 6357.9400, 1539565855)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1099, 6356.3600, 1539565857)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1100, 6356.3600, 1539565858)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1101, 6356.3600, 1539565859)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1102, 6356.3600, 1539565860)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1103, 6356.3600, 1539565861)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1104, 6357.3400, 1539565863)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1105, 6356.3400, 1539565864)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1106, 6357.3400, 1539565865)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1107, 6357.3400, 1539565866)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1108, 6357.3400, 1539565867)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1109, 6357.3400, 1539565869)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1110, 6356.3400, 1539565870)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1111, 6356.3400, 1539565871)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1112, 6356.3400, 1539565872)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1113, 6356.3400, 1539565873)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1114, 6356.3400, 1539565875)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1115, 6359.6200, 1539565876)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1116, 6356.3500, 1539565877)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1117, 6356.3500, 1539565878)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1118, 6356.4600, 1539565880)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1119, 6356.4600, 1539565881)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1120, 6356.4600, 1539565882)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1121, 6361.3500, 1539565883)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1122, 6357.5100, 1539565884)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1123, 6357.5100, 1539565886)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1124, 6361.3400, 1539565887)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1125, 6357.5100, 1539565888)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1126, 6357.5100, 1539565889)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1127, 6357.5100, 1539565890)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1128, 6357.5500, 1539565892)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1129, 6357.5000, 1539565893)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1130, 6357.5000, 1539565894)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1131, 6356.5700, 1539565895)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1132, 6356.5700, 1539565897)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1133, 6356.5700, 1539565899)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1134, 6356.5700, 1539565900)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1135, 6356.5700, 1539565901)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1136, 6361.9800, 1539565902)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1137, 6361.1100, 1539565903)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1138, 6356.6600, 1539565905)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1139, 6356.6600, 1539565906)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1140, 6356.6600, 1539565907)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1141, 6356.6600, 1539565908)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1142, 6356.6600, 1539565909)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1143, 6357.4900, 1539565911)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1144, 6357.4900, 1539565912)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1145, 6357.4900, 1539565913)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1146, 6357.4900, 1539565915)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1147, 6357.4900, 1539565916)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1148, 6357.4900, 1539565918)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1149, 6358.6600, 1539565919)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1150, 6358.6600, 1539565920)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1151, 6358.6600, 1539565921)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1152, 6358.6600, 1539565923)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1153, 6358.6600, 1539565925)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1154, 6358.6600, 1539565926)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1155, 6358.6600, 1539565927)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1156, 6358.6600, 1539565928)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1157, 6358.6600, 1539565929)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1158, 6358.6600, 1539565931)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1159, 6358.6800, 1539565932)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1160, 6358.7000, 1539565933)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1161, 6358.7000, 1539565934)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1162, 6357.6000, 1539565936)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1163, 6361.0700, 1539565937)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1164, 6361.0700, 1539565938)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1165, 6357.6700, 1539565939)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1166, 6376.1900, 1539565940)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1167, 6361.0900, 1539565941)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1168, 6361.0800, 1539565943)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1169, 6364.2900, 1539565944)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1170, 6364.2800, 1539565945)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1171, 6361.1400, 1539565946)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1172, 6361.1400, 1539565948)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1173, 6361.0700, 1539565949)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1174, 6364.2400, 1539565950)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1175, 6361.2300, 1539565951)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1176, 6364.2300, 1539565952)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1177, 6361.0700, 1539565953)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1178, 6360.5500, 1539565955)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1179, 6360.5500, 1539565956)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1180, 6360.5500, 1539565957)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1181, 6360.5500, 1539565958)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1182, 6360.5600, 1539565959)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1183, 6362.9900, 1539565961)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1184, 6360.5700, 1539565962)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1185, 6362.9700, 1539565963)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1186, 6362.9700, 1539565964)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1187, 6362.9700, 1539565965)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1188, 6360.5600, 1539565967)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1189, 6362.9700, 1539565968)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1190, 6362.9700, 1539565969)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1191, 6360.6100, 1539565970)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1192, 6364.2400, 1539565971)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1193, 6360.6700, 1539565973)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1194, 6360.6700, 1539565974)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1195, 6360.6700, 1539565975)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1196, 6360.6700, 1539565976)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1197, 6360.6700, 1539565977)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1198, 6360.6700, 1539565979)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1199, 6364.2400, 1539565980)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1200, 6364.2300, 1539565981)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1201, 6364.2600, 1539565982)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1202, 6361.8800, 1539565984)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1203, 6361.9300, 1539565985)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1204, 6361.9300, 1539565986)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1205, 6361.9300, 1539565987)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1206, 6361.9300, 1539565988)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1207, 6361.9300, 1539565990)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1208, 6361.9300, 1539565991)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1209, 6361.9300, 1539565992)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1210, 6364.2600, 1539565993)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1211, 6361.9500, 1539565995)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1212, 6361.9500, 1539565996)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1213, 6361.9500, 1539565997)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1214, 6361.9500, 1539565998)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1215, 6364.2500, 1539565999)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1216, 6364.2500, 1539566001)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1217, 6364.2500, 1539566002)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1218, 6364.2500, 1539566003)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1219, 6364.2500, 1539566004)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1220, 6364.2500, 1539566005)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1221, 6364.2500, 1539566007)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1222, 6364.2600, 1539566008)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1223, 6364.2600, 1539566009)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1224, 6364.2600, 1539566010)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1225, 6364.2600, 1539566011)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1226, 6364.2600, 1539566013)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1227, 6364.2500, 1539566014)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1228, 6364.2600, 1539566015)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1229, 6364.2600, 1539566016)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1230, 6364.2600, 1539566017)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1231, 6364.2600, 1539566019)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1232, 6364.2600, 1539566020)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1233, 6364.2600, 1539566021)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1234, 6364.2600, 1539566022)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1235, 6364.2600, 1539566023)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1236, 6364.2600, 1539566025)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1237, 6365.0000, 1539566026)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1238, 6365.0000, 1539566027)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1239, 6364.2600, 1539566028)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1240, 6365.0000, 1539566029)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1241, 6365.0000, 1539566031)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1242, 6364.2600, 1539566032)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1243, 6364.2500, 1539566033)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1244, 6364.2500, 1539566034)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1245, 6364.2500, 1539566035)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1246, 6364.2500, 1539566037)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1247, 6362.0000, 1539566038)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1248, 6362.0000, 1539566039)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1249, 6362.0000, 1539566040)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1250, 6362.0000, 1539566041)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1251, 6362.0000, 1539566043)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1252, 6362.0000, 1539566044)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1253, 6362.0000, 1539566045)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1254, 6364.1800, 1539566046)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1255, 6364.1800, 1539566047)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1256, 6364.1800, 1539566049)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1257, 6360.0000, 1539566050)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1258, 6360.0000, 1539566051)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1259, 6360.2900, 1539566052)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1260, 6360.2900, 1539566053)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1261, 6360.2900, 1539566055)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1262, 6361.9100, 1539566056)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1263, 6361.9100, 1539566057)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1264, 6360.0000, 1539566058)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1265, 6360.0000, 1539566059)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1266, 6360.0000, 1539566061)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1267, 6360.0000, 1539566062)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1268, 6360.0000, 1539566063)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1269, 6360.0000, 1539566064)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1270, 6360.0000, 1539566065)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1271, 6360.0000, 1539566067)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1272, 6360.0000, 1539566068)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1273, 6360.0000, 1539566069)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1274, 6360.0000, 1539566070)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1275, 6359.2800, 1539566071)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1276, 6359.2800, 1539566073)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1277, 6359.2800, 1539566074)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1278, 6359.2800, 1539566075)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1279, 6359.2800, 1539566076)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1280, 6359.1200, 1539566077)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1281, 6358.7400, 1539566079)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1282, 6358.6500, 1539566080)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1283, 6358.5800, 1539566081)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1284, 6358.5800, 1539566082)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1285, 6358.4800, 1539566083)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1286, 6358.3900, 1539566085)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1287, 6358.3900, 1539566086)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1288, 6358.3100, 1539566087)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1289, 6358.0200, 1539566088)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1290, 6357.7600, 1539566089)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1291, 6357.6100, 1539566091)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1292, 6357.6100, 1539566092)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1293, 6357.6100, 1539566093)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1294, 6357.6100, 1539566094)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1295, 6358.0000, 1539566095)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1296, 6358.6000, 1539566097)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1297, 6359.4700, 1539566098)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1298, 6359.0000, 1539566099)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1299, 6359.0000, 1539566100)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1300, 6359.0000, 1539566101)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1301, 6359.0000, 1539566103)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1302, 6359.0000, 1539566104)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1303, 6359.0100, 1539566105)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1304, 6359.0100, 1539566106)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1305, 6359.0100, 1539566107)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1306, 6359.0100, 1539566109)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1307, 6359.0100, 1539566110)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1308, 6361.1900, 1539566111)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1309, 6360.0000, 1539566112)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1310, 6360.0000, 1539566114)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1311, 6360.0000, 1539566115)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1312, 6360.0000, 1539566116)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1313, 6360.0000, 1539566117)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1314, 6360.0000, 1539566119)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1315, 6360.0000, 1539566120)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1316, 6360.0000, 1539566121)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1317, 6360.0000, 1539566122)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1318, 6360.0000, 1539566123)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1319, 6360.0000, 1539566125)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1320, 6360.0000, 1539566126)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1321, 6360.0000, 1539566127)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1322, 6360.0000, 1539566128)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1323, 6360.0000, 1539566129)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1324, 6360.0000, 1539566131)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1325, 6360.0000, 1539566132)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1326, 6360.0000, 1539566133)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1327, 6360.0000, 1539566134)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1328, 6360.0000, 1539566135)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1329, 6360.0000, 1539566137)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1330, 6360.0000, 1539566138)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1331, 6360.5000, 1539566139)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1332, 6360.5000, 1539566140)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1333, 6360.5000, 1539566141)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1334, 6362.0000, 1539566143)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1335, 6360.5600, 1539566144)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1336, 6360.5700, 1539566145)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1337, 6360.5600, 1539566146)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1338, 6360.5600, 1539566148)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1339, 6361.1900, 1539566149)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1340, 6361.1900, 1539566150)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1341, 6361.1900, 1539566151)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1342, 6361.2000, 1539566152)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1343, 6363.3900, 1539566154)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1344, 6361.2000, 1539566155)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1345, 6361.2000, 1539566156)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1346, 6361.2000, 1539566157)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1347, 6363.3700, 1539566158)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1348, 6361.2000, 1539566160)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1349, 6361.2000, 1539566161)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1350, 6361.1900, 1539566162)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1351, 6361.1900, 1539566163)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1352, 6361.1900, 1539566165)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1353, 6361.1900, 1539566166)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1354, 6361.1900, 1539566167)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1355, 6361.1900, 1539566168)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1356, 6361.1900, 1539566169)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1357, 6361.1900, 1539566171)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1358, 6360.5000, 1539566172)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1359, 6360.5000, 1539566173)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1360, 6360.5000, 1539566174)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1361, 6361.1900, 1539566176)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1362, 6361.1900, 1539566177)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1363, 6361.1900, 1539566178)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1364, 6361.1900, 1539566179)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1365, 6361.1900, 1539566180)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1366, 6360.5000, 1539566182)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1367, 6360.5000, 1539566183)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1368, 6360.5000, 1539566184)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1369, 6360.5000, 1539566185)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1370, 6360.5000, 1539566186)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1371, 6360.5000, 1539566188)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1372, 6360.5000, 1539566189)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1373, 6360.0000, 1539566190)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1374, 6360.0000, 1539566191)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1375, 6359.0000, 1539566192)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1376, 6359.0000, 1539566194)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1377, 6359.0000, 1539566195)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1378, 6357.6100, 1539566196)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1379, 6359.0000, 1539566197)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1380, 6357.6100, 1539566199)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1381, 6357.6100, 1539566200)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1382, 6357.6100, 1539566201)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1383, 6357.6100, 1539566202)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1384, 6357.6100, 1539566203)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1385, 6357.6100, 1539566205)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1386, 6357.6100, 1539566206)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1387, 6357.6100, 1539566207)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1388, 6357.6100, 1539566208)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1389, 6357.6100, 1539566209)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1390, 6357.6100, 1539566211)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1391, 6357.6100, 1539566212)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1392, 6358.0000, 1539566213)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1393, 6358.0000, 1539566214)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1394, 6358.0000, 1539566215)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1395, 6357.6100, 1539566217)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1396, 6358.0000, 1539566218)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1397, 6358.0000, 1539566219)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1398, 6358.0000, 1539566220)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1399, 6358.0000, 1539566222)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1400, 6356.6700, 1539566223)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1401, 6356.6700, 1539566224)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1402, 6356.9100, 1539566225)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1403, 6356.6700, 1539566226)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1404, 6356.9100, 1539566228)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1405, 6356.6700, 1539566229)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1406, 6356.6700, 1539566230)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1407, 6356.6700, 1539566231)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1408, 6356.6700, 1539566233)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1409, 6356.9100, 1539566234)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1410, 6356.9100, 1539566235)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1411, 6356.9100, 1539566236)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1412, 6356.6700, 1539566237)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1413, 6356.9100, 1539566239)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1414, 6356.9100, 1539566240)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1415, 6356.9100, 1539566241)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1416, 6356.6700, 1539566242)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1417, 6356.6700, 1539566243)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1418, 6356.9100, 1539566245)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1419, 6356.9100, 1539566246)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1420, 6356.6700, 1539566247)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1421, 6356.9100, 1539566248)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1422, 6356.6700, 1539566250)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1423, 6356.9100, 1539566251)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1424, 6356.6700, 1539566252)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1425, 6356.6700, 1539566253)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1426, 6356.6700, 1539566254)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1427, 6356.6700, 1539566256)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1428, 6356.6700, 1539566257)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1429, 6356.9000, 1539566258)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1430, 6356.9000, 1539566259)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1431, 6356.9000, 1539566260)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1432, 6356.9000, 1539566262)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1433, 6356.6800, 1539566263)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1434, 6356.6800, 1539566264)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1435, 6356.9100, 1539566265)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1436, 6356.9100, 1539566267)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1437, 6356.6800, 1539566269)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1438, 6356.6800, 1539566270)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1439, 6356.6800, 1539566271)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1440, 6356.6800, 1539566272)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1441, 6356.6800, 1539566274)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1442, 6356.6800, 1539566275)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1443, 6356.6800, 1539566276)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1444, 6356.6800, 1539566277)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1445, 6356.6800, 1539566279)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1446, 6356.6800, 1539566280)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1447, 6356.6800, 1539566281)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1448, 6356.6800, 1539566282)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1449, 6356.6800, 1539566284)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1450, 6356.6800, 1539566285)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1451, 6356.9100, 1539566286)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1452, 6356.9100, 1539566287)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1453, 6356.9100, 1539566288)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1454, 6356.9100, 1539566290)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1455, 6356.6800, 1539566291)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1456, 6356.9100, 1539566292)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1457, 6356.9100, 1539566293)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1458, 6356.9100, 1539566295)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1459, 6356.9100, 1539566296)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1460, 6356.9100, 1539566297)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1461, 6356.9100, 1539566298)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1462, 6357.6100, 1539566299)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1463, 6357.6100, 1539566301)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1464, 6356.6800, 1539566302)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1465, 6356.6800, 1539566303)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1466, 6356.6800, 1539566304)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1467, 6356.6800, 1539566306)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1468, 6356.6800, 1539566307)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1469, 6356.6800, 1539566308)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1470, 6356.6800, 1539566309)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1471, 6356.6800, 1539566310)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1472, 6356.6800, 1539566312)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1473, 6356.6800, 1539566313)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1474, 6356.6800, 1539566314)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1475, 6356.6800, 1539566315)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1476, 6356.6800, 1539566317)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1477, 6357.6100, 1539566318)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1478, 6357.6100, 1539566319)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1479, 6357.6100, 1539566320)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1480, 6357.6100, 1539566321)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1481, 6356.6800, 1539566323)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1482, 6356.6800, 1539566324)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1483, 6356.6800, 1539566325)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1484, 6356.6800, 1539566326)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1485, 6356.6800, 1539566327)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1486, 6356.6800, 1539566329)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1487, 6356.6800, 1539566330)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1488, 6356.6800, 1539566331)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1489, 6356.6800, 1539566332)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1490, 6356.6800, 1539566333)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1491, 6358.0000, 1539566335)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1492, 6358.0000, 1539566336)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1493, 6358.0000, 1539566337)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1494, 6356.6800, 1539566338)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1495, 6356.6800, 1539566340)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1496, 6356.6800, 1539566341)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1497, 6357.0000, 1539566342)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1498, 6357.0000, 1539566343)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1499, 6357.0000, 1539566344)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1500, 6356.6800, 1539566346)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1501, 6356.6700, 1539566347)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1502, 6356.6700, 1539566348)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1503, 6356.6700, 1539566349)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1504, 6360.0000, 1539566351)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1505, 6356.6800, 1539566352)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1506, 6356.6800, 1539566353)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1507, 6356.6700, 1539566354)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1508, 6356.6700, 1539566356)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1509, 6356.6700, 1539566357)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1510, 6356.6700, 1539566358)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1511, 6356.6700, 1539566359)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1512, 6356.6700, 1539566361)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1513, 6356.6700, 1539566362)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1514, 6356.6800, 1539566363)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1515, 6356.6800, 1539566364)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1516, 6356.6800, 1539566365)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1517, 6356.6800, 1539566367)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1518, 6356.6800, 1539566368)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1519, 6356.6800, 1539566369)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1520, 6356.6800, 1539566370)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1521, 6356.6800, 1539566372)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1522, 6356.6800, 1539566374)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1523, 6356.6800, 1539566375)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1524, 6356.6800, 1539566376)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1525, 6356.6800, 1539566377)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1526, 6356.6800, 1539566379)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1527, 6356.6900, 1539566380)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1528, 6356.6900, 1539566381)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1529, 6356.6900, 1539566382)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1530, 6356.6900, 1539566384)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1531, 6356.6800, 1539566385)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1532, 6356.6800, 1539566386)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1533, 6356.6800, 1539566387)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1534, 6356.6800, 1539566388)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1535, 6356.6800, 1539566390)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1536, 6356.6800, 1539566391)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1537, 6356.6800, 1539566392)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1538, 6356.6800, 1539566393)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1539, 6356.6800, 1539566395)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1540, 6356.6800, 1539566396)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1541, 6356.6800, 1539566397)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1542, 6356.6800, 1539566398)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1543, 6358.0900, 1539566399)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1544, 6358.0900, 1539566401)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1545, 6356.6800, 1539566402)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1546, 6358.0800, 1539566403)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1547, 6358.0800, 1539566404)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1548, 6358.0900, 1539566406)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1549, 6358.0900, 1539566407)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1550, 6358.0900, 1539566408)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1551, 6358.0900, 1539566409)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1552, 6358.0900, 1539566410)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1553, 6358.0900, 1539566412)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1554, 6358.0800, 1539566413)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1555, 6358.0800, 1539566414)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1556, 6358.0800, 1539566415)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1557, 6358.0800, 1539566417)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1558, 6358.0800, 1539566418)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1559, 6358.0800, 1539566419)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1560, 6358.0800, 1539566420)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1561, 6358.0800, 1539566421)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1562, 6358.0800, 1539566423)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1563, 6358.0800, 1539566424)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1564, 6358.0800, 1539566425)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1565, 6358.0800, 1539566426)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1566, 6358.0800, 1539566428)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1567, 6358.0800, 1539566429)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1568, 6358.0800, 1539566430)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1569, 6358.0800, 1539566431)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1570, 6358.0800, 1539566433)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1571, 6358.0800, 1539566434)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1572, 6358.0800, 1539566435)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1573, 6358.0800, 1539566436)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1574, 6358.0800, 1539566437)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1575, 6358.0800, 1539566439)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1576, 6358.0800, 1539566440)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1577, 6358.0800, 1539566441)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1578, 6356.6800, 1539566442)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1579, 6356.6800, 1539566444)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1580, 6356.6800, 1539566445)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1581, 6356.6800, 1539566446)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1582, 6356.6800, 1539566447)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1583, 6356.6800, 1539566449)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1584, 6359.0600, 1539566450)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1585, 6356.6800, 1539566451)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1586, 6356.6800, 1539566452)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1587, 6356.6700, 1539566454)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1588, 6356.6700, 1539566455)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1589, 6356.6800, 1539566456)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1590, 6356.6700, 1539566457)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1591, 6357.8100, 1539566459)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1592, 6357.8100, 1539566460)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1593, 6357.8100, 1539566462)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1594, 6356.6700, 1539566463)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1595, 6356.6700, 1539566464)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1596, 6356.6700, 1539566465)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1597, 6356.5900, 1539566466)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1598, 6356.5900, 1539566468)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1599, 6356.5900, 1539566469)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1600, 6356.3400, 1539566470)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1601, 6356.0000, 1539566471)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1602, 6356.5900, 1539566473)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1603, 6353.5500, 1539566474)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1604, 6353.5500, 1539566475)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1605, 6354.9800, 1539566476)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1606, 6354.9800, 1539566478)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1607, 6354.9800, 1539566479)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1608, 6354.9800, 1539566480)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1609, 6353.5000, 1539566481)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1610, 6353.4900, 1539566483)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1611, 6353.4900, 1539566484)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1612, 6353.4900, 1539566485)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1613, 6353.4900, 1539566486)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1614, 6353.4900, 1539566488)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1615, 6353.5000, 1539566489)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1616, 6353.4900, 1539566490)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1617, 6353.4900, 1539566491)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1618, 6353.4900, 1539566493)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1619, 6353.4900, 1539566494)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1620, 6353.4900, 1539566495)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1621, 6353.4900, 1539566496)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1622, 6353.4900, 1539566497)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1623, 6353.4900, 1539566499)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1624, 6353.4900, 1539566500)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1625, 6353.4900, 1539566501)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1626, 6353.1900, 1539566502)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1627, 6353.1900, 1539566504)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1628, 6353.1900, 1539566505)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1629, 6353.5000, 1539566506)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1630, 6353.1900, 1539566507)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1631, 6352.8100, 1539566509)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1632, 6352.8100, 1539566510)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1633, 6351.6400, 1539566511)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1634, 6351.9700, 1539566512)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1635, 6351.9800, 1539566514)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1636, 6351.9800, 1539566515)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1637, 6351.9800, 1539566516)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1638, 6351.9800, 1539566517)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1639, 6352.0000, 1539566519)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1640, 6354.9900, 1539566520)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1641, 6356.3500, 1539566521)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1642, 6351.7500, 1539566522)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1643, 6351.7500, 1539566523)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1644, 6355.8300, 1539566525)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1645, 6355.8300, 1539566526)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1646, 6353.1800, 1539566527)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1647, 6353.1800, 1539566528)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1648, 6353.1800, 1539566530)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1649, 6353.1800, 1539566531)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1650, 6351.8800, 1539566532)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1651, 6351.8800, 1539566533)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1652, 6351.8800, 1539566535)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1653, 6351.8800, 1539566536)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1654, 6351.8800, 1539566537)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1655, 6355.8200, 1539566538)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1656, 6352.8900, 1539566539)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1657, 6352.8900, 1539566541)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1658, 6352.8700, 1539566542)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1659, 6352.8900, 1539566543)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1660, 6352.8900, 1539566544)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1661, 6352.8900, 1539566546)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1662, 6352.9900, 1539566547)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1663, 6352.9900, 1539566548)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1664, 6352.8200, 1539566549)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1665, 6355.7900, 1539566551)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1666, 6355.7900, 1539566552)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1667, 6352.8500, 1539566553)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1668, 6352.8500, 1539566554)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1669, 6352.8500, 1539566555)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1670, 6352.8500, 1539566557)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1671, 6352.8500, 1539566558)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1672, 6352.8500, 1539566559)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1673, 6352.8500, 1539566560)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1674, 6352.8500, 1539566562)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1675, 6355.0000, 1539566563)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1676, 6355.0000, 1539566564)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1677, 6355.0000, 1539566565)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1678, 6355.0000, 1539566566)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1679, 6355.0000, 1539566569)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1680, 6355.0000, 1539566570)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1681, 6355.0000, 1539566571)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1682, 6355.0000, 1539566572)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1683, 6355.0000, 1539566574)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1684, 6355.7600, 1539566575)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1685, 6355.7600, 1539566576)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1686, 6355.7600, 1539566577)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1687, 6355.7600, 1539566579)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1688, 6355.7600, 1539566580)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1689, 6355.7600, 1539566581)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1690, 6355.7800, 1539566582)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1691, 6355.0000, 1539566583)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1692, 6355.0000, 1539566585)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1693, 6355.0000, 1539566586)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1694, 6355.0000, 1539566587)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1695, 6355.0000, 1539566588)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1696, 6355.0000, 1539566590)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1697, 6355.7700, 1539566591)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1698, 6355.7800, 1539566592)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1699, 6355.7800, 1539566593)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1700, 6355.7800, 1539566595)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1701, 6355.7800, 1539566596)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1702, 6355.7800, 1539566597)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1703, 6355.7800, 1539566598)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1704, 6355.7800, 1539566600)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1705, 6357.0000, 1539566601)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1706, 6355.1200, 1539566602)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1707, 6355.1300, 1539566603)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1708, 6358.0000, 1539566605)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1709, 6358.0000, 1539566606)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1710, 6358.0000, 1539566607)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1711, 6358.0000, 1539566608)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1712, 6355.1500, 1539566610)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1713, 6355.1500, 1539566611)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1714, 6355.1500, 1539566612)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1715, 6355.1500, 1539566613)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1716, 6352.8500, 1539566614)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1717, 6355.0000, 1539566616)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1718, 6355.0000, 1539566617)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1719, 6355.0000, 1539566618)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1720, 6355.0000, 1539566619)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1721, 6355.0000, 1539566621)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1722, 6355.0000, 1539566622)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1723, 6357.7100, 1539566623)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1724, 6355.0000, 1539566624)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1725, 6355.0000, 1539566626)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1726, 6357.6600, 1539566627)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1727, 6357.6600, 1539566628)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1728, 6357.6600, 1539566629)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1729, 6357.6600, 1539566631)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1730, 6355.0000, 1539566632)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1731, 6355.0000, 1539566633)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1732, 6355.0000, 1539566634)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1733, 6355.0000, 1539566636)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1734, 6355.0000, 1539566637)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1735, 6355.0000, 1539566638)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1736, 6355.0000, 1539566639)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1737, 6355.0000, 1539566640)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1738, 6355.0000, 1539566642)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1739, 6352.8500, 1539566643)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1740, 6357.2100, 1539566644)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1741, 6357.2100, 1539566645)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1742, 6357.2100, 1539566647)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1743, 6357.2100, 1539566648)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1744, 6357.2100, 1539566649)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1745, 6357.2100, 1539566650)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1746, 6352.8500, 1539566652)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1747, 6352.8500, 1539566653)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1748, 6352.8500, 1539566654)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1749, 6352.8500, 1539566655)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1750, 6352.8500, 1539566657)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1751, 6352.8500, 1539566658)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1752, 6352.8500, 1539566659)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1753, 6352.8600, 1539566660)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1754, 6352.8600, 1539566661)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1755, 6352.8600, 1539566663)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1756, 6352.8500, 1539566664)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1757, 6352.8500, 1539566665)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1758, 6352.8500, 1539566666)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1759, 6356.9500, 1539566668)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1760, 6352.8600, 1539566669)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1761, 6352.8600, 1539566670)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1762, 6352.8600, 1539566671)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1763, 6352.8600, 1539566673)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1764, 6352.8600, 1539566674)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1765, 6352.4500, 1539566675)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1766, 6352.4500, 1539566676)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1767, 6352.4500, 1539566678)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1768, 6352.4500, 1539566679)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1769, 6352.4500, 1539566680)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1770, 6352.4500, 1539566681)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1771, 6352.9000, 1539566683)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1772, 6352.9000, 1539566684)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1773, 6352.9000, 1539566685)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1774, 6352.9000, 1539566686)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1775, 6352.9000, 1539566688)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1776, 6352.9000, 1539566689)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1777, 6352.9100, 1539566690)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1778, 6352.9100, 1539566691)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1779, 6352.9000, 1539566693)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1780, 6352.4500, 1539566694)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1781, 6352.4500, 1539566695)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1782, 6352.4500, 1539566696)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1783, 6352.4500, 1539566698)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1784, 6352.4500, 1539566699)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1785, 6351.9800, 1539566700)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1786, 6351.9800, 1539566701)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1787, 6351.9800, 1539566703)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1788, 6351.9800, 1539566704)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1789, 6351.9800, 1539566705)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1790, 6351.9800, 1539566706)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1791, 6351.9800, 1539566707)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1792, 6351.9800, 1539566709)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1793, 6351.9800, 1539566710)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1794, 6351.9800, 1539566711)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1795, 6351.9800, 1539566713)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1796, 6351.9800, 1539566714)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1797, 6351.9800, 1539566715)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1798, 6351.6500, 1539566716)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1799, 6351.6500, 1539566718)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1800, 6350.5900, 1539566719)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1801, 6350.5900, 1539566720)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1802, 6350.5900, 1539566721)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1803, 6350.0000, 1539566722)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1804, 6350.0000, 1539566724)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1805, 6350.0100, 1539566725)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1806, 6350.0100, 1539566726)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1807, 6350.0100, 1539566727)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1808, 6350.0100, 1539566729)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1809, 6350.0100, 1539566730)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1810, 6350.0100, 1539566731)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1811, 6350.0100, 1539566732)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1812, 6350.0000, 1539566734)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1813, 6350.0000, 1539566735)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1814, 6350.0000, 1539566736)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1815, 6350.0000, 1539566737)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1816, 6350.0100, 1539566739)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1817, 6350.0100, 1539566740)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1818, 6350.0100, 1539566741)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1819, 6350.0100, 1539566742)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1820, 6350.0100, 1539566743)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1821, 6350.0200, 1539566745)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1822, 6350.0200, 1539566746)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1823, 6350.0200, 1539566747)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1824, 6350.0200, 1539566748)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1825, 6350.0200, 1539566750)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1826, 6350.0200, 1539566751)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1827, 6350.0100, 1539566752)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1828, 6350.0100, 1539566753)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1829, 6350.0100, 1539566755)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1830, 6350.0100, 1539566756)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1831, 6350.0100, 1539566757)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1832, 6350.0100, 1539566758)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1833, 6350.0100, 1539566760)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1834, 6350.0000, 1539566761)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1835, 6350.0000, 1539566762)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1836, 6350.0000, 1539566763)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1837, 6350.0000, 1539566765)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1838, 6350.0000, 1539566766)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1839, 6350.0000, 1539566767)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1840, 6350.4800, 1539566768)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1841, 6350.4800, 1539566769)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1842, 6350.4800, 1539566771)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1843, 6350.4800, 1539566772)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1844, 6350.4800, 1539566773)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1845, 6350.4800, 1539566774)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1846, 6350.4800, 1539566776)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1847, 6350.4800, 1539566777)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1848, 6351.8400, 1539566778)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1849, 6350.4900, 1539566779)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1850, 6350.4900, 1539566781)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1851, 6351.9800, 1539566782)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1852, 6351.8500, 1539566783)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1853, 6351.8500, 1539566784)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1854, 6351.8500, 1539566786)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1855, 6351.8500, 1539566787)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1856, 6351.8500, 1539566788)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1857, 6351.8500, 1539566789)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1858, 6351.8500, 1539566791)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1859, 6351.8500, 1539566792)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1860, 6351.8400, 1539566793)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1861, 6351.8400, 1539566794)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1862, 6351.8400, 1539566795)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1863, 6350.5000, 1539566797)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1864, 6350.5000, 1539566798)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1865, 6350.5000, 1539566799)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1866, 6350.5000, 1539566800)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1867, 6351.7000, 1539566802)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1868, 6351.8700, 1539566803)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1869, 6351.8700, 1539566804)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1870, 6352.7800, 1539566805)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1871, 6352.7800, 1539566807)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1872, 6352.7800, 1539566808)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1873, 6352.7800, 1539566809)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1874, 6352.7800, 1539566810)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1875, 6352.7800, 1539566812)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1876, 6352.7800, 1539566813)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1877, 6352.7800, 1539566814)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1878, 6352.7500, 1539566815)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1879, 6352.7500, 1539566817)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1880, 6352.7500, 1539566818)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1881, 6352.7500, 1539566819)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1882, 6352.7500, 1539566820)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1883, 6352.7500, 1539566822)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1884, 6351.8700, 1539566823)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1885, 6351.8700, 1539566824)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1886, 6351.8700, 1539566825)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1887, 6351.8700, 1539566827)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1888, 6351.8700, 1539566828)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1889, 6351.8800, 1539566829)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1890, 6351.8800, 1539566830)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1891, 6351.8800, 1539566832)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1892, 6351.8800, 1539566833)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1893, 6351.8800, 1539566834)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1894, 6351.8900, 1539566836)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1895, 6351.8900, 1539566837)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1896, 6351.9000, 1539566838)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1897, 6351.9000, 1539566839)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1898, 6351.9000, 1539566841)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1899, 6354.6800, 1539566842)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1900, 6351.8700, 1539566843)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1901, 6351.8700, 1539566844)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1902, 6351.8700, 1539566846)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1903, 6351.8700, 1539566848)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1904, 6351.8700, 1539566849)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1905, 6354.6300, 1539566850)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1906, 6351.8800, 1539566852)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1907, 6351.9000, 1539566853)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1908, 6351.9000, 1539566854)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1909, 6351.9000, 1539566855)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1910, 6351.9000, 1539566857)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1911, 6351.9100, 1539566858)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1912, 6351.9100, 1539566859)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1913, 6351.9100, 1539566860)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1914, 6354.8200, 1539566862)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1915, 6351.9300, 1539566863)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1916, 6355.0800, 1539566864)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1917, 6351.9800, 1539566865)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1918, 6351.9800, 1539566867)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1919, 6351.9800, 1539566868)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1920, 6353.5300, 1539566869)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1921, 6356.0600, 1539566870)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1922, 6353.5900, 1539566872)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1923, 6353.6600, 1539566873)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1924, 6353.6600, 1539566874)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1925, 6356.0600, 1539566875)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1926, 6356.0600, 1539566877)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1927, 6356.0600, 1539566878)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1928, 6356.0600, 1539566879)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1929, 6356.0600, 1539566880)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1930, 6355.0000, 1539566882)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1931, 6354.2100, 1539566883)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1932, 6355.9900, 1539566884)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1933, 6355.9900, 1539566885)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1934, 6355.9900, 1539566887)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1935, 6355.9900, 1539566888)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1936, 6355.9900, 1539566889)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1937, 6354.2400, 1539566890)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1938, 6354.2400, 1539566892)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1939, 6354.2400, 1539566893)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1940, 6355.9900, 1539566894)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1941, 6355.9900, 1539566895)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1942, 6355.9900, 1539566897)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1943, 6355.9900, 1539566898)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1944, 6355.9900, 1539566899)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1945, 6355.9900, 1539566901)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1946, 6355.9900, 1539566902)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1947, 6355.9900, 1539566903)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1948, 6355.9900, 1539566904)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1949, 6355.9900, 1539566906)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1950, 6355.9900, 1539566907)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1951, 6355.9900, 1539566909)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1952, 6356.0000, 1539566910)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1953, 6355.1200, 1539566912)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1954, 6355.1200, 1539566913)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1955, 6355.1200, 1539566914)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1956, 6355.1200, 1539566915)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1957, 6355.1200, 1539566917)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1958, 6355.1200, 1539566918)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1959, 6356.0000, 1539566919)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1960, 6356.0000, 1539566920)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1961, 6355.1200, 1539566922)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1962, 6355.1200, 1539566923)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1963, 6355.1200, 1539566924)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1964, 6355.1200, 1539566925)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1965, 6355.6700, 1539566927)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1966, 6355.1400, 1539566928)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1967, 6355.0000, 1539566929)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1968, 6355.0000, 1539566930)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1969, 6355.0000, 1539566932)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1970, 6355.0000, 1539566933)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1971, 6356.0000, 1539566934)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1972, 6356.0600, 1539566935)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1973, 6356.0600, 1539566937)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1974, 6356.0600, 1539566938)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1975, 6356.0600, 1539566939)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1976, 6356.0600, 1539566940)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1977, 6356.0600, 1539566942)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1978, 6356.0000, 1539566943)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1979, 6356.0000, 1539566944)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1980, 6356.0000, 1539566945)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1981, 6356.0300, 1539566947)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1982, 6356.0000, 1539566948)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1983, 6356.9400, 1539566949)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1984, 6356.9400, 1539566950)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1985, 6356.9400, 1539566952)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1986, 6356.9400, 1539566953)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1987, 6357.1800, 1539566954)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1988, 6356.9400, 1539566955)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1989, 6357.1800, 1539566957)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1990, 6357.1800, 1539566958)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1991, 6357.6100, 1539566959)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1992, 6356.9500, 1539566961)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1993, 6356.9500, 1539566962)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1994, 6356.9600, 1539566963)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1995, 6357.6000, 1539566964)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1996, 6357.6000, 1539566966)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1997, 6357.6100, 1539566967)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1998, 6356.9600, 1539566968)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (1999, 6356.9600, 1539566969)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2000, 6356.9600, 1539566971)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2001, 6357.6100, 1539566973)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2002, 6357.0000, 1539566974)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2003, 6356.9400, 1539566975)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2004, 6357.5900, 1539566977)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2005, 6355.0300, 1539566978)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2006, 6355.0300, 1539566979)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2007, 6355.0300, 1539566980)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2008, 6355.0300, 1539566982)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2009, 6355.0700, 1539566983)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2010, 6357.6100, 1539566984)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2011, 6357.6500, 1539566985)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2012, 6357.6500, 1539566987)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2013, 6357.6500, 1539566988)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2014, 6355.1300, 1539566989)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2015, 6358.3700, 1539566990)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2016, 6357.6600, 1539566992)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2017, 6357.6600, 1539566993)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2018, 6357.6600, 1539566994)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2019, 6358.3700, 1539566995)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2020, 6358.3700, 1539566997)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2021, 6358.3700, 1539566998)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2022, 6358.3700, 1539566999)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2023, 6357.6600, 1539567000)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2024, 6355.1800, 1539567002)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2025, 6355.2100, 1539567003)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2026, 6355.2200, 1539567004)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2027, 6358.3100, 1539567005)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2028, 6358.3100, 1539567007)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2029, 6358.3100, 1539567008)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2030, 6358.3200, 1539567009)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2031, 6358.3200, 1539567010)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2032, 6356.7100, 1539567012)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2033, 6356.7100, 1539567013)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2034, 6355.2300, 1539567014)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2035, 6355.2300, 1539567015)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2036, 6355.2300, 1539567017)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2037, 6355.6300, 1539567018)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2038, 6355.6300, 1539567019)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2039, 6356.9200, 1539567020)
GO
INSERT [dbo].[BTCPrice] ([Id], [Price], [Time]) VALUES (2040, 6357.9600, 1539567022)
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
SET IDENTITY_INSERT [dbo].[FAQ] ON 
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (1, N'Question #1 EN psum has been the industry''s stan rem Ipsum has bee dard asaa ass3er ', N'Answer #1 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (3, N'Question #1 JP', N'Answer #1 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (4, N'Question #2 EN', N'Answer #2 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (5, N'Question #2 JP', N'Answer #2 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (6, N'Question #3 EN', N'Answer #3 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (7, N'Question #3 JP', N'Answer #3 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (8, N'Question #4 EN', N'Answer #4 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (9, N'Question #4 JP', N'Answer #4 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (10, N'Question #5 EN', N'Answer #5 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (11, N'Question #5 JP', N'Answer #5 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (12, N'Question #6 EN', N'Answer #6 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (13, N'Question #6 JP', N'Answer #6 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (14, N'Question #7 EN', N'Answer #7 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (15, N'Question #7 JP', N'Answer #7 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (16, N'Question #8 EN', N'Answer #8 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (17, N'Question #8 JP', N'Answer #8 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (18, N'Question #9 EN', N'Answer #9 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (19, N'Question #9 JP', N'Answer #9 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (20, N'Question #10 EN', N'Answer #10 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (21, N'Question #10 JP', N'Answer #10 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (22, N'Question #11 EN', N'Answer #11 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (23, N'Question #11 JP', N'Answer #11 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (24, N'Question #12 EN', N'Answer #12 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (25, N'Question #12 JP', N'Answer #12 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (28, N'Question #13 EN', N'Answer #12 EN Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 1, 2)
GO
INSERT [dbo].[FAQ] ([Id], [Question], [Answer], [LangId], [GroupId]) VALUES (29, N'Question #13 JP', N'Answer #12 JP Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 2, 2)
GO
SET IDENTITY_INSERT [dbo].[FAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 
GO
INSERT [dbo].[Group] ([Id], [Name], [Filter]) VALUES (1, N'HOMEPAGE', N'SLIDER')
GO
INSERT [dbo].[Group] ([Id], [Name], [Filter]) VALUES (2, N'ALL', N'FAQ')
GO
SET IDENTITY_INSERT [dbo].[Group] OFF
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (233, 1, N'High', N'High')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (234, 1, N'Low', N'Low')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1616, 1, N'AboutCPO', N'About CPO')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1781, 1, N'MobileTopImage', N'Mobile slide image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1782, 1, N'DesktopTopImage', N'Desktop slide image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1783, 1, N'PrizeImage', N'Prize image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1784, 1, N'DesktopListingImageRequired', N'Please fill in listing image for desktop')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1785, 1, N'MobileListingImageRequired', N'Please fill in listing image for mobile')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1786, 1, N'DesktopTopImageRequired', N'Please fill in slide image for desktop')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1787, 1, N'MobileTopImageRequired', N'Please fill in slide image for mobile')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1801, 2, N'AboutCPO', N'CPOについて')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1832, 2, N'Bet', N'今すぐ購入')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1906, 2, N'Low', N'Low')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (1907, 2, N'Edit', N'編集')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2151, 2, N'High', N'High')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2182, 2, N'DesktopTopImage', N'デスクトップスライダーイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2183, 2, N'DesktopTopImageRequired', N'デスクトップのスライダーイメージをアップロードしてください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2184, 2, N'MobileListingImageRequired', N'モバイルのリスティングイメージを入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2185, 2, N'MobileTopImage', N'モバイルスライダーイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2186, 2, N'MobileTopImageRequired', N'モバイルスライダーイメージをアップロードしてください。')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2382, 1, N'AffliateUrl', N'Affiliate Generated URL')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2422, 1, N'BTCPricePredictionChartTitle', N'BTC/USDT')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2423, 2, N'BTCPricePredictionChartTitle', N'BTC/USDT')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2450, 1, N'AddANewLotteryCategory', N'Add new lottery category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2451, 2, N'AddANewLotteryCategory', N'新しい宝くじカテゴリを追加')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2452, 1, N'AffliateUrlComment', N'Lost CPL Amount of users who registered using this link will become affiliate sales')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2453, 2, N'AffliateUrlComment', N'このURLからユーザーが登録したユーザーのネットレベニュー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2454, 1, N'AllStandardAffiliate', N'All Standard Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2455, 2, N'AllStandardAffiliate', N'総アフィリエイト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2456, 1, N'AllTopAgencyAffiliate', N'All Top Agency Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2457, 2, N'AllTopAgencyAffiliate', N'総トップアフィリエイト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2458, 1, N'CommissionAmount', N'Commission amount')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2459, 2, N'CommissionAmount', N'報酬量')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2460, 1, N'ConfirmPayment', N'Do you want to pay commision ?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2461, 2, N'ConfirmPayment', N'報酬を支払いしますか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2462, 1, N'CreateNewCategory', N'Create new category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2463, 2, N'CreateNewCategory', N'新しいカテゴリを作成する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2464, 1, N'CurrencyPair', N'Currency Pair')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2465, 2, N'CurrencyPair', N'通貨ペア')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2466, 1, N'Deactivate', N'Deactivate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2467, 2, N'Deactivate', N'無効化する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2468, 1, N'Deactivated', N'Deactivated')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2469, 2, N'Deactivated', N'無効化された')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2470, 1, N'DeactivateLotteryGameConfirmation', N'Deactivate lottery game confirmation')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2471, 2, N'DeactivateLotteryGameConfirmation', N'宝くじゲームの無効を確認する')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2472, 1, N'DeactivateSuccessfully', N'Deactivate Successfully !')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2473, 2, N'DeactivateSuccessfully', N'無効化完了')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2474, 1, N'Desktop', N'Desktop')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2475, 2, N'Desktop', N'デスクトップ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2476, 1, N'Details', N'Details')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2477, 2, N'Details', N'詳細')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2478, 1, N'Device', N'Device')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2479, 2, N'Device', N'デバイス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2480, 1, N'DirectAffiliateSale', N'Direct Affiliate Sale')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2481, 2, N'DirectAffiliateSale', N'ダイレクトアフィリエイトセール')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2482, 1, N'DirectIntroducedUsers', N'Direct Introduced Users')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2483, 2, N'DirectIntroducedUsers', N'直売上')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2484, 1, N'DirectSale', N'Direct Sale')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2485, 2, N'DirectSale', N'直紹介者数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2486, 1, N'ExistingCategory', N'Existing category, please use another.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2487, 2, N'ExistingCategory', N'カテゴリは存在するので、別のカテゴリを使用してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2488, 1, N'IsAutoPaymentEnable', N'Is auto payment enable')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2489, 2, N'IsAutoPaymentEnable', N'自動支払いが有効ですか？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2490, 1, N'IsTier2TabVisible', N'Is tier2 tab visible')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2491, 2, N'IsTier2TabVisible', N'ティア2タブが表示される？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2492, 1, N'IsTier3TabVisible', N'Is tier3 tab visible')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2493, 2, N'IsTier3TabVisible', N'ティア3タブが表示される？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2494, 1, N'KindOfTier', N'Kind of tier')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2495, 2, N'KindOfTier', N'ティアのタイプ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2496, 1, N'ListOfTopAgencyAffiliate', N'List of top agency affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2497, 2, N'ListOfTopAgencyAffiliate', N'トップアフィリエイトエージェンシーの一覧')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2498, 1, N'LotteryCategory', N'Lottery Category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2499, 2, N'LotteryCategory', N'宝くじカテゴリ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2500, 1, N'LotteryCategoryNameRequired', N'Please fill in lottery category name')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2501, 2, N'LotteryCategoryNameRequired', N'カテゴリの名を入力してください。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2502, 1, N'LotteryCategoryRequired', N'Please select lottery category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2503, 2, N'LotteryCategoryRequired', N'宝くじのカテゴリを選択してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2504, 1, N'NoData', N'No Data Available')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2505, 2, N'NoData', N'利用可能なデータがありません')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2506, 1, N'NumberOfTicket', N'Number Of Ticket')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2507, 2, N'NumberOfTicket', N'チケット数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2508, 1, N'OverBettingTime', N'Betting time for this game is over')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2509, 2, N'OverBettingTime', N'このゲームの賭けの時間は終わった')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2510, 1, N'PageView', N'Page View')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2511, 2, N'PageView', N'ページビュー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2512, 1, N'PaidSuccessfully', N'Paid successfully !')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2513, 2, N'PaidSuccessfully', N'支払い完成した！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2514, 1, N'Pay', N'Pay')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2515, 2, N'Pay', N'支払い')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2516, 1, N'Payment', N'Payment')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2517, 2, N'Payment', N'お支払い')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2518, 1, N'PeriodInMonth', N'Period in month')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2519, 2, N'PeriodInMonth', N'月の期間')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2520, 1, N'PurchaseDateTime', N'Purchase date time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2521, 2, N'PurchaseDateTime', N'購入日時')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2522, 1, N'Revenue', N'Revenue')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2523, 2, N'Revenue', N'収入')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2524, 1, N'Sales', N'Sales')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2525, 2, N'Sales', N'販売')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2526, 1, N'StatisticChart', N'Statistic Chart')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2527, 2, N'StatisticChart', N'統計チャート')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2528, 1, N'Summary', N'Summary')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2529, 2, N'Summary', N'総合')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2530, 1, N'Tablet', N'Tablet')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2531, 2, N'Tablet', N'タブレット')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2532, 1, N'TimeRange', N'Time Range')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2533, 2, N'TimeRange', N'期間範囲')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2534, 1, N'TodayPlayers', N'Today Players')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2535, 2, N'TodayPlayers', N'今日のプレーヤー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2536, 1, N'TopAgency', N'Top Agency')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2537, 2, N'TopAgency', N'トップエージェンシー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2538, 1, N'TopAgencyAffiliate', N'Top Agency Affiliate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2539, 2, N'TopAgencyAffiliate', N'トップエージェンシーのアフィリエイト')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2540, 1, N'TopAgencyAffiliateTiers', N'Top agency affiliate tiers')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2541, 2, N'TopAgencyAffiliateTiers', N'トップエージェンシーのティア')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2542, 1, N'TotalAffiliateSale', N'Total Affiliate Sale')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2543, 2, N'TotalAffiliateSale', N'総売上')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2544, 1, N'TotalCPLLost', N'Total CPL lost')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2545, 2, N'TotalCPLLost', N'総損失CPL')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2546, 1, N'TotalDirectIntroducedUsers', N'Total Direct Introduced Users')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2547, 2, N'TotalDirectIntroducedUsers', N'総直紹介者')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2548, 1, N'TotalIntroducedUsers', N'Total Introduced Users')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2549, 2, N'TotalIntroducedUsers', N'総紹介者')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2550, 1, N'TotalPlayers', N'Total Players')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2551, 2, N'TotalPlayers', N'総プレーヤー')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2552, 1, N'TotalPurchasePrice', N'Total purchase price')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2553, 2, N'TotalPurchasePrice', N'購入総額')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2554, 1, N'TotalRevenue', N'Total Revenue')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2555, 2, N'TotalRevenue', N'総収入')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2556, 1, N'TotalSale', N'Total Sale')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2557, 2, N'TotalSale', N'総売上')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2558, 1, N'AddNewCategory', N'Add new category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2559, 2, N'AddNewCategory', N'新しいカテゴリを追加')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2560, 1, N'BeTheFirstPerson', N'Be the first')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2561, 2, N'BeTheFirstPerson', N'はじめての方はこちら')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2562, 1, N'BettingTime', N'Betting Time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2563, 2, N'BettingTime', N'ベットタイム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2564, 1, N'BTCDeposit', N'BTC Deposit')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2565, 2, N'BTCDeposit', N'BTC入金')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2566, 1, N'BTCDepositDetail', N'Just deposit BTC to the address provided by us! <br />   BTC is automatically converted to CPO.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2567, 2, N'BTCDepositDetail', N'指定のアドレスにBTCを送金するだけ！<br />  自動BTCがCPOに変換されます。')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2568, 1, N'Campaign', N'Campaign')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2569, 2, N'Campaign', N'キャンペーン')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2570, 1, N'CloseBettingTime', N'Close betting time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2571, 2, N'CloseBettingTime', N'賭け時間を閉じる')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2572, 1, N'DesktopImage', N'Desktop image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2573, 2, N'DesktopImage', N'デスクトップ画像')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2574, 1, N'DesktopImageRequired', N'Please fill in image for desktop!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2575, 2, N'DesktopImageRequired', N'デスクトップ用の画像を入力してください！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2576, 1, N'DividendRate', N'Dividend Rate')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2577, 2, N'DividendRate', N'配当率')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2578, 1, N'DividendRateRequired', N'Please fill in dividend rate!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2579, 2, N'DividendRateRequired', N'必要な配当率を記入してください!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2580, 1, N'Easy3Steps', N'3 Simple Steps')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2581, 2, N'Easy3Steps', N'簡単・楽々　３ステップ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2582, 1, N'EasyRegistration', N'Easy Registration')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2583, 2, N'EasyRegistration', N'楽々登録')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2584, 1, N'EasyRegistrationDetail', N'Personal identity is absolutely unnecessary! <br />  Easy registration with e-mail and password!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2585, 2, N'EasyRegistrationDetail', N'身分証登録一切不要！ <br />  メールアドレスとパスワード設定のみで簡単登録！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2586, 1, N'ForEnjoyingCryptOdds', N'To enjoy Crypto Odds')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2587, 2, N'ForEnjoyingCryptOdds', N'クリプトオッズを楽しむ為の')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2588, 1, N'Group', N'Group')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2589, 2, N'Group', N'グループ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2590, 1, N'HoldingTimeInterval', N'Holding Time Interval')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2591, 2, N'HoldingTimeInterval', N'ホールドタイム')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2592, 1, N'HoldingTimeIntervalRequired', N'Please fill in holding time interval!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2593, 2, N'HoldingTimeIntervalRequired', N'ホールドタイムを記入してください!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2594, 1, N'License', N'License')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2595, 2, N'License', N'ライセンス')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2596, 1, N'Message', N'Message')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2597, 2, N'Message', N'メッセージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2598, 1, N'MessageRequired', N'Please fill in message')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2599, 2, N'MessageRequired', N'メッセージを記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2600, 1, N'MobileImage', N'Mobile image')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2601, 2, N'MobileImage', N'モバイルイメージ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2602, 1, N'MobileImageRequired', N'Please fill in image for mobile!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2603, 2, N'MobileImageRequired', N'モバイル用の画像を入力してください！')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2604, 1, N'NameRequired', N'Please fill in name!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2605, 2, N'NameRequired', N'名前を記入してください!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2606, 1, N'NumberOfPrediction', N'Number Of Prediction')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2607, 2, N'NumberOfPrediction', N'予測数')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2608, 1, N'OpenBettingTime', N'Open betting time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2609, 2, N'OpenBettingTime', N'オープンベッティング時間')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2610, 1, N'PartnerCompanies', N'Partner games companies')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2611, 2, N'PartnerCompanies', N'協力ゲーム会社')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2612, 1, N'PersonalInformationProtection', N'Personal information protection')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2613, 2, N'PersonalInformationProtection', N'個人情報保護について')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2614, 1, N'PhoneNumber', N'Phone number')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2615, 2, N'PhoneNumber', N'電話番号')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2616, 1, N'PhoneNumberRequired', N'Please fill in phone number')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2617, 2, N'PhoneNumberRequired', N'電話番号を記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2618, 1, N'PlayGameDetail', N'Please choose your favorite game <br />Please enjoy the Crypto Odds as much as you want')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2619, 2, N'PlayGameDetail', N'お好みのゲームを選択してください <br />クリプトオッズをお楽しみ下さい')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2620, 1, N'PricePredictionCategory', N'Price Prediction Category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2621, 2, N'PricePredictionCategory', N'価格予測カテゴリ')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2622, 1, N'PricePredictionCategoryNameRequired', N'Please fill in price prediction category name')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2623, 2, N'PricePredictionCategoryNameRequired', N'価格予測カテゴリ名を記入してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2624, 1, N'PricePredictionCategoryRequired', N'Please select price prediction category')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2625, 2, N'PricePredictionCategoryRequired', N'価格予測カテゴリを選択してください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2626, 1, N'PricePredictionSetting', N'Price Prediction Setting')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2627, 2, N'PricePredictionSetting', N'価格予測設定')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2628, 1, N'RegisterFor30Seconds', N'30-seconds registration only')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2629, 2, N'RegisterFor30Seconds', N'３０秒登録')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2630, 1, N'ResultTimeInterval', N'Result Time Interval')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2631, 2, N'ResultTimeInterval', N'ラッフルの時間')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2632, 1, N'ResultTimeIntervalRequired', N'Please fill in result time interval!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2633, 2, N'ResultTimeIntervalRequired', N'結果の時間を記入してください!')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2634, 1, N'Url', N'Url')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2635, 2, N'Url', N'Url')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2636, 1, N'WhatIsBitcoin', N'What is Bitcoin?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2637, 2, N'WhatIsBitcoin', N'ビットコインとは')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2638, 1, N'WhatIsCryptoCasino', N'What is Crypto Casino?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2639, 2, N'WhatIsCryptoCasino', N'クリプトカジノとは?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2640, 1, N'WhatIsCryptoLottery', N'What is Crypto Lottery?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2641, 2, N'WhatIsCryptoLottery', N'仮想通貨宝クジとは？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2642, 1, N'WhatIsCryptoLotteryMainTitle', N'What is crypto lottery?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2643, 2, N'WhatIsCryptoLotteryMainTitle', N'仮想通貨宝クジとは？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2644, 1, N'WhatIsCryptoOdds', N'What is Crypto Odds')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2645, 2, N'WhatIsCryptoOdds', N'クリプトオッズとは')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2646, 1, N'WhatIsCryptoPricePrediction', N'What is Crypto Price Prediction?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2647, 2, N'WhatIsCryptoPricePrediction', N'仮想通貨の価格予測とは?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2648, 1, N'WhatIsCryptoPricePredictionMainTitle', N'What is crypto price prediction?')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2649, 2, N'WhatIsCryptoPricePredictionMainTitle', N'クリプトバイナリーは？')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2650, 1, N'CloseTimeMustBeGreaterThanOpenTime', N' Close betting time must be greater than open betting time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2651, 2, N'CloseTimeMustBeGreaterThanOpenTime', N'閉じる時間は、開く時間より大きく数字を入力')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2652, 1, N'Min', N'Min')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2653, 2, N'Min', N'分')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2654, 1, N'Hour', N'Hour')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2655, 2, N'Hour', N'時間')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2656, 1, N'ShortDescriptionMaxLengthLimit', N'Short description characters must be less than {0}')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2657, 2, N'ShortDescriptionMaxLengthLimit', N'説明文字は{0}未満でなければなりません')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2658, 1, N'WaitForNextGame', N'Please wait for next game')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2659, 2, N'WaitForNextGame', N'次の試合を待ってください')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2660, 1, N'CloseTimeMustBeGreaterThanOpenTime', N'Close betting time must be greater than open betting time')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2661, 2, N'CloseTimeMustBeGreaterThanOpenTime', N'閉じる賭けの時間は、開いている賭けの時間よりも大きくなければならない')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2662, 1, N'Min', N'Min')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2663, 2, N'Min', N'分')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2664, 1, N'Hour', N'Hour')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (2665, 2, N'Hour', N'時間')
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
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (25, 1, N'AffiliateProgramPolicy', N'<h1 class="mb-3"><strong>Crypto Odds Affiliate Program Terms</strong></h1>

                                            <p>Cryptoodds.com ("Crypto Odds") receives a game license from the Curacao Dutch curriculum and offers online game services.</p>
                                            <p>In order to use the Crypto Odds Affiliate Program, Affiliates are deemed to have agreed to all the terms stipulated in the contract by registering. Crypt odds reserves the right to change, caution, delete or extend the provision in any case without prior notice of the affiliate terms entered on the consent page. Based on these Terms, Affiliates are deemed to have agreed to abide by the following.</p>
                                            <ol>
                                                <li>Join the Affiliate Program</li>
                                                <li>Use of the Crypto Odds Affiliate Website and usage of the Crypto Odds Marketing Tool (see Definitions below)</li>
                                                <li>In order to receive affiliate fee from Crypto Odds, this Agreement and its amendments can not be revoked, and agree to be unmodifiable</li>
                                            </ol>
                                            <p>Therefore, affiliates are obligated to continue to comply with the terms of this agreement with the general terms of the Crypto Odds website, the policy of protection of personal information, carryforward rules and guidelines. The agreement between us and the affiliate will be effective on the date the affiliate application is approved.</p>
                                            <ol>
                                                <li>
                                                    <strong> Purpose</strong>
                                                    <ol>
                                                        <li>Affiliates will attract potential customers through the Internet by managing and operating the website ("Website"), or by any other route.</li>
                                                        <li>This Agreement governs the terms and conditions related to the affiliate ''s Crypto Odds campaign, and affiliates obtain the remuneration pursuant to this Agreement by directing visitors to the Crypto Odds.</li>
                                                        <li>The definition of net revenue income is defined in Article 19 of this Agreement. If you intend to introduce another product or another service in the future, Crypto Odds the right to define net revenue income for each product.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Affiliate approval</strong>
                                                    <ol>
                                                        <li>We reserve the right to refuse to register with affiliate program in its sole and absolute discretion.&nbsp;</li>
                                                    </ol>
                                                </li>
                                            </ol>
                                            <ol start="3">
                                                <li>
                                                    <strong> Eligibility condition</strong>
                                                    <ol>
                                                        <li>
                                                            Affiliates need to agree to guarantee about:
                                                            <ol>
                                                                <li>You have agreed to this agreement in the applicable jurisdictional area and have reached the legal age you can conclude</li>
                                                                <li>Be legally authorized and have legal capacity to enter into contracts with legally binding force</li>
                                                                <li>Actively act as owner of all rights, licenses and permits relating to sales, promotion, marketing activities of Crypto odds pursuant to the provisions of this Agreement</li>
                                                                <li>Compliance with all applicable regulations, laws and regulations relating to crypto odds campaign</li>
                                                                <li>To fully understand and to approve the terms and conditions of this Agreement</li>
                                                            </ol>
                                                        </li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Our responsibility and obligation</strong>
                                                    <ol>
                                                        <li>We will process the turnover generated via the tracking link, record the revenue and the total amount of remuneration generated via the link and provide remuneration statistics to the affiliate partner. In case</li>
                                                        <li>We will pay compensation to the affiliate based on this contract.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Responsibilities and obligations of affiliates</strong>
                                                    <ol>
                                                        <li>
                                                            Affiliates are required to:
                                                            <ol>
                                                                <li>In order to maximize the interests of both parties, we must adhere, actively and effectively advertise, sell, or obey our guidelines published actively and effectively, as broadly and effectively as possible.</li>
                                                                <li>At the expense of the affiliate, we will promote and introduce potential customers to Crypto Odds. Affiliates are solely responsible for dissemination of promotional activities, contents and methods. All affiliate promotional activities are professional and appropriate, legitimate in compliance with the terms and must comply with this agreement.</li>
                                                                <li>We guarantee to use only the tracking links provided within the affiliate program, otherwise we do not guarantee anything like registration or remuneration. In addition, you can not make any changes or modifications on links or promotional materials without prior written approval of the company.</li>
                                                                <li>You must be responsible for the development, operation and maintenance of the website, along with all the information displayed on the Affiliate website.</li>
                                                            </ol>
                                                        </li>
                                                        <li>
                                                            Affiliates must agree about the following
                                                            <ol>
                                                                <li>Do not do inappropriate acts such as slander slander, and do not publish things including obscene, pornographic, obscene or violent depiction.</li>
                                                                <li>Do not target minors who are not eligible for public gambling.</li>
                                                                <li>Do not work in jurisdictions where gambling and promotion activities are prohibited by law.</li>
                                                                <li>
                                                                    Do not create access to Crypt odds by illegal or fraudulent acts.
                                                                    <ol>
                                                                        <li>Send spam mail.</li>
                                                                        <li>In order to intentionally increase rewards or deceive our company, affiliates register as players, or make acquaintances, friends, employees or other third parties register from the Affiliate''s tracking link, and those accounts Directly or indirectly deposit money. We regard these as violations of this provision and fraud.</li>
                                                                    </ol>
                                                                </li>
                                                                <li>We will not display crypto odds and websites that appear to be at risk of being confused with our company and web sites that give the impression that the crypt odds or company misunderstood that it created some or all of the website about.</li>
                                                                <li>Without infringing on the rights of sales promotion materials that we have obtained from the web or infringing on the rights of sales promotion materials, affiliates shall notify the written agreement about the use of the company regarding the use of crypt odds or other terms, trademarks and other intellectual property rights attributable to the company Unless done, it can not be used.</li>
                                                            </ol>
                                                        </li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Payment</strong>
                                                    <ol>
                                                        <li>We will pay compensation to affiliates based on the net revenue generated by new customers introduced to our company through the Affiliate''s website and other routes. A new customer is a customer who does not have an account at us, accesses the website through the tracking link, properly registers and remits the bit coin of the amount corresponding to the minimum deposit amount to the account of the crypt odds. Remuneration is subject to VAT or other taxes.</li>
                                                        <li>Remuneration is calculated at the rate according to the remuneration provisions for each service. Calculation differs for each service and is calculated according to the rate of compensation for each service.</li>
                                                        <li>Remuneration is normally calculated at the end of each month and paid on the 10th of the following month (excluding weekends and public holidays).</li>
                                                        <li>Remuneration will be paid to the specified player account in bit coin. If there is any mistake in calculating remuneration, we have the right to revise the calculation at any time and pay the affiliate immediately or make a request for refund of excess payment.</li>
                                                        <li>With receipt of affiliate payment, it will be the complete and final invoice amount for the applicable period.</li>
                                                        <li>If there is any objection to the amount of the charge on which the affiliate has been notified, within 7 days) we will send an e-mail to our company and state the reason for the objection. If you do not send an e-mail within the above-mentioned period, you will be deemed impossible to submit an opposition request for the amount charged for the corresponding period, and it is considered confirmed.</li>
                                                        <li>The Company reserves the right to postpay payment to affiliates up to 90 days as a period to investigate and verify that affiliates are conducting related transactions in compliance with the provisions of these Terms.</li>
                                                        <li>If there is traffic that is illegal or violates these terms, we will not pay.</li>
                                                        <li>Affiliate agrees that there is an obligation to return for remuneration based on fraudulent transaction or counterfeit transaction and further agree that legal action against affiliates or all expenses on litigation against affiliates within the scope of law I shall bear it.</li>
                                                        <li>Both the casino and affiliate parties will lose the right to receive any payment from us if this agreement is terminated by either party. However, we will pay the payment that the payment obligation has occurred (the unpaid fee earned by the affiliate).</li>
                                                        <li>Only affiliate fee based on net revenue can be paid for affiliate fee, and even if different payment mechanism is applied, different compensation can not be used together. Affiliate''s obligations under this Agreement shall be applied to Affiliates pursuant to this Agreement until the termination of this Agreement.</li>
                                                        <li>Affiliates have all taxes, surcharges, charges, charges and any local or overseas (if applicable) taxing authorities, departments or other legal capacity incurred upon receiving compensation under this Agreement We are solely responsible for payment for payment imposed by the organization. We are not responsible for any payment made to the affiliate in any way, and affiliates are deemed to have agreed on this point.</li>
                                                    </ol>
                                                </li>
                                            </ol>
                                            <ol start="7">
                                                <li>
                                                    <strong> Termination of contract</strong>
                                                    <ol>
                                                        <li>This Agreement shall terminate through writing in writing by the Company or Affiliate to the other party at least 30 days in advance. Written notice also includes notice by e-mail.</li>
                                                        <li>
                                                            The parties agree on the following at the conclusion of this Agreement.
                                                            <ol>
                                                                <li>Affiliates need to remove all references to Crypto Odds and other promotional routes and communications from affiliate''s website, whether they are for commercial or non-commercial purposes.</li>
                                                                <li>All rights and licenses granted to the Affiliate under this Agreement shall be terminated immediately and all rights shall be returned to each Licensor and the Affiliate shall not be liable for all trademarks, service marks, logos and We will stop using other displays.</li>
                                                                <li>Affiliates reserve the right to receive payment only for unpaid remuneration earned by affiliate at the contract end date. However, we can withhold the final payment to the affiliate within the reasonable period necessary to confirm accurate amount payment. Affiliates shall not be entitled to receive remuneration or payment after the contract end date.</li>
                                                                <li>In the event that the Company terminates this Agreement due to breach of Affiliate''s Contract, the Company reserves the right to withhold the payment of unpaid remuneration earned by the affiliate earlier at the contract''s closing date as collateral for claims arising from such breach of the contract I have. If the company terminates the contract on the grounds that the affiliate has violated the terms of this agreement, the notice period is unnecessary and the contract shall be terminated immediately upon notice by the company to the affiliate.</li>
                                                                <li>Affiliate must return all confidential information of the company owned, stored and managed by the affiliate to the company</li>
                                                                <li>For all responsibilities and obligations of the affiliates of the company that occurred after the contract is concluded, affiliates shall waive the Company, but essential obligations shall survive. Just because the contract is over, the affiliate will not be exempt from the legal liability caused by breaching this Agreement before the termination of this Agreement, and for any breach of confidentiality obligation that occurred at any time after the termination of this Agreement We are not exempt from the legal liability. Affiliate''s confidentiality obligation to our company will survive the termination of this agreement</li>
                                                            </ol>
                                                        </li>
                                                        <li>We will reserve the right to terminate the contract automatically if affiliate''s account is suspended.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Certification</strong>
                                                    <ol>
                                                        <li>The affiliate person clearly confirms and agrees that the use of the Internet has a risk and that this affiliate program will be provided in the present state without any warranty or condition regardless of the implication. We do not guarantee the affiliate when accessing the website from any place at any time.</li>
                                                        <li>In no event shall the Company be liable to any affiliate or any third party for any loss, damage or damage caused by inaccuracy, mistake, omission, omission or any failure or delay or interruption of part or all of the Affiliate Program, , We are not responsible for the damage.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Compensation</strong>
                                                    <ol>
                                                        <li>Affiliate shall defend and indemnify the Company and its affiliates, successors, officers, employees, agents, directors, shareholders, attorneys and any claims or obligations, including attorneys and professional expenses related to: I agree not to give.</li>
                                                        <li>The Company reserves the right to defend himself in any case at its own expense.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Our rights</strong>
                                                    <ol>
                                                        <li>Crypto odds shall be able to refuse any player or close a player''s account if it deems it necessary to comply with company and crypto odds policy or to protect the company''s interests .</li>
                                                        <li>In order to comply with our policies or to protect our interests, we have the right to refuse any affiliate registrations or close affiliate accounts. In the event that an affiliate violates this Agreement or the company''s terms or other company rules, policies and guidelines, in addition to closing the affiliate''s account, we will take necessary legal action to protect the interests of the Company I can.&nbsp;</li>
                                                    </ol>
                                                </li>
                                            </ol>
                                            <ol start="11">
                                                <li>
                                                    <strong> Governing Law and Jurisdiction</strong>
                                                    <ol>
                                                        <li>This Agreement shall be construed in accordance with the laws of the Dutch Curacao and any litigation or dispute pertaining to this Agreement shall be carried out in the Dutch Curacao and because the Affiliate is the court jurisdiction of the Dutch Curacao You are deemed to have agreed to a certain thing.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Transfer</strong>
                                                    <ol>
                                                        <li>Affiliates can not transfer this Agreement by law or otherwise without prior written consent from us. Even if an affiliate acquires or acquires another crypt odds affiliate, it will coexist as an individual affiliate account.</li>
                                                        <li>The Company can transfer this Agreement at any time without prior consent of the Affiliate by the operation of the law or otherwise.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> No waiver</strong>
                                                    <ol>
                                                        <li>Even if we can not affiliate with this agreement by our affiliates, we are not deemed to have waived the right to enforce these terms at any time.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Force majeure</strong>
                                                    <ol>
                                                        <li>Neither party shall be held liable in the event of such failure in default of the obligation under this Agreement due to force majeure not exceeding the reasonable control of the party and not due to negligence of the relevant party. In the event of a force majeure occurrence, the nonperforming party is exempted from fulfilling the obligation to the extent that it becomes impossible to perform due to the occurrence of force majeure. However, if a case of force majeure persists for more than 30 days, neither party may terminate this Agreement without notice.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Relationship between the parties</strong>
                                                    <ol>
                                                        <li>No provision of this Agreement shall be deemed to be replaced by any party with respect to any action taken by either party in connection with this Agreement by any party (or any employee, agent or representative of such party) It is not interpreted as an agent and does not form a joint management relationship, a joint venture, a tie-up or a federation among the parties, but does (or obliges) to conclude a contract or pledge for the other party, It does not endorse the other party to explicit or implicit right, power, authority.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Confidentiality obligation</strong>
                                                    <ol>
                                                        <li>This includes, but is not limited to, the company''s business and finances, lists of customers and buyers, prices and sales information, products, records, operations, business plans, processes, product information, business know-how or logic, trade secrets, market opportunities and personal information All information is handled as confidentiality obligation. To disclose the above information to any person or third party, directly or indirectly, without the express written consent of the company or for the purpose of using for personal commercial or other purposes Prohibited.</li>
                                                        <li>Affiliates are obliged not to use confidential information for purposes other than to fulfill their obligations under this Agreement.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Change in this Agreement</strong>
                                                    <ol>
                                                        <li>The Company reserves the right to revise, change, delete or add the provisions of this Agreement at its sole discretion at any time without prior notice to the Affiliate pursuant to the provisions of this Agreement. Changes will be announced in Crypto Odds.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Trademark</strong>
                                                    <ol>
                                                        <li>No provision of this Agreement shall not grant any party any rights or interests in trademarks, trade names, service marks or other intellectual property rights (hereinafter simply "Mark") to the other party. During or after the terms of this Agreement, no party will attempt to register the mark of the other party or will not support or permit the registration attempt by the third party or the opposing party''s group company. Both parties also prohibit registering or registering marks that are basically similar to the marks owned by the counterparty party or the opposing party''s group company or that are similar at the level of confusion.</li>
                                                    </ol>
                                                </li>
                                                <li>
                                                    <strong> Affiliate fee</strong>
                                                    <ol>
                                                        <li>Affiliate fee will be paid based on net revenue. You can check the details of the reward on the affiliate page.</li>
                                                    </ol>
                                                </li>
                                            </ol>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (26, 2, N'AffiliateProgramPolicy', N'<h1 class="mb-3"><strong>クリプトオッズアフィリエイトプログラム規約</strong></h1>
                                            <p>Cryptoodds.com（以下「クリプトオッズ」）はオランダ領キュラソー政府のゲームライセンスを受け、オンラインゲームのサービスを提供しています。</p>
                                            <p>クリプトオッズアフィリエイトプログラムをご利用いただくには、アフィリエイターは登録することにより契約に規定されているすべての規約に同意したとみなされます。クリプトオッズは、同意ページで記入されたアフィリエイト規約を事前の通知なく、いかなる場合においても規定の変更、注意、削除、拡張をする権利を有します。本規約に基づきアフィリエイターは以下について順守することに同意したとみなされます。</p>
                                            <ol>
                                                <li>アフィリエイトプログラムへの参加</li>
                                                <li>クリプトオッズアフィリエイトウェブサイトの使用および、クリプトオッズマーケティングツールの使用法（定義下記参照）</li>
                                                <li>クリプトオッズからのアフィリエイト報酬を受領するために、本契約とその修正は取り消しができないもの、そして変更不可であることへの同意</li>
                                            </ol>
                                            <p>したがって、アフィリエイターは、クリプトオッズのウェブサイトの総規約と個人情報保護の方針や繰越規則およびガイドラインと共に継続的に本契約の条件について順守する義務があります。当社とアフィリエイター間の契約は、アフィリエイト申請書が承認された日付で有効となります。</p>
                                            <ol>
                                                <li><strong>目的</strong></li>
                                                <ol>
                                                    <li>アフィリエイターはインターネット上でウェブサイトを管理、運営し（以下「ウェブサイト」）、またはそのほかの経路を通じて潜在的顧客を呼び込みます。</li>
                                                    <li>本契約は、アフィリエイトのクリプトオッズのキャンペーンに関係する規約を管理するものであり、アフィリエイターはクリプトオッズに訪問者を誘導することで、本契約にしたがい定められた報酬を得ます。</li>
                                                    <li>ネットレベニューの収入の定義は、本規約第19条に定義されています。将来に別製品や別のサービスを導入する場合は、クリプトオッズは各製品に対するネットレベニュー収入を定義する権利を有します。</li>
                                                </ol>
                                                <li><strong>アフィリエイトの承認</strong></li>
                                                <ol>
                                                    <li>当社はその単独かつ絶対的な裁量でアフィリエイトプログラムへの登録を拒否する権利を有します。</li>
                                                </ol>
                                                <li><strong>資格条件</strong></li>
                                                <ol>
                                                    <li>アフィリエイターは以下について保証することに同意する必要があります。</li>
                                                    <ol>
                                                        <li>適用管轄区域において本規約に同意し、締結できる法的年齢に達していること</li>
                                                        <li>適法に承認されかつ法的拘束力を持つ契約を締結する法的能力を有していること</li>
                                                        <li>本契約の規定にしたがって積極的にクリプトオッズの売り込み、販売促進、マーケティング活動に関するすべての権利、ライセンス、許可の所有者として活動すること</li>
                                                        <li>クリプトオッズのキャンペーンに関係するすべての適用規則、法律および規則の順守</li>
                                                        <li>本契約の規約を完全に理解し承認すること</li>
                                                    </ol>
                                                </ol>
                                                <li><strong>当社の責任と義務</strong></li>
                                                <ol>
                                                    <li>当社は、 トラッキングリンクを経由して発生したターンオーバーを処理し、収益および当該リンクを経由して発生した報酬の総額を記録し、アフィリエイターに報酬統計を提供します。　</li>
                                                    <li>当社は、アフィリエイターに対して本契約を元に発生した報酬を支払います 。</li>
                                                </ol>
                                                <li><strong>アフィリエイターの責任と義務</strong></li>
                                                <ol>
                                                    <li>アフィリエイターは以下のことが要求されます。</li>
                                                    <ol>
                                                        <li>両当事者の利益を最大化するためにできる限り幅広く、活発かつ効果的にクリプトオッズを広告し、売り込み、またはオンラインで公表される当社のガイドラインに従わなければなりません。</li>
                                                        <li>アフィリエイトの費用負担にて、売り込みを行い、潜在的顧客をクリプトオッズに紹介します。販売促進活動の普及、コンテンツ、方法については、アフィリエイターが単独で責任を負います。アフィリエイトのすべての販売促進活動は、プロフェッショナルかつ適切で、規約を順守した合法的なものであり、本契約を順守しなければなりません。</li>
                                                        <li>アフィリエイトプログラムの範囲内で提供されたトラッキングリンクのみを使用することを保証し、そうでない場合は登録や報酬などいかなる保証もおこなわない。また、会社の事前の書面承認なしに、リンクまたは販売促進資料についていかなる変更または修正も行いけません。</li>
                                                        <li>アフィリエイトのウェブサイトに表示されているすべての情報と共に、ウェブサイトの開発、運営、維持に責任を持たなければなりません。</li>
                                                    </ol>
                                                    <li>アフィリエイターは以下について同意しなければなりません</li>
                                                    <ol>
                                                        <li>誹謗中傷等の不適切な行為を行わず、また卑猥、ポルノ、みだらまたは暴力的な描写を含むものを掲載しないこと。</li>
                                                        <li>公営ギャンブルができる対象年齢に達していない未成年者を対象にしないこと。</li>
                                                        <li>ギャンブルおよび販売促進活動が法律で禁じられている管轄地域において活動しないこと。</li>
                                                        <li>非合法的または詐欺的行為によって クリプトオッズへのアクセスを生み出さないこと。</li>
                                                        <ol>
                                                            <li>スパムメールの送付。</li>
                                                            <li>作為的に報酬を増やすため、もしくは当社を欺くために、アフィリエイターがプレイヤーとして登録すること、または知人、友人、従業員またはそのほかの第三者をアフィリエイターのトラッキングリンクから登録させ、それらのアカウントに直接的または間接的に入金すること。これらは本規定に違反および詐欺行為とみなします。</li>
                                                        </ol>
                                                        <li>クリプトオッズおよび当社と混同されるリスクあるようなウェブサイトの表示、およびクリプトオッズまたは会社がウェブサイトの一部または全部を作成したと誤解させるような印象を与えるウェブサイトの表示は行わないこと。</li>
                                                        <li>当社が送付およびウェブから入手した販売促進資料の権利を侵害することなく、アフィリエイターはクリプトオッズまたはそのほかの用語、商標およびそのほか会社に帰属する知的財産権について、会社が使用について書面同意を行わない限り、使用することはできない。</li>
                                                    </ol>
                                                </ol>
                                                <li><strong>支払い</strong></li>
                                                <ol>
                                                    <li>当社は、アフィリエイターのウェブサイトおよびそのほかの経路を通じて当社に紹介された新規顧客が生み出したネットレベニューに基づいて、アフィリエイターに報酬を支払います。新規顧客とは、当社にアカウントを持っておらず、トラッキングリンクを通じてウェブサイトにアクセスして適切に登録し、クリプトオッズのアカウントに最低入金額に相当する額のビットコインを送金した顧客です。報酬は付加価値税またはそのほかの税金の対象になります。</li>
                                                    <li>報酬は、サービスごとの報酬規定に従った割合で計算されます。計算は、サービスごとに異なり、サービスごとの報酬率に準じて計算されます。</li>
                                                    <li>報酬は通常、各月末締めで計算され翌月１０日（週末、祝日を除く）に支払われます。</li>
                                                    <li>報酬はビットコインにて、指定されたプレイヤーアカウントに支払われます。報酬計算に間違いがあった場合は、当社はいつでも計算を修正し、アフィリエイトに対して即座に不足分を支払うか、超過支払分の返還請求を行う権利を有します。</li>
                                                    <li>アフィリエイトの支払い受領をもって、該当期間に対する完全かつ最終的な請求額とします。</li>
                                                    <li>アフィリエイトが通知された差引請求額に対して異論がある場合は、 7日以内に)弊社に対して電子メールを送り、異論の理由を述べるものとします。上記期間内に電子メールを送信しなかった場合は、該当期間に対する請求額について以後異議申し出が不可能なこと、また確認済みとみなされます。</li>
                                                    <li>当社は、アフィリエイトが本規約の規定を順守した関連取引を行っているか調査および検証するための期間として、アフィリエイトへの支払いを90日まで延期する権利を有します。</li>
                                                    <li>非合法的または本規約に違反したトラフィックがあった場合は、支払いは行わないものとします。</li>
                                                    <li>アフィリエイトは、 詐欺的取引または偽造取引に基づいて得た報酬に対して、返還する義務があることに同意し、さらに法律の範囲内でアフィリエイトに対する法的措置または訴訟にかかった全経費を負担するものとします。</li>
                                                    <li>カジノとアフィリエイトの両当事者は、どちらかの当事者による本契約解除がされた場合、アフィリエイトは当社からいかなる支払いを受領する権利を失います。ただし、に支払い義務が発生した支払い（アフィリエイトが得た未払いの報酬）については当社が支払うものとします。</li>
                                                    <li>アフィリエイト報酬はネットレベニューを元にした報酬のみ可能で、仮に異なる報酬の仕組みが適用されても、異なる報酬を併用することはできません。本契約に基づくアフィリエイトの義務は、本契約が終了するまで本契約にしたがってアフィリエイトに対して適用されるものとします。</li>
                                                    <li>アフィリエイトは、本契約に基づいて報酬を受領する際に発生するすべての税金、課徴金、費用、料金およびあらゆる地方または海外（該当すれば）の課税当局、部門またはそのほか法的能力を有する団体によって課せられた支払金について単独で支払い責任を負うものとします。当社はいかなる 形においても、アフィリエイトに課せられた未払金に対して責任を負うことはなく、アフィリエイトはこの点について同意したとみなされます。</li>
                                                </ol>
                                                <li><strong>契約の終了</strong></li>
                                                <ol>
                                                    <li>本契約は、当社またはアフィリエイターが相手側当事者に対して30日前までに書面を通じて終了します。書面通知とは電子メールでの通知も含みます。</li>
                                                    <li>当事者は、本契約の終了に当たり以下について同意するものとします。</li>
                                                    <ol>
                                                        <li>アフィリエイターは、アフィリエイトのウェブサイトからクリプトオッズおよびそのほかの販促経路およびコミュニケーションへの参照について、それらのコミュニケーションが商業目的または非商業目的かどうかを問わず、すべて取り除く必要があります。</li>
                                                        <li>本契約に基づきアフィリエイトに許諾されたすべての権利とライセンスは即時終了し、すべての権利は各ライセンサーに返還されるものとし、アフィリエイターは当社に帰属するすべての商標、サービスマーク、ロゴおよびそのほかの表示の使用を中止します。</li>
                                                        <li>アフィリエイターは、契約終了日時点においてアフィリエイターが稼いだ未払いの報酬のみ支払いを受ける権利を有します。ただし当社は正確な金額支払いを確認するために必要な合理的期間内で、アフィリエイトへの最終支払いについて保留することができます。アフィリエイターは、契約終了日後に報酬を得るまたは支払いを受ける資格はないものとします。</li>
                                                        <li>アフィリエイトの契約違反を理由に会社が本契約を打ち切る場合は、当該契約違反から発生する申し立ての担保として、会社は契約終了日時点におけるアフィリエイトが稼いだ未払いの報酬の支払いを保留する権利を有します。アフィリエイトが本契約の条項に違反したことを理由に会社が契約を打ち切る場合は、通知期間は不要で、契約は会社がアフィリエイトに通知した時点で即座に打ち切られるものとします。</li>
                                                        <li>アフィリエイトは、アフィリエイトが所有、保管、管理する会社のすべての秘密情報を会社に返却しなければなりません</li>
                                                        <li>契約終了後に発生した会社のアフィリエイトに対するすべての責任と債務についてアフィリエイトは当社を免除するものとしますが、本質的な義務については存続するものとします。契約が終了したからといって、アフィリエイターは本契約の終了前に本契約に違反したことによって発生した法的責任は免除されず、また本契約終了後のいかなる時点に発生した秘密保持義務違反についての法的責任についても免除されません。アフィリエイトの当社に対する秘密保持義務は、本契約の終了後も存続します</li>
                                                    </ol>
                                                    <li>アフィリエイトのアカウントが休止となった場合は、当社が自動的に契約を打ち切る権利を有します。</li>
                                                </ol>
                                                <li><strong>証明</strong></li>
                                                <ol>
                                                    <li>アフィリエイターは、インターネットの使用にはリスクがあり、本アフィリエイトプログラムは明示暗示を問わずいかなる保証または条件の無い現状有姿の状態で提供されることについて明確に確認し同意します。アフィリエイトが、いかなる時にいかなる場所からウェブサイトにアクセスする際にも保証はいたしません。</li>
                                                    <li>会社は、いかなる場合もアフィリエイトまたはいかなる第三者に対して、ウェブサイトまたは本アフィリエイトプログラムの不正確性、誤り、不作為またはその一部または全部の故障、遅延または中断によって発生した損失、被害、損害の責任を負いません。</li>
                                                </ol>
                                                <li><strong>補償</strong></li>
                                                <ol>
                                                    <li>アフィリエイトは、当社およびその関係者、継承者、役員、従業員、代理人、重役、株主、弁護士を擁護、補償し、下記に関連した弁護士および専門家費用を含むあらゆる請求、債務について損害を与えないことに同意します。</li>
                                                    <li>当社はいかなる案件において、自らの費用負担にて自らを弁護する権利を有します。</li>
                                                </ol>
                                                <li><strong>当社の権利</strong></li>
                                                <ol>
                                                    <li>会社およびクリプトオッズの方針を順守するため、または会社の利益を保護するために必要と判断した場合は、クリプトオッズはいかなるプレイヤーを拒否するまたはプレイヤーのアカウントを閉鎖することができるものとします。</li>
                                                    <li>当社の方針を順守するため、または当社の利益を保護するために、当社はいかなるアフィリエイト登録を拒否する権利を有し、またはアフィリエイトのアカウントを閉鎖することができます。アフィリエイターが本契約または会社の規約または会社のそのほかの規則、方針およびガイドラインに違反した場合は、当社はアフィリエイトのアカウント閉鎖に加えて、会社の利益を保護するために必要な法的措置を取ることができます。</li>
                                                </ol>
                                                <li><strong>準拠法および裁判管轄</strong></li>
                                                <ol>
                                                    <li>本契約は、オランダ領キュラソーの法律に準拠し解釈されるものとし、本契約に係る訴訟または紛争は、オランダ領キュラソーにて実施されなければならず、アフィリエイトはオランダ領キュラソーの裁判所管轄のであることに同意したとみなされます。</li>
                                                </ol>
                                                <li><strong>譲渡</strong></li>
                                                <ol>
                                                    <li>アフィリエイトは、当社からの事前の書面同意なしに法律の運用またはそのほかによって本契約を譲渡することはできません。アフィリエイターがほかのクリプトオッズアフィリエイターを取得または獲得しても、個々のアフィリエイトアカウントとして共存します。</li>
                                                    <li>当社は、いかなる時もアフィリエイトの事前同意無しに法律の運用またはそのほかによって本契約を譲渡することができます。</li>
                                                </ol>
                                                <li><strong>権利不放棄</strong></li>
                                                <ol>
                                                    <li>当社がアフィリエイトに本契約を順守させることができなかったからといって、いかなる時点においても、当社が当該規約の執行にかかる権利を放棄したとはみなされません。</li>
                                                </ol>
                                                <li><strong>不可抗力</strong></li>
                                                <ol>
                                                    <li>いずれの当事者も、本契約上の義務の不履行についてかかる不履行が、当該当事者の合理的な支配の及ばない不可抗力による場合で当該当事者の過失によるものでない場合は、責任を負いません。不可抗力の出来事が発生した場合は、不履行当事者は不可抗力の発生によって履行不能になった程度において、義務の履行を免除されます。ただし、不可抗力の事案が30日を超えて存続する場合は、いずれの当事者も通知なしに本契約を終了することができます。</li>
                                                </ol>
                                                <li><strong>両当事者の関係</strong></li>
                                                <ol>
                                                    <li>本契約のいかなる規定も、本契約に関連していずれの当事者がとった行為について、いずれの当事者（または当該当事者の従業員、代理人または代表者）が、相手方当事者の従業員または法定代理人と解釈されるものではなく、両当事者間で共同経営関係、合弁事業、提携または企業連合を形成するものではなく、相手方当事者のために、契約締結または誓約を行う（または義務を課す）明示的または暗示的な権利、権力、権限を相手方当事者に授与するものではありません。</li>
                                                </ol>
                                                <li><strong>守秘義務</strong></li>
                                                <ol>
                                                    <li>会社の事業および財務、顧客およびバイヤーのリスト、価格および販売情報、製品、記録、運用、事業計画、プロセス、製品情報、事業ノウハウまたは論理、企業秘密、市場機会および個人情報を含むがこれに限らずすべての情報は守秘義務として取り扱うものとします。上記の情報について、個人的な商業またはそのほかの目的のために使用すること、または会社の明確な書面の事前同意なしに直接的間接的を問わずいかなる人または第三者に対して漏えいすることを禁止します。</li>
                                                    <li>アフィリエイトは、本契約に基づく義務を遂行する以外の目的で秘密情報を使用しないことを義務付けられています。</li>
                                                </ol>
                                                <li><strong>本契約の変更</strong></li>
                                                <ol>
                                                    <li>当社は、本契約に定められた規定にしたがって、いつでもその単独裁量にて、アフィリエイトへの事前通知なしに本契約の規定を改正、変更、削除、追加する権利を有します。変更についてはクリプトオッズで公表されます。</li>
                                                </ol>
                                                <li><strong>商標</strong></li>
                                                <ol>
                                                    <li>本契約のいずれの規定も、いかなる当事者が相手方当事者に商標、商品名、サービスマークまたはそのほかの知的財産権（以下簡潔に「マーク」）に関する権利や利益を認めるものではありません。本規約の期間中またはその後において、いかなる当事者も相手方当事者のマークを登録しようとするまたは第三者または相手方当事者のグループ会社による登録の試みを支援または許可しないものとします。また、両当事者とも相手方当事者または相手方当事者のグループ会社が所有するマークに基本的に類似したものまたは混同されるレベルで類似しているマークについて登録または登録を試みることを禁止します。</li>
                                                </ol>
                                                <li><strong>アフィリエイト報酬</strong></li>
                                                <ol>
                                                    <li>アフィリエイト報酬はネットレベニューに基づいて支払われます。報酬の詳細については、アフィリエイトページで確認できます。</li>
                                                </ol>
                                            </ol>
')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (27, 1, N'WhatIsCryptoLotteryHighestAwardContent', N'<p>                                                  You can purchase from 0.0001 BTC <br />                                                  We offer 100 BTC prize, <br />                                                  the highest ever winning record ever.                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (28, 2, N'WhatIsCryptoLotteryHighestAwardContent', N'<p>                                                  0.0001BTCから購入ができ <br />                                                  最高当選額は過去最高の１００ <br />                                                  BTCをご用意しております。                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (29, 1, N'WhatIsCryptoLotteryHighestAwardTitle', N'<p class="up">                                                  Highest prize                                              </p>                                              <p class="down">                                                  100BTC                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (30, 2, N'WhatIsCryptoLotteryHighestAwardTitle', N'<p class="up">                                                  最高当選                                              </p>                                              <p class="down">                                                  100BTC                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (31, 1, N'WhatIsCryptoLotteryLeadingClassContent', N'<p>                                                  Blockchain and smart contract technology will protect the system from corruption and hacking!                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (32, 2, N'WhatIsCryptoLotteryLeadingClassContent', N'<p>                                                  ブロックチェーンとスマートコントラクト技術で、不正とハッキングからシステムを守ります！                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (33, 1, N'WhatIsCryptoLotteryLeadingClassTitle', N'<p class="up">                                                  Industry-leading                                              </p>                                              <p class="down">                                                  Safety!                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (34, 2, N'WhatIsCryptoLotteryLeadingClassTitle', N'<p class="up">                                                  業界トップクラスの                                              </p>                                              <p class="down">                                                  安全性！                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (35, 1, N'WhatIsCryptoLotteryMainContent', N'<p>Cryptocurrency lottery game is a lottery platform that combines <span class="text-warning">blockchain </span>and <span class="text-warning">smart contract </span>technology.</p>                                      <p>It is possible to confirm the transaction history of all tickets by blockchain technology, easy to check the lottery with high transperancy</p>                                      <p class="text-muted font-size-13px">＊ Please do not worry because personal information such as customer''s name is not disclosed at all.</p>                                      <br />                                      <p>Also, because we use smartcontract so it is impossible for people to add or manage tickets, we will protect the system against fraud and external factors (such as hacking) and will provide fair and secure lottery games to users.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (36, 2, N'WhatIsCryptoLotteryMainContent', N'<p>仮想通貨宝クジとは、<span class="text-warning">ブロックチェーン</span>とスマートコ<span class="text-warning">ントラク</span>ト技術が活用された宝くじプラットホームです。</p>                                      <p>ブロックチェーン技術により全てのクジの履歴をトランザクションで確認する事が出来るようにし、透明性の高い宝くじを実現されております。</p>                                      <p class="text-muted font-size-13px">＊お客様の名前などの個人情報は一切公開されませんのでご安心ください。</p>                                      <br />                                      <p>また、スマートコントラクトにより、クジの発行や管理に一切人間の手が加える事ができないので、不正や外的要因（ハッキングなど）からシステムを守り、公正で安全な宝くじゲームをユーザーの皆様に提供いたしております。</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (37, 1, N'WhatIsCryptoLotteryMaximumRateContent', N'<p>                                                  There is NO labor cost so it is possible <br />                                                  Reduction rate No. 1 In Industry !                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (38, 2, N'WhatIsCryptoLotteryMaximumRateContent', N'<p>                                                  人件費がかからないからこそ出来る <br />                                                  業界NO.1の還元率！                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (39, 1, N'WhatIsCryptoLotteryMaximumRateTitle', N' <p class="up">                                                  Maximum reduction rate                                              </p>                                              <p class="down">                                                  80％                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (40, 2, N'WhatIsCryptoLotteryMaximumRateTitle', N' <p class="up">                                                  最大還元率                                              </p>                                              <p class="down">                                                  80％                                              </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (41, 1, N'WhatIsCryptoOdds', N'Crypt Odds is an online game website holding game online license issued by the government of Netherlands Curacao. <br />  Crypto Odds is an online casino that have anonymity in depositing and withdrawing by using cryptocurrency and fast deposit and withdrawal features. Please enjoy from one registration to get rich quick with smartphone. <br />  In this game, we use smart contract technology and random number generator (RNG) a system that randomly generates numbers, and we provide a safe and secure game with a system that eliminates fraud.')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (42, 2, N'WhatIsCryptoOdds', N'クリプトオッズはオランダ領キュラソー政府発行のオンラインゲーミングライセンスを保有するオンラインゲーミングサイトです。<br />  クリプトオッズは仮想通貨での入出金により匿名性を保ち、迅速な入出金が特徴のオンラインカジノです。スマホ一つで登録から一攫千金までお楽しみください。<br />  コンテンツにはスマートコントラクト技術やランダムナンバージェネレーター(RNG)と呼ばれる数字をランダムに生成するシステムを使用しており、不正を排除したシステムで安全・安心なゲーミングを提供しています。')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (43, 1, N'WhatIsCryptoPricePrediction15MinContent', N'Lottery <br /> Time')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (44, 2, N'WhatIsCryptoPricePrediction15MinContent', N'抽選 <br /> タイム')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (45, 1, N'WhatIsCryptoPricePrediction15MinExplain', N'※   Lottery Time   :')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (46, 2, N'WhatIsCryptoPricePrediction15MinExplain', N'※   抽選タイム   :')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (47, 1, N'WhatIsCryptoPricePrediction15MinExplainContent', N'<p>HIGH or LOW lottery will be held in 15 minutes between the starting price and ending price.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (48, 2, N'WhatIsCryptoPricePrediction15MinExplainContent', N'<p>指定された15分間の始まりの価格と終わりの価格で</p>                                              <p>HIGHかLOWの抽選が行われます。</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (49, 1, N'WhatIsCryptoPricePrediction15MinTitle', N'15 minutes')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (50, 2, N'WhatIsCryptoPricePrediction15MinTitle', N'15分')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (51, 1, N'WhatIsCryptoPricePrediction1HourContent', N'Hold time')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (52, 2, N'WhatIsCryptoPricePrediction1HourContent', N'ホールドタイム')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (53, 1, N'WhatIsCryptoPricePrediction1HourExplain', N'※   Hold time   :')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (54, 2, N'WhatIsCryptoPricePrediction1HourExplain', N'※   ホールドタイム   :')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (55, 1, N'WhatIsCryptoPricePrediction1HourExplainContent', N'<p>Total entries are summarized and the final decision is made.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (56, 2, N'WhatIsCryptoPricePrediction1HourExplainContent', N'<p>エントリーされた合計が集計され、倍率の最終決定がされます。</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (57, 1, N'WhatIsCryptoPricePrediction1HourTitle', N'1 hour')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (58, 2, N'WhatIsCryptoPricePrediction1HourTitle', N'１時間')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (59, 1, N'WhatIsCryptoPricePrediction24HourContent', N'Entry time')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (60, 2, N'WhatIsCryptoPricePrediction24HourContent', N'エントリータイム')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (61, 1, N'WhatIsCryptoPricePrediction24HourExplain', N'※  Entry time   :')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (62, 2, N'WhatIsCryptoPricePrediction24HourExplain', N'※  エントリータイム   :')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (63, 1, N'WhatIsCryptoPricePrediction24HourExplainContent', N'<p>It is time to choose High or Low.</p>                                              <p>We have a 24 hours of entry time.</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (64, 2, N'WhatIsCryptoPricePrediction24HourExplainContent', N'<p>HighかLowにエントリー出来る時間です。</p>                                              <p>24 時間のエントリータイムを設けております。</p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (65, 1, N'WhatIsCryptoPricePrediction24HourTitle', N'24 hours')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (66, 2, N'WhatIsCryptoPricePrediction24HourTitle', N'２４時間')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (67, 1, N'WhatIsCryptoPricePredictionMainContent', N'<p>                                          Crypto binary is a game that user can predict whether the BTC price  goes up or down.                                      </p>                                      <p>                                          One game is divided into entry time, hold time, lottery time.                                      </p>')
GO
INSERT [dbo].[LangMsgDetail] ([Id], [LangId], [Name], [Value]) VALUES (68, 2, N'WhatIsCryptoPricePredictionMainContent', N'<p>                                          クリプトバイナリーとは、BTCの価格が上がるか下がるかを当てるゲームです。                                      </p>                                      <p>                                          一回のゲームはエントリータイム・ホールドタイム・抽選タイムに分れています。                                      </p>')
GO
SET IDENTITY_INSERT [dbo].[LangMsgDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Lottery] ON 
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [Title], [UnitPrice], [UpdatedDate], [IsDeleted], [LotteryCategoryId]) VALUES (1, 1, CAST(N'2018-08-28T20:22:42.890' AS DateTime), 5000, 2, N'1BTC宝くじ', 500, NULL, 0, 1)
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [Title], [UnitPrice], [UpdatedDate], [IsDeleted], [LotteryCategoryId]) VALUES (2, 2, CAST(N'2018-08-28T20:26:40.453' AS DateTime), 5000, 2, N'2BTC宝くじ', 1000, NULL, 0, 1)
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [Title], [UnitPrice], [UpdatedDate], [IsDeleted], [LotteryCategoryId]) VALUES (3, 3, CAST(N'2018-08-28T20:31:25.240' AS DateTime), 5000, 2, N'0.5BTC宝くじ', 300, NULL, 0, 1)
GO
INSERT [dbo].[Lottery] ([Id], [Phase], [CreatedDate], [Volume], [Status], [Title], [UnitPrice], [UpdatedDate], [IsDeleted], [LotteryCategoryId]) VALUES (4, 4, CAST(N'2018-08-28T20:33:58.593' AS DateTime), 5000, 2, N'1BTC宝くじ', 300, NULL, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Lottery] OFF
GO
SET IDENTITY_INSERT [dbo].[LotteryCategory] ON 
GO
INSERT [dbo].[LotteryCategory] ([Id], [Name], [Description], [ViewId]) VALUES (1, N'Lottery 1', NULL, N'182104782')
GO
SET IDENTITY_INSERT [dbo].[LotteryCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[LotteryDetail] ON 
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (1, 1, 1, N'1_ds_20180828082242_desktop slider.jpg', N'1_dl_20180828082242_thumb-game_08.png', N'1_ml_20180828082242_thumb-game_17.png', N'1_ms_20180828082242_mobile banner.jpg', N'1_p_20180828082242_prize.jpg', N'<p>When the number of purchased lottery tickets reach the upper limit, we will make a lottery by Smart Contract.​</p>
<p>Lottery will be held at 0:00 am in Japan time and will be announced on the user''s management screen at 10 AM in the next morning.​</p>
<p>If the number of purchases does not reach the upper limit, it will be carried over to the next day until the upper ​limit is reached.</p>', N'0.0001 BTC<br/>
100 BTC highest prize!<br/>
An opportunity to be millionaire
')
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (2, 2, 1, N'2_ds_20180828082640_desktop slider.jpg', N'2_dl_20180828082640_thumb-game_08.png', N'2_ml_20180828082640_thumb-game_17.png', N'2_ms_20180828082640_mobile banner.jpg', N'2_p_20180828082640_prize.jpg', N'<p>When the number of purchased lottery tickets reach the upper limit, we will make a lottery by Smart Contract.​</p>
<p>Lottery will be held at 0:00 am in Japan time and will be announced on the user''s management screen at 10 AM in the next morning.​</p>
<p>If the number of purchases does not reach the upper limit, it will be carried over to the next day until the upper ​limit is reached.</p>', N'0.0001 BTC<br/>
100 BTC highest prize!<br/>
An opportunity to be millionaire
')
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (3, 3, 1, N'3_ds_20180828083125_desktop slider.jpg', N'3_dl_20180828083125_thumb-game_08.png', N'3_ml_20180828083125_thumb-game_17.png', N'3_ms_20180828083125_mobile banner.jpg', N'3_p_20180828083125_prize.jpg', N'<p>When the number of purchased lottery tickets reach the upper limit, we will make a lottery by Smart Contract.​</p>
<p>Lottery will be held at 0:00 am in Japan time and will be announced on the user''s management screen at 10 AM in the next morning.​</p>
<p>If the number of purchases does not reach the upper limit, it will be carried over to the next day until the upper ​limit is reached.</p>', N'0.0001 BTC<br/>
100 BTC highest prize!<br/>
An opportunity to be millionaire
')
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (4, 4, 1, N'4_ds_20180828083358_desktop slider.jpg', N'4_dl_20180828083358_thumb-game_08.png', N'4_ml_20180828083358_thumb-game_17.png', N'4_ms_20180828083358_mobile banner.jpg', N'4_p_20180828083358_prize.jpg', N'<p>When the number of purchased lottery tickets reach the upper limit, we will make a lottery by Smart Contract.​</p>
<p>Lottery will be held at 0:00 am in Japan time and will be announced on the user''s management screen at 10 AM in the next morning.​</p>
<p>If the number of purchases does not reach the upper limit, it will be carried over to the next day until the upper ​limit is reached.</p>', N'<p>0.0001 BTC<br />100 BTC highest prize!<br />An opportunity to be millionaire</p>')
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (5, 1, 2, N'1_ds_20180828082242_desktop slider.jpg', N'1_dl_20180828082242_thumb-game_08.png', N'1_ml_20180828082242_thumb-game_17.png', N'1_ms_20180828082242_mobile banner.jpg', N'1_p_20180828082242_prize.jpg', N'<p>仮想通貨くじの購入数が上限に達した段階で、スマートコントラクトによる抽選を行います。​</p>  <p>抽選時間は日本時間午前0時に行われ、翌朝10時にユーザー様の管理画面上で発表されます。​</p>  <p>（購入数が上限に達しない場合は、上限に達するまで翌日に持ち越されます。)</p>', N'0.0001BTC​<br/>
で遊べる宝くじ！​<br/>
最高当選１００BTC！​<br/>
億万長者のチャンス！​')
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (6, 2, 2, N'2_ds_20180828082640_desktop slider.jpg', N'2_dl_20180828082640_thumb-game_08.png', N'2_ml_20180828082640_thumb-game_17.png', N'2_ms_20180828082640_mobile banner.jpg', N'2_p_20180828082640_prize.jpg', N'<p>仮想通貨くじの購入数が上限に達した段階で、スマートコントラクトによる抽選を行います。​</p>  <p>抽選時間は日本時間午前0時に行われ、翌朝10時にユーザー様の管理画面上で発表されます。​</p>  <p>（購入数が上限に達しない場合は、上限に達するまで翌日に持ち越されます。)</p>', N'0.0001BTC​<br/>
で遊べる宝くじ！​<br/>
最高当選１００BTC！​<br/>
億万長者のチャンス！​')
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (7, 3, 2, N'3_ds_20180828083125_desktop slider.jpg', N'3_dl_20180828083125_thumb-game_08.png', N'3_ml_20180828083125_thumb-game_17.png', N'3_ms_20180828083125_mobile banner.jpg', N'3_p_20180828083125_prize.jpg', N'<p>仮想通貨くじの購入数が上限に達した段階で、スマートコントラクトによる抽選を行います。​</p>  <p>抽選時間は日本時間午前0時に行われ、翌朝10時にユーザー様の管理画面上で発表されます。​</p>  <p>（購入数が上限に達しない場合は、上限に達するまで翌日に持ち越されます。)</p>', N'0.0001BTC​<br/>
で遊べる宝くじ！​<br/>
最高当選１００BTC！​<br/>
億万長者のチャンス！​')
GO
INSERT [dbo].[LotteryDetail] ([Id], [LotteryId], [LangId], [DesktopTopImage], [DesktopListingImage], [MobileListingImage], [MobileTopImage], [PrizeImage], [Description], [ShortDescription]) VALUES (8, 4, 2, N'4_ds_20180828083358_desktop slider.jpg', N'4_dl_20180828083358_thumb-game_08.png', N'4_ml_20180828083358_thumb-game_17.png', N'4_ms_20180828083358_mobile banner.jpg', N'4_p_20180828083358_prize.jpg', N'<p>仮想通貨くじの購入数が上限に達した段階で、スマートコントラクトによる抽選を行います。​</p>
<p>抽選時間は日本時間午前0時に行われ、翌朝10時にユーザー様の管理画面上で発表されます。​</p>
<p>（購入数が上限に達しない場合は、上限に達するまで翌日に持ち越されます。)</p>', N'<p>0.0001BTC​<br />で遊べる宝くじ！​<br />最高当選１００BTC！​<br />億万長者のチャンス！​</p>')
GO
SET IDENTITY_INSERT [dbo].[LotteryDetail] OFF
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
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (65, 1, N'Common_ErrorOccurs', N'Error occurs')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (66, 2, N'Common_ErrorOccurs', N'エラー')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (67, 1, N'CustomModal_Loading_Title', N'Loading ...')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (68, 2, N'CustomModal_Loading_Title', N'ローディング中')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (69, 1, N'Header_Detail', N'Detail')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (70, 2, N'Header_Detail', N'詳細')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (71, 1, N'Header_Prize', N'Prize')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (72, 2, N'Header_Prize', N'賞')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (73, 1, N'LoginScreen_Inactivating_Account', N'In-activating account. Please check your email to activate.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (74, 2, N'LoginScreen_Inactivating_Account', N'アカウントをアクティブ化しています。 有効するにはメールを確認してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (75, 1, N'LoginScreen_Invalid_Email_Password', N'Invalid email or password. Please try again.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (76, 2, N'LoginScreen_Invalid_Email_Password', N'メールアドレスまたはパスワードは無効。 もう一度お試しください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (77, 1, N'LoginScreen_Invalid_PIN', N'Invalid PIN. Please try again.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (78, 2, N'LoginScreen_Invalid_PIN', N'PINが無効です。 もう一度お試しください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (79, 1, N'LotteryScreen_Ticket_Left', N'tickets left')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (80, 2, N'LotteryScreen_Ticket_Left', N'残りチケット')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (81, 1, N'LotteryScreen_Title', N'Lottery')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (82, 2, N'LotteryScreen_Title', N'宝くじ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (83, 1, N'LotteryScreen_Title_Game', N'Lottery Game')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (84, 2, N'LotteryScreen_Title_Game', N'宝くじゲーム')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (85, 1, N'MoreScreen_Button_Cancel', N'Cancel')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (86, 2, N'MoreScreen_Button_Cancel', N'キャンセル')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (87, 1, N'MoreScreen_Button_Ok', N'OK')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (88, 2, N'MoreScreen_Button_Ok', N'[OK]')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (89, 1, N'MoreScreen_Dialog_Title', N'Do you want to logout application?')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (90, 2, N'MoreScreen_Dialog_Title', N'ログアウトしますか？')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (91, 1, N'MoreScreen_Title', N'More')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (92, 2, N'MoreScreen_Title', N'もっと')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (93, 1, N'MoreScreen_Title_Contact', N'Contact')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (94, 2, N'MoreScreen_Title_Contact', N'連絡')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (95, 1, N'MoreScreen_Title_Deposit_Withdraw', N'Deposit / Withdraw')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (96, 2, N'MoreScreen_Title_Deposit_Withdraw', N'入金/出金')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (97, 1, N'MoreScreen_Title_Hitory', N'History')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (98, 2, N'MoreScreen_Title_Hitory', N'履歴')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (99, 1, N'MoreScreen_Title_Language', N'Language')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (100, 2, N'MoreScreen_Title_Language', N'言語')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (101, 1, N'MoreScreen_Title_Logout', N'Log out')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (102, 2, N'MoreScreen_Title_Logout', N'ログアウト')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (103, 1, N'MoreScreen_Title_User_Account', N'User account')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (104, 2, N'MoreScreen_Title_User_Account', N'ユーザーアカウント')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (105, 1, N'PredictionScreen_Title', N'Prediction')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (106, 2, N'PredictionScreen_Title', N'予測')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (107, 1, N'PurcharseScreen_Amount_Title', N'Total amount')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (108, 2, N'PurcharseScreen_Amount_Title', N'合計金額')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (109, 1, N'PurcharseScreen_Dialog_Confirm_Button', N'Confirm')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (110, 2, N'PurcharseScreen_Dialog_Confirm_Button', N'確認')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (111, 1, N'PurcharseScreen_Dialog_Confirm_Content1', N'All lottery and ticket information on CPL are kept on SmartContract to make it fair and transparent to all users.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (112, 2, N'PurcharseScreen_Dialog_Confirm_Content1', N'CPLに関する宝くじとチケットの情報は、ユーザーに公開して透明性を高めるためにSmartContractに保持されます。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (113, 1, N'PurcharseScreen_Dialog_Confirm_Content2', N'Transaction hash will be available for you to check by using Etherscan after clicking on confirm button.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (114, 2, N'PurcharseScreen_Dialog_Confirm_Content2', N'確認ボタンをクリックしてから、Etherscanで取引ハッシュを確認することができます。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (115, 1, N'PurcharseScreen_Dialog_Confirm_Ticket_Price_Title', N'Confirm your ticket')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (116, 2, N'PurcharseScreen_Dialog_Confirm_Ticket_Price_Title', N'チケットを確認する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (117, 1, N'PurcharseScreen_Dialog_Confirm_Title', N'Confirm your ticket')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (118, 2, N'PurcharseScreen_Dialog_Confirm_Title', N'チケットを確認する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (119, 1, N'PurcharseScreen_Dialog_Confirm_Total_Price_Title', N'Total price')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (120, 2, N'PurcharseScreen_Dialog_Confirm_Total_Price_Title', N'合計金額')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (121, 1, N'PurcharseScreen_Dialog_Confirm_Total_Ticket_Title', N'Total tickets')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (122, 2, N'PurcharseScreen_Dialog_Confirm_Total_Ticket_Title', N'総チケット数')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (123, 1, N'PurcharseScreen_Dialog_Thankyou_BackToTop_Button', N'Back to top')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (124, 2, N'PurcharseScreen_Dialog_Thankyou_BackToTop_Button', N'トップに戻る')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (125, 1, N'PurcharseScreen_Dialog_Thankyou_Content', N'Once transaction is successful, ticket number(s) will be available for you. You can check it in the Lottery history as below')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (126, 2, N'PurcharseScreen_Dialog_Thankyou_Content', N'取引が成功すると、チケット番号が利用可能になります。 下の宝くじ履歴で確認ができます.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (127, 1, N'PurcharseScreen_Dialog_Thankyou_Content_Title', N'Check transaction on Etherscan:')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (128, 2, N'PurcharseScreen_Dialog_Thankyou_Content_Title', N'Etherscanのトランザクションをチェックする：')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (129, 1, N'PurcharseScreen_Dialog_Thankyou_SubTitle', N'You bought')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (130, 2, N'PurcharseScreen_Dialog_Thankyou_SubTitle', N'購入完了')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (131, 1, N'PurcharseScreen_Dialog_Thankyou_Title', N'Thank you!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (132, 2, N'PurcharseScreen_Dialog_Thankyou_Title', N'ありがとうございました！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (133, 1, N'PurcharseScreen_Price_One_Title', N'Price per one ticket')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (134, 2, N'PurcharseScreen_Price_One_Title', N'チケット1枚あたりの価格')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (135, 1, N'PurcharseScreen_Purchase_Button', N'Purchase')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (136, 2, N'PurcharseScreen_Purchase_Button', N'購入')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (137, 1, N'PurcharseScreen_Purchased_Title', N'Purchased tickets')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (138, 2, N'PurcharseScreen_Purchased_Title', N'購入したチケット')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (139, 1, N'PurcharseScreen_Title', N'Purcharse')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (140, 2, N'PurcharseScreen_Title', N'購入者')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (141, 1, N'RegisterScreen_Input_Email_Exist', N'Existing email, please use another.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (142, 2, N'RegisterScreen_Input_Email_Exist', N'このEメールアドレスはすでに使用されています。別のEメールアドレスを使用してください。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (143, 1, N'SlotScreen_Title', N'Slot')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (144, 2, N'SlotScreen_Title', N'スロット')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (145, 1, N'Tabbar_Lottery_Title', N'Lottery')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (146, 2, N'Tabbar_Lottery_Title', N'宝くじ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (147, 1, N'Tabbar_More_Title', N'More')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (148, 2, N'Tabbar_More_Title', N'もっと')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (149, 1, N'Tabbar_Prediction_Title', N'Prediction')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (150, 2, N'Tabbar_Prediction_Title', N'予測')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (151, 1, N'Tabbar_Slot_Title', N'Slot')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (152, 2, N'Tabbar_Slot_Title', N'スロット')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (153, 1, N'ContactScreen_Button_Submit', N'Submit')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (154, 2, N'ContactScreen_Button_Submit', N'提出する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (155, 1, N'ContactScreen_Dialog_Deposit_Title', N'Deposit')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (156, 2, N'ContactScreen_Dialog_Deposit_Title', N'入金')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (157, 1, N'ContactScreen_Dialog_KYC_Title', N'KYC')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (158, 2, N'ContactScreen_Dialog_KYC_Title', N'KYC')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (159, 1, N'ContactScreen_Dialog_Lottery_Title', N'Lottery')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (160, 2, N'ContactScreen_Dialog_Lottery_Title', N'宝くじ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (161, 1, N'ContactScreen_Dialog_Other_Title', N'Other')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (162, 2, N'ContactScreen_Dialog_Other_Title', N'その他')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (163, 1, N'ContactScreen_Dialog_Success_Description', N'Thank you for contact my team, we will send feed back for you in early time!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (164, 2, N'ContactScreen_Dialog_Success_Description', N'連絡していただきありがとうございます、早い時期にフィードバックをお送りいたします！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (165, 1, N'ContactScreen_Dialog_Withdraw_Title', N'Withdraw')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (166, 2, N'ContactScreen_Dialog_Withdraw_Title', N'出金')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (167, 1, N'ContactScreen_Email_Sent_Successfully', N'Email is sent successfully')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (168, 2, N'ContactScreen_Email_Sent_Successfully', N'イメールが正常に送信されました')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (169, 1, N'ContactScreen_Form_Title', N'Ask us anything')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (170, 2, N'ContactScreen_Form_Title', N'質問ありますか？')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (171, 1, N'ContactScreen_Input_Category_Placeholder', N'Category')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (172, 2, N'ContactScreen_Input_Category_Placeholder', N'カテゴリー')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (173, 1, N'ContactScreen_Input_Description_PlaceHolder', N'Description')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (174, 2, N'ContactScreen_Input_Description_PlaceHolder', N'内容')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (175, 1, N'ContactScreen_Input_Email_PlaceHolder', N'Email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (176, 2, N'ContactScreen_Input_Email_PlaceHolder', N'イメール')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (177, 1, N'ContactScreen_Input_Subject_PlaceHolder', N'Subject')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (178, 2, N'ContactScreen_Input_Subject_PlaceHolder', N'件名')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (179, 1, N'ContactScreen_Title', N'Contact')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (180, 2, N'ContactScreen_Title', N'連絡先')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (181, 1, N'ContactScreen_Validate_Description', N'Please input description')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (182, 2, N'ContactScreen_Validate_Description', N'内容を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (183, 1, N'ContactScreen_Validate_Email', N'Please input e-mail address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (184, 2, N'ContactScreen_Validate_Email', N'メールアドレスを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (185, 1, N'ContactScreen_Validate_Subject', N'Please input subject')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (186, 2, N'ContactScreen_Validate_Subject', N'件名を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (187, 1, N'DepositAndWithdrawScreen_Insufficient_Funds', N'Insufficient funds')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (188, 2, N'DepositAndWithdrawScreen_Insufficient_Funds', N'残高不足')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (189, 1, N'DepositAndWithdrawScreen_Invalid_BTCAddress', N'Invalid BTC address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (190, 2, N'DepositAndWithdrawScreen_Invalid_BTCAddress', N'無効なBTCアドレス')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (191, 1, N'DepositAndWithdrawScreen_Invalid_Withdraw_Amount', N'Invalid withdraw amount')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (192, 2, N'DepositAndWithdrawScreen_Invalid_Withdraw_Amount', N'無効の引き出し金額')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (193, 1, N'DepositAndWithdrawScreen_Withdrawed_Successfully', N'Withdrawed successfully')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (194, 2, N'DepositAndWithdrawScreen_Withdrawed_Successfully', N'撤収に成功しました')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (195, 1, N'DepositWithdrawScreen_Button_Deposit', N'Deposit')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (196, 2, N'DepositWithdrawScreen_Button_Deposit', N'入金')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (197, 1, N'DepositWithdrawScreen_Button_Withdraw', N'Withdraw')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (198, 2, N'DepositWithdrawScreen_Button_Withdraw', N'出金')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (199, 1, N'DepositWithdrawScreen_Title', N'Deposit/ Withdraw')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (200, 2, N'DepositWithdrawScreen_Title', N'入金/出金')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (201, 1, N'DialogFinger_Button_Cancel', N'Cancel')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (202, 2, N'DialogFinger_Button_Cancel', N'キャンセル')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (203, 1, N'DialogFinger_Content_Body', N'Unlock “Crypto Odds” with your fingerprint')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (204, 2, N'DialogFinger_Content_Body', N'指紋で「Crypto Odds」のロックを解除する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (205, 1, N'DialogFinger_Content_Head', N'Touch ID for “Crypto Odds”')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (206, 2, N'DialogFinger_Content_Head', N'「Crypto Odds」のタッチID')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (207, 1, N'DialogFinger_Description_Authenticate', N'Scan your fingerprint on the device scanner to continue')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (208, 2, N'DialogFinger_Description_Authenticate', N'デバイススキャナで指紋をスキャンして続行する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (209, 1, N'EditEmailScreen_Button_Save', N'Save')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (210, 2, N'EditEmailScreen_Button_Save', N'保存')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (211, 1, N'EditEmailScreen_Dialog_Success', N'Edit email successfully!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (212, 2, N'EditEmailScreen_Dialog_Success', N'イメールを正常に編集した！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (213, 1, N'EditEmailScreen_Email_Updated_Successfully', N'Email updated successfully!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (214, 2, N'EditEmailScreen_Email_Updated_Successfully', N'イメールを正常に更新した！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (215, 1, N'EditEmailScreen_Existing_Email', N'Email existing in system')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (216, 2, N'EditEmailScreen_Existing_Email', N'システムに存在するイメール')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (217, 1, N'EditEmailScreen_Input_Confirm_Email_Placeholder', N'Confirm new email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (218, 2, N'EditEmailScreen_Input_Confirm_Email_Placeholder', N'新しいイメールを確認する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (219, 1, N'EditEmailScreen_Input_Confirm_Password_Placeholder', N'Confirm password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (220, 2, N'EditEmailScreen_Input_Confirm_Password_Placeholder', N'パスワードを認証する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (221, 1, N'EditEmailScreen_Input_New_Email_Placeholder', N'New email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (222, 2, N'EditEmailScreen_Input_New_Email_Placeholder', N'新しいイメール')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (223, 1, N'EditEmailScreen_Row_Current_Email_Title', N'Current email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (224, 2, N'EditEmailScreen_Row_Current_Email_Title', N'現在のイメール')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (225, 1, N'EditEmailScreen_Title', N'Edit Email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (226, 2, N'EditEmailScreen_Title', N'メールの編集')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (227, 1, N'EditEmailScreen_Validate_Email', N'Please input email address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (228, 2, N'EditEmailScreen_Validate_Email', N'イメールを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (229, 1, N'EditEmailScreen_Validate_Password', N'Please input confirm password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (230, 2, N'EditEmailScreen_Validate_Password', N'パスワードを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (231, 1, N'EditEmailScreen_Validate_Password_Not_Match', N'Password current not match')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (232, 2, N'EditEmailScreen_Validate_Password_Not_Match', N'現在のパスワードと一致しない')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (233, 1, N'EditPasswordScreen_Button_Save', N'Save')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (234, 2, N'EditPasswordScreen_Button_Save', N'保存')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (235, 1, N'EditPasswordScreen_Dialog_Error', N'Edit password fail!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (236, 2, N'EditPasswordScreen_Dialog_Error', N'パスワードの編集に失敗する！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (237, 1, N'EditPasswordScreen_Dialog_Success', N'Edit password successfully!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (238, 2, N'EditPasswordScreen_Dialog_Success', N'パスワードを正常に編集する！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (239, 1, N'EditPasswordScreen_Input_Confirm_Placeholder', N'Confirm password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (240, 2, N'EditPasswordScreen_Input_Confirm_Placeholder', N'パスワードを認証する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (241, 1, N'EditPasswordScreen_Input_Current_Placeholder', N'Current password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (242, 2, N'EditPasswordScreen_Input_Current_Placeholder', N'現在のパスワード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (243, 1, N'EditPasswordScreen_Input_New_Password_Placeholder', N'New password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (244, 2, N'EditPasswordScreen_Input_New_Password_Placeholder', N'新しいパスワード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (245, 1, N'EditPasswordScreen_Invalid_Current_Password', N'Invalid current password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (246, 2, N'EditPasswordScreen_Invalid_Current_Password', N'無効のパスワード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (247, 1, N'EditPasswordScreen_NonExisting_Account', N'Account is not existing')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (248, 2, N'EditPasswordScreen_NonExisting_Account', N'アカウントは存在しません')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (249, 1, N'EditPasswordScreen_Password_Updated_Successfully', N'Password is updated successfully')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (250, 2, N'EditPasswordScreen_Password_Updated_Successfully', N'パスワードを正常に更新する！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (251, 1, N'EditPasswordScreen_Title', N'Edit Password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (252, 2, N'EditPasswordScreen_Title', N'パスワードの編集')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (253, 1, N'EditPasswordScreen_Validate_Confirm_Not_Match', N'Password not match')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (254, 2, N'EditPasswordScreen_Validate_Confirm_Not_Match', N'パスワードが一致しません')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (255, 1, N'EditPasswordScreen_Validate_Confirm_Password', N'Please input confirm password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (256, 2, N'EditPasswordScreen_Validate_Confirm_Password', N'パスワードを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (257, 1, N'EditPasswordScreen_Validate_Current_Not_Match', N'Password current not match')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (258, 2, N'EditPasswordScreen_Validate_Current_Not_Match', N'現在のパスワードと一致しない')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (259, 1, N'EditPasswordScreen_Validate_Current_Password', N'Please input current password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (260, 2, N'EditPasswordScreen_Validate_Current_Password', N'現在のパスワードを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (261, 1, N'EditPasswordScreen_Validate_New_Password', N'Please input new password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (262, 2, N'EditPasswordScreen_Validate_New_Password', N'新しいパスワードを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (263, 1, N'EditProfileScreen_Birthday_Title', N'Date of birth')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (264, 2, N'EditProfileScreen_Birthday_Title', N'生年月日')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (265, 1, N'EditProfileScreen_Button_Close', N'Close')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (266, 2, N'EditProfileScreen_Button_Close', N'閉じる')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (267, 1, N'EditProfileScreen_Button_Save', N'Save')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (268, 2, N'EditProfileScreen_Button_Save', N'保存')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (269, 1, N'EditProfileScreen_Country_Title', N'Country')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (270, 2, N'EditProfileScreen_Country_Title', N'国')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (271, 1, N'EditProfileScreen_Dialog_Error', N'Edit profile fail!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (272, 2, N'EditProfileScreen_Dialog_Error', N'プロフィールを編集できません！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (273, 1, N'EditProfileScreen_Dialog_Success', N'Edit profile successfully!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (274, 2, N'EditProfileScreen_Dialog_Success', N'プロフィールを正常に編集する！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (275, 1, N'EditProfileScreen_Input_Address_Placeholder', N'Street address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (276, 2, N'EditProfileScreen_Input_Address_Placeholder', N'住所')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (277, 1, N'EditProfileScreen_Input_City_Placeholder', N'City')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (278, 2, N'EditProfileScreen_Input_City_Placeholder', N'都市')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (279, 1, N'EditProfileScreen_Input_First_Name_Placeholder', N'First name')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (280, 2, N'EditProfileScreen_Input_First_Name_Placeholder', N'	名')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (281, 1, N'EditProfileScreen_Input_Last_Name_Placeholder', N'Last name')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (282, 2, N'EditProfileScreen_Input_Last_Name_Placeholder', N'姓')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (283, 1, N'EditProfileScreen_Input_Number_Phone_Placeholder', N'Phone number')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (284, 2, N'EditProfileScreen_Input_Number_Phone_Placeholder', N'電話番号')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (285, 1, N'EditProfileScreen_Input_Postal_Code_Placeholder', N'Postal code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (286, 2, N'EditProfileScreen_Input_Postal_Code_Placeholder', N'郵便番号')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (287, 1, N'EditProfileScreen_Title', N'Edit Profile')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (288, 2, N'EditProfileScreen_Title', N'プロファイル編集')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (289, 1, N'EditProfileScreen_Validate_Address', N'Please input street address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (290, 2, N'EditProfileScreen_Validate_Address', N'住所を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (291, 1, N'EditProfileScreen_Validate_Birthday', N'Please choose date of birth')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (292, 2, N'EditProfileScreen_Validate_Birthday', N'生年月日を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (293, 1, N'EditProfileScreen_Validate_City', N'Please input city')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (294, 2, N'EditProfileScreen_Validate_City', N'都市を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (295, 1, N'EditProfileScreen_Validate_Country', N'Please choose country')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (296, 2, N'EditProfileScreen_Validate_Country', N'国を選択してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (297, 1, N'EditProfileScreen_Validate_First_Name', N'Please input first name')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (298, 2, N'EditProfileScreen_Validate_First_Name', N'名前を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (299, 1, N'EditProfileScreen_Validate_Last_Name', N'Please input last name')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (300, 2, N'EditProfileScreen_Validate_Last_Name', N'姓を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (301, 1, N'EditProfileScreen_Validate_Number_Phone', N'Please input phone number')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (302, 2, N'EditProfileScreen_Validate_Number_Phone', N'電話番号を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (303, 1, N'EditProfileScreen_Validate_Postal_Code', N'Please input postal code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (304, 2, N'EditProfileScreen_Validate_Postal_Code', N'郵便番号を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (305, 1, N'KYCScreen_Button_Cancel', N'Cancel')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (306, 2, N'KYCScreen_Button_Cancel', N'キャンセル')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (307, 1, N'KYCScreen_Button_Go_To_Web', N'Go to web')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (308, 2, N'KYCScreen_Button_Go_To_Web', N'ウェブに行く')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (309, 1, N'KYCScreen_Dialog_Title', N'If you do not KYC for your account. Please touch "Go to Web" for update KYC')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (310, 2, N'KYCScreen_Dialog_Title', N'あなたのアカウントにKYCがない場合、KYCを更新するには、[ウェブに行く]を押してください.')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (311, 1, N'MenuPincodeScreen_Button_Change', N'Change PIN Code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (312, 2, N'MenuPincodeScreen_Button_Change', N'PINコードの変更')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (313, 1, N'MenuPincodeScreen_Button_Remove', N'Remove PIN Code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (314, 2, N'MenuPincodeScreen_Button_Remove', N'PINコードを削除')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (315, 1, N'MenuPincodeScreen_Button_Setup', N'Setup PIN Code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (316, 2, N'MenuPincodeScreen_Button_Setup', N'PINコードの設定')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (317, 1, N'MenuPincodeScreen_Title', N'Setting Pincode')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (318, 2, N'MenuPincodeScreen_Title', N'PINコードの設定')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (319, 1, N'MoreScreen_Button_Ok', N'OK')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (320, 2, N'MoreScreen_Button_Ok', N'はい')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (321, 1, N'PincodeScreen_Button_Clear', N'Clear')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (322, 2, N'PincodeScreen_Button_Clear', N'クリア')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (323, 1, N'PincodeScreen_Button_Delete', N'Delete')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (324, 2, N'PincodeScreen_Button_Delete', N'削除')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (325, 1, N'PincodeScreen_Dialog_Message_Error', N'PIN code not match! Please re-input PIN code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (326, 2, N'PincodeScreen_Dialog_Message_Error', N'PINコードが一致しません！再入力してください！')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (327, 1, N'PincodeScreen_Dialog_Message_Success', N'Setting PIN code successfully!')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (328, 2, N'PincodeScreen_Dialog_Message_Success', N'PINコードを正常に設定した。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (329, 1, N'PincodeScreen_Input_Confirm_Title', N'Input confirm PIN code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (330, 2, N'PincodeScreen_Input_Confirm_Title', N'PINコードを確認する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (331, 1, N'PincodeScreen_Input_Current_Title', N'Input current PIN code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (332, 2, N'PincodeScreen_Input_Current_Title', N'現在のPINコードを入力する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (333, 1, N'PincodeScreen_Input_New_Title', N'Input new PIN code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (334, 2, N'PincodeScreen_Input_New_Title', N'新しいPINコードを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (335, 1, N'PincodeScreen_Title', N'Setting Pincode')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (336, 2, N'PincodeScreen_Title', N'PINコードの設定')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (337, 1, N'ProfileEditUserScreen_NonExisting_Account', N'Account is not existing')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (338, 2, N'ProfileEditUserScreen_NonExisting_Account', N'アカウントは存在しません')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (339, 1, N'ProfileEditUserScreen_Updated_Successfully', N'Personal info updated successfully')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (340, 2, N'ProfileEditUserScreen_Updated_Successfully', N'個人情報を正常に更新しました。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (341, 1, N'ProfileScreen_Address_Title', N'Street address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (342, 2, N'ProfileScreen_Address_Title', N'住所')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (343, 1, N'ProfileScreen_Birthday_Title', N'Date of birth')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (344, 2, N'ProfileScreen_Birthday_Title', N'生年月日')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (345, 1, N'ProfileScreen_BTC_Wallet_Title', N'BTC Wallet Address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (346, 2, N'ProfileScreen_BTC_Wallet_Title', N'BTCウォレットアドレス')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (347, 1, N'ProfileScreen_Button_Edit', N'Edit')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (348, 2, N'ProfileScreen_Button_Edit', N'編集')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (349, 1, N'ProfileScreen_City_Title', N'City')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (350, 2, N'ProfileScreen_City_Title', N'都市')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (351, 1, N'ProfileScreen_Country_Title', N'Country')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (352, 2, N'ProfileScreen_Country_Title', N'国')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (353, 1, N'ProfileScreen_Email_Title', N'Email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (354, 2, N'ProfileScreen_Email_Title', N'イメール')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (355, 1, N'ProfileScreen_ETH_Wallet_Title', N'ETH Wallet Address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (356, 2, N'ProfileScreen_ETH_Wallet_Title', N'ETHウォレットアドレス')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (357, 1, N'ProfileScreen_First_Name_Title', N'First name')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (358, 2, N'ProfileScreen_First_Name_Title', N'	名')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (359, 1, N'ProfileScreen_Game_History_Title', N'Game history')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (360, 2, N'ProfileScreen_Game_History_Title', N'ゲームの履歴')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (361, 1, N'ProfileScreen_KYC_Status_Not_Verified', N'Not verified yet')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (362, 2, N'ProfileScreen_KYC_Status_Not_Verified', N'確認されていない')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (363, 1, N'ProfileScreen_KYC_Status_Verified', N'Verified')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (364, 2, N'ProfileScreen_KYC_Status_Verified', N'検証済み')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (365, 1, N'ProfileScreen_Last_Name_Title', N'Last name')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (366, 2, N'ProfileScreen_Last_Name_Title', N'姓')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (367, 1, N'ProfileScreen_Mobile_Title', N'Mobile')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (368, 2, N'ProfileScreen_Mobile_Title', N'モバイル')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (369, 1, N'ProfileScreen_Postal_Code_Title', N'Postal code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (370, 2, N'ProfileScreen_Postal_Code_Title', N'郵便番号')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (371, 1, N'ProfileScreen_Title', N'Profile')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (372, 2, N'ProfileScreen_Title', N'プロフィール')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (373, 1, N'ProfileScreen_Transaction_Title', N'Transaction')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (374, 2, N'ProfileScreen_Transaction_Title', N'トランザクション')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (375, 1, N'ProfileScreen_Two_Factor_Status_Disable', N'Not enabled')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (376, 2, N'ProfileScreen_Two_Factor_Status_Disable', N'無効')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (377, 1, N'ProfileScreen_Two_Factor_Status_Enabled', N'Enabled')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (378, 2, N'ProfileScreen_Two_Factor_Status_Enabled', N'有効')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (379, 1, N'ProfileScreen_Two_Factor_Title', N'Two-factor authentication')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (380, 2, N'ProfileScreen_Two_Factor_Title', N'二要素認証')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (381, 1, N'PurchraseScreen_Validate_Max', N'The volume of CPL maximum is')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (382, 2, N'PurchraseScreen_Validate_Max', N'CPLの最大量は')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (383, 1, N'PurchraseScreen_Validate_Min', N'The volume of CPL minimum is 1')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (384, 2, N'PurchraseScreen_Validate_Min', N'CPLの最小量は1です')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (385, 1, N'PurchraseScreen_Validate_Null', N'Please input number of ticket')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (386, 2, N'PurchraseScreen_Validate_Null', N'チケット数を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (387, 1, N'QrScanScreen_Dialog_Button_Cancel', N'Cancel')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (388, 2, N'QrScanScreen_Dialog_Button_Cancel', N'キャンセル')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (389, 1, N'QrScanScreen_Dialog_Button_Ok', N'OK')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (390, 2, N'QrScanScreen_Dialog_Button_Ok', N'はい')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (391, 1, N'QrScanScreen_Dialog_Permisson_Content', N'Crypto Odds Would like to Access the Camera')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (392, 2, N'QrScanScreen_Dialog_Permisson_Content', N'「Crypto Odds」はカメラにアクセスしたい')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (393, 1, N'QrScanScreen_Dialog_Permisson_Content2', N'Please accept camera permission to scan QR code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (394, 2, N'QrScanScreen_Dialog_Permisson_Content2', N'QRコードをスキャンするためのカメラの許可をしてください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (395, 1, N'QrScanScreen_Dialog_Permisson_Title', N'Permisson denied')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (396, 2, N'QrScanScreen_Dialog_Permisson_Title', N'アクセス拒否')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (397, 1, N'QrScanScreen_Title', N'Qr Code Scanner')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (398, 2, N'QrScanScreen_Title', N'QRコードスキャナ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (399, 1, N'SecurityScreen_Button_Edit_Email', N'Edit email')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (400, 2, N'SecurityScreen_Button_Edit_Email', N'イメールの編集')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (401, 1, N'SecurityScreen_Button_Edit_Password', N'Edit password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (402, 2, N'SecurityScreen_Button_Edit_Password', N'パスワードの編集')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (403, 1, N'SecurityScreen_Button_Fingerprint', N'Finger print')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (404, 2, N'SecurityScreen_Button_Fingerprint', N'指紋')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (405, 1, N'SecurityScreen_Button_Pincode', N'PIN code')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (406, 2, N'SecurityScreen_Button_Pincode', N'PINコード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (407, 1, N'SecurityScreen_Title', N'Security')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (408, 2, N'SecurityScreen_Title', N'セキュリティ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (409, 1, N'SettingLanguageScreen_Title', N'Setting Language')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (410, 2, N'SettingLanguageScreen_Title', N'言語の設定')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (411, 1, N'UserAccountScreen_Button_Profile', N'Profile')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (412, 2, N'UserAccountScreen_Button_Profile', N'プロフィール')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (413, 1, N'UserAccountScreen_Button_Security', N'Security')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (414, 2, N'UserAccountScreen_Button_Security', N'セキュリティ')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (415, 1, N'UserAccountScreen_Title', N'User Account')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (416, 2, N'UserAccountScreen_Title', N'ユーザーアカウント')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (417, 1, N'WithdrawDialog_Button_Withdraw', N'Withdraw')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (418, 2, N'WithdrawDialog_Button_Withdraw', N'出金')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (419, 1, N'WithdrawDialog_Input_Address_Title', N'Address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (420, 2, N'WithdrawDialog_Input_Address_Title', N'住所')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (421, 1, N'WithdrawDialog_Input_Amount_Title', N'Amount')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (422, 2, N'WithdrawDialog_Input_Amount_Title', N'量')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (423, 1, N'WithdrawDialog_Input_Button_Max_Title', N'Max')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (424, 2, N'WithdrawDialog_Input_Button_Max_Title', N'最大')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (425, 1, N'WithdrawDialog_Title', N'You are about to withdraw BTC from your account')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (426, 2, N'WithdrawDialog_Title', N'あなたはBTCを引き出しようとする。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (427, 1, N'WithdrawDialog_Validate_Address', N'Please input BTC address')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (428, 2, N'WithdrawDialog_Validate_Address', N'BTCアドレスを入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (429, 1, N'WithdrawDialog_Validate_Amount_Max', N'Please input number BTC smaller than user BTC amount')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (430, 2, N'WithdrawDialog_Validate_Amount_Max', N'BTC額より小さいBTC金額を入力してください')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (431, 1, N'WithdrawDialog_Validate_Amount_Min', N'The number of BTC amount always greater than 0')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (432, 2, N'WithdrawDialog_Validate_Amount_Min', N'BTC金額は0より大きい。')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (441, 1, N'EditPasswordScreen_Input_Confirm_Password_Placeholder', N'Confirm password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (442, 2, N'EditPasswordScreen_Input_Confirm_Password_Placeholder', N'パスワードを認証する')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (443, 1, N'EditPasswordScreen_Input_Current_Password_Placeholder', N'Current password')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (444, 2, N'EditPasswordScreen_Input_Current_Password_Placeholder', N'現在のパスワード')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (445, 1, N'EditPasswordScreen_Validate_Confirm_Password_Not_Match', N'Password not match')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (446, 2, N'EditPasswordScreen_Validate_Confirm_Password_Not_Match', N'パスワードが一致しません')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (447, 1, N'EditPasswordScreen_Validate_Current_Password_Not_Match', N'Password current not match')
GO
INSERT [dbo].[MobileLangDetail] ([Id], [LangId], [Name], [Value]) VALUES (448, 2, N'EditPasswordScreen_Validate_Current_Password_Not_Match', N'現在のパスワードと一致しないパスワード')
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
SET IDENTITY_INSERT [dbo].[Payment] ON 
GO
INSERT [dbo].[Payment] ([Id], [SysUserId], [CreatedDate], [UpdatedDate], [Tier1DirectSale], [Tier2SaleToTier1Sale], [Tier3SaleToTier1Sale], [Tier1DirectRate], [Tier2SaleToTier1Rate], [Tier3SaleToTier1Rate]) VALUES (1, 4, CAST(N'2018-10-01T00:00:00.423' AS DateTime), NULL, 0.0000, 0.0000, 0.0000, 10, 5, 3)
GO
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[PricePrediction] ON 
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (1, 6514.0000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-28T01:15:00.200' AS DateTime), CAST(N'2018-09-27T01:15:00.010' AS DateTime), CAST(N'2018-09-28T00:00:00.010' AS DateTime), CAST(N'2018-09-28T01:15:00.010' AS DateTime), CAST(N'2018-09-28T01:00:00.010' AS DateTime), 6498.9700, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (2, 6704.0300, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-28T09:15:00.180' AS DateTime), CAST(N'2018-09-27T09:15:00.007' AS DateTime), CAST(N'2018-09-28T08:00:00.007' AS DateTime), CAST(N'2018-09-28T09:15:00.007' AS DateTime), CAST(N'2018-09-28T09:00:00.007' AS DateTime), 6689.1200, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (3, 6745.7000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-28T17:15:00.153' AS DateTime), CAST(N'2018-09-27T17:15:00.013' AS DateTime), CAST(N'2018-09-28T16:00:00.013' AS DateTime), CAST(N'2018-09-28T17:15:00.013' AS DateTime), CAST(N'2018-09-28T17:00:00.013' AS DateTime), 6788.9900, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (4, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-29T01:15:00.117' AS DateTime), CAST(N'2018-09-28T01:15:00.003' AS DateTime), CAST(N'2018-09-29T00:00:00.003' AS DateTime), CAST(N'2018-09-29T01:15:00.003' AS DateTime), CAST(N'2018-09-29T01:00:00.003' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (5, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-29T09:15:00.113' AS DateTime), CAST(N'2018-09-28T09:15:00.010' AS DateTime), CAST(N'2018-09-29T08:00:00.010' AS DateTime), CAST(N'2018-09-29T09:15:00.010' AS DateTime), CAST(N'2018-09-29T09:00:00.010' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (6, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-29T17:15:00.120' AS DateTime), CAST(N'2018-09-28T17:15:00.007' AS DateTime), CAST(N'2018-09-29T16:00:00.007' AS DateTime), CAST(N'2018-09-29T17:15:00.007' AS DateTime), CAST(N'2018-09-29T17:00:00.007' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (7, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-30T01:15:00.117' AS DateTime), CAST(N'2018-09-29T01:15:00.003' AS DateTime), CAST(N'2018-09-30T00:00:00.003' AS DateTime), CAST(N'2018-09-30T01:15:00.003' AS DateTime), CAST(N'2018-09-30T01:00:00.003' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (8, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-30T09:15:00.113' AS DateTime), CAST(N'2018-09-29T09:15:00.007' AS DateTime), CAST(N'2018-09-30T08:00:00.007' AS DateTime), CAST(N'2018-09-30T09:15:00.007' AS DateTime), CAST(N'2018-09-30T09:00:00.007' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (9, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-09-30T17:15:00.120' AS DateTime), CAST(N'2018-09-29T17:15:00.010' AS DateTime), CAST(N'2018-09-30T16:00:00.010' AS DateTime), CAST(N'2018-09-30T17:15:00.010' AS DateTime), CAST(N'2018-09-30T17:00:00.010' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (10, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-01T01:15:00.123' AS DateTime), CAST(N'2018-09-30T01:15:00.007' AS DateTime), CAST(N'2018-10-01T00:00:00.007' AS DateTime), CAST(N'2018-10-01T01:15:00.007' AS DateTime), CAST(N'2018-10-01T01:00:00.007' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (11, 6657.9400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-01T09:15:00.123' AS DateTime), CAST(N'2018-09-30T09:15:00.000' AS DateTime), CAST(N'2018-10-01T08:00:00.000' AS DateTime), CAST(N'2018-10-01T09:15:00.000' AS DateTime), CAST(N'2018-10-01T09:00:00.000' AS DateTime), 6657.9400, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (12, 6610.2400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-01T17:15:00.653' AS DateTime), CAST(N'2018-09-30T17:15:00.013' AS DateTime), CAST(N'2018-10-01T16:00:00.013' AS DateTime), CAST(N'2018-10-01T17:15:00.013' AS DateTime), CAST(N'2018-10-01T17:00:00.013' AS DateTime), 6604.8100, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (13, 6544.4400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-02T01:15:00.233' AS DateTime), CAST(N'2018-10-01T01:15:00.013' AS DateTime), CAST(N'2018-10-02T00:00:00.013' AS DateTime), CAST(N'2018-10-02T01:15:00.013' AS DateTime), CAST(N'2018-10-02T01:00:00.013' AS DateTime), 6569.9200, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (14, 6599.0800, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-02T09:15:00.233' AS DateTime), CAST(N'2018-10-01T09:15:00.013' AS DateTime), CAST(N'2018-10-02T08:00:00.013' AS DateTime), CAST(N'2018-10-02T09:15:00.013' AS DateTime), CAST(N'2018-10-02T09:00:00.013' AS DateTime), 6611.6100, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (15, 6608.1100, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-02T17:15:00.123' AS DateTime), CAST(N'2018-10-01T17:15:00.013' AS DateTime), CAST(N'2018-10-02T16:00:00.013' AS DateTime), CAST(N'2018-10-02T17:15:00.013' AS DateTime), CAST(N'2018-10-02T17:00:00.013' AS DateTime), 6606.8600, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (16, 6539.8800, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-03T01:15:00.230' AS DateTime), CAST(N'2018-10-02T01:15:00.007' AS DateTime), CAST(N'2018-10-03T00:00:00.007' AS DateTime), CAST(N'2018-10-03T01:15:00.007' AS DateTime), CAST(N'2018-10-03T01:00:00.007' AS DateTime), 6539.8800, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (17, 6539.8800, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-03T09:15:00.147' AS DateTime), CAST(N'2018-10-02T09:15:00.003' AS DateTime), CAST(N'2018-10-03T08:00:00.003' AS DateTime), CAST(N'2018-10-03T09:15:00.003' AS DateTime), CAST(N'2018-10-03T09:00:00.003' AS DateTime), 6539.8800, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (18, 6466.9600, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-03T17:15:00.673' AS DateTime), CAST(N'2018-10-02T17:15:00.000' AS DateTime), CAST(N'2018-10-03T16:00:00.000' AS DateTime), CAST(N'2018-10-03T17:15:00.000' AS DateTime), CAST(N'2018-10-03T17:00:00.000' AS DateTime), 6460.2800, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (19, 6510.9600, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-04T01:15:00.213' AS DateTime), CAST(N'2018-10-03T01:15:00.003' AS DateTime), CAST(N'2018-10-04T00:00:00.003' AS DateTime), CAST(N'2018-10-04T01:15:00.003' AS DateTime), CAST(N'2018-10-04T01:00:00.003' AS DateTime), 6512.4700, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (20, 6506.2100, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-04T09:15:00.130' AS DateTime), CAST(N'2018-10-03T09:15:00.010' AS DateTime), CAST(N'2018-10-04T08:00:00.010' AS DateTime), CAST(N'2018-10-04T09:15:00.010' AS DateTime), CAST(N'2018-10-04T09:00:00.010' AS DateTime), 6510.0000, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (21, 6603.2500, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-04T17:15:00.237' AS DateTime), CAST(N'2018-10-03T17:15:00.017' AS DateTime), CAST(N'2018-10-04T16:00:00.017' AS DateTime), CAST(N'2018-10-04T17:15:00.017' AS DateTime), CAST(N'2018-10-04T17:00:00.017' AS DateTime), 6574.4500, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (22, 6608.0400, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-05T01:15:00.143' AS DateTime), CAST(N'2018-10-04T01:15:00.003' AS DateTime), CAST(N'2018-10-05T00:00:00.003' AS DateTime), CAST(N'2018-10-05T01:15:00.003' AS DateTime), CAST(N'2018-10-05T01:00:00.003' AS DateTime), 6597.7700, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (23, 6597.0700, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-05T09:15:00.773' AS DateTime), CAST(N'2018-10-04T09:15:00.003' AS DateTime), CAST(N'2018-10-05T08:00:00.003' AS DateTime), CAST(N'2018-10-05T09:15:00.003' AS DateTime), CAST(N'2018-10-05T09:00:00.003' AS DateTime), 6593.7900, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (24, 6591.4200, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-05T17:15:00.250' AS DateTime), CAST(N'2018-10-04T17:15:00.000' AS DateTime), CAST(N'2018-10-05T16:00:00.000' AS DateTime), CAST(N'2018-10-05T17:15:00.000' AS DateTime), CAST(N'2018-10-05T17:00:00.000' AS DateTime), 6578.7600, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (25, 6591.5600, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-06T01:15:00.137' AS DateTime), CAST(N'2018-10-05T01:15:00.010' AS DateTime), CAST(N'2018-10-06T00:00:00.010' AS DateTime), CAST(N'2018-10-06T01:15:00.010' AS DateTime), CAST(N'2018-10-06T01:00:00.010' AS DateTime), 6598.5100, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (26, 6640.0200, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-06T09:15:00.267' AS DateTime), CAST(N'2018-10-05T09:15:00.010' AS DateTime), CAST(N'2018-10-06T08:00:00.010' AS DateTime), CAST(N'2018-10-06T09:15:00.010' AS DateTime), CAST(N'2018-10-06T09:00:00.010' AS DateTime), 6635.6500, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (27, 6616.9900, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-06T17:15:00.150' AS DateTime), CAST(N'2018-10-05T17:15:00.010' AS DateTime), CAST(N'2018-10-06T16:00:00.010' AS DateTime), CAST(N'2018-10-06T17:15:00.010' AS DateTime), CAST(N'2018-10-06T17:00:00.010' AS DateTime), 6620.3500, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (28, 6600.0000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-07T01:15:00.240' AS DateTime), CAST(N'2018-10-06T01:15:00.003' AS DateTime), CAST(N'2018-10-07T00:00:00.003' AS DateTime), CAST(N'2018-10-07T01:15:00.003' AS DateTime), CAST(N'2018-10-07T01:00:00.003' AS DateTime), 6596.0800, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (29, 6594.2800, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-07T09:15:00.157' AS DateTime), CAST(N'2018-10-06T09:15:00.007' AS DateTime), CAST(N'2018-10-07T08:00:00.007' AS DateTime), CAST(N'2018-10-07T09:15:00.007' AS DateTime), CAST(N'2018-10-07T09:00:00.007' AS DateTime), 6594.2800, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (30, 6547.3500, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-07T17:15:00.167' AS DateTime), CAST(N'2018-10-06T17:15:00.013' AS DateTime), CAST(N'2018-10-07T16:00:00.013' AS DateTime), CAST(N'2018-10-07T17:15:00.013' AS DateTime), CAST(N'2018-10-07T17:00:00.013' AS DateTime), 6569.4600, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (31, 6574.0900, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-08T01:15:00.230' AS DateTime), CAST(N'2018-10-07T01:15:00.010' AS DateTime), CAST(N'2018-10-08T00:00:00.010' AS DateTime), CAST(N'2018-10-08T01:15:00.010' AS DateTime), CAST(N'2018-10-08T01:00:00.010' AS DateTime), 6582.0700, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (32, 6607.8700, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-08T09:15:00.133' AS DateTime), CAST(N'2018-10-07T09:15:00.013' AS DateTime), CAST(N'2018-10-08T08:00:00.013' AS DateTime), CAST(N'2018-10-08T09:15:00.013' AS DateTime), CAST(N'2018-10-08T09:00:00.013' AS DateTime), 6615.2600, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (33, 6596.0000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-08T17:15:00.140' AS DateTime), CAST(N'2018-10-07T17:15:00.013' AS DateTime), CAST(N'2018-10-08T16:00:00.013' AS DateTime), CAST(N'2018-10-08T17:15:00.013' AS DateTime), CAST(N'2018-10-08T17:00:00.013' AS DateTime), 6596.0300, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (34, 6673.9500, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-09T01:15:00.360' AS DateTime), CAST(N'2018-10-08T01:15:00.003' AS DateTime), CAST(N'2018-10-09T00:00:00.003' AS DateTime), CAST(N'2018-10-09T01:15:00.003' AS DateTime), CAST(N'2018-10-09T01:00:00.003' AS DateTime), 6676.5200, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (35, 6673.6700, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-09T09:15:00.130' AS DateTime), CAST(N'2018-10-08T09:15:00.000' AS DateTime), CAST(N'2018-10-09T08:00:00.000' AS DateTime), CAST(N'2018-10-09T09:15:00.000' AS DateTime), CAST(N'2018-10-09T09:00:00.000' AS DateTime), 6673.0100, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (36, 6659.9000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-09T17:15:00.123' AS DateTime), CAST(N'2018-10-08T17:15:00.007' AS DateTime), CAST(N'2018-10-09T16:00:00.007' AS DateTime), CAST(N'2018-10-09T17:15:00.007' AS DateTime), CAST(N'2018-10-09T17:00:00.007' AS DateTime), 6669.3500, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (37, 6626.7800, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-10T01:15:00.120' AS DateTime), CAST(N'2018-10-09T01:15:00.007' AS DateTime), CAST(N'2018-10-10T00:00:00.007' AS DateTime), CAST(N'2018-10-10T01:15:00.007' AS DateTime), CAST(N'2018-10-10T01:00:00.007' AS DateTime), 6643.7900, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (38, 6648.0200, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-10T09:15:00.377' AS DateTime), CAST(N'2018-10-09T09:15:00.010' AS DateTime), CAST(N'2018-10-10T08:00:00.010' AS DateTime), CAST(N'2018-10-10T09:15:00.010' AS DateTime), CAST(N'2018-10-10T09:00:00.010' AS DateTime), 6656.6100, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (39, 6571.1800, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-10T17:15:00.130' AS DateTime), CAST(N'2018-10-09T17:15:00.007' AS DateTime), CAST(N'2018-10-10T16:00:00.007' AS DateTime), CAST(N'2018-10-10T17:15:00.007' AS DateTime), CAST(N'2018-10-10T17:00:00.007' AS DateTime), 6576.0000, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (40, 6598.0000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-11T01:15:00.133' AS DateTime), CAST(N'2018-10-10T01:15:00.003' AS DateTime), CAST(N'2018-10-11T00:00:00.003' AS DateTime), CAST(N'2018-10-11T01:15:00.003' AS DateTime), CAST(N'2018-10-11T01:00:00.003' AS DateTime), 6588.9900, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (41, 6603.0000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-11T09:15:00.143' AS DateTime), CAST(N'2018-10-10T09:15:00.010' AS DateTime), CAST(N'2018-10-11T08:00:00.010' AS DateTime), CAST(N'2018-10-11T09:15:00.010' AS DateTime), CAST(N'2018-10-11T09:00:00.010' AS DateTime), 6631.0000, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (42, 6306.0000, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-11T17:15:00.857' AS DateTime), CAST(N'2018-10-10T17:15:00.010' AS DateTime), CAST(N'2018-10-11T16:00:00.010' AS DateTime), CAST(N'2018-10-11T17:15:00.010' AS DateTime), CAST(N'2018-10-11T17:00:00.010' AS DateTime), 6300.8600, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (43, 6310.6500, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-12T01:15:00.143' AS DateTime), CAST(N'2018-10-11T01:15:00.013' AS DateTime), CAST(N'2018-10-12T00:00:00.013' AS DateTime), CAST(N'2018-10-12T01:15:00.013' AS DateTime), CAST(N'2018-10-12T01:00:00.013' AS DateTime), 6294.0900, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (44, 6226.3100, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-12T09:15:00.380' AS DateTime), CAST(N'2018-10-11T09:15:00.007' AS DateTime), CAST(N'2018-10-12T08:00:00.007' AS DateTime), CAST(N'2018-10-12T09:15:00.007' AS DateTime), CAST(N'2018-10-12T09:00:00.007' AS DateTime), 6252.6300, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (45, 6320.9100, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-12T17:15:00.133' AS DateTime), CAST(N'2018-10-11T17:15:00.013' AS DateTime), CAST(N'2018-10-12T16:00:00.013' AS DateTime), CAST(N'2018-10-12T17:15:00.013' AS DateTime), CAST(N'2018-10-12T17:00:00.013' AS DateTime), 6334.3000, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (46, 6334.2200, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-13T01:15:00.483' AS DateTime), CAST(N'2018-10-12T01:15:00.013' AS DateTime), CAST(N'2018-10-13T00:00:00.013' AS DateTime), CAST(N'2018-10-13T01:15:00.013' AS DateTime), CAST(N'2018-10-13T01:00:00.013' AS DateTime), 6341.6900, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (47, 6324.9800, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-13T09:15:00.160' AS DateTime), CAST(N'2018-10-12T09:15:00.007' AS DateTime), CAST(N'2018-10-13T08:00:00.007' AS DateTime), CAST(N'2018-10-13T09:15:00.007' AS DateTime), CAST(N'2018-10-13T09:00:00.007' AS DateTime), 6298.0100, 1, 1, 80)
GO
INSERT [dbo].[PricePrediction] ([Id], [ResultPrice], [NumberOfPredictors], [Volume], [Coinbase], [UpdatedDate], [OpenBettingTime], [CloseBettingTime], [ResultTime], [ToBeComparedTime], [ToBeComparedPrice], [PricePredictionCategoryId], [Status], [DividendRate]) VALUES (48, 6309.9900, 0, 0.0000, N'BTCUSDT', CAST(N'2018-10-13T17:15:00.420' AS DateTime), CAST(N'2018-10-12T17:15:00.013' AS DateTime), CAST(N'2018-10-13T16:00:00.013' AS DateTime), CAST(N'2018-10-13T17:15:00.013' AS DateTime), CAST(N'2018-10-13T17:00:00.013' AS DateTime), 6318.4700, 1, 1, 80)
GO
SET IDENTITY_INSERT [dbo].[PricePrediction] OFF
GO
SET IDENTITY_INSERT [dbo].[PricePredictionCategory] ON 
GO
INSERT [dbo].[PricePredictionCategory] ([Id]) VALUES (1)
GO
INSERT [dbo].[PricePredictionCategory] ([Id]) VALUES (2)
GO
SET IDENTITY_INSERT [dbo].[PricePredictionCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[PricePredictionCategoryDetail] ON 
GO
INSERT [dbo].[PricePredictionCategoryDetail] ([Id], [Name], [Description], [PricePredictionCategoryId], [LangId]) VALUES (1, N'Standard', NULL, 1, 1)
GO
INSERT [dbo].[PricePredictionCategoryDetail] ([Id], [Name], [Description], [PricePredictionCategoryId], [LangId]) VALUES (2, N'スタンダード', NULL, 1, 2)
GO
INSERT [dbo].[PricePredictionCategoryDetail] ([Id], [Name], [Description], [PricePredictionCategoryId], [LangId]) VALUES (3, N'Variety', NULL, 2, 1)
GO
INSERT [dbo].[PricePredictionCategoryDetail] ([Id], [Name], [Description], [PricePredictionCategoryId], [LangId]) VALUES (4, N'バラエティー', NULL, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[PricePredictionCategoryDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[PricePredictionDetail] ON 
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (1, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 1)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (2, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 2)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (3, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 3)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (4, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 4)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (5, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 5)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (6, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 6)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (7, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 7)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (8, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 8)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (9, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 9)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (10, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 10)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (11, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 11)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (12, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 12)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (13, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 13)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (14, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 14)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (15, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 15)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (16, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 16)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (17, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 17)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (18, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 18)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (19, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 19)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (20, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 20)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (21, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 21)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (22, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 22)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (23, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 23)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (24, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 24)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (25, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 25)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (26, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 26)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (27, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 27)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (28, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 28)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (29, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 29)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (30, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 30)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (31, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 31)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (32, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 32)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (33, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 33)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (34, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 34)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (35, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 35)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (36, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 36)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (37, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 37)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (38, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 38)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (39, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 39)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (40, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 40)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (41, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 41)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (42, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 42)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (43, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 43)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (44, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 44)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (45, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 45)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (46, N'24:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 46)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (47, N'8:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 47)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (48, N'16:00', N'Just choose High or Low! <br/>
There are three games a day!', 1, 48)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (49, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 1)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (50, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 2)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (51, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 3)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (52, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 4)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (53, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 5)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (54, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 6)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (55, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 7)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (56, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 8)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (57, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 9)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (58, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 10)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (59, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 11)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (60, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 12)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (61, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 13)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (62, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 14)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (63, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 15)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (64, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 16)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (65, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 17)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (66, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 18)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (67, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 19)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (68, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 20)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (69, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 21)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (70, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 22)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (71, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 23)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (72, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 24)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (73, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 25)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (74, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 26)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (75, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 27)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (76, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 28)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (77, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 29)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (78, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 30)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (79, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 31)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (80, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 32)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (81, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 33)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (82, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 34)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (83, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 35)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (84, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 36)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (85, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 37)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (86, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 38)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (87, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 39)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (88, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 40)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (89, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 41)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (90, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 42)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (91, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 43)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (92, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 44)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (93, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 45)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (94, N'24:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 46)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (95, N'8:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 47)
GO
INSERT [dbo].[PricePredictionDetail] ([Id], [Title], [ShortDescription], [LangId], [PricePredictionId]) VALUES (96, N'16:00', N'HighかLowを選ぶだけ！<br/>
1日３回のチャンスを掴むのはあなたです！', 2, 48)
GO
SET IDENTITY_INSERT [dbo].[PricePredictionDetail] OFF
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
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (9, N'ETHNotifyCurrentBlockNo', N'6357993', NULL)
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
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (24, N'PricePredictionHoldingIntervalInHour', N'1', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (25, N'PricePredictionCompareIntervalInMinute', N'15', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (28, N'PaymentCreateMonthlyStartTimeInDay', N'1', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (29, N'PaymentCreateMonthlyStartTimeInHour', N'0', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (30, N'PaymentCreateMonthlyStartTimeInMinute', N'0', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (31, N'PaymentProcessMonthlyStartTimeInDay', N'10', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (32, N'PaymentProcessMonthlyStartTimeInHour', N'0', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (33, N'PaymentProcessMonthlyStartTimeInMinute', N'0', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (34, N'PricePredictionGameIntervalInHour', N'24', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (35, N'BTCNotifyCurrentBlockNo', N'545790', N'This is BlockNo on Main net. If you want to use on testnet. Please check on testnet.blockchain.info')
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (36, N'HomeViewId', N'181557634', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (37, N'LotteryViewId', N'181871809', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (38, N'PricePredictionViewId', N'181838124', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (39, N'AdminPricePredictionDailyJobStartHour', N'0', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (40, N'AdminPricePredictionDailyJobStartMinute', N'0', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (41, N'PricePredictionTotalAwardPercentage', N'80', NULL)
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
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (4, 1, N't-kitamura@famhopper.com', N'$2a$10$Rj8FfDB1bGHUs6DSqh3Zs.fnKSTUq5.KyLeIMOfLFXBkYvFHH33XO', N'kit', N'mur', N'+84987654321', NULL, NULL, NULL, CAST(N'2018-08-28T20:31:18.990' AS DateTime), NULL, NULL, NULL, NULL, 4, NULL, 0, N'0xEB8691789fD36FF0A8949413Ad9245855394fAd8', 4, N'13KBMHecERwGzuhBF7CcSAxSCu9D6dphqY', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, CAST(N'2018-09-30T18:40:56.273' AS DateTime), 0)
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
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (10, 0, N'npp.nguyentuan@gmail.com', N'$2a$10$8BXkpExIbMd5g1rS/WFaoODLthdEmNpynnvMaVFAe5ILWBEd7q.5a', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-09-06T09:18:12.563' AS DateTime), NULL, NULL, NULL, NULL, 10, NULL, 0, N'0xbe8537bF9234546C66cC328fcfE61D9aB2fefEF5', 10, N'15RTiH5pBa3bHDTLhKUC6Qo2xNhSrnCWRw', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (11, 0, N'lan-do@famhopper.com', N'$2a$10$Z3cBdD6X.1CU6lKVahztQO89.OG7citK/nUfZ4j0shH4b7GKNshSy', NULL, NULL, NULL, NULL, NULL, N'a2cea1ce-5c7c-4d8d-b333-68549add848c', CAST(N'2018-10-01T15:38:46.673' AS DateTime), NULL, NULL, NULL, NULL, 11, NULL, 0, N'0xFf0Cb33BAA581f3834645d754402c9C0eF69ab91', 11, N'1GKCBpyMPjaaAe4cuLDs12EUaueMp6AiCC', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (12, 0, N'myxaogion1@gmail.com', N'$2a$10$4FHBBhrdYgEpKejlMz3V9uOZ4yVovrfjEIUHxVI.4ZL1N6kFPH/e6', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-10-02T10:38:38.880' AS DateTime), NULL, NULL, NULL, NULL, 12, NULL, 0, N'0x6d8f7c7DE4136DbF2d2A933c219A218C9Cd444F5', 12, N'1FoQKMSZEMUit2NXJMrhUmBUHMWxwn23jw', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable], [AgencyId], [AffiliateId], [IsIntroducedById], [AffiliateCreatedDate], [IsLocked]) VALUES (13, 0, N'enjoyvinh@yahoo.com', N'$2a$10$TF.nehhMv9wI/Tk5e7mXqudGftLitH7MU85mv3U/HENcYHFNM7ICu', NULL, NULL, NULL, NULL, NULL, N'1a5e9997-c12c-4312-a260-1dd0e759828e', CAST(N'2018-10-10T16:14:00.297' AS DateTime), NULL, NULL, NULL, NULL, 13, NULL, 0, N'0x606D2ED3a2346681b48C8c9af08652fbfbBaB53C', 13, N'16dx2e7Ftyzn4VUPVLwY7vWEeA1B9dUGpV', CAST(0.00000000 AS Decimal(18, 8)), CAST(0.00000000 AS Decimal(18, 8)), 0.0000, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0)
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
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (7, N'Message', N'MessageEmailTemplate', N'Message from customer at CPL')
GO
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
ALTER TABLE [dbo].[Affiliate] ADD  DEFAULT ((0)) FOR [IsAutoPaymentEnable]
GO
ALTER TABLE [dbo].[Affiliate] ADD  DEFAULT ((0)) FOR [IsTier2TabVisible]
GO
ALTER TABLE [dbo].[Affiliate] ADD  DEFAULT ((0)) FOR [IsTier3TabVisible]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('0') FOR [Volume]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('1') FOR [Status]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ('0') FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Lottery] ADD  DEFAULT ((1)) FOR [LotteryCategoryId]
GO
ALTER TABLE [dbo].[LotteryCategory] ADD  DEFAULT (N'') FOR [ViewId]
GO
ALTER TABLE [dbo].[LotteryHistory] ADD  DEFAULT ('') FOR [TxHashId]
GO
ALTER TABLE [dbo].[LotteryPrize] ADD  DEFAULT ('0') FOR [Volume]
GO
ALTER TABLE [dbo].[LotteryPrize] ADD  DEFAULT ((0)) FOR [Index]
GO
ALTER TABLE [dbo].[PricePrediction] ADD  DEFAULT ((0)) FOR [PricePredictionCategoryId]
GO
ALTER TABLE [dbo].[PricePrediction] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PricePrediction] ADD  DEFAULT ((80)) FOR [DividendRate]
GO
ALTER TABLE [dbo].[PricePredictionSetting] ADD  DEFAULT ((0)) FOR [Status]
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
/****** Object:  StoredProcedure [dbo].[usp_CreatePayment]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CreatePayment]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Payment
	SELECT 
		-----------------------------------------------
		-- SysUserId to be inserted to PAYMENT table --
		-----------------------------------------------
		su.Id, 

		-------------------------------------------------
		-- CreatedDate to be inserted to PAYMENT table --
		-------------------------------------------------
		getdate() AS CreatedDate, 

		-------------------------------------------------
		-- UpdatedDate to be inserted to PAYMENT table --
		-------------------------------------------------
		null AS UpdatedDate, 

		-----------------------------------------------------
		-- Tier1DirectSale to be inserted to PAYMENT table --
		-----------------------------------------------------
		--(SELECT MAX(Value) FROM (VALUES (0), (
			ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
					FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
					WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
							and DATEPART(yyyy, Lottery.UpdatedDate) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
							and DATEPART(m, Lottery.UpdatedDate) = DATEPART(m, DATEADD(m, -1, getdate())) 
							and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.DirectIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
									join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, Lottery.UpdatedDate) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, Lottery.UpdatedDate) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.DirectIntroducedUsers, ','))),0)
				+
			ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
					    and DATEPART(yyyy, PricePrediction.ResultTime) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
						and DATEPART(m, PricePrediction.ResultTime) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and  PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.DirectIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE   PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, PricePrediction.ResultTime) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
						and DATEPART(m, PricePrediction.ResultTime) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.DirectIntroducedUsers, ','))),0)
						--)) Tier1Direct(Value))
		AS Tier1DirectSale,

		----------------------------------------------------------
		-- Tier2SaleToTier1Sale to be inserted to PAYMENT table --
		----------------------------------------------------------
		--(SELECT MAX(Value) FROM (VALUES (0), (
			ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, Lottery.UpdatedDate) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, Lottery.UpdatedDate) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
									join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, Lottery.UpdatedDate) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, Lottery.UpdatedDate) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier2IntroducedUsers, ','))),0)
				+
			ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, PricePrediction.ResultTime) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, PricePrediction.ResultTime) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and  PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, PricePrediction.ResultTime) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, PricePrediction.ResultTime) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier2IntroducedUsers, ','))),0)
					--)) Tier2ToTier1(Value))
		AS Tier2SaleToTier1Sale,

		----------------------------------------------------------
		-- Tier3SaleToTier1Sale to be inserted to PAYMENT table --
		----------------------------------------------------------
		--(SELECT MAX(Value) FROM (VALUES (0), (
			ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, Lottery.UpdatedDate) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, Lottery.UpdatedDate) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
									join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, Lottery.UpdatedDate) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, Lottery.UpdatedDate) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier3IntroducedUsers, ','))),0)
				+
			ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE	PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, PricePrediction.ResultTime) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, PricePrediction.ResultTime) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and  PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE	PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and DATEPART(yyyy, PricePrediction.ResultTime) = DATEPART(yyyy, DATEADD(m, -1, getdate())) 
						and DATEPART(m, PricePrediction.ResultTime) = DATEPART(m, DATEADD(m, -1, getdate())) 
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(iu.Tier3IntroducedUsers, ','))),0)
					--)) Tier3ToTier1(Value))
		AS Tier3SaleToTier1Sale,

		-----------------------------------------------------
		-- Tier1DirectRate to be inserted to PAYMENT table --
		-----------------------------------------------------
		CASE	WHEN EXISTS (SELECT 1 FROM Tier1Agencies WHERE su.Id = Tier1Agencies.Id) 
				THEN 
					(SELECT Tier1DirectRate FROM Agency WHERE Id = su.AgencyId)
				WHEN EXISTS (SELECT 1 FROM Tier2Agencies WHERE su.Id = Tier2Agencies.Id) 
				THEN
					(SELECT Tier2DirectRate FROM Agency WHERE Id = su.AgencyId)
				WHEN EXISTS (SELECT 1 FROM Tier3Agencies WHERE su.Id = Tier3Agencies.Id) 
				THEN
					(SELECT Tier3DirectRate FROM Agency WHERE Id = su.AgencyId)
				ELSE
					(SELECT Tier1DirectRate FROM Affiliate WHERE Id = su.AffiliateId)
		END		
				AS Tier1DirectRate, 

		----------------------------------------------------------
		-- Tier2SaleToTier1Rate to be inserted to PAYMENT table --
		----------------------------------------------------------
		CASE	WHEN EXISTS (SELECT 1 FROM Tier1Agencies WHERE su.Id = Tier1Agencies.Id) 
				THEN 
					(SELECT Tier2SaleToTier1Rate FROM Agency WHERE Id = su.AgencyId)
				WHEN EXISTS (SELECT 1 FROM Tier2Agencies WHERE su.Id = Tier2Agencies.Id) 
				THEN
					(SELECT Tier3SaleToTier2Rate FROM Agency WHERE Id = su.AgencyId)
				ELSE
					(SELECT Tier2SaleToTier1Rate FROM Affiliate WHERE Id = su.AffiliateId)
		END		
				AS Tier2SaleToTier1Rate,

		----------------------------------------------------------
		-- Tier3SaleToTier1Rate to be inserted to PAYMENT table --
		----------------------------------------------------------
		CASE	WHEN EXISTS (SELECT 1 FROM Tier1Agencies WHERE su.Id = Tier1Agencies.Id)
				THEN 
					(SELECT Tier3SaleToTier1Rate FROM Agency WHERE Id = su.AgencyId)
				ELSE
					(SELECT Tier3SaleToTier1Rate FROM Affiliate WHERE Id = su.AffiliateId)
		END		
				AS Tier3SaleToTier1Rate
				
	FROM SysUser su join IntroducedUsers iu on su.Id = iu.Id
	WHERE su.AffiliateId is not null and su.AffiliateId > 0
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAffiliateInfo_NonTier1_IntroducedUsers]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAffiliateInfo_NonTier1_IntroducedUsers]
	-- Add the parameters for the stored procedure here
	@Tier int,
	@SysUserId int,
	@PeriodInDay int,
	@PageSize int,
	@PageIndex int,
	@OrderColumn nvarchar(30),
	@OrderDirection nvarchar(5),
	@SearchValue nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #1 - TIER X'S DIRECT INTRODUCED USERS IN DETAILS /////////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--

-------------------- BEGIN SETTING PARAM FOR TESTING PURPOSE --------------------
--DECLARE @SysUserId int;
--SET @SysUserId = 1;

--DECLARE @PeriodInDay int;
--SET @PeriodInDay = 300;
-------------------- END SETTING PARAM FOR TESTING PURPOSE --------------------


DECLARE @TierXUsers nvarchar(MAX);
DECLARE @FilteredCount int;
DECLARE @TotalCount int;


SELECT	@TierXUsers = 
		CASE @Tier 
			WHEN 2 THEN IntroducedUsers.DirectIntroducedUsers
			WHEN 3 THEN IntroducedUsers.Tier2IntroducedUsers 
		END
FROM IntroducedUsers 
WHERE IntroducedUsers.Id = @SysUserId;


------------------------------------------------------------------------------------
-------------------------- 1.1 CONSTRUCT SQL QUERY FIRST --------------------------- 
------------------------------------------------------------------------------------
DECLARE @TableDirectIntroducedUsers TABLE
(
	Id int, 
	KindOfTier nvarchar(20),
	UsedCPL money,
	LostCPL money,
	AffiliateSale money,
	TotalDirectIntroducedUsers int,
	AffiliateCreatedDate datetime,
	Tier1DirectRate int,
	Tier2SaleToTier1Rate int,
	Tier3SaleToTier1Rate int,
	AffiliateId int,
	IsLocked bit,
	RowNum int
);

WITH DirectIntroducedUsersCTE AS 
(
	SELECT 
		--------
		-- Id --
		--------
		su.Id,

		----------------
		-- KindOfTier --
		----------------
		CASE @Tier 
			WHEN 2
			THEN 'Tier 3' 
			WHEN 3
			THEN 'Tier 4' 
		END
		AS KindOfTier,

		-------------
		-- UsedCPL --
		-------------
		ISNULL((SELECT SUM(UnitPrice)
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId = su.Id),0)
		+
		ISNULL((SELECT SUM(Amount) 
				FROM PricePredictionHistory
				WHERE PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId = su.Id),0)
		As UsedCPL,
								 
		-------------
		-- LostCPL --
		-------------
		ISNULL((SELECT SUM(UnitPrice)
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId = su.Id),0)
		-
		ISNULL((SELECT SUM(LotteryPrize.Value)
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId = LotteryPrize.Id
				WHERE LotteryHistory.Result = 'WIN' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId = su.Id),0)
		+
		ISNULL((SELECT SUM(Amount) 
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId = su.Id),0)
		-
		ISNULL((SELECT SUM(TotalAward) 
				FROM PricePredictionHistory
				WHERE PricePredictionHistory.Result = 'WIN' -- WIN / LOSE 
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId = su.Id),0)
		As LostCPL,

		-------------------
		-- AffiliateSale --
		-------------------
			---------------------------
			-- Direct affiliate sale --
			---------------------------
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			---------------------------
			-- Tier 2 affiliate sale --
			---------------------------
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			---------------------------
			-- Tier 3 affiliate sale --
			---------------------------
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
		As AffiliateSale,

	----------------------------
	-- Direct introduced users --
	----------------------------
	   (SELECT COUNT(Id) FROM SysUser WHERE SysUser.IsIntroducedById = su.Id and SysUser.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate()))
		AS TotalDirectIntroducedUsers,

	----------------------------
	-- Affiliate created date --
	----------------------------
		su.AffiliateCreatedDate
		AS AffiliateCreatedDate,

	------------------------
	-- Tier 1 Direct Rate --
	------------------------
		aff.Tier1DirectRate
		AS Tier1DirectRate,

	---------------------------
	-- Tier 2 to Tier 1 Rate --
	---------------------------
		aff.Tier2SaleToTier1Rate
		AS Tier2SaleToTier1Rate,

	---------------------------
	-- Tier 3 to Tier 2 Rate --
	---------------------------
		aff.Tier3SaleToTier1Rate
		AS Tier3SaleToTier1Rate,
	
	------------------
	-- Affiliate Id --
	------------------
		su.AffiliateId
		AS AffiliateId,

	---------------
	-- Is Locked --
	---------------
		su.IsLocked
		AS IsLocked

	FROM   SysUser su join Affiliate aff on su.AffiliateId = aff.Id
	WHERE (su.IsIntroducedById in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@TierXUsers, ',')))
		and su.AffiliateId is not null 
		and su.AffiliateId > 0
		and su.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
),

------------------------------------------------------------------------------------------
---------------------------- 2.2 APPLY SORT / SEARCH / PAGING  --------------------------- 
------------------------------------------------------------------------------------------

DirectIntroducedUsersWithRowNumCTE AS
(	
	SELECT *, 
		RowNum = ROW_NUMBER() OVER (
			ORDER BY -- ASC
			CASE WHEN @OrderDirection = N'asc' THEN ''
				 WHEN @OrderColumn = N'KindOfTier' THEN KindOfTier
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'UsedCPL' THEN UsedCPL
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'LostCPL' THEN LostCPL
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'AffiliateSale' THEN AffiliateSale
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN 0
				 WHEN @OrderColumn = N'TotalDirectIntroducedUsers' THEN TotalDirectIntroducedUsers
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'AffiliateCreatedDate' THEN AffiliateCreatedDate
				 END DESC,

				-- DESC
			CASE WHEN @OrderDirection = N'desc' THEN ''
				 WHEN @OrderColumn = N'KindOfTier' THEN KindOfTier
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'UsedCPL' THEN UsedCPL
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'LostCPL' THEN LostCPL
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'AffiliateSale' THEN AffiliateSale
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN 0
				 WHEN @OrderColumn = N'TotalDirectIntroducedUsers' THEN TotalDirectIntroducedUsers
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'AffiliateCreatedDate' THEN AffiliateCreatedDate
				 END ASC)
	FROM DirectIntroducedUsersCTE
	WHERE(KindOfTier like '%' + @SearchValue + '%'
		  OR 
		  (CONVERT(varchar, AffiliateCreatedDate, 111) + ' ' + CONVERT(varchar, AffiliateCreatedDate, 8)) like ('%' + @SearchValue + '%'))
)
INSERT INTO @TableDirectIntroducedUsers
SELECT Id, KindOfTier, UsedCPL, LostCPL, AffiliateSale, TotalDirectIntroducedUsers, AffiliateCreatedDate, Tier1DirectRate, Tier2SaleToTier1Rate, Tier3SaleToTier1Rate, AffiliateId, IsLocked, RowNum
FROM DirectIntroducedUsersWithRowNumCTE;

SELECT Id, KindOfTier, UsedCPL, LostCPL, AffiliateSale, TotalDirectIntroducedUsers, AffiliateCreatedDate, Tier1DirectRate, Tier2SaleToTier1Rate, Tier3SaleToTier1Rate, AffiliateId, IsLocked
FROM @TableDirectIntroducedUsers
WHERE RowNum  BETWEEN ((@PageIndex - 1) * @PageSize + 1) AND (@PageIndex * @PageSize);

--///////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #2 - Total Count /////////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////--


SELECT	COUNT(*) as TotalCount
FROM	SysUser
WHERE	SysUser.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and SysUser.IsIntroducedById in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@TierXUsers, ','))

--///////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #3 - Filtered Count //////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////--

SELECT COUNT(*) as FilteredCount
FROM   @TableDirectIntroducedUsers
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAffiliateInfo_NonTier1_Statistics]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAffiliateInfo_NonTier1_Statistics]
	-- Add the parameters for the stored procedure here
	@Tier int,
	@SysUserId int,
	@PeriodInDay int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

DECLARE @TierXUsers nvarchar(MAX);
SELECT	@TierXUsers = 
		CASE @Tier 
			WHEN 2 THEN IntroducedUsers.DirectIntroducedUsers
			WHEN 3 THEN IntroducedUsers.Tier2IntroducedUsers 
		END
FROM IntroducedUsers 
WHERE IntroducedUsers.Id = @SysUserId;


DECLARE @DirectIntroducedUsers nvarchar(MAX)
DECLARE @Tier2IntroducedUsers nvarchar(MAX)
DECLARE @Tier3IntroducedUsers nvarchar(MAX)

-- INTRODUCED USERS REGARDLESS PERIOD
SELECT	@DirectIntroducedUsers = 
		(SELECT STRING_AGG(Id, ',') 
		 FROM	SysUser 
		 WHERE	SysUser.IsIntroducedById in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@TierXUsers, ','))),
		@Tier2IntroducedUsers = 
		(SELECT STRING_AGG(Id, ',') 
		 FROM	SysUser 
		 WHERE	SysUser.IsIntroducedById in 
			(SELECT	Id 
			 FROM	SysUser 
			 WHERE	SysUser.IsIntroducedById in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@TierXUsers, ',')))),
		@Tier3IntroducedUsers = 
		(SELECT STRING_AGG(Id, ',')
		 FROM	SysUser
		 WHERE	SysUser.IsIntroducedById in 
				(SELECT	Id 
				 FROM	SysUser 
				 WHERE	SysUser.IsIntroducedById in 
					(SELECT	Id 
					 FROM	SysUser 
					 WHERE	SysUser.IsIntroducedById in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@TierXUsers, ',')))))
FROM IntroducedUsers 
WHERE IntroducedUsers.Id = @SysUserId;


--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////// DATATABLE #1 -  SALE & INTRODUCED USERS ///////////////////////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--

SELECT 
	--------------------------------------------------------
	-- Total Affiliate Sale | Tier 1 Direct Afiliate Sale --
	--------------------------------------------------------
	ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
			FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
					and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsers, ','))),0)
	-
	ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
		FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsers, ','))),0)
	+
	ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
		FROM PricePredictionHistory 
		WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsers, ','))),0)
	-
	ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
		FROM PricePredictionHistory 
		WHERE   PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsers, ','))),0)
	+
	--------------------------------------------------------------------------
	-- Total Affiliate Sale | Tier 2 Affiliate Sale to Tier 1 Afiliate Sale --
	--------------------------------------------------------------------------
	ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
		FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsers, ','))),0)
	-
	ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
		FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsers, ','))),0)
	+
	ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
		FROM PricePredictionHistory 
		WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsers, ','))),0)
	-
	ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
		FROM PricePredictionHistory 
		WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsers, ','))),0)
	+
	--------------------------------------------------------------------------
	-- Total Affiliate Sale | Tier 3 Affiliate Sale to Tier 1 Afiliate Sale --
	--------------------------------------------------------------------------
	ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
		FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier3IntroducedUsers, ','))),0)
	-
	ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
		FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier3IntroducedUsers, ','))),0)
	+
	ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
		FROM PricePredictionHistory 
		WHERE	PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier3IntroducedUsers, ','))),0)
	-
	ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
		FROM PricePredictionHistory 
		WHERE	PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate()) 
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier3IntroducedUsers, ','))),0)
AS TotalAffiliateSale

FROM SysUser su 
WHERE su.Id = @SysUserId and su.AffiliateId is not null and su.AffiliateId > 0


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--//////////////////////////// DATATABLE #2 -  SALE & INTRODUCED USERS GROUPED BY DATE ////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--  1.1.1 AFFILIATE SALE - DIRECT INTRODUCED USERS - USED CPL IN LOTTERY
DECLARE @TableDirectUsedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableDirectUsedCPLInLottery
SELECT	SUM(l.UnitPrice),
		CAST(lh.CreatedDate AS DATE)
FROM	 LotteryHistory lh join Lottery l on l.Id = lh.LotteryId
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsers, ','))
GROUP BY CAST(lh.CreatedDate AS DATE)

---------------------------------------------------------
------------------------- LOTTERY -----------------------
---------------------------------------------------------

--  1.1.2 AFFILIATE SALE - DIRECT INTRODUCED USERS - AWARDED CPL IN LOTTERY
DECLARE @TableDirectAwardedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableDirectAwardedCPLInLottery
SELECT	SUM(lp.Value), 
		CAST(lh.UpdatedDate AS DATE)
FROM	 LotteryHistory lh join LotteryPrize lp on lh.LotteryPrizeId = lp.Id
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsers, ','))
GROUP BY CAST(lh.UpdatedDate AS DATE)



--  1.2.1 AFFILIATE SALE - TIER 2 INTRODUCED USERS - USED CPL IN LOTTERY
DECLARE @TableTier2UsedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier2UsedCPLInLottery
SELECT	SUM(l.UnitPrice),
		CAST(lh.CreatedDate AS DATE)
FROM	 LotteryHistory lh join Lottery l on l.Id = lh.LotteryId
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsers, ','))
GROUP BY CAST(lh.CreatedDate AS DATE)

-- 1.2.2 AFFILIATE SALE - TIER 2 INTRODUCED USERS - AWARDED CPL IN LOTTERY
DECLARE @TableTier2AwardedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier2AwardedCPLInLottery
SELECT	SUM(lp.Value), 
		CAST(lh.UpdatedDate AS DATE)
FROM	 LotteryHistory lh join LotteryPrize lp on lh.LotteryPrizeId = lp.Id
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsers, ','))
GROUP BY CAST(lh.UpdatedDate AS DATE)



--  1.3.1 AFFILIATE SALE - TIER 3 INTRODUCED USERS - USED CPL IN LOTTERY
DECLARE @TableTier3UsedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier3UsedCPLInLottery
SELECT	SUM(l.UnitPrice),
		CAST(lh.CreatedDate AS DATE)
FROM	 LotteryHistory lh join Lottery l on l.Id = lh.LotteryId
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier3IntroducedUsers, ','))
GROUP BY CAST(lh.CreatedDate AS DATE)

--  1.3.2 AFFILIATE SALE - TIER 3 INTRODUCED USERS - AWARDED CPL IN LOTTERY
DECLARE @TableTier3AwardedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier3AwardedCPLInLottery
SELECT	SUM(lp.Value), 
		CAST(lh.UpdatedDate AS DATE)
FROM	 LotteryHistory lh join LotteryPrize lp on lh.LotteryPrizeId = lp.Id
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier3IntroducedUsers, ','))
GROUP BY CAST(lh.UpdatedDate AS DATE)


---------------------------------------------------------
-------------------- PRICE PREDICTION -------------------
---------------------------------------------------------
--  2.1.1 AFFILIATE SALE - DIRECT INTRODUCED USERS - USED CPL IN PRICE PREDICTION
DECLARE @TableDirectUsedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT	INTO @TableDirectUsedCPLInPricePrediction
SELECT	SUM(pph.Amount),
		CAST(pph.CreatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.CreatedDate AS DATE)

--  2.1.2 AFFILIATE SALE - DIRECT INTRODUCED USERS - AWARDED CPL IN PRICE PREDICTION
DECLARE @TableDirectAwardedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableDirectAwardedCPLInPricePrediction
SELECT	SUM(pph.TotalAward),
		CAST(pph.UpdatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.UpdatedDate AS DATE)


--  2.2.1 AFFILIATE SALE - TIER 2 INTRODUCED USERS - USED CPL IN PRICE PREDICTION
DECLARE @TableTier2UsedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT	INTO @TableTier2UsedCPLInPricePrediction
SELECT	SUM(pph.Amount),
		CAST(pph.CreatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.CreatedDate AS DATE)

--  2.2.2 AFFILIATE SALE - TIER 2 INTRODUCED USERS - AWARDED CPL IN PRICE PREDICTION
DECLARE @TableTier2AwardedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier2AwardedCPLInPricePrediction
SELECT	SUM(pph.TotalAward),
		CAST(pph.UpdatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.UpdatedDate AS DATE)



--  2.3.1 AFFILIATE SALE - TIER 3 INTRODUCED USERS - USED CPL IN PRICE PREDICTION
DECLARE @TableTier3UsedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT	INTO @TableTier3UsedCPLInPricePrediction
SELECT	SUM(pph.Amount),
		CAST(pph.CreatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.CreatedDate AS DATE)

--  2.3.2 AFFILIATE SALE - TIER 3 INTRODUCED USERS - AWARDED CPL IN PRICE PREDICTION
DECLARE @TableTier3AwardedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier3AwardedCPLInPricePrediction
SELECT	SUM(pph.TotalAward),
		CAST(pph.UpdatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.UpdatedDate AS DATE)


DECLARE @TableTotalAffiliateSale TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTotalAffiliateSale
SELECT SUM(_Value), _Date
FROM (
	SELECT	ISNULL(dulottery.Value, 0) - ISNULL(dalottery.Value, 0) 
			+ 
			ISNULL(t2ulottery.Value, 0) - ISNULL(t2alottery.Value, 0) 
			+
			ISNULL(t3ulottery.Value, 0) - ISNULL(t3alottery.Value, 0) 
			+
			ISNULL(dupriceprediction.Value, 0) - ISNULL(dapriceprediction.Value, 0) 
			+ 
			ISNULL(t2upriceprediction.Value, 0) - ISNULL(t2apriceprediction.Value, 0) 
			+
			ISNULL(t3upriceprediction.Value, 0) - ISNULL(t3apriceprediction.Value, 0) 
			as _Value, 
			COALESCE(dulottery.Date, dalottery.Date, t2ulottery.Date, t2alottery.Date, t3ulottery.Date, t3alottery.Date,
					  dupriceprediction.Date, dapriceprediction.Date, t2upriceprediction.Date, t2apriceprediction.Date, t3upriceprediction.Date, t3apriceprediction.Date) as _Date
	FROM	@TableDirectUsedCPLInLottery dulottery
			full outer join @TableDirectAwardedCPLInLottery dalottery on dulottery.Date = dalottery.Date
			full outer join @TableTier2UsedCPLInLottery t2ulottery on dulottery.Date = t2ulottery.Date
			full outer join @TableTier2AwardedCPLInLottery t2alottery on dulottery.Date = t2alottery.Date
			full outer join @TableTier3UsedCPLInLottery t3ulottery on dulottery.Date = t3ulottery.Date
			full outer join @TableTier3AwardedCPLInLottery t3alottery on dulottery.Date = t3alottery.Date
			full outer join @TableDirectUsedCPLInPricePrediction dupriceprediction on dulottery.Date = dupriceprediction.Date
			full outer join @TableDirectAwardedCPLInPricePrediction dapriceprediction on dulottery.Date = dapriceprediction.Date
			full outer join @TableTier2UsedCPLInPricePrediction t2upriceprediction on dulottery.Date = t2upriceprediction.Date
			full outer join @TableTier2AwardedCPLInPricePrediction t2apriceprediction on dulottery.Date = t2apriceprediction.Date
			full outer join @TableTier3UsedCPLInPricePrediction t3upriceprediction on dulottery.Date = t3upriceprediction.Date
			full outer join @TableTier3AwardedCPLInPricePrediction t3apriceprediction on dulottery.Date = t3apriceprediction.Date
	GROUP BY COALESCE(dulottery.Date, dalottery.Date, t2ulottery.Date, t2alottery.Date, t3ulottery.Date, t3alottery.Date,
					  dupriceprediction.Date, dapriceprediction.Date, t2upriceprediction.Date, t2apriceprediction.Date, t3upriceprediction.Date, t3apriceprediction.Date), 
			ISNULL(dulottery.Value, 0) - ISNULL(dalottery.Value, 0) 
			+ 
			ISNULL(t2ulottery.Value, 0) - ISNULL(t2alottery.Value, 0) 
			+
			ISNULL(t3ulottery.Value, 0) - ISNULL(t3alottery.Value, 0) 
			+
			ISNULL(dupriceprediction.Value, 0) - ISNULL(dapriceprediction.Value, 0) 
			+ 
			ISNULL(t2upriceprediction.Value, 0) - ISNULL(t2apriceprediction.Value, 0) 
			+
			ISNULL(t3upriceprediction.Value, 0) - ISNULL(t3apriceprediction.Value, 0) 
) AS TableTotalAffiliateSale
GROUP BY _Date


------------------------ FINALIZE THEM ALL ------------------------
SELECT	SUM(ISNULL(tas.Value, 0)) as TotalAffiliateSale, 
		tas.Date as Date
FROM	@TableTotalAffiliateSale tas
GROUP BY tas.Date

--SELECT * 
--FROM @TableTotalAffiliateSale;

END	
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAffiliateInfo_Tier1_IntroducedUsers]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAffiliateInfo_Tier1_IntroducedUsers]
	-- Add the parameters for the stored procedure here
	@SysUserId int,
	@PeriodInDay int,
	@PageSize int,
	@PageIndex int,
	@OrderColumn nvarchar(30),
	@OrderDirection nvarchar(5),
	@SearchValue nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #1 - INTRODUCED TIER 2 & TIER 3 USERS IN DETAILS /////////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--

-------------------- BEGIN SETTING PARAM FOR TESTING PURPOSE --------------------
	--DECLARE @SysUserId int;
	--SET @SysUserId = 1;

	--DECLARE @PeriodInDay int;
	--SET @PeriodInDay = 300;
-------------------- END SETTING PARAM FOR TESTING PURPOSE --------------------

DECLARE @DirectIntroducedUsersOnPeriod nvarchar(MAX);
DECLARE @Tier2IntroducedUsersOnPeriod nvarchar(MAX);
DECLARE @FilteredCount int;
DECLARE @TotalCount int;

SELECT @DirectIntroducedUsersOnPeriod = STRING_AGG(Id, ',')
FROM SysUser Tier1
WHERE Tier1.IsIntroducedById = @SysUserId and Tier1.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())

SELECT @Tier2IntroducedUsersOnPeriod = STRING_AGG(Id, ',') 
FROM SysUser Tier2 
WHERE Tier2.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and Tier2.IsIntroducedById in 
		(SELECT Id 
		 FROM SysUser Tier1
		 WHERE Tier1.IsIntroducedById = @SysUserId)

------------------------------------------------------------------------------------
-------------------------- 1.1 CONSTRUCT SQL QUERY FIRST --------------------------- 
------------------------------------------------------------------------------------
DECLARE @TableIntroducedUsers TABLE
(
	Id int, 
	KindOfTier nvarchar(20),
	UsedCPL money,
	LostCPL money,
	AffiliateSale money,
	TotalDirectIntroducedUsers int,
	AffiliateCreatedDate datetime,
	Tier1DirectRate int,
	Tier2SaleToTier1Rate int,
	Tier3SaleToTier1Rate int,
	AffiliateId int,
	IsLocked bit,
	RowNum int
);

WITH IntroducedUsersCTE AS 
(
	SELECT 
		--------
		-- Id --
		--------
		su.Id,

		----------------
		-- KindOfTier --
		----------------
		CASE WHEN su.Id in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsersOnPeriod, ','))
				THEN 'Tier 2' -- Tier 2
				WHEN su.Id in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsersOnPeriod, ','))
				THEN 'Tier 3' -- Tier 3
				END
		AS KindOfTier,

		-------------
		-- UsedCPL --
		-------------
		ISNULL((SELECT SUM(UnitPrice)
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId = su.Id),0)
		+
		ISNULL((SELECT SUM(Amount) 
				FROM PricePredictionHistory
				WHERE PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId = su.Id),0)
		As UsedCPL,
								 
		-------------
		-- LostCPL --
		-------------
		ISNULL((SELECT SUM(UnitPrice)
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId = su.Id),0)
		-
		ISNULL((SELECT SUM(LotteryPrize.Value)
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId = LotteryPrize.Id
				WHERE LotteryHistory.Result = 'WIN' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId = su.Id),0)
		+
		ISNULL((SELECT SUM(Amount) 
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId = su.Id),0)
		-
		ISNULL((SELECT SUM(TotalAward) 
				FROM PricePredictionHistory
				WHERE PricePredictionHistory.Result = 'WIN' -- WIN / LOSE 
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId = su.Id),0)
		As LostCPL,

		-------------------
		-- AffiliateSale --
		-------------------
			---------------------------
			-- Direct affiliate sale --
			---------------------------
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			---------------------------
			-- Tier 2 affiliate sale --
			---------------------------
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)

			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			---------------------------
			-- Tier 3 affiliate sale --
			---------------------------
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory 
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = su.Id), ','))),0)
		As AffiliateSale,

	----------------------------
	-- Direct introduced users --
	----------------------------
	   (SELECT COUNT(Id) FROM SysUser WHERE SysUser.IsIntroducedById = su.Id and SysUser.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate()))
		AS TotalDirectIntroducedUsers,

	----------------------------
	-- Affiliate created date --
	----------------------------
		su.AffiliateCreatedDate
		AS AffiliateCreatedDate,

	------------------------
	-- Tier 1 Direct Rate --
	------------------------
		aff.Tier1DirectRate
		AS Tier1DirectRate,

	---------------------------
	-- Tier 2 to Tier 1 Rate --
	---------------------------
		aff.Tier2SaleToTier1Rate
		AS Tier2SaleToTier1Rate,

	---------------------------
	-- Tier 3 to Tier 2 Rate --
	---------------------------
		aff.Tier3SaleToTier1Rate
		AS Tier3SaleToTier1Rate,
	
	------------------
	-- Affiliate Id --
	------------------
		su.AffiliateId
		AS AffiliateId,

	---------------
	-- Is Locked --
	---------------
		su.IsLocked
		AS IsLocked

	FROM   SysUser su join Affiliate aff on su.AffiliateId = aff.Id
	WHERE (su.Id in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@DirectIntroducedUsersOnPeriod, ','))
		or su.Id in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@Tier2IntroducedUsersOnPeriod, ',')))
		and su.AffiliateId is not null 
		and su.AffiliateId > 0
),

------------------------------------------------------------------------------------------
---------------------------- 1.2 APPLY SORT / SEARCH / PAGING  --------------------------- 
------------------------------------------------------------------------------------------

IntroducedUsersWithRowNumCTE AS
(	
	SELECT *, 
		RowNum = ROW_NUMBER() OVER (
			ORDER BY -- ASC
			CASE WHEN @OrderDirection = N'asc' THEN ''
				 WHEN @OrderColumn = N'KindOfTier' THEN KindOfTier
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'UsedCPL' THEN UsedCPL
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'LostCPL' THEN LostCPL
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'AffiliateSale' THEN AffiliateSale
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN 0
				 WHEN @OrderColumn = N'TotalDirectIntroducedUsers' THEN TotalDirectIntroducedUsers
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'AffiliateCreatedDate' THEN AffiliateCreatedDate
				 END DESC,

				-- DESC
			CASE WHEN @OrderDirection = N'desc' THEN ''
				 WHEN @OrderColumn = N'KindOfTier' THEN KindOfTier
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'UsedCPL' THEN UsedCPL
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'LostCPL' THEN LostCPL
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'AffiliateSale' THEN AffiliateSale
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN 0
				 WHEN @OrderColumn = N'TotalDirectIntroducedUsers' THEN TotalDirectIntroducedUsers
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'AffiliateCreatedDate' THEN AffiliateCreatedDate
				 END ASC)
	FROM IntroducedUsersCTE
	WHERE(KindOfTier like '%' + @SearchValue + '%'
		  OR 
		  (CONVERT(varchar, AffiliateCreatedDate, 111) + ' ' + CONVERT(varchar, AffiliateCreatedDate, 8)) like ('%' + @SearchValue + '%'))
)
INSERT INTO @TableIntroducedUsers
SELECT Id, KindOfTier, UsedCPL, LostCPL, AffiliateSale, TotalDirectIntroducedUsers, AffiliateCreatedDate, Tier1DirectRate, Tier2SaleToTier1Rate, Tier3SaleToTier1Rate, AffiliateId, IsLocked, RowNum
FROM IntroducedUsersWithRowNumCTE;

SELECT Id, KindOfTier, UsedCPL, LostCPL, AffiliateSale, TotalDirectIntroducedUsers, AffiliateCreatedDate, Tier1DirectRate, Tier2SaleToTier1Rate, Tier3SaleToTier1Rate, AffiliateId, IsLocked
FROM @TableIntroducedUsers
WHERE RowNum  BETWEEN ((@PageIndex - 1) * @PageSize + 1) AND (@PageIndex * @PageSize);

--///////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #2 - Total Count /////////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////--


SELECT ISNULL((LEN(@DirectIntroducedUsersOnPeriod) - LEN(REPLACE(@DirectIntroducedUsersOnPeriod,',','')) + 1),0)
	 + ISNULL((LEN(@Tier2IntroducedUsersOnPeriod) - LEN(REPLACE(@Tier2IntroducedUsersOnPeriod,',','')) + 1),0) as TotalCount

--///////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #3 - Filtered Count //////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////--

SELECT COUNT(*) as FilteredCount
FROM   @TableIntroducedUsers
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAffiliateInfo_Tier1_Statistics]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAffiliateInfo_Tier1_Statistics]
	-- Add the parameters for the stored procedure here
	@SysUserId int,
	@PeriodInDay int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

DECLARE @DirectIntroducedUsersOnPeriod nvarchar(MAX)
DECLARE @Tier2IntroducedUsersOnPeriod nvarchar(MAX)
DECLARE @Tier3IntroducedUsersOnPeriod nvarchar(MAX)

-- INTRODUCED USERS ON PERIOD
SELECT @DirectIntroducedUsersOnPeriod = STRING_AGG(Id, ',')
FROM SysUser Tier1
WHERE Tier1.IsIntroducedById = @SysUserId and Tier1.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())

--Tier 2 Introduced Users on period
SELECT @Tier2IntroducedUsersOnPeriod = STRING_AGG(Id, ',') 
FROM SysUser Tier2 
WHERE	  Tier2.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	  and Tier2.IsIntroducedById in 
			(SELECT	Id 
			 FROM	SysUser Tier1
			 WHERE	Tier1.IsIntroducedById = @SysUserId)

--Tier 3 Introduced Users on period
SELECT @Tier3IntroducedUsersOnPeriod = STRING_AGG(Id, ',') 
FROM SysUser Tier3 
WHERE	  Tier3.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	  and Tier3.IsIntroducedById in 
		   (SELECT	Id 
			FROM	SysUser Tier2
			WHERE	Tier2.IsIntroducedById in 
					   (SELECT	Id
						FROM	SysUser Tier1 
						WHERE	Tier1.IsIntroducedById = @SysUserId))


--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--/////////////////////////////////// DATATABLE #1 -  SALE & INTRODUCED USERS ///////////////////////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--

SELECT 
	--------------------------------------------------------
	-- Total Affiliate Sale | Tier 1 Direct Afiliate Sale --
	--------------------------------------------------------
	ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
			FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
					and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
		FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	+
	ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
		FROM PricePredictionHistory 
		WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
		FROM PricePredictionHistory 
		WHERE   PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	+
	--------------------------------------------------------------------------
	-- Total Affiliate Sale | Tier 2 Affiliate Sale to Tier 1 Afiliate Sale --
	--------------------------------------------------------------------------
	ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
		FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
		FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	+
	ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
		FROM PricePredictionHistory 
		WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
		FROM PricePredictionHistory 
		WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	+
	--------------------------------------------------------------------------
	-- Total Affiliate Sale | Tier 3 Affiliate Sale to Tier 1 Afiliate Sale --
	--------------------------------------------------------------------------
	ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
		FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
		FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	+
	ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
		FROM PricePredictionHistory 
		WHERE	PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
		FROM PricePredictionHistory 
		WHERE	PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate()) 
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
AS TotalAffiliateSale,

---------------------------
-- Direct Affiliate Sale --
---------------------------
	ISNULL((SELECT SUM(UnitPrice) as TotalDirectCPLUsedInLottery
			FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
			WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
					and Lottery.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
					and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(Value) as TotalDirectCPLAwardedInLottery
		FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
		WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
				and LotteryHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	+
	ISNULL((SELECT SUM(Amount) as TotalDirectCPLUsedInPricePrediction
		FROM PricePredictionHistory 
		WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
	-
	ISNULL((SELECT SUM(TotalAward) as TotalDirectCPLAwardedInPricePrediction
		FROM PricePredictionHistory 
		WHERE   PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE 
				and PricePredictionHistory.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))),0)
AS DirectAffiliateSale,

--------------------------
-- Total Introduced Users --
--------------------------
	ISNULL((LEN(@DirectIntroducedUsersOnPeriod) - LEN(REPLACE(@DirectIntroducedUsersOnPeriod,',','')) + 1),0)
	+ 
	ISNULL((LEN(@Tier2IntroducedUsersOnPeriod) - LEN(REPLACE(@Tier2IntroducedUsersOnPeriod,',','')) + 1),0)
	+ 
	ISNULL((LEN(@Tier3IntroducedUsersOnPeriod) - LEN(REPLACE(@Tier3IntroducedUsersOnPeriod,',','')) + 1),0)
AS TotalIntroducedUsers,

---------------------------
-- Direct Introduced Users --
---------------------------
	ISNULL((LEN(@DirectIntroducedUsersOnPeriod) - LEN(REPLACE(@DirectIntroducedUsersOnPeriod,',','')) + 1),0)
AS DirectIntroducedUsers

FROM SysUser su 
WHERE su.Id = @SysUserId and su.AffiliateId is not null and su.AffiliateId > 0


--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--//////////////////////////// DATATABLE #2 -  SALE & INTRODUCED USERS GROUPED BY DATE ////////////////////////////////////--
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--  1.1.1 AFFILIATE SALE - DIRECT INTRODUCED USERS - USED CPL IN LOTTERY
DECLARE @TableDirectUsedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableDirectUsedCPLInLottery
SELECT	SUM(l.UnitPrice),
		CAST(lh.CreatedDate AS DATE)
FROM	 LotteryHistory lh join Lottery l on l.Id = lh.LotteryId
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(lh.CreatedDate AS DATE)

---------------------------------------------------------
------------------------- LOTTERY -----------------------
---------------------------------------------------------

--  1.1.2 AFFILIATE SALE - DIRECT INTRODUCED USERS - AWARDED CPL IN LOTTERY
DECLARE @TableDirectAwardedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableDirectAwardedCPLInLottery
SELECT	SUM(lp.Value), 
		CAST(lh.UpdatedDate AS DATE)
FROM	 LotteryHistory lh join LotteryPrize lp on lh.LotteryPrizeId = lp.Id
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(lh.UpdatedDate AS DATE)



--  1.2.1 AFFILIATE SALE - TIER 2 INTRODUCED USERS - USED CPL IN LOTTERY
DECLARE @TableTier2UsedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier2UsedCPLInLottery
SELECT	SUM(l.UnitPrice),
		CAST(lh.CreatedDate AS DATE)
FROM	 LotteryHistory lh join Lottery l on l.Id = lh.LotteryId
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(lh.CreatedDate AS DATE)

-- 1.2.2 AFFILIATE SALE - TIER 2 INTRODUCED USERS - AWARDED CPL IN LOTTERY
DECLARE @TableTier2AwardedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier2AwardedCPLInLottery
SELECT	SUM(lp.Value), 
		CAST(lh.UpdatedDate AS DATE)
FROM	 LotteryHistory lh join LotteryPrize lp on lh.LotteryPrizeId = lp.Id
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(lh.UpdatedDate AS DATE)



--  1.3.1 AFFILIATE SALE - TIER 3 INTRODUCED USERS - USED CPL IN LOTTERY
DECLARE @TableTier3UsedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier3UsedCPLInLottery
SELECT	SUM(l.UnitPrice),
		CAST(lh.CreatedDate AS DATE)
FROM	 LotteryHistory lh join Lottery l on l.Id = lh.LotteryId
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(lh.CreatedDate AS DATE)

--  1.3.2 AFFILIATE SALE - TIER 3 INTRODUCED USERS - AWARDED CPL IN LOTTERY
DECLARE @TableTier3AwardedCPLInLottery TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier3AwardedCPLInLottery
SELECT	SUM(lp.Value), 
		CAST(lh.UpdatedDate AS DATE)
FROM	 LotteryHistory lh join LotteryPrize lp on lh.LotteryPrizeId = lp.Id
WHERE	lh.Result is not null and lh.Result <> 'REFUND' -- WIN / LOSE 
	and lh.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
	and lh.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(lh.UpdatedDate AS DATE)


---------------------------------------------------------
-------------------- PRICE PREDICTION -------------------
---------------------------------------------------------
--  2.1.1 AFFILIATE SALE - DIRECT INTRODUCED USERS - USED CPL IN PRICE PREDICTION
DECLARE @TableDirectUsedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT	INTO @TableDirectUsedCPLInPricePrediction
SELECT	SUM(pph.Amount),
		CAST(pph.CreatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.CreatedDate AS DATE)

--  2.1.2 AFFILIATE SALE - DIRECT INTRODUCED USERS - AWARDED CPL IN PRICE PREDICTION
DECLARE @TableDirectAwardedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableDirectAwardedCPLInPricePrediction
SELECT	SUM(pph.TotalAward),
		CAST(pph.UpdatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT DirectIntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.UpdatedDate AS DATE)


--  2.2.1 AFFILIATE SALE - TIER 2 INTRODUCED USERS - USED CPL IN PRICE PREDICTION
DECLARE @TableTier2UsedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT	INTO @TableTier2UsedCPLInPricePrediction
SELECT	SUM(pph.Amount),
		CAST(pph.CreatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.CreatedDate AS DATE)

--  2.2.2 AFFILIATE SALE - TIER 2 INTRODUCED USERS - AWARDED CPL IN PRICE PREDICTION
DECLARE @TableTier2AwardedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier2AwardedCPLInPricePrediction
SELECT	SUM(pph.TotalAward),
		CAST(pph.UpdatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier2IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.UpdatedDate AS DATE)



--  2.3.1 AFFILIATE SALE - TIER 3 INTRODUCED USERS - USED CPL IN PRICE PREDICTION
DECLARE @TableTier3UsedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT	INTO @TableTier3UsedCPLInPricePrediction
SELECT	SUM(pph.Amount),
		CAST(pph.CreatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.CreatedDate AS DATE)

--  2.3.2 AFFILIATE SALE - TIER 3 INTRODUCED USERS - AWARDED CPL IN PRICE PREDICTION
DECLARE @TableTier3AwardedCPLInPricePrediction TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTier3AwardedCPLInPricePrediction
SELECT	SUM(pph.TotalAward),
		CAST(pph.UpdatedDate AS DATE)
FROM	PricePredictionHistory pph 
		WHERE	pph.Result is not null and pph.Result <> 'REFUND' -- WIN / LOSE 
				and pph.UpdatedDate >= DATEADD(d, -@PeriodInDay, getdate())
				and pph.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT((SELECT Tier3IntroducedUsers FROM IntroducedUsers WHERE IntroducedUsers.Id = @SysUserId), ','))
GROUP BY CAST(pph.UpdatedDate AS DATE)


DECLARE @TableTotalAffiliateSale TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTotalAffiliateSale
SELECT SUM(_Value), _Date
FROM (
	SELECT	ISNULL(dulottery.Value, 0) - ISNULL(dalottery.Value, 0) 
			+ 
			ISNULL(t2ulottery.Value, 0) - ISNULL(t2alottery.Value, 0) 
			+
			ISNULL(t3ulottery.Value, 0) - ISNULL(t3alottery.Value, 0) 
			+
			ISNULL(dupriceprediction.Value, 0) - ISNULL(dapriceprediction.Value, 0) 
			+ 
			ISNULL(t2upriceprediction.Value, 0) - ISNULL(t2apriceprediction.Value, 0) 
			+
			ISNULL(t3upriceprediction.Value, 0) - ISNULL(t3apriceprediction.Value, 0) 
			as _Value, 
			COALESCE(dulottery.Date, dalottery.Date, t2ulottery.Date, t2alottery.Date, t3ulottery.Date, t3alottery.Date,
					  dupriceprediction.Date, dapriceprediction.Date, t2upriceprediction.Date, t2apriceprediction.Date, t3upriceprediction.Date, t3apriceprediction.Date) as _Date
	FROM	@TableDirectUsedCPLInLottery dulottery
			full outer join @TableDirectAwardedCPLInLottery dalottery on dulottery.Date = dalottery.Date
			full outer join @TableTier2UsedCPLInLottery t2ulottery on dulottery.Date = t2ulottery.Date
			full outer join @TableTier2AwardedCPLInLottery t2alottery on dulottery.Date = t2alottery.Date
			full outer join @TableTier3UsedCPLInLottery t3ulottery on dulottery.Date = t3ulottery.Date
			full outer join @TableTier3AwardedCPLInLottery t3alottery on dulottery.Date = t3alottery.Date
			full outer join @TableDirectUsedCPLInPricePrediction dupriceprediction on dulottery.Date = dupriceprediction.Date
			full outer join @TableDirectAwardedCPLInPricePrediction dapriceprediction on dulottery.Date = dapriceprediction.Date
			full outer join @TableTier2UsedCPLInPricePrediction t2upriceprediction on dulottery.Date = t2upriceprediction.Date
			full outer join @TableTier2AwardedCPLInPricePrediction t2apriceprediction on dulottery.Date = t2apriceprediction.Date
			full outer join @TableTier3UsedCPLInPricePrediction t3upriceprediction on dulottery.Date = t3upriceprediction.Date
			full outer join @TableTier3AwardedCPLInPricePrediction t3apriceprediction on dulottery.Date = t3apriceprediction.Date
	GROUP BY COALESCE(dulottery.Date, dalottery.Date, t2ulottery.Date, t2alottery.Date, t3ulottery.Date, t3alottery.Date,
					  dupriceprediction.Date, dapriceprediction.Date, t2upriceprediction.Date, t2apriceprediction.Date, t3upriceprediction.Date, t3apriceprediction.Date), 
			ISNULL(dulottery.Value, 0) - ISNULL(dalottery.Value, 0) 
			+ 
			ISNULL(t2ulottery.Value, 0) - ISNULL(t2alottery.Value, 0) 
			+
			ISNULL(t3ulottery.Value, 0) - ISNULL(t3alottery.Value, 0) 
			+
			ISNULL(dupriceprediction.Value, 0) - ISNULL(dapriceprediction.Value, 0) 
			+ 
			ISNULL(t2upriceprediction.Value, 0) - ISNULL(t2apriceprediction.Value, 0) 
			+
			ISNULL(t3upriceprediction.Value, 0) - ISNULL(t3apriceprediction.Value, 0) 
) AS TableTotalAffiliateSale
GROUP BY _Date

DECLARE @TableTotalDirectAffiliateSale TABLE
(
	Value money, 
	Date datetime
);

INSERT INTO @TableTotalDirectAffiliateSale
SELECT SUM(Value), Date
FROM (
	SELECT	ISNULL(dulottery.Value, 0) - ISNULL(dalottery.Value, 0) 
			+
			ISNULL(dupriceprediction.Value, 0) - ISNULL(dapriceprediction.Value, 0) 
			as Value, 
			COALESCE(dulottery.Date, dalottery.Date, dupriceprediction.Date, dapriceprediction.Date) as Date
	FROM	@TableDirectUsedCPLInLottery dulottery
			full outer join @TableDirectAwardedCPLInLottery dalottery on dulottery.Date = dalottery.Date
			full outer join @TableDirectUsedCPLInPricePrediction dupriceprediction on dulottery.Date = dupriceprediction.Date
			full outer join @TableDirectAwardedCPLInPricePrediction dapriceprediction on dulottery.Date = dapriceprediction.Date
	GROUP BY COALESCE(dulottery.Date, dalottery.Date, dupriceprediction.Date, dapriceprediction.Date), 
			ISNULL(dulottery.Value, 0) - ISNULL(dalottery.Value, 0) 
			+
			ISNULL(dupriceprediction.Value, 0) - ISNULL(dapriceprediction.Value, 0) 
) AS TableDirectAffiliateSale
GROUP BY Date



--  3.1 NUMBER - DIRECT INTRODUCED USERS
DECLARE @TableTotalDirectIntroducedUsers TABLE
(
	Value int, 
	Date datetime
);

INSERT INTO @TableTotalDirectIntroducedUsers
SELECT	COUNT(Id), CAST(CreatedDate AS DATE)
		FROM	SysUser 
		WHERE	CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
			and IsIntroducedById =  @SysUserId
GROUP BY CAST(CreatedDate AS DATE)

--  3.2 NUMBER - TIER 2 INTRODUCED USERS
DECLARE @TableTier2IntroducedUsers TABLE
(
	Value int, 
	Date datetime
);

INSERT INTO @TableTier2IntroducedUsers
SELECT	COUNT(Id), CAST(CreatedDate AS DATE)
		FROM	SysUser 
		WHERE	CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
			and SysUser.IsIntroducedById in (
				SELECT	Id
				FROM	SysUser 
				WHERE	SysUser.IsIntroducedById =  @SysUserId)
GROUP BY CAST(CreatedDate AS DATE)

--  3.3 NUMBER - TIER 3 INTRODUCED USERS
DECLARE @TableTier3IntroducedUsers TABLE
(
	Value int, 
	Date datetime
);

INSERT INTO @TableTier3IntroducedUsers
SELECT	COUNT(Id), CAST(CreatedDate AS DATE)
		FROM	SysUser 
		WHERE	CreatedDate >= DATEADD(d, -@PeriodInDay, getdate())
			and SysUser.IsIntroducedById in (
				SELECT	Id
				FROM	SysUser 
				WHERE	SysUser.IsIntroducedById in (
						SELECT	Id
						FROM	SysUser 
						WHERE	SysUser.IsIntroducedById =  @SysUserId))
GROUP BY CAST(CreatedDate AS DATE)

DECLARE @TableTotalIntroducedUsers TABLE
(
	Value int, 
	Date datetime
);


INSERT INTO @TableTotalIntroducedUsers
SELECT SUM(Value), Date
FROM (
	SELECT	ISNULL(diu.Value, 0) + ISNULL(t2iu.Value, 0) + ISNULL(t3iu.Value, 0)
			as Value, 
			COALESCE(diu.Date, t2iu.Date, t3iu.Date) as Date
	FROM	@TableTotalDirectIntroducedUsers diu
			full outer join @TableTier2IntroducedUsers t2iu on diu.Date = t2iu.Date
			full outer join @TableTier3IntroducedUsers t3iu on diu.Date = t3iu.Date
	GROUP BY ISNULL(diu.Value, 0) + ISNULL(t2iu.Value, 0) + ISNULL(t3iu.Value, 0),
			COALESCE(diu.Date, t2iu.Date, t3iu.Date)
) TotalIntrocuedUsers
GROUP BY Date


------------------------ FINALIZE THEM ALL ------------------------
SELECT	SUM(ISNULL(tas.Value, 0)) as TotalAffiliateSale, 
		SUM(ISNULL(das.Value, 0)) as DirectAffiliateSale, 
		SUM(ISNULL(tiu.Value, 0)) as TotalIntroducedUsers, 
		SUM(ISNULL(diu.Value, 0)) as DirectIntroducedUsers, 
		COALESCE(das.Date, tas.Date, tiu.Date, diu.Date) as Date
FROM	@TableTotalDirectAffiliateSale das
		full outer join @TableTotalAffiliateSale tas on das.Date = tas.Date
		full outer join @TableTotalIntroducedUsers tiu on das.Date = tiu.Date
		full outer join @TableTotalDirectIntroducedUsers diu on das.Date = diu.Date
GROUP BY COALESCE(das.Date, tas.Date, tiu.Date, diu.Date)

--SELECT * 
--FROM @TableTotalAffiliateSale;

--SELECT *
--FROM @TableTotalDirectAffiliateSale;

--SELECT * 
--FROM @TableTotalDirectIntroducedUsers

--SELECT * 
--FROM @TableTier2IntroducedUsers

--SELECT * 
--FROM @TableTier3IntroducedUsers

--SELECT *
--FROM @TableTotalIntroducedUsers;
END	
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAffiliateSale]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetAffiliateSale]
	-- Add the parameters for the stored procedure here
	@SysUserId int,
	@TotalAffiliateSale money OUTPUT,
	@TodayAffiliateSale money OUTPUT,
	@YesterdayAffiliateSale money OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- List of introduced users by @SysUserId
	DECLARE @directIntroducedUsers nvarchar(MAX);
	DECLARE @tier2IntroducedUsers nvarchar(MAX);
	DECLARE @tier3IntroducedUsers nvarchar(MAX);
	SELECT 
		-- Direct introduced users
		@directIntroducedUsers = DirectIntroducedUsers,
		-- Tier 2 introduced users
		@tier2IntroducedUsers = Tier2IntroducedUsers,
		-- Tier 3 introduced users
		@tier3IntroducedUsers = Tier3IntroducedUsers

	FROM dbo.IntroducedUsers
	WHERE Id = @SysUserId;

	SELECT @directIntroducedUsers as Direct, @tier2IntroducedUsers as Tier2, @tier3IntroducedUsers as tier3

    -- Insert statements for procedure here
	SELECT @TotalAffiliateSale = TotalAffiliateSale,
		@TodayAffiliateSale = TodayAffiliateSale,
		@YesterdayAffiliateSale = YesterdayAffiliateSale
	FROM (
	SELECT
		----------------
		-- Total sale --
		----------------
		--(SELECT MAX(Value) FROM (VALUES (0), (
			-----------------
			-- Direct sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-- Plus tier 1 sale
				+
			-----------------
			-- Tier 2 sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			----- Price prediction
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-- Plus tier 1 sale
				+
			-----------------
			-- Tier 3 sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
									join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			----- Price prediction
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
		--				)) Total(Value))
		As TotalAffiliateSale,

		----------------
		-- Today sale --
		----------------
		--(SELECT MAX(Value) FROM (VALUES (0), (
			-----------------
			-- Direct sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE
						and Lottery.UpdatedDate >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and Lottery.UpdatedDate < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE
						and LotteryHistory.UpdatedDate >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.UpdatedDate < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-- Plus tier 1 sale
				+
			-----------------
			-- Tier 2 sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and Lottery.UpdatedDate >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and Lottery.UpdatedDate < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.UpdatedDate < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			----- Price prediction
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-- Plus tier 1 sale
				+
			-----------------
			-- Tier 3 sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and Lottery.UpdatedDate >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and Lottery.UpdatedDate < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and LotteryHistory.UpdatedDate >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.UpdatedDate < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			----- Price prediction
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,-1,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			--			)) Today(Value))
		As TodayAffiliateSale,

		--------------------
		-- Yesterday sale --
		--------------------
		--(SELECT MAX(Value) FROM (VALUES (0), (
			-----------------
			-- Direct sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE
						and	Lottery.UpdatedDate >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and Lottery.UpdatedDate < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE
						and	LotteryHistory.UpdatedDate >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and LotteryHistory.UpdatedDate < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@directIntroducedUsers, ','))),0)
			-- Plus tier 1 sale
				+
			-----------------
			-- Tier 2 sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and	Lottery.UpdatedDate >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and Lottery.UpdatedDate < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and	LotteryHistory.UpdatedDate >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and LotteryHistory.UpdatedDate < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			----- Price prediction
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier2IntroducedUsers, ','))),0)
			-- Plus tier 1 sale
				+
			-----------------
			-- Tier 3 sale --
			-----------------
			----- Lottery
			ISNULL((SELECT SUM(UnitPrice) as TotalCPLUsedInLottery
				FROM LotteryHistory join Lottery on LotteryHistory.LotteryId = Lottery.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and	Lottery.UpdatedDate >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and Lottery.UpdatedDate < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(Value) as TotalCPLAwardedInLottery
				FROM LotteryHistory join LotteryPrize on LotteryHistory.LotteryPrizeId  = LotteryPrize.Id
				WHERE LotteryHistory.Result is not null and LotteryHistory.Result <> 'REFUND' -- WIN / LOSE 
						and	LotteryHistory.UpdatedDate >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and LotteryHistory.UpdatedDate < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and LotteryHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-- Plus Price prediction
				+
			----- Price prediction
			ISNULL((SELECT SUM(Amount) as TotalCPLUsedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
			-
			ISNULL((SELECT SUM(TotalAward) as TotalCPLAwardedInPricePrediction
				FROM PricePredictionHistory join PricePrediction on PricePredictionHistory.PricePredictionId = PricePrediction.Id
				WHERE PricePredictionHistory.Result is not null and PricePredictionHistory.Result <> 'REFUND' -- WIN / LOSE
						and PricePrediction.ResultTime >= DATEADD(day,DATEDIFF(day,1,GETDATE()),0)
						and PricePrediction.ResultTime < DATEADD(day,DATEDIFF(day,0,GETDATE()),0)
						and PricePredictionHistory.SysUserId in (SELECT CAST(Value AS int) FROM STRING_SPLIT(@tier3IntroducedUsers, ','))),0)
		--				)) Yesterday(Value))
		As YesterdayAffiliateSale
	FROM SysUser su
	WHERE Id = @SysUserId and AffiliateId is not null and AffiliateId > 0
	) AffiliateSale

	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetGameHistory]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetGameHistory] 
	-- Add the parameters for the stored procedure here
	@SysUserId int,
	@PageSize int,
	@PageIndex int,
	@OrderColumn nvarchar(30),
	@OrderDirection nvarchar(5),
	@SearchValue nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
------------------------------------------------------------------------------------
-------------------------- 1.1 CONSTRUCT SQL QUERY FIRST --------------------------- 
------------------------------------------------------------------------------------
DECLARE @TableGameHistory TABLE
(
	GameId int, 
	CreatedDate datetime,
	CreatedDateInString nvarchar(20),
	CreatedTimeInString nvarchar(20),
	Amount money,
	Result nvarchar(20),
	Balance money,
	Award money,
	GameType nvarchar(50),
	RowNum int
);

WITH GameHistoryCTE AS
(
	------------------
	-- Lottery Game --
	------------------
	SELECT
		------------
		-- GameId --
		------------
		lh.LotteryId as GameId,

		-----------------
		-- CreatedDate --
		-----------------
		MAX(lh.CreatedDate) AS CreatedDate,

		-------------------------
		-- CreatedDateInString --
		-------------------------
		CONVERT(varchar, MAX(lh.CreatedDate), 111) AS CreatedDateInString,

		-------------------------
		-- CreatedTimeInString --
		-------------------------
		CONVERT(varchar, MAX(lh.CreatedDate), 8) AS CreatedTimeInString,

		------------
		-- Amount --
		------------
		SUM(lot.UnitPrice) AS Amount,

		------------
		-- Result --
		------------
		CASE WHEN SUM(CASE lh.Result WHEN 'WIN' THEN 1 ELSE 0 END) > 0
             THEN 'WIN'
			 WHEN SUM(CASE WHEN lh.Result is null THEN 1 ELSE 0 END) > 0
			 THEN ''
             ELSE 'LOSE'
		END AS Result,

		-------------
		-- Balance --
		-------------
		CASE WHEN SUM(CASE WHEN lh.Result is null THEN 1 ELSE 0 END) > 0
			 THEN 0
             ELSE SUM(ISNULL(lp.Value,0)) - SUM(lot.UnitPrice)
		END AS Balance,

		-----------
		-- Award --
		-----------
		SUM(ISNULL(lp.Value,0)) AS Award,
		
		--------------
		-- GameType --
		--------------
		'Lottery' AS GameType

	FROM LotteryHistory lh
			join Lottery lot on lh.LotteryId = lot.Id
			left join LotteryPrize lp on lh.LotteryPrizeId = lp.Id
	WHERE lh.SysUserId = @SysUserId and lh.Result <> 'REFUND'
	GROUP BY lh.LotteryId

	UNION ALL

	---------------------------
	-- Price Prediction Game --
	---------------------------
	SELECT
		------------
		-- GameId --
		------------
		pph.PricePredictionId AS GameId,

		-----------------
		-- CreatedDate --
		-----------------
		MAX(pph.CreatedDate) AS CreatedDate,

		-------------------------
		-- CreatedDateInString --
		-------------------------
		CONVERT(varchar, MAX(pph.CreatedDate), 111) AS CreatedDateInString,

		-------------------------
		-- CreatedTimeInString --
		-------------------------
		CONVERT(varchar, MAX(pph.CreatedDate), 8) AS CreatedTimeInString,

		------------
		-- Amount --
		------------
		SUM(pph.Amount) AS Amount,

		------------
		-- Result --
		------------
		CASE WHEN SUM(CASE pph.Result WHEN 'WIN' THEN 1 ELSE 0 END) > 0
             THEN 'WIN'
			 WHEN SUM(CASE WHEN pph.Result is null THEN 1 ELSE 0 END) > 0
			 THEN ''
             ELSE 'LOSE'
		END AS Result,

		-------------
		-- Balance --
		-------------
		CASE WHEN SUM(CASE WHEN pph.Result is null THEN 1 ELSE 0 END) > 0
			 THEN 0
             ELSE SUM(ISNULL(pph.TotalAward,0)) - SUM(pph.Amount)
		END AS Balance,

		-----------
		-- Award --
		-----------
		SUM(ISNULL(pph.TotalAward,0)) AS Award,

		--------------
		-- GameType --
		--------------
		'Price Prediction' AS GameType

	FROM PricePredictionHistory pph
	WHERE pph.SysUserId = @SysUserId and pph.Result <> 'REFUND'
	GROUP BY pph.PricePredictionId
),
------------------------------------------------------------------------------------------
---------------------------- 1.2 APPLY SORT / SEARCH / PAGING  --------------------------- 
------------------------------------------------------------------------------------------
GameHistoryWithRowNumCTE AS
(	
	SELECT GameHistoryCTE.*,
		RowNum = ROW_NUMBER() OVER (
			ORDER BY -- ASC
			CASE WHEN @OrderDirection = N'asc' THEN 0
				 WHEN @OrderColumn = N'GameId' THEN GameId
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'CreatedDate' THEN CreatedDate
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN ''
				 WHEN @OrderColumn = N'CreatedDateInString' THEN CreatedDate
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN ''
				 WHEN @OrderColumn = N'CreatedTimeInString' THEN CreatedDate
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'Amount' THEN Amount
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN ''
				 WHEN @OrderColumn = N'Result' THEN Result
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'Balance' THEN Balance
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
				 WHEN @OrderColumn = N'Award' THEN Award
				 END DESC,
			CASE WHEN @OrderDirection = N'asc' THEN ''
				 WHEN @OrderColumn = N'GameType' THEN GameType
				 END DESC,

				-- DESC
			CASE WHEN @OrderDirection = N'desc' THEN 0
				 WHEN @OrderColumn = N'GameId' THEN GameId
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'CreatedDate' THEN CreatedDate
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'CreatedDateInString' THEN CreatedDate
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as datetime)
				 WHEN @OrderColumn = N'CreatedTimeInString' THEN CreatedDate
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'Amount' THEN Amount
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN ''
				 WHEN @OrderColumn = N'Result' THEN Result
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'Balance' THEN Balance
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
				 WHEN @OrderColumn = N'Award' THEN Award
				 END ASC,
			CASE WHEN @OrderDirection = N'desc' THEN ''
				 WHEN @OrderColumn = N'GameType' THEN GameType
				 END ASC)
	FROM GameHistoryCTE
	WHERE(Result like '%' + @SearchValue + '%'
		  OR 
		  (CONVERT(varchar, CreatedDate, 111) + ' ' + CONVERT(varchar, CreatedDate, 8)) like ('%' + @SearchValue + '%')
		  OR
		  GameType like '%' + @SearchValue + '%')
)

INSERT INTO @TableGameHistory
SELECT GameId, CreatedDate, CreatedDateInString, CreatedTimeInString, Amount, Result, Balance, Award, GameType, RowNum
FROM GameHistoryWithRowNumCTE;

SELECT GameId, CreatedDate, CreatedDateInString, CreatedTimeInString, GameType, Amount, Result, Award, Balance
FROM @TableGameHistory
WHERE RowNum  BETWEEN ((@PageIndex - 1) * @PageSize + 1) AND (@PageIndex * @PageSize);

--///////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #2 - Total Count /////////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////--

-------LAN: WILL BE CHECKED TO VERIFY PERFORMANCE + MEMORY ON LARGE SCALE OF DATA ---------
--///////////////////////////////////////////////////////////////////////////////////////--


SELECT SUM(tc.VALUE) AS TotalCount
FROM ((SELECT COUNT(DISTINCT lh.LotteryId) AS VALUE
	FROM LotteryHistory lh
	WHERE lh.SysUserId = 1) 
	UNION ALL
	(SELECT COUNT(DISTINCT pph.PricePredictionId) AS VALUE
	FROM PricePredictionHistory pph
	WHERE pph.SysUserId = 1)) As tc


--///////////////////////////////////////////////////////////////////////////////////////--
--////////////////////////////// DATATABLE #3 - Filtered Count //////////////////////////--
--///////////////////////////////////////////////////////////////////////////////////////--

SELECT COUNT(*) as FilteredCount
FROM   @TableGameHistory
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetPricePredictionHistory]    Script Date: 10/15/2018 10:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		DamTran
-- Create date: 20181009
-- Description:	Get PricePrediction history to show in admin view
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetPricePredictionHistory] 
	-- Add the parameters for the stored procedure here
	@PricePredictionCategoryId int,
	@LangId int,
	@PageSize int,
	@PageIndex int,
	@OrderColumn nvarchar(30),
	@OrderDirection nvarchar(5),
	@SearchValue nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


--////////////////////////////// DATATABLE #1 - @TablePricePredictionHistory ////////////--
 
-- Insert statements for procedure here
-- CONSTRUCT SQL QUERY FIRST -- 
DECLARE @TablePricePredictionHistory TABLE
(
	SysUserId int, 
	Email nvarchar(50),
	[Status] int,
	StatusInString nvarchar(20),
	NumberOfPrediction int,
	TotalPurchasePrice money,
	Title nvarchar(200),
	PurchaseDateTime date,
	RowNum int
);

	WITH PricePredictionHistoryCTE AS
	(
		SELECT  SUM(ISNULL(pph.Amount,0)) as TotalPurchasePrice,
			    COUNT(pph.Prediction) as NumberOfPrediction, 
				CAST(pph.CreatedDate AS DATE) as PurchaseDateTime,
				PricePredictionId,
				SysUserId
		FROM PricePredictionHistory pph
		WHERE pph.Result <> 'REFUND'
		GROUP BY CAST(pph.CreatedDate as date),
				 pph.PricePredictionId,
				 pph.SysUserId
	
	),
	-- JOIN WITH OTHER TABLE -- 
	PricePredictionHistoryResultCTE AS
	(
		SELECT cte.*,
			   su.Email,
			   ppdt.Title,
			   pp.[Status],
			   CASE WHEN pp.[Status]= 1
					THEN 'ACTIVE'
					WHEN pp.[Status] = 2
					THEN 'COMPLETED'
					ELSE ''
				END AS StatusInString
		FROM PricePrediction pp
		JOIN PricePredictionHistoryCTE cte	on pp.Id = cte.PricePredictionId
		JOIN PricePredictionDetail ppdt		on pp.Id = ppdt.PricePredictionId 
											and ppdt.[LangId] = @LangId
		JOIN SysUser su						on cte.SysUserId = su.Id
		WHERE   pp.PricePredictionCategoryId = 
				CASE
				WHEN  @PricePredictionCategoryId > 0 THEN @PricePredictionCategoryId
				ELSE 
					pp.PricePredictionCategoryId
				END
	)
	--SELECT * FROM  PricePredictionHistoryResultCTE
	,
	-- APPLY SORT / SEARCH / PAGING  --
	PricePredictionHistoryWithRowNumCTE AS
	(	
		SELECT PricePredictionHistoryResultCTE.*,
			RowNum = ROW_NUMBER() OVER (
				ORDER BY -- ASC
				CASE WHEN @OrderDirection = N'asc' THEN 0
					 WHEN @OrderColumn = N'SysUserId' THEN SysUserId
					 END DESC,
				CASE WHEN @OrderDirection = N'asc' THEN ''
					 WHEN @OrderColumn = N'Email' THEN Email
					 END DESC,
				CASE WHEN @OrderDirection = N'asc' THEN ''
					 WHEN @OrderColumn = N'Status' THEN [Status]
					 END DESC,
				CASE WHEN @OrderDirection = N'asc' THEN 0
					 WHEN @OrderColumn = N'NumberOfPrediction' THEN NumberOfPrediction
					 END DESC,
				CASE WHEN @OrderDirection = N'asc' THEN cast(null as money)
					 WHEN @OrderColumn = N'TotalPurchasePrice' THEN TotalPurchasePrice
					 END DESC,
				CASE WHEN @OrderDirection = N'asc' THEN ''
					 WHEN @OrderColumn = N'Title ' THEN Title 
					 END DESC,
				CASE WHEN @OrderDirection = N'asc' THEN cast (null as date)
					 WHEN @OrderColumn = N'PurchaseDateTime ' THEN PurchaseDateTime 
					 END DESC,
				CASE WHEN @OrderDirection = N'asc' THEN ''
					 WHEN @OrderColumn = N'StatusInString' THEN [Status] 
					 END DESC,
	
				-- DESC
				CASE WHEN @OrderDirection = N'desc' THEN 0
					 WHEN @OrderColumn = N'SysUserId' THEN SysUserId
					 END ASC,
				CASE WHEN @OrderDirection = N'desc' THEN ''
					 WHEN @OrderColumn = N'Email' THEN Email
					 END ASC,
				CASE WHEN @OrderDirection = N'desc' THEN ''
					 WHEN @OrderColumn = N'Status' THEN [Status]
					 END ASC,
				CASE WHEN @OrderDirection = N'desc' THEN 0
					 WHEN @OrderColumn = N'NumberOfPrediction' THEN NumberOfPrediction
					 END ASC,
				CASE WHEN @OrderDirection = N'desc' THEN cast(null as money)
					 WHEN @OrderColumn = N'TotalPurchasePrice' THEN TotalPurchasePrice
					 END ASC,
				CASE WHEN @OrderDirection = N'desc' THEN ''
					 WHEN @OrderColumn = N'Title ' THEN Title 
					 END ASC,
				CASE WHEN @OrderDirection = N'desc' THEN cast (null as date)
					 WHEN @OrderColumn = N'PurchaseDateTime ' THEN PurchaseDateTime 
					 END ASC,
				CASE WHEN @OrderDirection = N'desc' THEN ''
					 WHEN @OrderColumn = N'StatusInString' THEN [Status] 
					 END ASC
	)
		FROM PricePredictionHistoryResultCTE
		WHERE(Email like '%' + @SearchValue + '%'
			  OR 
			  (CONVERT(varchar, PurchaseDateTime, 111)) like ('%' + @SearchValue + '%')
			  OR 
			  Title like ('%' + @SearchValue + '%')
			  OR
			  StatusInString like ('%' + @SearchValue + '%'))
	)

INSERT INTO @TablePricePredictionHistory
SELECT SysUserId, Email, [Status], StatusInString, NumberOfPrediction, TotalPurchasePrice, Title, PurchaseDateTime, RowNum
FROM PricePredictionHistoryWithRowNumCTE;

SELECT *
FROM @TablePricePredictionHistory
WHERE RowNum  BETWEEN ((@PageIndex - 1) * @PageSize + 1) AND (@PageIndex * @PageSize);



--////////////////////////////// DATATABLE #2 - Total Count /////////////////////////////--
SELECT COUNT(*) as TotalCount
FROM (
		SELECT		COUNT(pph.PricePredictionId) as TotalCount
		FROM		PricePredictionHistory pph
		JOIN		PricePrediction pp
		on		pph.PricePredictionId = pp.Id
		WHERE		pp.PricePredictionCategoryId = 
						CASE
						WHEN  @PricePredictionCategoryId > 0 THEN @PricePredictionCategoryId
						ELSE 
							pp.PricePredictionCategoryId
						END
		GROUP BY	CAST(pph.CreatedDate as date),
					 pph.PricePredictionId,
					 pph.SysUserId) As Result



--////////////////////////////// DATATABLE #3 - Filtered Count //////////////////////////--
SELECT COUNT(*) as FilteredCount
FROM @TablePricePredictionHistory
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTxHashIdToBTCTransaction]    Script Date: 10/15/2018 10:30:23 AM ******/
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
