# 启用管理员权限
$D1 = [uri].module.gettype('System.Diagnostics.Process')."GetM`ethods"(42) | where {$_.Name -eq 'SetPrivilege'}
foreach ($privilege in 'SeSecurityPrivilege','SeTakeOwnershipPrivilege','SeBackupPrivilege','SeRestorePrivilege') {
    $D1.Invoke($null, @($privilege, 2))
}

# 关闭 Edge 和相关进程
$shut = 'explorer', 'Widgets', 'widgetservice', 'msedgewebview2', 'MicrosoftEdge*', 'chredge', 'msedge', 'edge', 'msteams', 'msfamily', 'WebViewHost', 'Clipchamp'
$shut | foreach { Stop-Process -Name $_ -Force -ErrorAction SilentlyContinue }

# 准备 Edge 卸载
$DIR = "$env:SystemDrive\Scripts"
New-Item -Path $DIR -ItemType Directory -ErrorAction SilentlyContinue

# 查找所有 Edge 的 setup.exe 和 BHO 路径
$edges = @()
$bho = @()
$edgeUpdates = @()
'LocalApplicationData', 'ProgramFilesX86', 'ProgramFiles' | foreach {
    $folder = [Environment]::GetFolderPath($_)
    $bho += Get-ChildItem "$folder\Microsoft\Edge*\ie_to_edge_stub.exe" -Recurse -ErrorAction SilentlyContinue
    $edges += Get-ChildItem "$folder\Microsoft\Edge*\setup.exe" -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -notlike '*EdgeWebView*' }
}

# 移除找到的 Edge appx 包
$appxPackages = Get-AppxPackage -AllUsers
foreach ($appx in $appxPackages) {
    if ($appx.Name -like "*Microsoft Edge*") {
        Remove-AppxPackage -Package $appx.PackageFullName -AllUsers -ErrorAction SilentlyContinue
    }
}

# 使用找到的 setup.exe 执行卸载操作
foreach ($setup in $edges) {
    if (-not (Test-Path $setup)) { continue }
    $removalArgs = "--uninstall --system-level --verbose-logging --force-uninstall"
    Start-Process -FilePath $setup -ArgumentList $removalArgs -Wait
}

# 清理与 Edge 相关的 MSI 安装程序
Get-ChildItem "HKLM:\SOFTWARE\Classes\Installer\Products\*" | Where-Object { $_.ProductName -like '*Microsoft Edge*' } | foreach {
    $prodCode = ($_.PSChildName -split '(.{8})(.{4})(.{4})(.{4})' -join '-').Trim('-')
    Start-Process msiexec.exe -ArgumentList "/X$prodCode /qn" -Wait
}

# 最终清理 Edge 更新组件
$edgeUpdates | foreach {
    if (Test-Path $_) {
        Start-Process $_ -ArgumentList '/uninstall' -Wait
    }
}

# 通知完成
Write-Host "Microsoft Edge 已被移除！"
