#Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp
#Подсчитать размер занимаемый файлами в папке C:\windows (и во всех подпапках) за исключением файлов *.tmp
Get-ChildItem "C:\Windows" -Recurse -Exclude "*.tmp" -File | Measure-Object -Property Length -Sum