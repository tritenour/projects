;update waplots
!+x::
temp := copy()
FoundPos := RegExMatch(temp, "axislabels\s{0,}=\s{0,}['""]\s{0,}(.+?)\s{0,},\s{0,}(.+?)\s{0,}['""]", matches)
temp := RegExReplace(temp, "axislabels\s{0,}=\s{0,}['""]\s{0,}(\w)\s{0,},\s{0,}(\w)\s{0,}['""]", "axislabels='\!\($1\""\""\), \!\($2\""\""\)'")
Paste(temp)
return

;matrix mode
+#m::
temp := copy()
temp := RegExReplace(temp, "{tab}.+", "")
temp := RegExReplace(temp, "\s{1,}`r`n", ", ")
temp := RegExReplace(temp, "\$FRACTION\s{0,}=\s{0,}1;", "")
temp := "[" . temp . "]"
temp := RegExReplace(temp, " ]", "]")
Paste("<EQN $MATRIX='1';''>" . temp)
return