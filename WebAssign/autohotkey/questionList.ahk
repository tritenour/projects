!+q::
i := 1
;GUI
Gui, 1:New, , Question List
Gui, 1:Add, Text, , Enter a list of line break seperated question names
Gui, 1:Add, Edit, yp+15 r10 w200 vQuestionList
Gui, 1:Add, Button, gButtonOK36 yp+140, OK
Gui, 1:Show

Gui, 2:New, , Question List
return

ButtonOK36:	
	global i
	questionNotes := []
	Gui, 1:Submit
	global QuestionList
	questions := []
	questions := StrSplit(QuestionList, "`n")
	questionsChoices := questions[1] . "|"
	n := questions.length() - 1
	Loop % n{
		questionsChoices := questionsChoices . "|" . questions[A_Index+1]
	}
	Gui, 2:Add, ListBox, AltSubmit gChangeChoice r10 w200 vQuestionChoice, % questionsChoices
	Gui, 2:Add, Button, gButtonLoadInActive36 yp+150, Load in Active
	Gui, 2:Add, Text, ym xp+210, Notes
	Gui, 2:Add, Edit, vNotes w200 h200 yp+20,
	Gui, 2:Show
	return	
	
ButtonLoadInActive36:
	Gui, 2:Submit, NoHide
	ImportQuestionToActive(questions[QuestionChoice])
	return

ButtonLoadInBrowser36:
	return
	
ButtonLoadAllInBrowser36:
	return
	
ButtonLoadAllInProofingPage36:
	return
	
ChangeChoice:
	if (A_GuiEvent = "normal"){
		global i
		Gui, 2:Submit, NoHide
		questionNotes[i] := Notes
		i := QuestionChoice
		GuiControl, , Notes, % questionNotes[i]
	}
	else{
		Gui, 2:Submit, NoHide
		ImportQuestionToActive(questions[QuestionChoice])
	}
	return
	
	
ImportQuestionToActive(qname)
{  
    IfWinExist, WebAssign Qbc Active
    {
        WinActivate
        Send {F10}
        Sleep, 200
        IfWinActive, ahk_class #32770
        {
            MsgBox, 4, Active Import, Question is not saved. Do you want to cancel the current operation so you can save this question?, 10
            IfMsgBox, Yes
            {
                Send {Enter}
            }
            IfMsgBox, No
            {
                Send {Tab}{Enter}
                Sleep, 100
                Paste(qname)
                Send {Enter}
            }
            IfMsgBox, Timeout
            {
              Send {Enter}
            }
        }
        Else
        {
            Sleep, 100
            Paste(qname)
            Send {Enter}
        }
        return
    }
    Else
    {
        MsgBox, GetInfoFromJIRA could not find JIRA - exiting.
        return
    }
}
	