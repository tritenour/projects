sub polyShiftX{
    if ($_[0] eq "help"){
        return "Shift polynomials horizontally.<br />
        polyShiftX(\@p, a) returns the polynomial <em>p</em> shifted <em>a</em> units to the right.";
    }
    
    my @p = @{$_[0]};
    my $x0 = $_[1];

    my @pDerivatives = (\@p);
    #take derivatives
    foreach my $i (1..$#p){
        my @function = @{$pDerivatives[$i-1]};
        my @derivative = derPoly(\@function);
        push(@pDerivatives, \@derivative);
    }

    my @q = ();
    #calculate coefficients
    foreach my $i (0..$#pDerivatives){
        my @function = @{$pDerivatives[$i]};
        my $q0 = evalPoly(\@function, -$x0)/factorial($i);
        push(@q, $q0);
    }
    return @q;
}
