#!/usr/bin/perl

%result;


#calculate on each ad_unit, how many impressions were covered during the sampling.

while(<STDIN>){

    $line = $_;

    chomp $line;
    ($ad_unit,$count)= split /\t/, $line ;
   
    if (exists $result{$ad_unit}) {
	$result{$ad_unit}=$result{$ad_unit}+$count;
    } else{
	$result{$ad_unit}=$count; 
    }
}

foreach $i ( keys %result ) {
    print $i."\t".$result{$i}."\n";
}


