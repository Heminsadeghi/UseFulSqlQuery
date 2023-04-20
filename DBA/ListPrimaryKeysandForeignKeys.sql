SELECT
DISTINCT
Constraint_Name AS [Constraint],
Table_Schema AS [Schema],
Table_Name AS [TableName] FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
GO