USE [dataBaseName]
GO
CREATE TABLE #Tab
(
Table_Name [varchar](max),
Total_Records int
);
EXEC sp_MSForEachTable @command1=' Insert Into #Tab(Table_Name, Total_Records) SELECT ''?'', COUNT(*) FROM ?'
SELECT * FROM #Tab t ORDER BY t.Total_Records DESC;
DROP TABLE #Tab;