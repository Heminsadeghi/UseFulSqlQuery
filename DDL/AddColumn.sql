if(
        not exists (
						 select * from INFORMATION_SCHEMA.COLUMNS
						 where TABLE_NAME='[TableName]'
						 and TABLE_SCHEMA='[TableSCHEMA]' 
						 and COLUMN_NAME='[columnName]'
				 )
)

alter table [TableName]
add [columnName] [DataType] [Type null]

--example 
if(
        not exists (
						 select * from INFORMATION_SCHEMA.COLUMNS
						 where TABLE_NAME='Clients'
						 and TABLE_SCHEMA='dbo' 
						 and COLUMN_NAME='Group'
				 )
)

alter table Clients
add [Groupn] int null
