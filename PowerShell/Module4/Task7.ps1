#Написать сценарий, выводящий суммарное время пингования компьютера (например 10.0.0.1) в сети.
$pingCounter = 3
$sumOfResponces = 0
for ([int]$i = 0; $i -lt $pingCounter; $i++) {
$sumOfResponces += $(Get-WmiObject Win32_PingStatus -Filter "Address='8.8.8.8'").ResponseTime
}
Write-Output "$sumOfResponces ms"
