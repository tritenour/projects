;---html tags---
	^e::
	to_paste := Copy()
	Paste("<eqn " to_paste ">")
	return
	
	!e::
	to_paste := Copy()
	Paste("<EQN " to_paste ">")
	return
	
	#e::
	Paste("<eqn>`r`n`r`n''</eqn>")
	return

	#+n::
	to_paste := Copy()
	Paste("<span class='nobr'>" to_paste "</span>")
	return

	#+l::
	to_paste := Copy()
	Paste("<li>" to_paste "</li>")
	return

	#+s::
	to_paste := Copy()
	Paste("<sup>" to_paste "</sup>")
	return

	#+x::
	to_paste := Copy()
	Paste("<sub>" to_paste "</sub>")
	return

	#+o::
	to_paste := Copy()
	Paste("<span aria-hidden='true'>" to_paste "</span>")
	return

	;<watex>
	#+w::
	to_paste := Copy()
	Paste("<watex>\[" to_paste "\]</watex>")
	return

	;<strong>
	#+b::
	to_paste := Copy()
	Paste("<strong>" to_paste "</strong>")
	return

	;<em>
	#+i::
	to_paste := Copy()
	Paste("<em>" to_paste "</em>")
	return

;---Functions---

	#!h::
	to_paste := Copy()
	Paste("HoldForm[" to_paste "]")
	return

	#!,::
	to_paste := Copy()
	Paste("commas(" to_paste ")")
	return

	#!d::
	to_paste := Copy()
	Paste("decform(" to_paste ", 2)")
	return

	#!p::
	to_paste := Copy()
	Paste("\pre{" to_paste "}")
	return

;---Delimeters---

	^0::
	to_paste := Copy()
	Paste("(" to_paste ")")
	return

	^+|::
	to_paste := Copy()
	Paste("|" to_paste "|")
	return

	^]::
	to_paste := Copy()
	Paste("[" to_paste "]")
	return

	^+}::
	to_paste := Copy()
	Paste("{" to_paste "}")
	return

	^'::
	to_paste := Copy()
	Paste("'" to_paste "'")
	return

	^+'::
	to_paste := Copy()
	Paste("""" to_paste """")
	return

	^+<::
	to_paste := Copy()
	Paste("\left[2](" to_paste "\right[2])")
	return

	^+>::
	to_paste := Copy()
	Paste("\left(" to_paste "\right)")
	return