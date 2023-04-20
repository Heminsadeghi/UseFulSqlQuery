USE [dataBaseName]
GO
EXEC sp_MSforeachtable 'TRUNCATE TABLE ?' 