#Работа с профилем
New-Item -ItemType File -Path .\boot -Force
(Get-Host).UI.RawUI.ForegroundColor = "Green"
(Get-Host).UI.RawUI.BackgroundColor = "Black"
Set-Alias GetHelp Get-Help
Set-Alias UpdateHelp Update-Help
Set-Alias UpdateDisk Update-Disk
Set-Variable Constant1 -option Constant -Value 1 
Set-Variable Constant2 -Option Constant -Value 2.0
Set-Variable Constant3 -Option Constant -Value "Hello"
Set-Variable Constant4 -Option Constant -Value Get-Help Get-Help
Set-Location C:\Test\
Write-Host("ZDAROVA")