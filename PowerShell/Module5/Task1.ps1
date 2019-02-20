#При помощи WMI перезагрузить все виртуальные машины.
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "169.254.170.35, 169.254.100.27"
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName 169.254.170.35 -Credential VM1_Teshev\Administrator
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName 169.254.100.27 -Credential VM2_Teshev\Administrator