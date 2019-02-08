#Сохранить в текстовый файл на созданном диске список запущенных(!) служб. 
#Просмотреть содержимое диска. Вывести содержимое файла в консоль PS. 
Get-Service | Where-Object {$_. Status -eq 'running'} | Out-File "C:\M2T2_Teshev\RunningServices.txt"
Set-Location "C:\M2T2_Teshev"
Get-ChildItem
Get-Content "C:\M2T2_Teshev\RunningServices.txt"
