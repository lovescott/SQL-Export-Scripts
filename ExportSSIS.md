
### **PowerShell Script: Export SSIS Packages**
Extracting SSIS (SQL Server Integration Services) packages using PowerShell requires using SQL Server Management Objects (SMO) and the SSISDB catalog (if deployed on a SQL Server instance). Below is a PowerShell script to export SSIS packages from an SSISDB catalog to `.dtsx` files.  

---

```powershell
# Define variables
$ServerName = "YourServerName"        # Change this to your SQL Server name
$SSISFolder = "YourSSISFolder"        # Change this to your SSIS folder name in SSISDB
$OutputDirectory = "C:\SSIS_Export"   # Change this to your desired export folder

# Ensure the output directory exists
if (!(Test-Path -Path $OutputDirectory)) {
    New-Item -ItemType Directory -Path $OutputDirectory
}

# Load SQL Server module (if not loaded)
Import-Module SQLPS -ErrorAction SilentlyContinue

# Get all SSIS packages from SSISDB
$query = @"
SELECT project_name, package_name, CAST(CONTENT AS VARBINARY(MAX)) AS PackageData
FROM SSISDB.catalog.packages
WHERE folder_id = (SELECT folder_id FROM SSISDB.catalog.folders WHERE name = '$SSISFolder')
"@

# Execute the query
$packages = Invoke-Sqlcmd -ServerInstance $ServerName -Database "SSISDB" -Query $query

# Loop through each package and save as .dtsx file
foreach ($package in $packages) {
    $PackageName = $package.package_name
    $PackageData = $package.PackageData

    # Define file path
    $FilePath = "$OutputDirectory\$PackageName.dtsx"

    # Save package to file
    [System.IO.File]::WriteAllBytes($FilePath, $PackageData)
    Write-Host "Exported: $PackageName"
}

Write-Host "SSIS Package export complete!"
```

---

### **How to Use:**
1. Replace:
   - `"YourServerName"` with your SQL Server instance name.
   - `"YourSSISFolder"` with the actual SSIS folder name in SSISDB.
   - `$OutputDirectory` with the path where you want to save `.dtsx` files.
2. Save the script as `ExportSSIS.ps1`.
3. Open PowerShell as Administrator and set the execution policy:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope Process
   ```
4. Run the script:
   ```powershell
   .\ExportSSIS.ps1
   ```

---

### **What This Does:**
- Connects to SSISDB.
- Retrieves all SSIS packages in a specified folder.
- Saves each package as a `.dtsx` file.

Would you like a version that works with file-system-deployed SSIS packages instead of SSISDB? 🚀