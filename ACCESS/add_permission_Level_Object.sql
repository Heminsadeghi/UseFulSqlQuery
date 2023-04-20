--add permission in Object level
 --permission include (select,update,delete,drop,alter,....)
USE [dataBaseName]
GO

grant [Typepermission] ON [ObjectName] to [UserName]
--or
grant [Typepermission]   to [UserName] 

--example GRANT SELECT ON [Customer] TO [test]
