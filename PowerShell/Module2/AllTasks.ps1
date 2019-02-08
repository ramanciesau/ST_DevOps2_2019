#Просмотреть содержимое ветви реeстра HKCU 
cd HKCU:\
Get-ChildItem  -Recurse

#Создать, переименовать, удалить каталог на локальном диске
Set-Location D:\
$newDirectory = New-Item -ItemType Directory -Name "NewDirectory"
Rename-Item D:\NewDirectory D:\NewDirectory2
Remove-Item D:\NewDirectory2

#Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.
New-Item -Path -ItemType "directory" "C:\M2T2_Teshev"
New-PSDrive -PSProvider FileSystem -Name "M2T2_Teshev" -Root "C:\M2T2_Teshev"  

#Сохранить в текстовый файл на созданном диске список запущенных(!) служб. 
#Просмотреть содержимое диска. Вывести содержимое файла в консоль PS. 
Get-Service | Where-Object {$_. Status -eq 'running'} | Out-File "C:\M2T2_Teshev\RunningServices.txt"
Set-Location "C:\M2T2_Teshev"
Get-ChildItem
Get-Content "C:\M2T2_Teshev\RunningServices.txt"


#Просуммировать все числовые значения переменных текущего сеанса.
$var1 = 1
$var2 = 2
$var1 = 3
$sum 
foreach ($obj in (Get-Variable | Select-Object Value)) 
{
    if ($obj.Value -is [int])
    {
        $sum += $obj.Value
    }
}
$sum

#Вывести список из 6 процессов занимающих дольше всего процессор.
Get-Process | Sort-Object -Descending -ErrorAction SilentlyContinue | Select-Object Id, Name, UserProcessorTime -First 6

<#
Вывести список названий и занятую виртуальную память (в Mb) каждого процесса, 
разделённые знаком тире, 
при этом если процесс занимает более 100Mb – выводить информацию красным цветом, иначе зелёным. 
#>
$memProcs = @(Get-Process | Select-Object VirtualMemorySize, Name)
foreach($obj in $memProcs)
{
    if(($obj.VirtualMemorySize / 1000000) -gt 100.0)
    {
    Write-Host ($obj.Name + "-" + ($obj.VirtualMemorySize / 1000000 )) -ForegroundColor red
    }
    else
    {
    Write-Host ($obj.Name + "-" + ( $obj.VirtualMemorySize / 1000000 )) -ForegroundColor Green
    }
}


#Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp
Get-ChildItem "C:\Windows" -Recurse -Exclude "*.tmp" -File | Measure-Object -Property Length -Sum


#Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft
Set-Location HKLM:\SOFTWARE\Microsoft
Get-ChildItem > C:\M2T2_Teshev\Teshev.csv

#Сохранить в XML -файле историческую информацию о командах выполнявшихся в текущем сеансе работы PS.
Get-History > C:\ShellHistory.xml
 
#Загрузить данные из полученного в п.10 xml-файла и вывести в виде списка информацию о каждой записи,в виде 5 любых (выбранных Вами) свойств.
Get-Content -Path C:\ShellHistory.xml | Select-Object PsChaildName, PsProvider, PsPath, ReadCount, Lenght


#Удалить созданный диск и папку С:\M2T2_ФАМИЛИЯ
Remove-Item -Path C:\M2T2_Teshev -Recurse
Remove-PSDrive -Name M2T2_Teshev