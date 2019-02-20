#Для одной из виртуальных машин установить для прослушивания порт 42658.
Invoke-Command -ScriptBlock {Set-Item WSMan:\localhost\listener\listener*\port -Value 42658} -ComputerName 169.254.170.35 -Credential VM1_Teshev\Administrator
#Проверить работоспособность PS Remoting
#Invoke-Command -ScriptBlock {Get-Item WSMan:\localhost\listener\listener*\port } -ComputerName 169.254.170.35 -Port 42658 -Credential VM1_Teshev\Administrator
