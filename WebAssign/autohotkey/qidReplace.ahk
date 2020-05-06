#!o::
Gui, New, , qidReplace
Gui, Add, Text, ,QIDs (<p:commalist>)
Gui, Add, Edit, r9 vQids w500
Gui, Add, Button, Default, Go
Gui, Show
return

ButtonGo:
	Gui, Submit, NoHide
	Qids := RegExReplace(Qids, ",\s+", ",")
	QidsArray := StrSplit(Qids, ",", "")
	
	arr := ComObjArray(VT_DISPATCH  := 9, QidsArray.length())
	
	Loop, % QidsArray.length(){
		arr[A_Index-1] := ComObjCreate("InternetExplorer.Application")
		;arr[A_Index-1].Visible := true
		arr[A_Index-1].Navigate("http://www.editorial.webassign.net/v4cgi/faculty.pl?action=questions/edit&qid=" . QidsArray[A_Index])
		;arr[A_Index-1].document.getElementByID("solution").value := "test"
	}
	
	Loop, % QidsArray.length(){
		arr[A_Index-1].Visible := true
		arr[A_Index-1].document.getElementByID("solution").value := "test"
		sleep 1000
	}
	
	
	;for window in ComObjCreate("Shell.Application").Windows
	;	windows .= window.LocationName " :: " window.LocationURL "`n"
	;MsgBox % windows