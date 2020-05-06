# @flexbox @accessibility
sub flex {
    if($_[0] eq "help")
    {return 'flex($a)<br />
    returns markup for a flexbox div containing $a'};

    my $content = shift;

    my $html_code = qq@
    <div flexbox>
       $content
    </div>
    @;

    return $html_code;
}

sub flexAbs {
    if($_[0] eq "help")
    {return 'flexAbs($a, {options hash})<br />
    returns markup for the absolute value of $a<br />
    option size changes the size of the absolute value bars.'};

    my $content = $_[0];
    my %options = %{$_[1]};
    my $size = $options{size} // 1;

    my $html_code = qq@
        <div absolute>
            <div token$size>
                <i absolute></i>
            </div>
            <div basic>
                $content
           </div>
           <div token$size>
           <i absolute></i>
           </div>
        </div>
    @;

    return $html_code;
}

sub flexArray {
    if($_[0] eq "help")
    {return 'flexArray([$a, $b, $c], [$x, $y, $z])<br />
    returns markup for a flexbox array. Each array reference is a row of the flexbox array.'};

    my @rows = @_;
    my $rows_code = '';

    foreach my $row (@rows) {
        $rows_code .= qq@
        <div array_row>
            <div array_lft>
                ${$row}[0]
            </div>
            <div array_mid>
                ${$row}[1]
            </div>
            <div array_rit>
                ${$row}[2]
            </div>
        </div>
        @;
    }

    my $html_code =  qq@
      <div flexbox>
          <div array>
              $rows_code
          </div>
      </div>
    @;

    return $html_code;
}

sub flexBasic {
    if($_[0] eq "help")
    {return 'flexBasic($a)<br />
    returns markup for a basic div containing $a.'};

    my $content = shift;

    my $html_code = qq@
        <div basic>
            $content
        </div>
    @;

    return $html_code;
}

sub flexDerivative{
    if($_[0] eq "help")
        {return 'flexDerivative("<em>y</em>", "<em>x</em>")<br />
        returns markup for dy/dx.<br />
        flexDerivative("<em>f</em>", ["<em>x</em>","<em>y</em>","<em>y</em>"], {partial=>1})<br />
        returns markup for mixed partial derivatives. d<sup>3</sup>f/(dxdy<sup>2</sup>)'};

    my ($y, $x) = @_[0,1];
    my %options = %{$_[2]};

    my $partial = $options{partial} // 0;
    my $operator = ($partial)? "<i partial_diff></i>" : "<em>d</em>";

    my $numerator = "";
    my $denominator = "";

    if (ref $x eq 'ARRAY'){
        my @xs = @$x;
        my @dxs = ();
        my $n = scalar @xs;
        $numerator = "$operator<sup>$n</sup><i math_space> </i>$y";
 
        my $j = 1;
        foreach my $i (0..$#xs){
            if ($xs[$i] eq $xs[$i+1]){
                $j++;
            }
            else{
                push(@dxs, "${operator}<i math_space> </i>$xs[$i]<sup>$j</sup>");
                $j = 1;
            }
        }

        $denominator = join("<i math_space> </i>", @dxs);
        $denominator =~ s/<sup>1<\/sup>//g;
    }

    else{
        $numerator = "$operator<i math_space> </i>$y";
        $denominator = "$operator<i math_space> </i>$x";
    }

    my $html_code = flexFraction($numerator, $denominator);
    return $html_code;
}

sub flexEquate {
    if($_[0] eq "help")
    {return 'flexEquate($left, $right)<br />
    returns markup for the equality $left = $right'};

    my ($left, $right) = @_;

    my $html_code = qq@
    $left
    <div equate>
      =
    </div>
    $right
    @;

    return $html_code;
}

sub flexExp {
    if($_[0] eq "help")
    {return 'flexEquate($base, $exp)<br />
    returns markup for the expression $base^$exp'};

    my $base = shift;
    my $exp = shift;

    my $html_code = qq@
        <div exponent_base>
            $base
        </div>
        <div exponent>
            <div exponent_term>
                $exp
            </div>
        </div>
    @;

    return $html_code;
}

sub flexFraction {
    if($_[0] eq "help")
    {return 'flexFraction($numerator, $denominator, {options hash})<br />
    returns markup for the fraction $numerator/$denominator.<br />
    option wider => 1 gives a larger vinculum'};

    my ($numerator, $denominator) = @_[0,1];
    my %options = %{$_[2]};
    my $wider = $options{wider} // 0;
    my $divisor = ($wider)? "wider_divisor" : "divisor";


    my $html_code =  qq@
        <div fraction>
            <div numerator>
                <div basic>
                    $numerator
                </div>
            </div>
            <div $divisor>
            </div>
            <div denominator>
                <div basic>
                    $denominator
                </div>
            </div>
        </div>
    @;

    return $html_code;
}

sub flexFunctionSet{
    if($_[0] eq "help")
    {return 'flexFunctionSet([$f, $g, $h]], {options hash})<br />
    returns markup for the piecewise function with the rows $f, $g, and $h.<br />
    option size sets the size of the curly brace; the default is the number of list items.'};

    my @list = @{$_[0]};
    my %options = %{$_[1]};
    my $size = $options{size} // scalar(@list); # optional size override, default to # list items
    my $items = "";
    foreach (@list) {
        $items = $items . qq@
        <li function_item>
            $_
        </li>
        @;
    }

    my $html_code = qq@
    <div function_set>
        <div token$size>
            {
        </div>
        <ul function_list>
            $items
        </ul>
    </div>
    @;

    return $html_code;
}

sub flexIntegral{
    if($_[0] eq "help")
    {return 'flexIntegral($a, $b, $f, $dx, {options hash})<br />
    returns markup for the integral from $a to $b of $f $dx. Set $a = $b = "" for an indefinite integral.<br />
    option size sets the size of the integral symbol.'};

    my ($a, $b, $f, $dx) = @_[0..3];
    my %options = %{$_[4]};
    my $size = $options{size} // 1;
    my $bounds = ($a eq "" && $b eq "")? "" : qq@
        <div integral_bounds>
            <div integral_upper>
                $b
            </div>
            <div integral_lower>
                $a
            </div>
        </div>
    @;

    my $html_code = qq@
    <div integral>
        <div token$size>
            <div integral_type>
                <i integral></i>
            </div>
        </div>
        $bounds
    </div>
    <div basic>
        $f
    </div>
    <i single_space></i>
    <div basic>
        $dx
    </div>
    @;

    return $html_code;
}

sub flexLimit{
    if($_[0] eq "help")
    {return 'flexLimit($x, $c)<br />
    returns markup for the limit as $x goes to $c.'};

    my ($var, $var0) = @_;
    my $html_code = qq@
        <div limit>
            <div limit_upper>
                lim
            </div>
            <div limit_lower>
                <div basic>
                    $var <i right_arrow></i> $var0
                </div>
            </div>
        </div>
    @;

	return $html_code;
}

sub flexLongDivision{
    if($_[0] eq "help")
    {return 'flexLongDivision(dividend, divisor, quotient)<br />
    returns markup for the long division.<br />
    you may use "" in the second and third arguments.'};

    my ($dividend, $divisor, $quotient) = @_[0..2];

    my $top = ($quotient eq "")? "" : qq|
        <div long_division_top>
            $quotient
        </div>
    |;

    my $left = ($divisor eq "")? "" : qq|
        <div long_division_lft>
            $divisor
        </div>
    |;

    my $right = ($dividend eq "")? "" : qq|
        <div long_division_rit>
            $dividend
        </div>
    |;

    my $bottom = ($divisor eq "" && $dividend eq "")? "" : qq|
        <div long_division_btm>
        ${left}
        ${right}
        </div>
    |;

    my $html_code = qq|
        <div long_division>
        ${top}
        ${bottom}
        </div>
    |;

return $html_code;
}

sub flexRoot {
    if($_[0] eq "help")
    {return 'flexRoot($a, $n, {options hash})<br />
    returns markup for the $nth root of $a. Default value for $n is 2.<br />
    option size sets the size of the radical symbol. Currently only sqrt supports this.'};

    my ($content) = $_[0];
    my $n = $_[1] // 2;
    my $radical = ($n == 2)? "sqrt" : ($n == 3)? "cbrt" : ($n == 4)? "qdrt" : "root_n";
    my $index = ($n == 2 || $n == 3 || $n == 4)? "" : qq@<div root_index>$n</div>@;

    my %options = %{$_[2]};
    my $size = $options{size} // 1; #size 2 only available for sqrt, currently

    my $html_code = "";
    if ($size == 2){
        $html_code = qq@
        <div root2>
            <div radical2>
                <i sqrt2></i>
            </div>
            <div radicand2>
                $content
            </div>
        </div>
        @;
    }

    else{
        $html_code =  qq@
            <div root>
                <div radical>
                    <i $radical></i>
                </div>
                $index
                <div radicand>
                    <div basic>
                        $content
                    </div>
                </div>
            </div>
        @;
    }

    return $html_code;
}

sub flexSum{
    if($_[0] eq "help")
    {return 'flexSum($lower, $upper)<br />
    returns markup the sum from $lower to $upper.'};

	my ($lower, $upper) = @_;

	my $html_code = qq@
	<div summation>
		<div summation_type>
			<i summation></i>
		</div>
		<div summation_bounds>
			<div summation_upper>
				<div basic>
					$upper
				</div>
			</div>
			<div summation_lower>
				<div basic>
					$lower
				</div>
			</div>
		</div>
	</div>
	@;

    return $html_code;
}
