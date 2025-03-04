# Define variables
$ServerName = "YourServerName"   # Change this to your SQL Server name
$DatabaseName = "YourDatabase"   # Change this to your database name
$OutputDirectory = "C:\SQL_Procedures"  # Change this to your desired output folder

# Ensure the output directory exists
if (!(Test-Path -Path $OutputDirectory)) {
    New-Item -ItemType Directory -Path $OutputDirectory
}

# Load SQL Server module
Import-Module SQLPS -ErrorAction SilentlyContinue

# Get all stored procedures
$query = @"
SELECT name, OBJECT_DEFINITION(OBJECT_ID) AS Definition
FROM sys.procedures
"@

# Execute query
$procedures = Invoke-Sqlcmd -ServerInstance $ServerName -Database $DatabaseName -Query $query

# Loop through each procedure and save to a file
foreach ($proc in $procedures) {
    $ProcName = $proc.name
    $ProcDefinition = $proc.Definition

    # Define file path
    $FilePath = "$OutputDirectory\$ProcName.sql"

    # Save stored procedure to a file
    if ($ProcDefinition -ne $null) {
        $ProcDefinition | Out-File -FilePath $FilePath -Encoding utf8
        Write-Host "Exported: $ProcName"
    } else {
        Write-Host "Skipping empty procedure: $ProcName"
    }
}

Write-Host "Stored procedure export complete!"
