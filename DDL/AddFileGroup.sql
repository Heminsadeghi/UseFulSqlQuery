USE [master]
GO
if(
         exists (
						 select * from sys.filegroups a
						 where a.name='[filegroupName]' 
				 )
)
ALTER DATABASE [dataBaseName] ADD FILEGROUP [filegroupName]
GO

--example 
--ALTER DATABASE [test] ADD FILEGROUP [FG_Test]

