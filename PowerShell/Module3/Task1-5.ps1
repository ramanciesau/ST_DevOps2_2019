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