#Вывести список из 6 процессов занимающих дольше всего процессор.
Get-Process | Sort-Object -Descending -ErrorAction SilentlyContinue | Select-Object Id, Name, UserProcessorTime -First 6