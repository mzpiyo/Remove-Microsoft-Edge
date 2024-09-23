# Remove-Microsoft-Edge

Englist | [简体中文](./README.zh-CN.md)

### Description
This PowerShell script is designed to completely remove Microsoft Edge from your Windows system. It includes steps to elevate privileges, terminate Edge-related processes, locate and uninstall Edge setup files, remove Edge appx packages, and clean up related MSI installers. This script ensures a thorough removal of Microsoft Edge and its components.

**Note**: This script has been tested and verified to work on Windows 10 LTSC 2021 (version 19044.1288).

### Usage Instructions
#### Prerequisites
- Ensure you have administrative privileges on your Windows system.
- PowerShell must be installed and accessible.

#### Steps to Use the Script
1. **Open PowerShell as Administrator**:
   - Right-click on the PowerShell icon and select "Run as administrator".

2. **Download and Run the Script**:
   - Use the following command to download and run the script:
   ```powershell
   Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/mzpiyo/Remove-Microsoft-Edge/remove-edge.ps1" -OutFile "remove-edge.ps1"
   .\remove-edge.ps1
   ```

3. **Handling Execution Policy**:
   - If you encounter a message about script execution being restricted, you can temporarily change the execution policy:
   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```
   - After running the script, you can revert the execution policy to its default setting:
   ```powershell
   Set-ExecutionPolicy Restricted
   ```

4. **Script Actions**:
   - The script will perform the following actions:
     - Enable necessary privileges.
     - Terminate all Edge and related processes.
     - Locate and prepare Edge setup files for uninstallation.
     - Remove Edge appx packages.
     - Execute the uninstallation of Edge using setup files.
     - Clean up any remaining Edge-related MSI installers.
     - notify you upon completion.

5. **Completion**:
   - Once the script finishes, you will see a message indicating that Microsoft Edge has been removed.

#### Note
- This script is intended for advanced users who are comfortable with PowerShell and system administration tasks.
- Use this script at your own risk. Ensure you have backups of any important data before proceeding.
