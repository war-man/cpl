--BackupDB--
--USE CPL;
--GO
--DECLARE @datetime nvarchar(50) = (SELECT CONVERT (date, SYSDATETIME()));
--DECLARE @fileName nvarchar(50) = CONCAT('D:\\BK_CPL_',@datetime,'.BAK');
--BACKUP DATABASE CPL 
--TO DISK = @fileName;
--GO
USE master;
GO
ALTER DATABASE [CPL]
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO
--DropDB--
USE master;
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = N'CPL')
DROP DATABASE [CPL]
GO

--CreateDB--
USE master;
GO
CREATE DATABASE [CPL]
GO