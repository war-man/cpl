USE [CPL]
GO
/****** Object:  Table [dbo].[LangContent]    Script Date: 20/08/2018 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LangContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[TableId] [int] NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_LangContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


EXEC sp_RENAME 'Lottery.SlideImage' , 'DesktopSlideImage', 'COLUMN'

GO

alter table Lottery add MobileSlideImage nvarchar(200) null;

update Lottery set MobileSlideImage = 'mobile_banner.jpg';

update Lottery set DesktopListingImage = 'listing_desktop.jpg';

update Lottery set MobileListingImage = 'listing_mobile.jpg';

update Lottery set MobileListingImage = 'listing_mobile.jpg';

GO

alter table Lottery add PrizeImage nvarchar(200) null;

update Lottery set PrizeImage = 'prize.jpg';

update LangDetail set Value = 'Desktop listing image' where Name = N'DesktopListingImage';
update LangDetail set Value = 'Mobile listing image' where Name = N'MobileListingImage';

insert into LangDetail values (1, N'MobileSlideImage', N'Mobile slide image');
insert into LangDetail values (1, N'DesktopSlideImage', N'Desktop slide image');
insert into LangDetail values (1, N'PrizeImage', N'Prize image');

insert into LangDetail values (1, N'DesktopListingImageRequired', N'Please fill in listing image for desktop');
insert into LangDetail values (1, N'MobileListingImageRequired', N'Please fill in listing image for mobile');
insert into LangDetail values (1, N'DesktopSlideImageRequired', N'Please fill in slide image for desktop');
insert into LangDetail values (1, N'MobileSlideImageRequired', N'Please fill in slide image for mobile');
insert into LangDetail values (1, N'PrizeImageRequired', N'Please fill in prize image');

select * from LangDetail where Name = 'MobileSlideImage';