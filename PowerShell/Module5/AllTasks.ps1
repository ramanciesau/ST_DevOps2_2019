#При помощи WMI перезагрузить все виртуальные машины.
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "169.254.170.35, 169.254.100.27"
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName 169.254.170.35 -Credential VM1_Teshev\Administrator
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName 169.254.100.27 -Credential VM2_Teshev\Administrator


#При помощи WMI просмотреть список запущенных служб на удаленном компьютере.
Invoke-Command -ScriptBlock {Get-Service |  Where-Object{$_.Status -eq "Running"}} -ComputerName 169.254.170.35 -Credential VM1_Teshev\Administrator


#Настроить PowerShell Remoting, для управления всеми виртуальными машинами с хостовой.
Set-Item WSMan:\Localhost\Client\Trustedhosts -Value *


#Для одной из виртуальных машин установить для прослушивания порт 42658.
Invoke-Command -ScriptBlock {Set-Item WSMan:\localhost\listener\listener*\port -Value 42658} -ComputerName 169.254.170.35 -Credential VM1_Teshev\Administrator
#Проверить работоспособность PS Remoting
#Invoke-Command -ScriptBlock {Get-Item WSMan:\localhost\listener\listener*\port } -ComputerName 169.254.170.35 -Port 42658 -Credential VM1_Teshev\Administrator


#Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.
New-PSSessionConfigurationFile -Path "C:\disableCmndsSessionConf.pssc" -VisibleCmdlets Get-ChildItem
Register-PSSessionConfiguration -Name disableCmndsSessionConf -Path "C:\disableCmndsSessionConf.pssc" 