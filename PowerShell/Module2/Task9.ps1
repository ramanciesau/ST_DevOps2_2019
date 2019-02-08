#Сохранить в CSV-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft
Set-Location HKLM:\SOFTWARE\Microsoft
Get-ChildItem > C:\M2T2_Teshev\Teshev.csv