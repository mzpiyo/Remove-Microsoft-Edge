# 移除 Microsoft Edge

### 描述
此 PowerShell 脚本旨在完全从您的 Windows 系统中移除 Microsoft Edge。它包括提升权限、终止与 Edge 相关的进程、定位并卸载 Edge 安装文件、移除 Edge appx 包以及清理相关 MSI 安装程序的步骤。该脚本确保彻底移除 Microsoft Edge 及其组件。

**注意**：此脚本已在 Windows 10 LTSC 2021 (版本 19044.1288) 上测试并验证通过。

### 使用说明
#### 前提条件
- 确保您在 Windows 系统上具有管理员权限。
- 必须安装并可访问 PowerShell。

#### 使用脚本的步骤
1. **以管理员身份打开 PowerShell**：
   - 右键单击 PowerShell 图标并选择“以管理员身份运行”。

2. **下载并运行脚本**：
   - 使用以下命令下载并运行脚本：
   ```powershell
   Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/gh/mzpiyo/Remove-Microsoft-Edge/remove-edge.ps1" -OutFile "remove-edge.ps1"
   .\remove-edge.ps1
   ```

3. **处理执行策略**：
   - 如果遇到有关脚本执行受限的提示，您可以临时更改执行策略：
   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```
   - 运行脚本后，您可以将执行策略恢复为默认设置：
   ```powershell
   Set-ExecutionPolicy Restricted
   ```

4. **脚本操作**：
   - 该脚本将执行以下操作：
     - 启用必要的权限。
     - 终止所有 Edge 及相关进程。
     - 定位并准备 Edge 安装文件以进行卸载。
     - 移除 Edge appx 包。
     - 使用安装文件执行 Edge 的卸载操作。
     - 清理任何剩余的与 Edge 相关的 MSI 安装程序。
     - 在完成后通知您。

5. **完成**：
   - 脚本完成后，您将看到一条消息，指示 Microsoft Edge 已被移除。

#### 注意
- 此脚本适用于熟悉 PowerShell 和系统管理任务的高级用户。
- 使用此脚本需自行承担风险。请确保在继续操作之前备份任何重要数据。
