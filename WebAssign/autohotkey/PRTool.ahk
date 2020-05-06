!+p::
i := 1
steps := []

;GUI
Gui, New, , PR Tool 
Gui, Add, Text, vStepText ym+10 w400, Hello
Gui, Add, Button, gButtonOK yp-5 xp+400 w60, OK
Gui, Add, Button, gButtonBack yp xp+70 w60, Back
Gui, Add, Button, gButtonReset yp xp+70 w60, Reset
Gui, Add, GroupBox, xm yp+30 w250 h125, Options
Gui, Add, Checkbox, xp+5 yp+20 vGeneral Checked, General
Gui, Add, Checkbox, xp yp+20 vMI, MI
Gui, Add, Checkbox, xp yp+20 vEP, EP
Gui, Add, Checkbox, xp yp+20 vSolution, Solution
Gui, Add, Checkbox, xp yp+20 vAccessibility, Accessibility
Gui, Add, Checkbox, xp+80 yp-80 vDevMath Checked, Dev Math
Gui, Add, Checkbox, xp yp+20 vPrecalculus, Pre-calculus
Gui, Add, Checkbox, xp yp+20 vCalculus, Calculus
Gui, Add, Checkbox, xp yp+20 vStats, Stats
Gui, Add, Checkbox, xp+80 yp-60 vAltText, Alt Text
Gui, Add, Checkbox, xp yp+20 vGraphs, Graphs
Gui, Add, GroupBox, xm+255 ym+35 w400 h125, Modes
Gui, Add, Checkbox, xp+5 yp+20 vMC, Multiple Choice
Gui, Add, Checkbox, xp yp+20 vPulldown, Multiple Choice Pulldowns
Gui, Add, Checkbox, xp yp+20 vMCGraphs, Multiple Choice Waplots
Gui, Add, Checkbox, xp yp+20 vMS, Multiple Select
Gui, Add, Checkbox, xp yp+20 vNumerical, Numerical
Gui, Add, Checkbox, xp+150 yp-80 vAlgebraic, Algebraic
Gui, Add, Checkbox, xp yp+20 vIntervals, Intervals
Gui, Add, Checkbox, xp yp+20 vLists, Lists
Gui, Add, Checkbox, xp+150 yp-40 vEssay, Essay
Gui, Add, Checkbox, xp yp+20 vFileUpload, File-Upload
Gui, Add, Checkbox, xp yp+20 vGraphing, Graphing
Gui, Add, Checkbox, xp yp+20 vNumberLine, NumberLine
Gui, Add, Button, gButtonResetOps yp+60 xm w100, Reset Options and Modes
Gui, Show
return

StepRefresh()
{
	global steps
	global General
	global MI
	global EP
	global Solution
	global Accessibility
	global DevMath
	global Precalculus
	global Calculus
	global Stats
	global AltText
	global Graphs
	global MC
	global Pulldown
	global MCGraphs
	global MS
	global Numerical
	global Algebraic
	global Intervals
	global Lists
	global Essay
	global FileUpload
	global Graphing
	global NumberLine
	
	Gui, Submit, NoHide
	steps := []
	
	if (Accessibility = 1){
		steps.Push("label tags")
		steps.Push("tooltip prompts")
		steps.Push("unit prompts")
		steps.Push("accessible colors")
		steps.Push("read through")
		steps.Push("question difference tool")
	}
	
	if (MI = 1){
		steps.Push("MI Document")
	}
	
	if (General = 1){
		steps.Push("read textbook and ISM")
		steps.Push("remove textbook randomization")
		steps.Push("read through: spelling, grammar, and correct, unambiguous answers")
	}
	
	if (Solution = 1){
		steps.Push("<p:solution_roundedvalues>")
	}
	
	if (MI = 1){
		steps.Push("no static variables")
	}

	if (Graphs = 1){
		steps.Push("gridlines and ticks")
		steps.Push("axes are imposed and in italics")
		steps.Push("accessible colors")	
	}

	if (General = 1){
		steps.Push("generalized for randomization")
		steps.Push("well formatted variables, expressions, etc.")
		steps.Push("commas()")
	}

	if (Numerical = 1 || Algebraic == 1){
		steps.Push("answer blank labels")	
	}

	if (Numerical = 1){
		steps.Push("answer blank units, prompted")
	}
	
	if (General = 1){
		steps.Push("answer blank parentheses")
		steps.Push("question is well organized")
		steps.Push("consistent randomizations")
		steps.Push("check analysis for commas")
		steps.Push("randomized variables are displayed in red.")
		steps.Push("efficient Code")
	}
	
	if (MI = 1){
		steps.Push("base/MI randomization overlap")
	}
	
	if (EP = 1){
		steps.Push("randomizations are still ok after EP steps added")
	}
	
	if (Numerical = 1){
		steps.Push("grading flags")
		steps.Push("zero, near-zero, rounding tolerance, prompted")
		steps.Push("cascading tolerance")
		steps.Push("$size")
	}
	
	if (DevMath = 1){
	steps.Push("disallow division or scientific notation")
	}
	
	if (Algebraic = 1){
		steps.Push("correct answers are accepted, incorrect answers are denied")
	}
	
	if (DevMath = 1){
		steps.Push("proper simplification demanded, prompted")
	}
	
	if (Algebraic = 1){
		steps.Push("grading Options")
		steps.Push("$KEY_IMAGE_DISPLAY='';")
	}
	
	if (Lists = 1){
		steps.Push("<p:commalist>")
		steps.Push("$KEY_DISPLAY='commalist';")
	}
	
	if (MC = 1 || MS = 1 || Pulldown = 1){
		steps.Push("options are $ORDERED='1';, possibly with a hash")
		steps.Push("no distractors are technically correct")
	}
	
	if (MS = 1){
		steps.Push("<p:selectall>")
		steps.Push("wa1ans msel")
	}
	
	if (Pulldown = 1){
		steps.Push("sentences will pulldowns always make sense")
		steps.Push("$Select_Option = '?';")
		steps.Push("wa1ans fitb")
	}
	
	if (Graphing = 1){
		steps.Push("snap, grid values are appropriate")
		steps.Push("For parabolas: vertex has been introduced")
	}
	
	if (AltText = 1){
		steps.Push("alt text spelling and grammar are ok")
		steps.Push("alt text is ok across randomizations")
		steps.Push("math is displayed correctly")
		steps.Push("span nobr")
		steps.Push("requires visual cues")
	}
	
	if (General = 1){
		steps.Push("randomization overlap")
		steps.Push("consistent with sisters")
	}
}

ButtonOK:
	i++
	i := Mod(i-1,steps.MaxIndex())+1 ;curse arrays that start at 1
	GuiControl, Text, StepText, % steps[i]
	return
	
ButtonBack:
	if (i = 1){
		i := steps.MaxIndex()
	}
	else{
		i--
	}
	i := Mod(i-1,steps.MaxIndex())+1
	GuiControl, Text, StepText, % steps[i]
	return

ButtonReset:
	StepRefresh()
	i = 1
	i := Mod(i-1,steps.MaxIndex())+1
	GuiControl, Text, StepText, % steps[i]
	return	
	
ButtonResetOps:
	GuiControl, , General, 0
	GuiControl, , MI, 0
	GuiControl, , EP, 0
	GuiControl, , Solution, 0
	GuiControl, , Accessibility, 0
	GuiControl, , DevMath, 0
	GuiControl, , Precalculus, 0
	GuiControl, , Calculus, 0
	GuiControl, , Stats, 0
	GuiControl, , AltText, 0
	GuiControl, , Graphs, 0
	GuiControl, , MC, 0
	GuiControl, , Pulldown, 0
	GuiControl, , MCGraphs, 0
	GuiControl, , MS, 0
	GuiControl, , Numerical, 0
	GuiControl, , Algebraic, 0
	GuiControl, , Intervals, 0
	GuiControl, , Lists, 0
	GuiControl, , Essay, 0
	GuiControl, , FileUpload, 0
	GuiControl, , Graphing, 0
	GuiControl, , NumberLine, 0
	return