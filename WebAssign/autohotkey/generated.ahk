:r*:chidis;::distr("cdf=chi, v=$df, prob=0.95");

#!r::
to_paste := Copy()
Paste("sqrt(" to_paste ")")
return

:r*:fdis;::distr("cdf=f, v1=$df1, v2=$df2, prob=.95");

^+5::
to_paste := Copy()
Paste("%" to_paste "%")
return

:r*:polyin;::<eqn include('/userimages/feedback/math/PolynomialSub.pl')>

:r*:zdis;::distr("cdf=z, x=1")

:r*:normdis;::distr("cdf=normal, mu=$u, s=$s, x=$x");

!#n::
to_paste := Copy()
Paste("accneg(" to_paste ")")
return

:r*:spm;::<s:plusminus>

:r*:br;::<br />

:r*:tolc;::($min, $max) = sort {$a <=> $b} 

:r*:vecin;::<eqn include('/userimages/feedback/math/VectorFunctions.pl')>

:r*:psolr;::<p:solution_roundedvalues>

:r*:size15;::$size = 15;

:r*:finin;::<eqn include('/userimages/feedback/math/financial.pl')>

!#c::
to_paste := Copy()
Paste("acct_comma(" to_paste ")")
return
:r*:stsp;::<s:thinsp>

:r*:casc;::$tol = abs(decform(, 2) - decform(, 2)) + 0.006;

+#t::
to_paste := Copy()
Paste("<td>" to_paste "</td>")
return

:r*:auf;::AufQR1

:r*:ppfr;::<p:probfraction>

:r*:ppfrs;::<p:probfractions>

!#f::
to_paste := Copy()
Paste("floor(" to_paste ")")
return

:r*:mic;::#Tutorial

:r*:brec;::BreCMBC9

!#a::
to_paste := Copy()
Paste("spell_number(" to_paste ")")
return

+#c::
to_paste := Copy()
Paste("<eqn commas(" to_paste ")>")
return

^!d::
to_paste := Copy()
Paste("do{`r`n" to_paste "`r`n}until();")
return

!#m::
to_paste := Copy()
Paste("abs(" to_paste ")")
return

:r*:prt;::PR OK. To Task Complete.

:r*:bas;::BassElemMath7

:r*:sz;::$size = 1;

:r*:ind;::(in dollars)

:r*:physin;::<eqn include('/userimages/feedback/physics/physics.pl')>

:r*:statatin;::<eqn include('/userimages/feedback/stats/statsAltText.pl')>

:r*:atr;::[~acogan] for alt text review

:r*:pfx;::Fixes made:`r1)

:r*:no-;::=~ s/-/<s:minus>/g;

:r*:pfsum;::summary="This table represents a two-column proof."

:r*:scl;::<s:scriptl>

:r*:alp;::<s:alpha>

:r*:stri;::<s:triangle_white_up>

:r*:sapprox;::<s:approximate>

:r*:prk;::PR ok.

:r*:sdeg;::<s:degree>

:r*:dvm;::DevMath1

:r*:spll;::<s:parallel>

:r*:sort;::sort {$a <=> $b}

:r*:parok;::Post-authoring ok. To ready for coding.

:r*:epp;::EppDiscMath5

:r*:matrin;::<eqn include('/userimages/feedback/math/MatrixFunctions.pl')>

:r*:kmb;::KMBIAlg7

:r*:smta;::SmithNM13Acc

:r*:pxn;::<p:enterexactnum>

:r*:pexps;::<p:enterexps>

:r*:h4;::<h4 class="aria-index" role="region" aria-label="question item">(a)</h4>

:r*:pen;::<p:enternum>

:r*:ctf;::Consider the following.

:r*:triple;::<watex>\[<_> \frac{<_>}{<_>}\]</watex>

:r*:sub;::#subroutine`r`n#/subroutine

:r*:psimps;::<p:simplify_plural>

:r*:pint;::<p:interval>

:r*:lapc;::LarApCalc10

:r*:sfr;::<s:frasl>

:r*:chint;::($THIS_SCORE, $HINT) = (0, 'Remember to use capital C.') if contains('C') == 0 && $thisresponse;

:r*:pinte;::<p:integration>

:r*:xyit;::\!\(x\"\"\), \!\(y\"\"\)

:r*:casresponse;::print join("~~", @$casresponse);

:r*:matin;::<eqn include('/userimages/feedback/math/MatrixFunctions.pl')>

:r*:isint;::sub is_integer {`r$_[0] =~ /^[+-]?\d+$/;`r}

:r*:rkfun;::RKFunLD7

:r*:atc;::#altText#

:r*:gser;::optSeries = {RANGE -> {n, 0, Infinity}, CENTER -> any, POWERSERIES -> False}; <g:optSeries>

:r*:seriesblank;::<watex>\[    \sum_{n=0}^{\infty}{\left[2](<_>\right[2])}\]</watex>

^+#m::
to_paste := Copy()
Paste(""" to_paste """)
return

:r*:aufa;::AufQR1Acc

:r*:pxns;::<p:enterexactnums>

:r*:pgraph;::<p:selectgraph>

:r*:pex;::<p:exact>

:r*:porp;::<p:orderedpair>

:r*:pexp;::<p:enterexp>

:r*:in$;::(in dollars)

:r*:pens;::<p:enternums>

:r*:utp;::UTPBFin1

:r*:pjoin;::print join(",", @a);

:r*:aswb;::ASWSBE14

:r*:cherry;::@{pickone()};

:r*:mshift;::map {$_ + shift}

:r*:bindis;::distr("pdf=binomial, n=$n, p=$p, x=$x")

:r*:poidis;::distr("pdf=poi, lambda=$mean, x=$xA")

:r*:pct;::$p_pct = $p*100;

:r*:stca;::SCalcCC4Acc

:r*:flex;::<div flexbox>
<EQN $flex>
</div>

:r*:turnin;::Do this task on your own. Your instructor may ask you to turn in your work.

:r*:i-;::<i minus></i>

:r*:puna;::<p:union_acc>

:r*:accsty;::<link rel="stylesheet" type="text/css" href="/accessibility/aria.css" />

:r*:mathop;::<span class="stackmathop">

:r*:alt0;::<EQN $altText0>

+#=::
to_paste := Copy()
Paste("<label class=""aria-item"">" to_paste "</label>")
return

:r*:pun;::<p:union_acc>

:r*:iinf;::<i infinity></i>

:r*:sumsub;::sub flexboxSum{`rmy ($low, $upp) = @_;`rreturn qq|<div summation>`r<div summation_type>`r<i summation></i>`r</div>`r<div summation_bounds>`r            <div summation_upper>`r                $upp`r            </div>`r            <div summation_lower>`r                <div basic>`r                    $low`r                </div>`r            </div>`r        </div>`r    </div>|;`r}

:r*:wane;::WaneFMAC7

:r*:pinf;::<p:infinity>

:r*:pnosol;::<p:nosoln>

:r*:norad;::$thisresponse='' if !contains(['root', 'sqrt']);

:r*:gotech;::optTechnologyFormula = {MANIPULABLE ->True, ASSUME->"" }; <g:optTechnologyFormula>

!#u::
to_paste := Copy()
Paste("ToString[Unevaluated[ " to_paste "],InputForm]")
return

:r*:goco;::optCoefficients = {TOLERANCE -> "0.011"}; <g:optCoefficients>

:r*:matb;::<_ matrix_mode='matrix' matrix_dimensions='3x3'>

:r*:matans;::<EQN $MATRIX='1';''>

:r*:matgin;::<eqn include('/userimages/feedback/math/MatrixGrading.pl')>

:r*:pdnm;::<p:dnematrix>

:r*:dnegrade;::$THIS_SCORE=1 if $thisresponse=~/dne/i;

:r*:sulc;::SullivanCalc2

:r*:s/;::<s:frasl>

:r*:pes;::<p:essay>

:r*:ppar;::If the system is dependent, express your answer using the parameters <em>x</em> and/or <em>y</em>.

:r*:punm;::If an answer is undefined, enter UNDEFINED in any cell of the matrix.

:r*:i/;::<i divide_slash></i>

!#s::
to_paste := Copy()
Paste("<span class=""aria-item"">" to_paste "</span>")
return

:r*:pprop;::<p:properfraction>

+#h::
to_paste := Copy()
Paste("<span class='stackmathop'>" to_paste "</span>")
return

:r*:pcli;::<p:commalistineq>

:r*:goinf;::optInfinity = {DNE->True, SIMPLIFY->False}; <g:optInfinity>

:r*:diffin;::<eqn include('/userimages/feedback/math/DifferentialEquations.pl')>

:r*:gode;::optODE = {INDEPVAR -> x, DEPVAR -> y, ASSUM -> "", PARAM -> none}; <g:optODE>

:r*:gotr;::optBasicTrigForm = {TOLERANCE -> {0, 0, 0, 0, 0}}; <g:optBasicTrigForm>

:r*:harm;::HarMathAp12

:r*:feedin;::<eqn include('/userimages/feedback/math/mathFeedbackNumeric.pl')>

+#q::
to_paste := Copy()
Paste("math_feedback_fraction(" to_paste ")")
return

+#a::
to_paste := Copy()
Paste("math_feedback_numeric(" to_paste ")")
return

:r*:inh;::$INLINE_HINT=1;

:r*:hintcss;::<link rel="stylesheet" type="text/css" href="/scalchs1/hint.css"/>

:r*:hintscr;::<script src='/scalchs1/hintIcon.js'></script>

+#z::
to_paste := Copy()
Paste("mathFeedbackMatrixEquivalent(" to_paste ")")
return

:r*:pln;::<p:lnabs>

:r*:gointe;::optIntegral = {VARIABLE -> x}; <g:optIntegral>

:r*:inth;::($THIS_SCORE,$HINT)=(0,'Remember to use capital C.') if contains('C')==0 && $thisresponse;

:r*:psimp2;::<p:simplified>

:r*:larap;::LarHSCalc2 FT5

:r*:apord;::
PASTE("<EQN $ORDERED=4;''>(A)<s:quad>`r`n(B)<s:quad>`r`n(C)<s:quad>`r`n(D)<s:quad>")
return
