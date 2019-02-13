#Просуммировать все числовые значения переменных среды Windows. (Параметры не нужны)
[CmdletBinding()]
Param 
(

    [parameter (Mandatory = $true, HelpMessage = "Var value")]
    
    [int]$var1,
    [int]$var2 = 2,
    [int]$var3 = 3,
    $sum 
)


foreach ($obj in (Get-Variable | Select-Object Value)) 
{
    if ($obj.Value -is [int])
    {
        $sum += $obj.Value
    }
}
$sum