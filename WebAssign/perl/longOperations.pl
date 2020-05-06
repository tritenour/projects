#check consistency in long multiplciation/division/addition etc.

sub longMultiplication {
my $a = shift;
my $b = shift;
$a =~ s/\.//g; #remove decimal
$b =~ s/\.//g;
$a =~ s/-//g; #remove negatives
$b =~ s/-//g;
my $maxMag = int(log10($a)+1)+int(log10($b)+1);
my $targetRef = shift() // [];
my @target = @$targetRef;
my @aDigs = split("",$a);
my @bDigs = split("",$b);
my $productMod10 = 0;
my @productDigs = ();
my @carries = ();
foreach my $i (0..$#bDigs){
my $carry = 0;
foreach my $j (0..$#aDigs){
my $product = $aDigs[$#aDigs - $j]*$bDigs[$#bDigs - $i] + $carry;
$productMod10 = $product % 10;
$carry = floor($product/10);
push @productDigs, $productMod10;
push @carries, $carry;
}
}
return (@carries);
}
sub longAddition {
my $a = shift;
my $b = shift;
$a =~ s/\.//g; #remove decimal
$b =~ s/\.//g;
$a =~ s/-//g; #remove negatives
$b =~ s/-//g;
my $maxDigits = max(int(log10($a)), int(log10($b)));
my $maxMag = max(int(log10($a)),int(log10($b))) + 1;
my $targetRef = shift() // [];
my @target = @$targetRef;
my @aDigs = split("",$a);
@aDigs = ((0)x($maxDigits - $#aDigs), @aDigs);
my @bDigs = split("",$b);
@bDigs = ((0)x($maxDigits - $#bDigs), @bDigs);
my $sumMod10 = 0;
my @sumDigs = ();
my @carries = ();
my $carry = 0;
foreach my $i (reverse (0..$maxDigits)){
my $sum = $aDigs[$i] + $bDigs[$i] + $carry;
my $sumMod10 = $sum % 10;
$carry = floor($sum/10);
push @sumDigs, $sumMod10;
push @carries, $carry;
}
return (@carries);
}
