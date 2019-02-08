<#
Вывести список названий и занятую виртуальную память (в Mb) каждого процесса, 
разделённые знаком тире, 
при этом если процесс занимает более 100Mb – выводить информацию красным цветом, иначе зелёным. 
#>
$memProcs = @(Get-Process | Select-Object VirtualMemorySize, Name)
foreach($obj in $memProcs)
{
    if($obj.VirtualMemorySize / 1MB -gt 100)
    {
        Write-Host ($obj.Name + "-" + ($obj.VirtualMemorySize / 1MB)) -ForegroundColor red
    }
    else
    {
        Write-Host ($obj.Name + "-" + ( $obj.VirtualMemorySize / 1MB)) -ForegroundColor Green
    }
}