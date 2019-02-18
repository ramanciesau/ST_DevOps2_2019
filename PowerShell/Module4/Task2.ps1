#Получить список всех пространств имён классов WMI. 
Get-WmiObject -List | Select-Object __NAMESPACE -Unique
