USE [dataBaseName]
GO
DBCC CHECKIDENT ('[TableName]', RESEED, 0); 