#Получить список классов работы с принтером.
Get-WmiObject -List | Where-Object {$_.name -match "Printer"}
