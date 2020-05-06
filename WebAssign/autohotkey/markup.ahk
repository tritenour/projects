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

:r*;:wans;::
Paste("<div class='wa1ans'>`r`n<_>`r`n</div>")
return

:r*;:wansf;::
sendraw <div class="wa1ans fitb">
sendraw     <_>
sendraw </div>
return

:r0*:waul;::
PASTE("<ul class = 'wa1list'></ul>")
return

; Div Par Tab
:r;:wapar;::
Paste("<div class='wa1par'>`r`n`r`n</div>")
return

; Div Given Tab
:r;:wagiv;::
Paste("<div class='wa1given'>`r`n`r`n</div>")
return

; multiple choice waplot table (new style)
:r;:mcplot;::
Paste("<div class='wa1ans'>`r`n<div class='accplotmc'>`r`n<div class='accblock'>`r`n<_>`r`n</div>`r`n<div class='accblock'>`r`n<_>`r`n</div>`r`n<div class='accblock'>`r`n<_>`r`n</div>`r`n<div class='accblock'>`r`n<_>`r`n</div>`r`n</div>`r`n</div>")
return

;Stacked Answer blanks (two stacked with all span classes)
:r*:stack;::
Paste("<span class='stackblock'>`r`n<span class='stackline'>`r`n<span class='stacktext'> text </span>`r`n<span class='stackmath'> </span>`r`n<span class='stackop'> = </span>`r`n<span class='stackans'> <_> </span>`r`n</span>`r`n<span class='stackline'>`r`n<span class='stacktext'> text </span>`r`n<span class='stackmath'> </span>`r`n<span class='stackop'> = </span>`r`n<span class='stackans'> <_> </span>`r`n</span>`r`n</span>")
return

:r0*:ovly;::
PASTE("<div style='position: absolute; top: 0px; left: 0px'><span aria-hidden='true'>text</span></div>")
return

	
#a::
Paste("<_>")
return



:r0*:latin;::
Paste("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae fringilla ligula. Vestibulum ultricies metus sed semper ornare. In efficitur rhoncus felis sit amet sodales. Cras porttitor augue non urna pulvinar pretium. Morbi sed risus ornare, tempor enim id, hendrerit lacus. Vestibulum faucibus massa vitae est pretium varius. Curabitur vel cursus dolor.")
return

;remove line breaks
!+l::
temp := Copy()
temp := RegExReplace(temp, "`r`n", "")
temp := RegExReplace(temp, "\s{2,}"," ")
Paste(temp)
return

;update tags
!+t::
temp := Copy()
temp := RegExReplace(temp, "<i>", "<em>")
temp := RegExReplace(temp, "</i>", "</em>")
temp := RegExReplace(temp, "<b>", "<strong>")
temp := RegExReplace(temp, "</b>", "</strong>")
Paste(temp)
return

:r0*:posrel;::style="position:relative"


:r0*:marg;::
PASTE("style=""margin-right:1em; margin-bottom:1em;""")
return

:r*?;:em;::
SEND +{LEFT}
temp := copy()
PASTE("<em>" . temp . "</em>")
return

^+f::
temp := copy()
temp := "\frac{" . temp . "}"
temp := RegExReplace(temp, "/", "}{")
PASTE(temp)
return

;remove tutorials
!+m::
temp := copy()
temp := RegExReplace(temp, "ms)<tutorial.+?>.+</tutorial>(`r`n)?", "")
Paste(temp)
return

^4::
temp := copy()
temp := RegExReplace(temp, "s)<div class=""sublabel"">(.+?)</div>", "<div class=""sublabel""><h4 class=""aria-index"" role=""region"" aria-label=""question item"">$1</h4></div>")
Paste(temp)
return

!+w::
temp := copy()
temp := RegExReplace(temp, "`r`n", "\\`r`n")
temp := RegExReplace(temp, "  ", " & ")
temp := "<watex>\[\begin{array}{rcl}`r`n" . temp . "`r`n\end{array}\]</watex>"
Paste(temp)
return