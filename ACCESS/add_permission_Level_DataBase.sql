--add permission in database level
 --permission include (db_securityadmin,db_owner,db_denydatawriter,db_denydatareader,db_ddladmin,db_datawriter,db_datareader,db_accessadmin,db_backupoperator)
USE [dataBaseName]
GO

ALTER ROLE [permission] ADD MEMBER [UserName]
GO