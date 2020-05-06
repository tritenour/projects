;---p tags---
	:r0*:pcl;::
	PASTE("<p:commalist>")
	return
	
	:r0*:pcls;::
	PASTE("<p:commalist_plural>")
	return

	:r0*:po12;::
	PASTE("<p:order12>")
	return

	:r0*:psa;::
	PASTE("<p:selectall>")
	return

	:r0*:psimp;::
	PASTE("<p:simplify>")
	return

	:r0*:pmix;::
	PASTE("<p:mixednumber>")
	return

	:r0*:punit;::
	PASTE("<p:includeunits>")
	return

	:r0*:punits;::
	PASTE("<p:includeunits_plural>")
	return

	:r0*:pnunit;::
	PASTE("<p:nounits>")
	return

	:r0*:pnunits;::
	PASTE("<p:nounits_plural>")
	return
	
	:r*:pasw;::<p:aswlink>

;---s tags---
	:r0*:s-;::
	Paste("<s:minus>")
	return
	
	:r*:sun;::<s:union>

;---rounding prompts---
	:r0*:round0;::
	PASTE("Round your answer to the nearest integer.")
	return

	:r0*:round0w;::
	PASTE("Round your answer to the nearest whole number.")
	return
	
	:r0*:round1;::
	PASTE("Round your answer to one decimal place.")
	return

	:r0*:round2;::
	PASTE("Round your answer to two decimal places.")
	return

	:r0*:round2c;::
	PASTE("Round your answer to the nearest cent.")
	return

	:r0*:round3;::
	PASTE("Round your answer to three decimal places.")
	return

	:r0*:round4;::
	PASTE("Round your answer to four decimal places.")
	return
	
	:r0*:round0s;::
	PASTE("Round your answers to the nearest integer.")
	return

	:r0*:round0ws;::
	PASTE("Round your answers to the nearest whole number.")
	return
	
	:r0*:round1s;::
	PASTE("Round your answers to one decimal place.")
	return

	:r0*:round2s;::
	PASTE("Round your answers to two decimal places.")
	return

	:r0*:round2cs;::
	PASTE("Round your answers to the nearest cent.")
	return

	:r0*:round3s;::
	PASTE("Round your answers to three decimal places.")
	return

	:r0*:round4s;::
	PASTE("Round your answers to four decimal places.")
	return