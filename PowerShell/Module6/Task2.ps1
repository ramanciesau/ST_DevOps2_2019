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

