--drop object
--ObjectType inculde(Table,View,Proc,...)

USE [dataBaseName]
GO
drop [ObjectType] if exists [ObjectName]

--example drop table if exists ClientInvoices