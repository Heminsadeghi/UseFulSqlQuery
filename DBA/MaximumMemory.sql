
/*
Plus 1 GB for every 4 GB in the machine, between 4 and 16 GB
Plus 1 GB for every 8 GB in the machine, above 16 GB
*/
IF OBJECT_ID('tempdb..#mem') IS NOT NULL DROP TABLE #mem
GO

DECLARE 
@memInMachine DECIMAL(9,2)
,@memOsBase DECIMAL(9,2)
,@memOs4_16GB DECIMAL(9,2)
,@memOsOver_16GB DECIMAL(9,2)
,@memOsTot DECIMAL(9,2)
,@memForSql DECIMAL(9,2)
,@CurrentMem DECIMAL(9,2)
,@sql VARCHAR(1000)

CREATE TABLE #mem(mem DECIMAL(9,2))

--Get current mem setting----------------------------------------------------------------------------------------------
SET @CurrentMem = (SELECT CAST(value AS INT)/1024. FROM sys.configurations WHERE name = 'max server memory (MB)')

--Get emory in machine-------------------------------------------------------------------------------------------------
IF CAST(LEFT(CAST(SERVERPROPERTY('ResourceVersion') AS VARCHAR(20)), 2) AS INT) >= 11
  SET @sql = 'SELECT physical_memory_kb/(1024*1024.) FROM sys.dm_os_sys_info'
ELSE
  SET @sql = 'SELECT physical_memory_in_bytes/(1024*1024*1024.) FROM sys.dm_os_sys_info'
SET @sql = 'INSERT INTO #mem(mem) VALUES((' + @sql + '))'

EXEC(@sql)
SET @memInMachine = (SELECT MAX(mem) FROM #mem)

--Calculate recommended memory setting---------------------------------------------------------------------------------
SET @memOsBase = 1

SET @memOs4_16GB = 
  CASE 
    WHEN @memInMachine <= 4 THEN 0
   WHEN @memInMachine > 4 AND @memInMachine <= 16 THEN (@memInMachine - 4) / 4
    WHEN @memInMachine >= 16 THEN 3
  END

SET @memOsOver_16GB = 
  CASE 
    WHEN @memInMachine <= 16 THEN 0
   ELSE (@memInMachine - 16) / 8
  END

SET @memOsTot = @memOsBase + @memOs4_16GB + @memOsOver_16GB
SET @memForSql = @memInMachine - @memOsTot

--Output findings------------------------------------------------------------------------------------------------------
SELECT @CurrentMem AS CurrentMemConfig, @memInMachine AS MemInMachine, @memOsTot AS MemForOS, @memForSql AS memForSql

SELECT
'You can copy this to a query window and execute.' AS Comment
,'EXEC sp_configure ''max server memory'', ' + CAST(CAST(@memForSql * 1024 AS INT) AS VARCHAR(10)) + ' RECONFIGURE' AS CommandToExecute
UNION ALL
SELECT 'Make sure the value is reasonable.', ''
UNION ALL
SELECT 'Assumes that the OS is dedicated to one SQL Server instance!', ''