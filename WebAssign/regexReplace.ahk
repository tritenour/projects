; @title regexReplace GUI
; @author Travis Ritenour
; @date 5/10/2019
; @description bring up a gui to apply AHK's RegExReplace on the current highlighted text. Use "Copy and Replace" unless you're sure about the output.
; @General Code @FindReplace @regex

findGlobal := ""
replaceGlobal := ""

#!x::
old := copy()
Gui, New, , regexReplace
Gui, Add, Text, ym+5, Find
Gui, Add, Edit, xp+150 yp-5 vfindGlobal w250, %findGlobal%
Gui, Add, Text, xm, Replace with
Gui, Add, Edit, xp+150 yp-5 vreplaceGlobal w250, %replaceGlobal%
Gui, Add, Button, Default xm yp30 w80, Copy and Replace
Gui, Add, Button, xm yp40 w80, Replace
Gui, Show 
return

ButtonCopyandReplace:
	Gui, Submit
	new := RegExReplace(old, findGlobal, replaceGlobal)
	Paste(old . "`r`n`r`n" . new . "`r`n")
	return
	
ButtonReplace:
	Gui, Submit
	new := RegExReplace(old, findGlobal, replaceGlobal)
	Paste(new)
	return
