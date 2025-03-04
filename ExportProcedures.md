### **How to Use:**
1. Replace `"YourServerName"` and `"YourDatabase"` with your actual SQL Server name and database.
2. Change `$OutputDirectory` to the folder where you want to save the `.sql` files.
3. Save the script as `ExportProcedures.ps1`.
4. Run PowerShell as Administrator and execute:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope Process
   ```
5. Run the script:
   ```powershell
   .\ExportProcedures.ps1
   ```

### **What This Does:**
- Connects to SQL Server.
- Retrieves all stored procedures.
- Saves each procedure as a separate `.sql` file.

Would you like an additional option to zip the files after exporting? 🚀