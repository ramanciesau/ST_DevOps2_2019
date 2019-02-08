#Создать папку C:\M2T2_ФАМИЛИЯ. Создать диск ассоциированный с папкой C:\M2T2_ФАМИЛИЯ.
New-Item -Path -ItemType "directory" "C:\M2T2_Teshev"
New-PSDrive -PSProvider FileSystem -Name "M2T2_Teshev" -Root "C:\M2T2_Teshev"  