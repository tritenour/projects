;----Coding----

	:r0*:cdd;:: 
	Paste("Coded.")
	Send !s
	return

	:r0*:fix;::
	PASTE("Ready for PRR.")
	Send !s
	return

	:r0*:fixc;::
	PASTE("Fixes made. Ready for PRR.")
	SEND {Enter}
	PASTE("1) ")
	return

	:r0*:fixp;::
	PASTE("Ready for Proofing.")
	Send !s
	return

	:r0*:fixpc;::
	PASTE("Fixes made. Ready for proofing.")
	SEND {Enter}
	PASTE("1) ")
	return

	:r0*:fp;::
	PASTE("Fastpass! Ready for proofing.")
	Send !s
	return

	:r0*:pr;:: 
	Paste("Ready for PR.")
	Send !s
	return

	:r0*:prc;:: 
	Paste("Ready for PR.")
	return

;----PR----

	:r0*:pf;::
	Paste("PR OK. Ready for proofing.")
	Send !s
	return

	:r0*:pfc;::
	Paste("PR OK. Ready for proofing.")
	return

	:r0*:pnf;::
	PASTE("PR fixes needed.")
	SEND {Enter}
	PASTE("1) ")
	return

	:r0*:pns;::
	PASTE("PR suggestions")
	SEND {Enter}
	PASTE("1) ")
	return

	:r0*:pnq;::
	PASTE("PR questions")
	SEND {Enter}
	PASTE("1) ")
	return

	:r0*:rq;::
	PASTE("PR OK. To RQNUS.")
	Send !s
	return

	:r0*:rqc;::
	PASTE("PR OK. To RQNUS.")
	return