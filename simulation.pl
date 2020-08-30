#!/usr/bin/perl

#used the simulation method to get the creative coverage change from the impression coverage change

use List::Util 'shuffle';

#here $i is a generic denote for a creative
$i=0;

#$b is the vector to store the impressions, and each impression, there is a sign ($i) to show which creative 
#it is related to
@b=();
open(FILE,"/Users/natasha.che/Desktop/rtb.txt");

# get the data. Get the repeats of the creatives, i.e. for each creative, how many impressions share it.

while(<FILE>){
    $line = $_;
    chomp $line;
    $i++;
    @a=($i)x$line;
    push(@b,@a);
    
}
close(FILE);

#shuffle the data

@c=shuffle(@b);

#this is the total number of creatives

@d=@c[1 .. 66341];

#get the hash for the creatives seen
%seen = ( );
@uniq = ( );

#this is the loop to see which creatives were sampled.


foreach $item (@d) {
    unless ($seen{$item}) {
        # if we get here, we have not seen it before
        $seen{$item} = 1;
        push(@uniq, $item);
    }
}

#get the total number of creatives sampled

$length=scalar(@uniq);

print $length;
