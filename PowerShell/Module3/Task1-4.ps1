#Подсчитать размер занимаемый файлами в папке (например C:\windows) за исключением файлов с заданным расширением(напрмер .tmp)
[CmdletBinding()]
Param 
(
   
    [string]$searchDirectory = "C:\Windows\",
    [string]$excludeFiles = "*.tmp"

)
Get-ChildItem $searchDirectory -Recurse -Exclude $excludeFiles -File -Force | Measure-Object -Property Length -Sum