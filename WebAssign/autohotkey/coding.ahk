	:r*?;:rn;::
	SEND +{LEFT 2}
	temp := copy()
	a := Substr(temp, 1, 1)
	b := Substr(temp, 2, 1)
	c := 1
	PASTE("randnum(" . a . "," . b . "," . c . ")")
	return
	
	:r*?;:rn1;::
	SEND +{LEFT 4}
	temp := copy()
	a := Substr(temp, 1, 2)
	b := Substr(temp, 3, 2)
	c := 1
	PASTE("randnum(" . a . "," . b . "," . c . ")")
	return

	:r*?;:paste;::
	SEND +{LEFT 1}
	n := copy() - 1
	temp := ""
	Loop %n%{
	temp := temp . clipboard . "`r`n"
	}
	temp := temp . clipboard
	PASTE(temp)
	return
	
	

!+f::
temp := copy()
temp := RegExReplace(temp, "/", ",")
PASTE("fraction(" . temp . ")")
return

;Change $ to $t_ in highlighted text
!+y::
temp := Copy()
temp := RegExReplace(temp, "\$", "$t_")
temp := RegExReplace(temp, "\$t_t_", "$t_")
temp := RegExReplace(temp, "\$t__", "$_")
temp := RegExReplace(temp, "\$t_\#", "$#t_")
temp := RegExReplace(temp, "\$t_PAD", "$PAD")
temp := RegExReplace(temp, "\$t_CASGRADER", "$CASGRADER")
temp := RegExReplace(temp, "\$t_KEY_", "$KEY_")
temp := RegExReplace(temp, "\$t_ORDERED", "$ORDERED")
temp := RegExReplace(temp, "\$t_PULLDOWN", "$PULLDOWN")
temp := RegExReplace(temp, "\$t_FRACTION", "$FRACTION")
temp := RegExReplace(temp, "\$t_PROPERFRACTION", "$PROPERFRACTION")
temp := RegExReplace(temp, "\$t_SIMPLIFIED", "$SIMPLIFIED")
temp := RegExReplace(temp, "\$t_Select_Option", "$Select_Option")
temp := RegExReplace(temp, "\$t_SET_EACH_POSITION", "$SET_EACH_POSITION")
temp := RegExReplace(temp, "\$t_EXTRAGRADING", "$EXTRAGRADING")
temp := RegExReplace(temp, "\$t_thisresponse", "$thisresponse")
temp := RegExReplace(temp, "\$t_thisanswerr", "$thisanswer")
temp := RegExReplace(temp, "\$t_THIS_SCORE", "$THIS_SCORE")
temp := RegExReplace(temp, "\$t_HINT", "$HINT")
temp := RegExReplace(temp, "\$t_TOOLTIP", "$TOOLTIP")
temp := RegExReplace(temp, "\$t_TOL", "$TOL")
temp := RegExReplace(temp, "\$t_<", "$<")
temp := RegExReplace(temp, "\$t_([0-9])", "$$$1")
temp := RegExReplace(temp, "\{\$t_a<=>\$t_b\}", "{$a<=>$b}")
temp := RegExReplace(temp, "\{\$t_b<=>\$t_a\}", "{$b<=>$a}")
temp := RegExReplace(temp, "@", "@t_")
temp := RegExReplace(temp, "@t_t_", "@t_")
temp := RegExReplace(temp, "@t_{", "@{")
temp := RegExReplace(temp, "@t_\$", "@$")
Paste(temp)
return

:r*;:gc0;::black
:r*;:gc1;::RGBColor[0/255,114/255,187/255] 
:r*;:gc2;::RGBColor[255/255,32/255,32/255]
:r*;:gc3;::RGBColor[148/255,0/255,211/255]
:r*;:gc4;::RGBColor[58/255,166/255,58/255]
:r*;:gc5;::RGBColor[255/255,140/255,0/255]
:r*;:gc6;::RGBColor[130/255,130/255,130/255]
:r*;:gcgrid;::RGBColor[130/255,130/255,130/255,0.3]
:r*:rgc1;::RGBColor[0/255,114/255,187/255,0.6]
:r*:rgc2;::RGBColor[242/255,202/255,39/255,0.6]
:r*:rgc3;::RGBColor[58/255,166/255,58/255,0.6]

!+v::
temp := copy()
var := temp
temp := RegExReplace(temp, "p", " + ")
temp := RegExReplace(temp, "m", " - ")
temp := RegExReplace(temp, "d", " / ")

Loop{
oldTemp := temp
temp := RegExReplace(temp, "([a-zA-z])([a-zA-Z])", "$1 * $2")
temp := RegExReplace(temp, "([a-zA-Z])(\d+)", "$1 * $2")
temp := RegExReplace(temp, "(\d+)([a-zA-Z])", "$1 * $2")
} until oldTemp = temp

temp := RegExReplace(temp, "([a-zA-z])", "REPLACEME$1")
temp := RegExReplace(temp, "REPLACEME", "$") 
PASTE("$" . var . " = " . temp . ";")
return

!+e::
temp := copy()
temp := RegExReplace(temp, "eqn", "EQN")
Paste(temp)
return

!+%::
temp := Copy()
PASTE(temp . "_pct = 100 * " . temp . ";")
return

:r*?;:stepacc;::
SEND +{LEFT 2}
temp := copy()
a := Substr(temp, 1, 1)
b := Substr(temp, 2, 1)
PASTE("<h4 class='aria-item' role='region' aria-label='tutorial step'>Step " . a . " of " . b . " </h4>")
return