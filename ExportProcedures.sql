-- This script retrieves the CREATE syntax for all stored procedures from the specified database and saves them to .sql files

USE YourDatabaseName; -- Replace with your database name
GO

DECLARE @ProcName NVARCHAR(MAX), @SQL NVARCHAR(MAX);

DECLARE cur CURSOR FOR
SELECT p.name 
FROM sys.procedures p;

OPEN cur;
FETCH NEXT FROM cur INTO @ProcName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'bcp "SELECT definition FROM ' + DB_NAME() + 
               '.sys.sql_modules WHERE object_id = OBJECT_ID(''' + @ProcName + ''')" 
               queryout "' + @ProcName + '.sql" -c -T -S ' + @@SERVERNAME;
    
    EXEC xp_cmdshell @SQL;
    
    FETCH NEXT FROM cur INTO @ProcName;
END

CLOSE cur;
DEALLOCATE cur;
GO
