!+u::
temp := copy()
temp := "<li>" . temp
temp := RegExReplace(temp, "`r`n", "</li>`r`n<li>")
temp := temp . "</li>"
temp := "<ul class = 'wa1list'>`r`n" . temp . "`r`n</ul>"
Paste(temp)
return

!+i::
temp := copy()
temp := "<li style=""display:inline"">" . temp
temp := RegExReplace(temp, "`r`n", "</li>`r`n<li style=""display:inline"">")
temp := temp . "</li>"
temp := "<ul class = 'wa1list'>`r`n" . temp . "`r`n</ul>"
Paste(temp)
return