;---Style---

	:r0*:sty;::
	PASTE("<link rel='stylesheet' type='text/css' href='/csstyle/style.css'/>")
	return

;---Include Files---

	:r0*:accin;::
	PASTE("<eqn include('/userimages/feedback/accessibility.pl')>")
	return

	:r0*:atin;::
	PASTE("<eqn include('/userimages/feedback/math/altText.pl')>")
	return	

	:r0*:chemin;::
	PASTE("<eqn include('/userimages/feedback/chemistry/h_chem.pl')>")
	return	

	:r0*:mathin;::
	PASTE("<eqn include('/userimages/feedback/math/MathGeneral.pl')>")
	return

	:r0*:statin;::
	PASTE("<eqn include('/userimages/feedback/stats/Descriptive.pl')>")
	return

	:r*:statin2;::<eqn include('/userimages/feedback/stats/Distribution.pl')>