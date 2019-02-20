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


#Получить список коммандлетов работы с Hyper-V (Module Hyper-V)
Get-Command -Module Hyper-V 
#Получить список виртуальных машин
Get-VM 
#Получить состояние имеющихся виртуальных машин
Get-VM | Select-Object State, Name
#Выключить виртуальную машину 
Stop-VM -Name VM1_Teshev
#Создать новую виртуальную машину
New-VM -Name VM_PS_Teshev -MemoryStartupBytes 2048Mb
#Создать динамический жесткий диск
New-VHD -Dynamic -SizeBytes 500Mb -Path "C:\Hyper-V Virtual Hard Disks\testVHD.vhd" 
#Удалить созданную виртуальную машину
Remove-VM -Name VM_PS_Teshev -Force