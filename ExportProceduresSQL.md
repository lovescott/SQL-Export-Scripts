# Documentation: Extracting Stored Procedures to .SQL Files

## Overview
This document provides detailed instructions on how to use the provided SQL script to extract all stored procedures from a specified SQL Server database and save them as individual `.sql` files.

## Prerequisites
Before executing the script, ensure that:
1. You have administrative privileges on the SQL Server instance.
2. The `xp_cmdshell` feature is enabled.
3. The `bcp` (Bulk Copy Program) utility is installed and accessible via the command line.

## Steps to Use the Script

### 1. Enable xp_cmdshell (if not already enabled)
By default, `xp_cmdshell` is disabled in SQL Server for security reasons. To enable it, run the following commands:
```sql
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;
```

### 2. Modify the Script
- Replace `YourDatabaseName` in the `USE` statement with the actual name of your database.
- Ensure that your SQL Server instance name is correctly set.

### 3. Execute the Script
Run the script in SQL Server Management Studio (SSMS). The script will:
1. Loop through all stored procedures in the database.
2. Extract their `CREATE` syntax using `sys.sql_modules`.
3. Use the `bcp` utility to save each procedure as an individual `.sql` file.

### 4. Verify Output
After execution, check the SQL Server instance's working directory or specified output directory for the `.sql` files containing stored procedures.

## Troubleshooting
### Error: `xp_cmdshell` is Disabled
- Ensure you have executed the enabling commands correctly.

### Error: `bcp` Not Recognized
- Make sure the `bcp` utility is installed and added to the system path.

### No `.sql` Files Generated
- Check permissions and ensure SQL Server has write access to the directory.

## Security Considerations
- `xp_cmdshell` should be disabled after use to prevent security risks:
```sql
EXEC sp_configure 'xp_cmdshell', 0;
RECONFIGURE;
```

## Conclusion
This script automates the extraction of stored procedures, making it easier to back up and migrate them. Follow the above steps carefully to ensure successful execution.

