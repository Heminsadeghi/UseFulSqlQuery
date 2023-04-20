USE [dataBaseName]
GO
EXEC sys.sp_MSforeachtable @command1 = 'Drop Table ?'