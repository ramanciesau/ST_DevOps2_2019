#Сохранить в текстовый файл на диске список запущенных(!) служб.
[CmdletBinding()]
Param 
(
    
    [parameter(Mandatory = $true, HelpMessage = "Disk name")]
    
    [string]$diskName,
    [string]$rootCat = "C:\",
    
    [parameter(Mandatory = $true, HelpMessage = "Directory name")]
    
    [string]$directoryName,
    [string]$fileName = "runningServices.txt"

)
New-PSDrive -Name $diskName -Root $rootCat -PSProvider FileSystem 
Set-Location $diskName":\" 
New-Item -Path $diskName":\" -Name $directoryName -ItemType Directory
Get-Service | Where-Object {$_.Status -eq 'running'} > $diskName":\"$directoryName"\"$fileName
Get-ChildItem -Path $diskName":\"
Get-Content $diskName":\"$directoryName"\"$fileName


#Просуммировать все числовые значения переменных среды Windows. (Параметры не нужны)
[CmdletBinding()]
Param 
(

    [parameter (Mandatory = $true, HelpMessage = "Var value")]
    
    [int]$var1,
    [int]$var2 = 2,
    [int]$var3 = 3,
    $sum 
)


foreach ($obj in (Get-Variable | Select-Object Value)) 
{
    if ($obj.Value -is [int])
    {
        $sum += $obj.Value
    }
}
$sum


#Вывести список из 10 процессов занимающих дольше всего процессор. Результат записывать в файл
[CmdletBinding()]
Param
(
    
    [string]$filePath = "C:\",
    [string]$fileName = "fatProcesses.txt"

)
$fatProcesses = Get-Process | Sort-Object -Descending | Select-Object Id, Name, UserProcessorTime -First 10 > $filePath$fileName


#Подсчитать размер занимаемый файлами в папке (например C:\windows) за исключением файлов с заданным расширением(напрмер .tmp)
[CmdletBinding()]
Param 
(
   
    [string]$searchDirectory = "C:\Windows\",
    [string]$excludeFiles = "*.tmp"

)
Get-ChildItem $searchDirectory -Recurse -Exclude $excludeFiles -File -Force | Measure-Object -Property Length -Sum


<#
Создать один скрипт, объединив 3 задачи:
    Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
    Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
    Загрузить данные из полученного в п.1.5.1 или п.1.5.2 файла и вывести в виде списка  разным разными цветами
#>
[CmdletBinding()]
param

(
        $secUpdates='C:\secUpdates.csv',
        $regTree='C:\regTree.xml'   
)
Get-HotFix -Description 'security*'|Export-Csv -Path $secUpdates
Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft|Export-Clixml $regTree
Import-Csv $secUpdates|Format-List -Property HotfixID 
Import-Clixml $regTree|Format-List -Property Name, psprovider 
$xmlOut = Get-Content -Path $regTree
Write-Host $xmlOut -BackgroundColor Green 


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


#Получить список всех доступных модулей
Get-Module -ListAvailable -All