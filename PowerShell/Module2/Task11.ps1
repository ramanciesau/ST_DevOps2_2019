﻿#Загрузить данные из полученного в п.10 xml-файла и вывести в виде списка информацию о каждой записи,в виде 5 любых (выбранных Вами) свойств.
Get-Content -Path C:\ShellHistory.xml | Select-Object PsChaildName, PsProvider, PsPath, ReadCount, Lenght