;---alt text include file---
	:r0*:svr;::
	PASTE("setViewingRange([-10, 10], [-10, 10]);")
	return

	:r0*:lat;::
	PASTE("setVariables(linearAltText(), {figcaption => 1});")
	return

	:r0*:mlat;::
	PASTE("setVariables(multipleLines(), {figcaption => 1});")
	return

	:r0*:pat;::
	PASTE("setVariables(polyAltText(), {figcaption => 1});")
	return

	:r0*:sv;::
	PASTE("setVariables(,{figcaption => 1});")
	return

;---figure captions, tabbed interfaces---
	:r*:uid;::
	;get QID from active
		WinGetActiveStats, Title, Width, Height, X, Y
		StringGetPos, pos, Title , (, R                          
		pos++                                                    
		StringTrimLeft, MyQid, Title, %pos%                      
		StringReplace, MyQid, MyQid, ), , All
	PASTE("@unique = ();`r`n@unique = generateUniqueIds('" . MyQid . "');")
	return
	
	;replace QID-cap-X with <EQN $unique[X]>-cap
	!+c::
	temp := copy()
	temp := RegExReplace(temp, "\d+-cap-(\d)", "<EQN $unique[$1]>-cap")
	Paste(temp)
	return

	; figure caption
	#+f::
	;get QID from active
	WinGetActiveStats, Title, Width, Height, X, Y
	StringGetPos, pos, Title , (, R                          
	pos++                                                    
	StringTrimLeft, MyQid, Title, %pos%                      
	StringReplace, MyQid, MyQid, ), , All
	NewQid := MyQid
	if (NewQid = OldQid) 
	{
	 var:=var+1
	}
	else
	{
	 var := 0
	}
	OldQid := MyQid
	mytext := Copy()
	modText := RegExReplace(mytext,"([^.]*\.[a-z]{3}['""])\s*(.*)\/\>","$1 alt=""""/>")
	modText := RegExReplace(modtext,"<waplot\s(.*?)>","<waplot alt="""" $1>")
	modText := RegExReplace(modText,"<\/?figure>","")
	;InputBox,Var,Caption Number
	Paste("<figure class=""cap-btm-rit"" tabindex=""0"" aria-describedby=""" . "<EQN $unique[" . Var . "]>" . "-cap" . """>" . modText . "<figcaption class=""alt-cap"" id=""" . "<EQN $unique[" . Var . "]>" . "-cap" . """> <div class=""desc""> <EQN $altText" . Var . "> </div> </figcaption> </figure>")
	return
	
	;tabbed interfaces
	^+a::

	;get QID from active
	WinGetActiveStats, Title, Width, Height, X, Y
	StringGetPos, pos, Title , (, R                          
	pos++                                                    
	StringTrimLeft, MyQid, Title, %pos%                      
	StringReplace, MyQid, MyQid, ), , All
	mytext := Copy()
	modText := RegExReplace(mytext,"("")","'")
	modText := RegExReplace(modText,"alt=['""]['""]","")
	modText := RegExReplace(modText,"(\.[a-z]{3}['""])","$1 alt=""""")
	modText := RegExReplace(modText,"(\<img.*?[^\/])\>","$1 />")
	modText := RegExReplace(modText,"([^>]>)(.*)","$1")
	modText := RegExReplace(modText,"\<div\s+class\s*=\s*['""]?figure['""]?\>","")
	modText := RegExReplace(modText,"\<\/div\>","")
	;output figure + caption

	;H:\ahk_files\Figcaptions\
	file_name = %A_ScriptDir%\tab_ahk_currentQID.txt
	FileRead, file, %A_ScriptDir%\tab_ahk_currentQID.txt
	;FileAppend,Test1234, H:\ahk_files\Figcaptions\tab_ahk_currentQID.txt

	;MsgBox %A_ScriptDir%\tab_ahk_currentQID.txt
	if (!FileExist(A_ScriptDir . "\tab_ahk_currentQID.txt")) {
		FileAppend," ", %A_ScriptDir%\tab_ahk_currentQID.txt
	}

	QID_prev = ""
	image_counter = 0
	Loop
	{
		FileReadLine, line, %A_ScriptDir%\tab_ahk_currentQID.txt, %A_Index%
		if ErrorLevel
			break
		if (A_Index == 1) {
			QID_prev := line
		} else {
			image_counter := line
		}
	}

	if (MyQID != QID_prev) {
	;MsgBox, %MyQID% ||| %QID_prev%
		
		FileDelete, %A_ScriptDir%\tab_ahk_currentQID.txt
		FileAppend, %MyQID%`n, %A_ScriptDir%\tab_ahk_currentQID.txt
		FileAppend, 1, %A_ScriptDir%\tab_ahk_currentQID.txt
		image_counter = 1
		
		
	} else {
		image_counter++

		FileDelete, %A_ScriptDir%\tab_ahk_currentQID.txt
		FileAppend, %MyQID%`n, %A_ScriptDir%\tab_ahk_currentQID.txt
		FileAppend, %image_counter%, %A_ScriptDir%\tab_ahk_currentQID.txt
		
	}

	FigCapQID := MyQID
	MyQID := MyQID . "-" . Chr(96 + image_counter)

	;myTab = <figure class="cap-btm-rit" tabindex="0" aria-describedby="%MyQid%-cap-%image_counter%">`r`n%modText%`r`n<figcaption class="alt-cap" id="%MyQid%-cap-%image_counter%">`r`n <div class="desc">`r`n`r`n`r`n`r`n</div>`r`n </figcaption>`r`n</figure>`r`n
	myTab = <div class="wa1-tabbox">`r`n<div class="wa1-tab">`r`n<input id="%MyQid%-tab-1" type="radio" name="%MyQid%-tab" checked="true" role="presentation" aria-hidden="true" />`r`n<label class="wa1-tablabel" role="tab" for="%MyQid%-tab-1" >Figure</label>`r`n<div class="wa1-tabcontent" role="tabpanel">`r`n<figure class="cap-btm-rit" aria-describedby="%FigCapQID%-cap-1" tabindex="0">`r`n%modText%`r`n<figcaption class="alt-cap" id="%FigCapQID%-cap-1">`r`n<div class="desc">[Description of image.] Refer to the adjacent list/table/explanation for more details.</div>`r`n</figcaption>`r`n</figure>`r`n</div>`r`n</div>`r`n<div class="wa1-tab">`r`n<input id="%MyQid%-tab-2" type="radio" name="%MyQid%-tab" role="presentation" aria-hidden="true" />`r`n<label class="wa1-tablabel" role="tab" for="%MyQid%-tab-2">Tab 2</label>`r`n<div class="wa1-tabcontent" role="tabpanel">`r`n</div>`r`n</div>`r`n</div> 


	clipboard = %myTab%
		send ^v
	sleep, 200
	Clipboard := ClipSaved
     ClipWait, 0
     ClipSaved =
     
	 return

;---other---
	;<s:mathsp> out and italicize letters
	#!l::
	temp := copy()
	temp := RegExReplace(temp, ".", "<em>$0</em><s:mathsp>")
	temp := "<span class='nobr'>" . SubStr(temp, 1, -10) . "</span>"
	Paste(temp)
	return