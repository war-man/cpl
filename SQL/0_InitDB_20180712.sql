USE [CPL]
GO
/****** Object:  Table [dbo].[BTCPrice]    Script Date: 18/07/2018 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTCPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [money] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_BTCPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoinTransaction]    Script Date: 18/07/2018 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoinTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SysUserId] [int] NOT NULL,
	[FromWalletAddress] [nvarchar](100) NULL,
	[ToWalletAddress] [nvarchar](100) NULL,
	[CoinAmount] [money] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[TokenAmount] [money] NULL,
	[Rate] [float] NULL,
	[TxId] [nvarchar](150) NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 18/07/2018 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_GameType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameHistory]    Script Date: 18/07/2018 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[Amount] [money] NOT NULL,
	[Result] [bit] NULL,
	[Award] [money] NULL,
	[SysUserId] [int] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lang]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[LangDetail]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[LangMsgDetail]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[Lottery]    Script Date: 18/07/2018 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lottery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phase] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Lottery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryHistory]    Script Date: 18/07/2018 11:22:04 AM ******/
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
	[TicketNumber] [nvarchar](6) NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[LotteryPrizeId] [int] NULL,
	[TicketIndex] [int] NOT NULL,
 CONSTRAINT [PK_LotteryHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryPrize]    Script Date: 18/07/2018 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryPrize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Amount] [money] NOT NULL,
	[LotteryId] [int] NOT NULL,
 CONSTRAINT [PK_LotteryPrize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[PricePrediction]    Script Date: 18/07/2018 11:22:04 AM ******/
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
	[NumberOfPredictors] [int] NOT NULL,
	[Volume] [money] NOT NULL,
	[Coinbase] [nvarchar](10) NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PricePrediction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePredictionHistory]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[Rate]    Script Date: 18/07/2018 11:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [float] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[CurrencyId] [int] NOT NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[SysUser]    Script Date: 18/07/2018 11:22:04 AM ******/
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
	[ETHWalletAddress] [nvarchar](100) NULL,
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
	[BTCWalletAddress] [nvarchar](100) NULL,
	[KYCCreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ETHHDWalletAddress] [nvarchar](100) NULL,
	[ETHHDWalletAddressIndex] [int] NOT NULL,
	[BTCHDWalletAddress] [nvarchar](100) NULL,
	[BTCAmount] [money] NOT NULL,
	[ETHAmount] [money] NOT NULL,
	[TokenAmount] [money] NOT NULL,
	[Gender] [bit] NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](30) NULL,
	[City] [nvarchar](30) NULL,
	[StreetAddress] [nvarchar](100) NULL,
	[TwoFactorAuthenticationEnable] [bit] NOT NULL,
 CONSTRAINT [PK_SysUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 18/07/2018 11:22:04 AM ******/
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
/****** Object:  Table [dbo].[Template]    Script Date: 18/07/2018 11:22:04 AM ******/
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
SET IDENTITY_INSERT [dbo].[Game] ON 
GO
INSERT [dbo].[Game] ([Id], [Name], [Description], [IsActive]) VALUES (1, N'Lotto', NULL, 1)
GO
INSERT [dbo].[Game] ([Id], [Name], [Description], [IsActive]) VALUES (2, N'BTCPrise', NULL, 1)
GO
INSERT [dbo].[Game] ([Id], [Name], [Description], [IsActive]) VALUES (3, N'WorldCup', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[GameHistory] ON 
GO
INSERT [dbo].[GameHistory] ([Id], [GameId], [CreatedDate], [UpdatedDate], [Amount], [Result], [Award], [SysUserId]) VALUES (5, 1, CAST(N'2018-06-27T02:50:12.000' AS DateTime), CAST(N'2018-06-28T02:50:12.000' AS DateTime), 1000.0000, 1, 1000.0000, 20)
GO
INSERT [dbo].[GameHistory] ([Id], [GameId], [CreatedDate], [UpdatedDate], [Amount], [Result], [Award], [SysUserId]) VALUES (6, 2, CAST(N'2018-07-05T13:30:00.000' AS DateTime), CAST(N'2018-07-08T13:30:00.000' AS DateTime), 4444.0000, 0, 0.0000, 20)
GO
INSERT [dbo].[GameHistory] ([Id], [GameId], [CreatedDate], [UpdatedDate], [Amount], [Result], [Award], [SysUserId]) VALUES (7, 3, CAST(N'2018-07-05T20:00:00.000' AS DateTime), CAST(N'2018-07-05T20:00:00.000' AS DateTime), 3131.0000, 1, 5000.0000, 20)
GO
INSERT [dbo].[GameHistory] ([Id], [GameId], [CreatedDate], [UpdatedDate], [Amount], [Result], [Award], [SysUserId]) VALUES (8, 1, CAST(N'2018-07-30T00:00:00.000' AS DateTime), CAST(N'2018-07-30T00:00:00.000' AS DateTime), 1234.0000, 0, 0.0000, 20)
GO
SET IDENTITY_INSERT [dbo].[GameHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Lang] ON 
GO
INSERT [dbo].[Lang] ([Id], [Name], [Image]) VALUES (1, N'English', N'flag-icon-us')
GO
INSERT [dbo].[Lang] ([Id], [Name], [Image]) VALUES (2, N'日本語', N'flag-icon-jp')
GO
INSERT [dbo].[Lang] ([Id], [Name], [Image]) VALUES (3, N'한국어
', N'flag-icon-kr')
GO
INSERT [dbo].[Lang] ([Id], [Name], [Image]) VALUES (4, N'中文（简体）
', N'flag-icon-cn')
GO
INSERT [dbo].[Lang] ([Id], [Name], [Image]) VALUES (5, N'中文（传统）', N'flag-icon-cn')
GO
SET IDENTITY_INSERT [dbo].[Lang] OFF
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (31, 1, N'ActivateEmailSent', N'An email has been sent to your registered email address')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (111, 1, N'GameHistory', N'game history')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (133, 1, N'ExistEmail', N'Existing email')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (157, 1, N'ErrorOccurs', N'Error occurs')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (179, 1, N'KYCReceived', N'We have received your personal KYC document, please wait for our update..')
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (208, 1, N'FirstPrize', N'<a style="font-weight: bold">1st</a><br /><a style="font-size:12px">Prize</a>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (209, 1, N'SecondPrize', N'<a style="font-weight: bold">2nd</a><br /><a style="font-size:12px">Prize</a>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (210, 1, N'ThirdPrize', N'<a style="font-weight: bold">3rd</a><br /><a style="font-size:12px">Prize</a>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (211, 1, N'FourthPrize', N'<a style="font-weight: bold">4th</a><br /><a style="font-size:12px">Prize</a>')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (212, 1, N'PercentagesInParentheses', N'Percentages in parentheses indicate the dividend payout ratio.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (213, 1, N'NotePrize', N'<span class="font-weight-bold font-italic text-warning">Note: </span> The number in parentheses is the number contained per 5000 pieces')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (214, 1, N'PurchaseLotteryConfirm', N'Please confirm your purchase.')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (215, 1, N'TicketPrice', N'Ticket price')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (216, 1, N'TotalOfTickets', N'Total of tickets')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (217, 1, N'TotalPrice', N'Total price')
GO
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (218, 1, N'PurchaseSuccessfully', N'You purchased successfully')
GO
SET IDENTITY_INSERT [dbo].[LangDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[LotteryHistory] ON 
GO
INSERT [dbo].[LotteryHistory] ([Id], [LotteryId], [SysUserId], [Result], [CreatedDate], [TicketNumber], [UpdatedDate], [LotteryPrizeId], [TicketIndex]) VALUES (1, 1, 20, N'LOSE', CAST(N'2018-07-02T00:00:00.000' AS DateTime), N'123456', CAST(N'2018-07-03T00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[LotteryHistory] ([Id], [LotteryId], [SysUserId], [Result], [CreatedDate], [TicketNumber], [UpdatedDate], [LotteryPrizeId], [TicketIndex]) VALUES (2, 1, 20, N'LOSE', CAST(N'2018-07-03T00:00:00.000' AS DateTime), N'123654', CAST(N'2018-07-03T00:00:00.000' AS DateTime), NULL, 2)
GO
INSERT [dbo].[LotteryHistory] ([Id], [LotteryId], [SysUserId], [Result], [CreatedDate], [TicketNumber], [UpdatedDate], [LotteryPrizeId], [TicketIndex]) VALUES (3, 2, 20, N'WIN', CAST(N'2018-07-05T00:00:00.000' AS DateTime), N'132523', CAST(N'2018-07-06T00:00:00.000' AS DateTime), 4, 30)
GO
INSERT [dbo].[LotteryHistory] ([Id], [LotteryId], [SysUserId], [Result], [CreatedDate], [TicketNumber], [UpdatedDate], [LotteryPrizeId], [TicketIndex]) VALUES (4, 2, 20, N'LOSE', CAST(N'2018-07-05T00:00:00.000' AS DateTime), N'123123', CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 31)
GO
INSERT [dbo].[LotteryHistory] ([Id], [LotteryId], [SysUserId], [Result], [CreatedDate], [TicketNumber], [UpdatedDate], [LotteryPrizeId], [TicketIndex]) VALUES (5, 2, 20, N'LOSE', CAST(N'2018-07-05T00:00:00.000' AS DateTime), N'123258', CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 32)
GO
INSERT [dbo].[LotteryHistory] ([Id], [LotteryId], [SysUserId], [Result], [CreatedDate], [TicketNumber], [UpdatedDate], [LotteryPrizeId], [TicketIndex]) VALUES (6, 2, 20, N'WIN', CAST(N'2018-07-05T00:00:00.000' AS DateTime), N'123301', CAST(N'2018-07-06T00:00:00.000' AS DateTime), 6, 33)
GO
INSERT [dbo].[LotteryHistory] ([Id], [LotteryId], [SysUserId], [Result], [CreatedDate], [TicketNumber], [UpdatedDate], [LotteryPrizeId], [TicketIndex]) VALUES (7, 2, 20, N'LOSE', CAST(N'2018-07-05T00:00:00.000' AS DateTime), N'215351', CAST(N'2018-07-06T00:00:00.000' AS DateTime), NULL, 34)
GO
SET IDENTITY_INSERT [dbo].[LotteryHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[LotteryPrize] ON 
GO
INSERT [dbo].[LotteryPrize] ([Id], [Name], [Amount], [LotteryId]) VALUES (1, NULL, 1000000.0000, 1)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Name], [Amount], [LotteryId]) VALUES (2, NULL, 50000.0000, 1)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Name], [Amount], [LotteryId]) VALUES (3, NULL, 1000.0000, 1)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Name], [Amount], [LotteryId]) VALUES (4, NULL, 2000000.0000, 2)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Name], [Amount], [LotteryId]) VALUES (5, NULL, 200000.0000, 2)
GO
INSERT [dbo].[LotteryPrize] ([Id], [Name], [Amount], [LotteryId]) VALUES (6, NULL, 0.0000, 2)
GO
SET IDENTITY_INSERT [dbo].[LotteryPrize] OFF
GO
SET IDENTITY_INSERT [dbo].[PricePredictionHistory] ON 
GO
INSERT [dbo].[PricePredictionHistory] ([Id], [PricePredictionId], [SysUserId], [CreatedDate], [Amount], [Prediction], [Result], [Award], [UpdatedDate]) VALUES (1, 1, 20, CAST(N'2018-06-30T13:00:00.000' AS DateTime), 500.0000, 1, N'WIN', 1500.0000, CAST(N'2018-07-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PricePredictionHistory] ([Id], [PricePredictionId], [SysUserId], [CreatedDate], [Amount], [Prediction], [Result], [Award], [UpdatedDate]) VALUES (2, 2, 20, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 100.0000, 0, N'LOSE', 0.0000, CAST(N'2018-07-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PricePredictionHistory] ([Id], [PricePredictionId], [SysUserId], [CreatedDate], [Amount], [Prediction], [Result], [Award], [UpdatedDate]) VALUES (3, 3, 20, CAST(N'2018-07-07T01:00:00.000' AS DateTime), 1000.0000, 0, N'KYC_PENDING', 2000.0000, CAST(N'2018-07-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[PricePredictionHistory] ([Id], [PricePredictionId], [SysUserId], [CreatedDate], [Amount], [Prediction], [Result], [Award], [UpdatedDate]) VALUES (4, 4, 20, CAST(N'2018-07-08T00:00:00.000' AS DateTime), 2000.0000, 1, N'LOSE', 0.0000, CAST(N'2018-07-09T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PricePredictionHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Rate] ON 
GO
INSERT [dbo].[Rate] ([Id], [Value], [StartDate], [EndDate], [CurrencyId]) VALUES (1, 1000, CAST(N'2018-06-26T00:00:00.000' AS DateTime), CAST(N'2018-07-26T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Rate] OFF
GO
SET IDENTITY_INSERT [dbo].[Setting] ON 
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (1, N'IsOnMaintenance', N'false', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (2, N'IsAccountActivationEnable', N'false', NULL)
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (3, N'ServiceEndPointUrl', N'http://api.famhopperchain.com/', N'Local FHCore')
GO
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (4, N'BTCToTokenRate', N'1000000', NULL)
GO
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[SysUser] ON 
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [ETHWalletAddress], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [BTCWalletAddress], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable]) VALUES (20, 0, N'nlqnhat@gmail.com', N'$2a$10$E22ysTtA.Thdjhsotf80.OvmWVLEtNWECBtTx6n.hZAwqj1qDoFwu', N'Bin', N'Do', NULL, N'+841213644445', NULL, NULL, NULL, CAST(N'2018-06-26T16:38:16.700' AS DateTime), NULL, NULL, NULL, CAST(N'2016-05-04T00:00:00.000' AS DateTime), 0, NULL, NULL, 0, N'0x4D694AC9c7a3e8DB53BA33792Ef102Ff206Df526', 0, N'mkbWEuujrMJZRVsPnTHE1ykUfiEexdwjsE', 9.0000, 0.0000, 500000.0000, 0, N'084', N'AR', N'Tuy Hoa', N'23 Nguyen Hue', 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [ETHWalletAddress], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [BTCWalletAddress], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable]) VALUES (25, 0, N'bdo@netsservices.dk', N'$2a$10$w56HeZDMok/TXs6rjKyzCOZ3G0MrVWaL/LQVHV.HcLpJR3Ph2wOYu', N'Lan', N'Do', NULL, N'+841213644445', NULL, NULL, NULL, CAST(N'2018-06-27T07:43:35.547' AS DateTime), NULL, NULL, NULL, CAST(N'2018-02-28T00:00:00.000' AS DateTime), 0, NULL, NULL, 0, N'0x4D694AC9c7a3e8DB53BA33792Ef102Ff206Df526', 0, N'mkbWEuujrMJZRVsPnTHE1ykUfiEexdwjsE', 0.0000, 0.0000, 0.0000, 1, N'057', N'AL', N'AAAA', N'222 BBBBB', 0)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [ETHWalletAddress], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [BTCWalletAddress], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCAmount], [ETHAmount], [TokenAmount], [Gender], [PostalCode], [Country], [City], [StreetAddress], [TwoFactorAuthenticationEnable]) VALUES (26, 0, N'tran.quoc.dam.0606@gmail.com', N'$2a$10$0KgrbeoWYUIKEeHUdV7bcO9e.G1003Qc6Ioj6ay.lgjmhV6uqqQC.', N'Bin', N'Do', NULL, N'+841213644445', NULL, NULL, NULL, CAST(N'2018-06-26T16:38:16.700' AS DateTime), NULL, NULL, NULL, CAST(N'2016-05-04T00:00:00.000' AS DateTime), 0, NULL, NULL, 0, N'0xEbf7aEa65944A953C27643160797a90176e6f03f', 0, N'mkbWEuujrMJZRVsPnTHE1ykUfiEexdwjsE', 10.0000, 20.0000, 500000.0000, 0, N'084', N'AR', N'Tuy Hoa', N'23 Nguyen Hue', 0)
GO
SET IDENTITY_INSERT [dbo].[SysUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Template] ON 
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (1, N'Activate', N'ActivateEmailTemplate', N'Activate your account at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (2, N'Member', N'MemberEmailTemplate', N'Account is activated successfully at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (3, N'Contact', N'ContactEmailTemplate', N'Contact from customer at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (4, N'KYCVerify', N'KYCVerifyEmailTemplate', N'KYC is verified successfully at CPL')
GO
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_BTCHDWalletAddressIndex]  DEFAULT ((0)) FOR [BTCHDWalletAddressIndex]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_ETHHDWalletAddressIndex]  DEFAULT ((0)) FOR [ETHHDWalletAddressIndex]
GO
ALTER TABLE [dbo].[SysUser] ADD  DEFAULT ((0)) FOR [TwoFactorAuthenticationEnable]
GO
