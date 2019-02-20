#Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.
New-PSSessionConfigurationFile -Path "C:\disableCmndsSessionConf.pssc" -VisibleCmdlets Get-ChildItem
Register-PSSessionConfiguration -Name disableCmndsSessionConf -Path "C:\disableCmndsSessionConf.pssc" 
