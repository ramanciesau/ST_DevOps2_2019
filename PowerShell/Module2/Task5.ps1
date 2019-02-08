#Просуммировать все числовые значения переменных текущего сеанса.
$var1 = 1
$var2 = 2
$var1 = 3
$sum 
foreach ($obj in (Get-Variable | Select-Object Value)) 
{
    if ($obj.Value -is [int])
    {
        $sum += $obj.Value
    }
}
$sum