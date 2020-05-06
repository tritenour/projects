;---grading statements---
	:r0*:gsimp;::
	PASTE("<g:Simplify>")
	return

	:r0*:gosimp;::
	PASTE("optSimplify = {EXPONENT -> any, POWERDIST -> ignore}; <g:optSimplify>")
	return

	:r0*:grexp;::
	PASTE("<g:RationalExpressions>")
	return

	:r0*:ge;::
	PASTE("<g:Exact>")
	return

	:r0*:golist;::
	Paste("optList = {TOLERANCE -> ""0"", FORM -> unordered, FREQUENCY -> False, BRACKETS -> either, SIMPLIFY -> False}; <g:optList>")
	return

	:r0*:golist2;::
	Paste("optList = {TOLERANCE -> ""0"", FORM -> ordered, FREQUENCY -> True, BRACKETS -> reject, SIMPLIFY -> False}; <g:optList>")
	return

	:r0*:goeq;::
	Paste("optEquations = {FORM -> any, FREQUENCY -> True, ASSUME -> """"}; <g:optEquations>")
	return

	:r0*:gw;::
	Paste("<g:Word>")
	return

	:r0*:goexf;::
	Paste("optExpressionFactors = {LEVEL -> moderate}; <g:optExpressionFactors>")
	return

	:r0*:goint;::
	Paste("optInterval = {SIMPLIFY->False, TOLERANCE -> ""0"", ENDPOINTS->True}; <g:optInterval>")
	return

	:r0*:grads;::
	PASTE("<g:Radical_Simplify>")
	return

	:r0*:grad;::
	PASTE("<g:Radical>")
	return

	:r0*:gexp;::
	PASTE("<g:Expand_Any>")
	return

	:r0*:gexps;::
	PASTE("<g:Expand_Simplify>")
	return

	:r0*:gotrig;::
	PASTE("optTrigSimplify = {ALLOW->{""Sin"",""Cos""}}; <g:Trig_Simplify>")
	return

	:r0*:goineq;::
	PASTE("optInequalities = {FORM->any, FREQUENCY->False}; <g:optInequalities>")
	return

	:r0*:gocxf;::
	PASTE("optComplexForm = {FORM -> unordered, TOLERANCE -> ""0"", SQRTNEGONE -> disallow, SIMPLIFY -> False}; <g:optComplexForm>")
	return