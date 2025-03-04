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