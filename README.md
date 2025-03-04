# 🚀 SQL Server Export Scripts  

This repository contains PowerShell scripts for extracting key SQL Server components such as **Stored Procedures** and **SSIS Packages**. These scripts help automate database management tasks and facilitate easy backups.

## 📂 Scripts Included  

### 1️⃣ Export SQL Server Stored Procedures  
🔹 Script: [`ExportProcedures.ps1`](./ExportProcedures.ps1)  
🔹 Documentation: [`ExportProcedures.md`](./ExportProcedures.md)  

This script retrieves all stored procedures from a specified SQL Server database and saves them as `.sql` files.  

### 2️⃣ Export SSIS Packages  
🔹 Script: [`ExportSSIS.ps1`](./ExportSSIS.ps1)  
🔹 Documentation: [`ExportSSIS.md`](./ExportSSIS.md)  

This script connects to the **SSISDB** catalog in SQL Server and exports all SSIS packages from a specified folder into `.dtsx` files.  

---

## 🛠️ Installation & Usage  

1. **Ensure PowerShell is installed** on your system.  
2. Clone this repository:  
   ```powershell
   git clone https://github.com/YourUsername/SQL-Export-Scripts.git
   cd SQL-Export-Scripts
   ```
3. Follow the setup instructions in each script’s documentation:  
   - **[ExportProcedures.md](./ExportProcedures.md)**
   - **[ExportSSIS.md](./ExportSSIS.md)**

---

## ⚡ Requirements  
- **SQL Server Management Studio (SSMS)** (optional, for testing)  
- **PowerShell 5.1+** (or PowerShell Core)  
- **SQL Server with SSISDB enabled** (for SSIS exports)  
- **SQLCMD Utility** (for running SQL queries in PowerShell)  

---

## 📜 License  
This project is licensed under the **MIT License** – feel free to use and modify.  

---

## 🤝 Contributing  
Contributions are welcome! If you find a bug or want to add improvements, submit a pull request.  

---

### 🔗 Author & Contact  
**GitHub:** [lovescott](https://github.com/lovescott)  
**Email:** scott.love@databricks.com  
