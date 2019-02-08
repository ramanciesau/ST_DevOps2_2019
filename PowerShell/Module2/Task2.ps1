#Создать, переименовать, удалить каталог на локальном диске
Set-Location D:\
$newDirectory = New-Item -ItemType Directory -Name "NewDirectory"
Rename-Item D:\NewDirectory D:\NewDirectory2
Remove-Item D:\NewDirectory2