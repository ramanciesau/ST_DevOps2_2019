#Выводить сообщение при каждом запуске приложения MS Word.Выводить сообщение при каждом запуске приложения MS Word.
Register-WmiEvent -Query "SELECT * FROM __instancecreationevent WITHIN 5 WHERE targetinstance ISA 'Win32_Process' `
AND targetinstance.name='winword.exe'" -sourceIdentifier "Started" -Action { Write-Host "Microsoft Word is open now" }
 