; @title Hotkey Maker
; @author Travis Ritenour
; @date 3/18/2019
; @description This hotkey pulls up a gui to create simple, typical hotkeys and automatically reload ahk afterwards


;This hotkey assumes you have a main ahk script that #includes other scripts
;Create "generated.ahk" in the same directory as AutoHotKey.ahk (or whatever your main script is)
;Include generated.ahk in AutoHotKey.ahk (or whatever your main script is)
;There are options to create hotkeys in other directories/files. 

#!y::
dChecked := 0
copy := Copy()

Gui, New, , Hotkey Maker 
Gui, Add, Text, ym+5, String to be produced:
Gui, Add, Edit, xp+150 yp-5 vproduced, %copy%

Gui, Add, Radio, xm +Checked gHotstringSub visHotstring, Hotstring
Gui, Add, Radio, xp160 gHotkeySub visHotkey, Hotkey

Gui, Add, Edit, xm yp+20 vhotstring w135, abc;

Gui, Add, Checkbox, +Disabled xm160 yp+20 gDelimiterSub vDelimiter, This goes around text
Gui, Add, Edit,vLeft +Disabled w60,
Gui, ADd, Text, +Disabled xp+80 yp+5, Text in between
Gui, Add, Edit, xp+100 yp-5 +Disabled vRight w60,

Gui, Add, GroupBox, xm+160 w200 h100, Command:
Gui, Add, Checkbox, +Disabled xp+5 yp+20 vCtrl, Ctrl ^
Gui, Add, Checkbox, +Disabled xp60 yp0 vAlt, Alt !
Gui, Add, Checkbox, +Disabled xm+165 yp+20 vShift, Shift +
Gui, Add, Checkbox, +Disabled xp60 yp0 vWindows, Windows #
Gui, Add, Edit, +Disabled xp-60 yp+20 vHotkey w25, a

Gui, Add, Button, xm yp60 w80, File
Gui, Add, Edit, xp+90 vSave, %A_WorkingDir%\generated.ahk
Gui, Add, Checkbox, xm vAHKReload, Reload AHK
Gui, Add, Button, xm w80, Create
Gui, Show
return

ButtonCreate:
	Gui, Submit
	if (isHotstring = 1){
		output = `r`n:r*:%hotstring%::%produced%`r`n
		FileAppend , %output%, %Save%
		if (AHKReload = 1){
		Reload
		}
		return
	}

	modifiers := ""
	if (Ctrl = 1){
		modifiers = %modifiers%^
	}
	if (Alt = 1){
		modifiers = %modifiers%!
	}
	if (Shift = 1){
		modifiers = %modifiers%+
	}
	if (Windows = 1){
		modifiers = %modifiers%#
	}
	 if (Delimiter = 1){
		output =  `r`n%modifiers%%Hotkey%::`r`nto_paste := Copy()`r`nPaste("%Left%" to_paste "%Right%")`r`nreturn`r`n
	}
	else{
	output = `r`n%modifiers%%Hotkey%::`r`nPaste("%produced%")`r`nreturn`r`n
	}
	FileAppend , %output%, %Save%
	if (AHKReload = 1){
		Reload
	}
	return
	
HotstringSub:
	GuiControl,Enable, Hotstring
	GuiControl,Disable, Delimiter
	GuiControl,Disable, Left
	GuiControl,Disable, Right
	GuiControl,Disable, Ctrl
	GuiControl,Disable, Alt
	GuiControl,Disable, Shift
	GuiControl,Disable, Windows
	GuiControl,Disable, Hotkey
	GuiControl,,Delimiter,0
	dChecked := 0
	return

HotkeySub:
	GuiControl,Disable, Hotstring
	GuiControl,Enable, Delimiter
	GuiControl,Enable, Ctrl
	GuiControl,Enable, Alt
	GuiControl,Enable, Shift
	GuiControl,Enable, Windows
	GuiControl,Enable, Hotkey
	return
	
DelimiterSub:
	dChecked := 1 - dChecked
	Gui, Submit, NoHide
	if (dChecked = 1){
	GuiControl, Enable, Left
	GuiControl, Enable, Right
	}
	else {
	GuiControl, Disable, Left
	GuiControl, Disable, Right
	}
	GuiControl, , Left, %produced%
	GuiControl, , Right, %produced%
	return

ButtonFile: 
	FileSelectFile, File, 8
	GuiControl, , Save, %File%
	return