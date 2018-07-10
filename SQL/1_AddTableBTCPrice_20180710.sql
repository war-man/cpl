/*
   Tuesday, July 10, 201810:53:27 AM
   User: 
   Server: DESKTOP-KDJU0MP\SQLEXPRESS
   Database: CPL
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.BTCPrice
	(
	Id int NOT NULL IDENTITY (1, 1),
	Currency nvarchar(10) NOT NULL,
	Price money NOT NULL,
	Time datetime NOT NULL,
	Description nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.BTCPrice ADD CONSTRAINT
	PK_BTCPrice PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.BTCPrice SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
