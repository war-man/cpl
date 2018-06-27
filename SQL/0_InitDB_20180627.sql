USE [CPL]
GO
/****** Object:  Table [dbo].[CoinTransaction]    Script Date: 27/06/2018 2:13:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoinTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SysUserId] [int] NOT NULL,
	[FromWalletAddress] [nvarchar](100) NULL,
	[ToWalletAddress] [nvarchar](100) NOT NULL,
	[CoinAmount] [money] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[TokenAmount] [money] NULL,
	[Rate] [float] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[Game]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[GameHistory]    Script Date: 27/06/2018 2:13:35 PM ******/
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
	[Bonus] [money] NULL,
	[SysUserId] [int] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lang]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[LangDetail]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[LangMsgDetail]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[Rate]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[Setting]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[SysUser]    Script Date: 27/06/2018 2:13:35 PM ******/
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
	[FrontSide] [nvarchar](50) NULL,
	[BackSide] [nvarchar](50) NULL,
	[DOB] [datetime] NULL,
	[BTCHDWalletAddressIndex] [int] NOT NULL,
	[BTCWalletAddress] [nvarchar](100) NULL,
	[KYCCreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[ETHHDWalletAddress] [nvarchar](100) NULL,
	[ETHHDWalletAddressIndex] [int] NOT NULL,
	[BTCHDWalletAddress] [nvarchar](100) NULL,
	[BTCWallet] [money] NOT NULL,
	[ETHWallet] [money] NOT NULL,
	[TokenWallet] [money] NOT NULL,
	[Gender] [bit] NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](30) NULL,
	[City] [nvarchar](30) NULL,
	[Address] [nvarchar](100) NULL,
 CONSTRAINT [PK_SysUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 27/06/2018 2:13:35 PM ******/
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
/****** Object:  Table [dbo].[Template]    Script Date: 27/06/2018 2:13:35 PM ******/
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
INSERT [dbo].[LangDetail] ([Id], [LangId], [Name], [Value]) VALUES (4, 1, N'CredentialsEdit', N'Edit Credentials')
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
SET IDENTITY_INSERT [dbo].[LangDetail] OFF
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
INSERT [dbo].[Setting] ([Id], [Name], [Value], [Description]) VALUES (3, N'ServiceEndPointUrl', N'http://202.53.150.20/', N'HongKong fhcore')
GO
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[SysUser] ON 
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [ETHWalletAddress], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [BTCWalletAddress], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCWallet], [ETHWallet], [TokenWallet], [Gender], [PostalCode], [Country], [City], [Address]) VALUES (20, 0, N'nlqnhat@gmail.com', N'$2a$10$cx5UpTFFTj0LCDnMlhxrge3HS8UkJ3qKE5MbwtW/vKuz2tPsJ2HOC', NULL, NULL, NULL, NULL, NULL, NULL, N'26b81c95-4a21-49a7-97dc-9f9c8cc95928', CAST(N'2018-06-26T16:38:16.700' AS DateTime), NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SysUser] ([Id], [IsAdmin], [Email], [Password], [FirstName], [LastName], [ETHWalletAddress], [Mobile], [ResetPasswordToken], [ResetPasswordDate], [ActivateToken], [CreatedDate], [KYCVerified], [FrontSide], [BackSide], [DOB], [BTCHDWalletAddressIndex], [BTCWalletAddress], [KYCCreatedDate], [IsDeleted], [ETHHDWalletAddress], [ETHHDWalletAddressIndex], [BTCHDWalletAddress], [BTCWallet], [ETHWallet], [TokenWallet], [Gender], [PostalCode], [Country], [City], [Address]) VALUES (25, 0, N'bdo@netsservices.dk', N'$2a$10$w56HeZDMok/TXs6rjKyzCOZ3G0MrVWaL/LQVHV.HcLpJR3Ph2wOYu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-06-27T07:43:35.547' AS DateTime), NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SysUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Template] ON 
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (1, N'Activate', N'ActivateEmailTemplate', N'Activate your account at CPL')
GO
INSERT [dbo].[Template] ([Id], [Name], [Body], [Subject]) VALUES (2, N'Member', N'MemberEmailTemplate', N'Account is activated successfully at CPL')
GO
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_BTCHDWalletAddressIndex]  DEFAULT ((0)) FOR [BTCHDWalletAddressIndex]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_ETHHDWalletAddressIndex]  DEFAULT ((0)) FOR [ETHHDWalletAddressIndex]
GO
