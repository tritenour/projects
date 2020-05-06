;---General---
	:r*:sec;::
	PASTE("<SECTION>")
	return

	:r*:seca;::
	PASTE("<SECTION NOBR>")
	return

;---Numerical Grading---
	:r*:simp;::
	PASTE("$SIMPLIFIED=1;")
	return

	:r*:fr;::
	PASTE("$FRACTION=1;")
	return

	:r0*:pfr;::
	PASTE("$PROPERFRACTION=1;")
	return

	:r0*?:nums;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $SIMPLIFIED=1; " . temp . "> {tab} 0")
	return

	:r0*?:numact;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN acct_comma(" . temp . ")> {tab} 0")
	return

	:r0*?:num0s;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $SIMPLIFIED=1; " . temp . "> {tab} 0")
	return

	:r0*?:numf;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $FRACTION=1; " . temp . ">")
	return

	:r0*?:num0f;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $FRACTION=1; " . temp . ">")
	return

	:r0*?:numpf;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $PROPERFRACTION=1; " . temp . ">")
	return

	:r0*?:num0pf;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $PROPERFRACTION=1; " . temp . ">")
	return


	:r0*?:num;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN " . temp . "> {tab} 0")
	return

	:r0*?:num0;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN " . temp . "> {tab} 0")
	return

	:r0*?:numfeed;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN math_feedback_numeric(" . temp . ")> {tab} 0")
	return
	
	:r0*?:numfeeds;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $SIMPLIFIED=1; math_feedback_numeric(" . temp . ")> {tab} 0")
	return
	
	:r0*?:numfeedf;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $FRACTION=1; math_feedback_fraction(" . temp . ")>")
	return
	
	:r0*?:numfeedpf;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	PASTE(sec . "<EQN $PROPERFRACTION=1; math_feedback_fraction(" . temp . ")>")
	return
	
	:r0*:tol;::
	PASTE("$TOL = {min => $min, max => $max};")
	return

	:r0*:nofrac;::
	PASTE("$THIS_SCORE=0 if contains('/'); $TOOLTIP=""Enter a number as an exact integer or decimal."";")
	return

	:r0*:nofract;::
	PASTE("$THIS_SCORE=0 if contains('/'); $TOOLTIP=""Enter a number as an integer or decimal."";")
	return

	:r0*:rfrac;::
	PASTE("$THIS_SCORE=0 if (!contains('/')); $TOOLTIP=""Enter an answer as a fraction."";")
	return

	;For sciNot questions
	:r0*:nosci;::
	PASTE("$THIS_SCORE=0 if contains(['e', '/']);")
	return

;---MC Grading---
	:r*:pd;::
	PASTE("$PULLDOWN=1;")
	return

	:r*:pdo;::
	PASTE("$PULLDOWN=1; $ORDERED=1;")
	return

	:r*:sep;::
	PASTE("$SET_EACH_POSITION=1;")
	return

	:r*:mcp;::
	PASTE("<MCPART>")
	return

	:r*:ord;::
	PASTE("$ORDERED='1';")
	return

	:r*:soq;::
	PASTE("$Select_Option = '?';")
	return

	:r0*?:hash;::
	count := 1
	SEND +{LEFT}
	temp := copy()
	vars := "@h"
	hashContents := ""
	Loop %temp%{
	hashContents := hashContents . "$h[" . count-1 . "] => ,`r`n"
	count++
	}
	hashContents := SubStr(hashContents, 1, -3)
	PASTE(vars . " = pick(" . temp . ", 1.." . temp . ");`r`n%mc = (`r`n" . hashContents . "`r`n);")
	return

	:r0*?:hashans;::
	count := 1
	SEND +{LEFT}
	temp := copy()
	out := "<EQN $ORDERED=$h[0];''>"
	Loop %temp%{
	out := out . "<EQN $mc{" . count . "}>`r`n"
	count++
	}
	out := SubStr(out, 1, -2)
	PASTE(out)
	return
	
;---Algebraic/Symbolic Grading---
	:r*:kid;::
	PASTE("$KEY_IMAGE_DISPLAY='';")
	return

	:r*:padp;::
	PASTE("$PAD='phys';")
	return

	:r*:padc;::
	PASTE("$PAD='calc';")
	return

	:r*:padd;::
	PASTE("$PAD='devmath';")
	return

	:r*:nsh;::
	PASTE("$NO_SYMBOLIC_HINT=1;")
	return

	:r*:cas;::
	PASTE("$CASGRADER='mathematica';")
	return

	;keydisplay commas
	:r0*:kdc;::
	PASTE("$KEY_DISPLAY='commalist';")
	return

	:r0*?:algd;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	kdc := ""
	gspace := "<g:Exact>"
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	if (RegExMatch(temp, "{")){
	kdc := "$KEY_DISPLAY='commalist'; "
	gspace = optList = {TOLERANCE -> "0", FORM -> unordered, FREQUENCY -> False, BRACKETS -> either, SIMPLIFY -> False}; <g:optList>
	}
	PASTE(sec . "<EQN $CASGRADER='mathematica'; $PAD='devmath'; " . kdc . "''> " . temp . " {tab} " . gspace)
	return

	:r0*?:algc;::
	SEND +{HOME}
	temp := copy()
	sec := ""
	kdc := ""
	gspace := "<g:Exact>"
	if (RegExMatch(temp, "<SECTION>")){
	temp := RegExReplace(temp, "<SECTION>","")
	sec :="<SECTION>"
	}
	if (RegExMatch(temp, "{")){
	kdc := "$KEY_DISPLAY='commalist'; "
	gspace = optList = {TOLERANCE -> "0", FORM -> unordered, FREQUENCY -> False, BRACKETS -> either, SIMPLIFY -> False}; <g:optList>
	}
	PASTE(sec . "<EQN $CASGRADER='mathematica'; $PAD='calc'; " . kdc . "''> " . temp . " {tab} " . gspace)
	return