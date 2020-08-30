#!/usr/bin/perl

#label the impression on the ad_unit that will be covered, when $my_number which is the sampling percentage, i.e. what percentage
#of impressions will be sampled.


%result;


while(<STDIN>){

    $line = $_;

    chomp $line;
    $ad_unit= $line;
    $my_number=rand();
    if ($my_number<=0.045) {
	if (exists $result{$ad_unit})
	{
	    $result{$ad_unit}=$result{$ad_unit}+1; }
        else { $result{$ad_unit}=1; }
      
    }
}


    foreach $i ( keys %result ) {
	print $i."\t".$result{$i}."\n";
    }


