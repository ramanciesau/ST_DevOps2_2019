#Вывести список из 10 процессов занимающих дольше всего процессор. Результат записывать в файл
#Вывести список из 10 процессов занимающих дольше всего процессор. Результат записывать в файл
[CmdletBinding()]
Param
(
    
    [string]$filePath = "C:\",
    [string]$fileName = "fatProcesses.txt"

)
$fatProcesses = Get-Process | Sort-Object -Descending | Select-Object Id, Name, UserProcessorTime -First 10 > $filePath$fileName
