#!/usr/bin/env perl
#project1 calculate the %nucleotides in a sequence supplied by a user

use warnings; use strict;

#Use command line to get the DNA seq
#Pass the seq to string variable $seq

my ($seq) = @ARGV;

#count the number of sequences entered by user
my $seq_count = scalar @ARGV;

print "Only $seq_count sequence was entered.\n"; #Debuging Check point
print "You entered the following seqence(s). ", @ARGV, "\n" ;    #Debuging Check point 


#to count the number of bases in the seq
#my $base_count = @ARGV[0];

for @ARGV; counter= 0; my $counter = $counter + 1
	{
	my $count = 0;
	my $base_count = @ARGV [count];
	The number of bases in seq ($count + 1) is $base_count \n";
	$count = ($count + 1);
	
	if count > $seq_count;
	die;
	}	


print "@ARGV\n";
my $count_A = $ARGV[0] =~ s/A/A/gi	; #g for global and i case ins.?
#my $count_T = (@ARGV =~ s/t|T/T/gi);
#my $count_G = (@ARGV =~ s/g|G/G/gi);
#my $count_C = (@ARGV =~ s/c|C/C/gi);
print "$count_A\n";
exit;
#print "This many " , $count_A, "As are in the sequence. Yes?\n";
__END__
#Calculate and print the GC content.

#print "The GC content of this ", $seq, "is";
#print (	2*($count_G))/((2*($count_G))+(2*($count_T))) ;
print " \n";
		
#Print the total number of bases
	
#print "There is a total of ", (2*($count_G)+2*($count_T)), "bases\n";


#Bid bye

print "Thanks for using the GC counter.\n";


#*************************************************
#use for loop for counting.

for (@ARGV)
	{
	my $A_count = (@ARGV =~ m/a|A/g)s;
	#$A_count = $A_count + 1;
	
	}
	
	print "The number of As is ", $A_count;
	