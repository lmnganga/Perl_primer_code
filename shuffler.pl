	#!/usr/bin/env perl

	# a program that shuffles a DNA sequence to create a new
	#random sequences from the original
	
	use warnings;
	use strict;

	#all sequences entered by users
	my (@all_seq) = @ARGV;

	print "You entered:", @all_seq, "\n";

	#save the entered seq in a string variable then
	# split the string into an array

	#do it for the first seq, at least for now
	my @split_seq_1 = split("", @all_seq[0]);

	print " seq one is @split_seq_1 \n\n";


	my $length = @split_seq_1;
	print "It's length is $length\n";


	#rand is working
	my $rand_seq_1_base = @split_seq_1[(int rand($length))];
	print " a random base from seq 1: $rand_seq_1_base \n";


	#generate two random pos that your're gonna exchange
	 
	my ($rand1, $rand2) = (int (rand($length)), (int (rand($length)))) ;

	print " random pos one and two = $rand1, and $rand2 wdyg?\n";


	#now create a loop that changes the random position of the of the bases.
	#make sure no bases are lost in the process
	#do it length^length times or just ^2? Too many iterations vs too few?

	# XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	#The sequence doesn't seem really random. 


	#create a random seq using the for loop
	#start randomizing bases from same seq and save to rand_seq_1
	#for loop for a million times?
	my (@rand_seq_1)= @split_seq_1;

	for my $i(1 .. (($length**2	))) {

		#generate random base pos $rand1 and $rand2 that your're gonna exchange
		 my ($rand1, $rand2) = ((int (rand($length-1))), (int (rand($length-1)))) ;


		($rand_seq_1[$rand1], $rand_seq_1[$rand2]) =
		 ($split_seq_1[$rand2], $split_seq_1[$rand1]);
		 # print "Iterations: $i.\n";
		
	}

	print "split seq 1: @split_seq_1 \nrandom seq: @rand_seq_1\n";

	#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	#seems like sometimes no random number is generated
	#leads to throwing out of some bases when the program is run.
	#Wrong version of perl?


	#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTt
	#Next step. Create a loop from the start to read all the sequences
	# create variable names within the program. 
