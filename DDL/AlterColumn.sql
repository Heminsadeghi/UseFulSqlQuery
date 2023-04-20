if(
         exists (
						 select * from INFORMATION_SCHEMA.COLUMNS
						 where TABLE_NAME='[TableName]'
						 and TABLE_SCHEMA='[TableSCHEMA]' 
						 and COLUMN_NAME='[columnName]'
				 )
)

alter table [TableName]
alter column [columnName] [DataType] [Type null]

--example 
if(
         exists (
						 select * from INFORMATION_SCHEMA.COLUMNS
						 where TABLE_NAME='Clients'
						 and TABLE_SCHEMA='dbo' 
						 and COLUMN_NAME='Group'
				 )
)

alter table Clients
alter column [Group] bigint null
