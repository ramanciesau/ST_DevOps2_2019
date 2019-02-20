#Вывести все IP адреса вашего компьютера (всех сетевых интерфейсов)
$ipAdresses = Get-WmiObject -Class "Win32_NetworkAdapterConfiguration" -ComputerName localhost | Select-Object -ExpandProperty IPAddress
Write-Output $ipAdresses
#Получить mac-адреса всех сетевых устройств вашего компьютера и удалённо
Get-WmiObject -Class "Win32_NetworkAdapterConfiguration" -ComputerName localhost | Select-Object -ExpandProperty MACAddress
Get-WmiObject -Class "Win32_NetworkAdapterConfiguration" -ComputerName 169.254.170.35 -Credential VM1_Teshev\Administrator | Select-Object -ExpandProperty MACAddress
#На всех виртуальных компьютерах настроить (удалённо) получение адресов с DHСP
Invoke-Command -ComputerName 169.254.170.35 -Credential VM1_Teshev\Administrator -ScriptBlock {Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled=true" `
| ForEach-Object -Process {$_.InvokeMethod("EnableDHCP", $null)}}
#Расшарить папку на компьютере
net share shareTest = C:\ShareTest /users:25 /remark:"Sharing folder TestShare"
#Удалить шару из п.1.4
net share shareTest /delete

