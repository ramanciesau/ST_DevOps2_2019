#Вывести информацию об операционной системе, не менее 10 полей.
Get-WmiObject -Class CIM_OperatingSystem | Select-Object "Caption","CreationClassName","CSCreationClassName", "CSName", "CurrentTimeZone","Description", `
"Distributed","FreePhysicalMemory",  "FreeSpaceInPagingFiles", "FreeVirtualMemory" | Format-Table