#Сохранить в текстовый файл на диске список запущенных(!) служб.
[CmdletBinding()]
Param 
(
    
    [parameter(Mandatory = $true, HelpMessage = "Disk name")]
    
    [string]$diskName,
    [string]$rootCat = "C:\",
    
    [parameter(Mandatory = $true, HelpMessage = "Directory name")]
    
    [string]$directoryName,
    [string]$fileName = "runningServices.txt"

)
New-PSDrive -Name $diskName -Root $rootCat -PSProvider FileSystem 
Set-Location $diskName":\" 
New-Item -Path $diskName":\" -Name $directoryName -ItemType Directory
Get-Service | Where-Object {$_.Status -eq 'running'} > $diskName":\"$directoryName"\"$fileName
Get-ChildItem -Path $diskName":\"
Get-Content $diskName":\"$directoryName"\"$fileName