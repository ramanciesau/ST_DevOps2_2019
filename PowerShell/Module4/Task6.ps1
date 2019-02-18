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
