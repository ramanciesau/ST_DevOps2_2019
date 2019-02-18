#Вывести список всех классов WMI на локальном компьютере. 
Get-WmiObject -List


#Получить список всех пространств имён классов WMI. 
Get-WmiObject -List | Select-Object __NAMESPACE -Unique


#Получить список классов работы с принтером.
Get-WmiObject -List | Where-Object {$_.name -match "Printer"}


#Вывести информацию об операционной системе, не менее 10 полей.
Get-WmiObject -Class CIM_OperatingSystem | Select-Object "Caption","CreationClassName","CSCreationClassName", "CSName", "CurrentTimeZone","Description", `
"Distributed","FreePhysicalMemory",  "FreeSpaceInPagingFiles", "FreeVirtualMemory" | Format-Table


#Получить информацию о BIOS
Get-WmiObject Win32_BIOS


#Вывести свободное место на локальных дисках. На каждом и сумму.
$allDisksFreeSpace = Get-WmiObject -Class Win32_LogicalDisk | Select-Object -Property FreeSpace | ForEach-Object {$_.FreeSpace/1Gb}
Write-Output $allDisksFreeSpace
$sumOfFreeSpace = 0
$allDisksFreeSpace1 = Get-WmiObject -Class Win32_LogicalDisk | Select-Object -Property FreeSpace
foreach ($freeSpace in $allDisksFreeSpace1)
{
    $sumOfFreeSpace += ($freeSpace.FreeSpace / 1Gb)
    
}
Write-Output ("all free space = $sumOfFreeSpace")


#Написать сценарий, выводящий суммарное время пингования компьютера (например 10.0.0.1) в сети.
$pingCounter = 3
$sumOfResponces = 0
for ([int]$i = 0; $i -lt $pingCounter; $i++) {
$sumOfResponces += $(Get-WmiObject Win32_PingStatus -Filter "Address='8.8.8.8'").ResponseTime
}
Write-Output "$sumOfResponces ms"


#Создать файл-сценарий вывода списка установленных программных продуктов в виде таблицы с полями Имя и Версия.
Get-WmiObject -Class Win32_Product | Format-Table -Property Name, Version


#Выводить сообщение при каждом запуске приложения MS Word.Выводить сообщение при каждом запуске приложения MS Word.
Register-WmiEvent -Query "SELECT * FROM __instancecreationevent WITHIN 5 WHERE targetinstance ISA 'Win32_Process' `
AND targetinstance.name='winword.exe'" -sourceIdentifier "Started" -Action { Write-Host "Microsoft Word is open now" }
 