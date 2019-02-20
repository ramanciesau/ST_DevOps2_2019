#Настроить PowerShell Remoting, для управления всеми виртуальными машинами с хостовой.
Set-Item WSMan:\Localhost\Client\Trustedhosts -Value *