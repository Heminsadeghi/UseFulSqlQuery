Step 1: Put the database in EMERGENCY mode
Change the database status to EMERGENCY mode. Doing so, will provide users read-only access to the database. The basic purpose of changing the database mode to emergency is troubleshooting what resulted in database suspect mode issue. 
To change the database status to EMERGENCY mode, run the below T-SQL query:

ALTER DATABASE  dbName  SET  EMERGENCY

Once you have changed the database status, you will be able to access the db.

Step 2: Check database integrity
Next, execute Database Console Command (DBCC) CHECKDB. The command helps check the logical and physical integrity of the specified database. If it finds any problem with the database, it recommends appropriate repair options such as ‘REPAIR_REBUILD’, ‘REPAIR_FAST’, or ‘REPAIR_ALLOW_DATA_LOSS’.
Use the following query to run DBCC CHECKDB:

DBCC CHECKDB ('dbName')

Suggestion: Make sure to run the DBCC CHECKDB command regularly to check for physical and logical integrity of the database.

Step 3: Set database in SINGLE_USER mode
Now run the below T-SQL query to rollback any transaction and bring the SQL database to Single User mode.

ALTER DATABASE dbName SET SINGLE_USER WITH ROLLBACK IMMEDIATE

Step 4: Repair the database

Re-Run DBCC CHECKDB with repair options to repair the suspect database. For this, use the following T-SQL query:

DBCC CHECKDB (dbName, REPAIR_ALLOW_DATA_LOSS)
Note: DBCC CHECKDB with REPAIR_ALLOW_DATA_LOSS may help you fix all the errors and repair them; however, it can cause data loss from the repaired database.

Step 5: Bring the database to MULTI_USER mode

If you find that the script runs successfully, bring the database back from single-user mode to multi-user mode. Run the following command to do it:

ALTER DATABASE dbName SET MULTI_USER
Step 6: Bring the database ONLINE

To change the database state from EMERGENCY to ONLINE, execute the following command:

ALTER DATABASE dbName SET ONLINE

