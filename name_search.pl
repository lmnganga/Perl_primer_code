#!/usr/bin/env perl
#a program that searches for your name among protein seq
use warnings;
use strict;
my $run_time = time ();

#User enters a file name and his/her name
die "<Usage: file_name>, <name to search>\n" unless scalar @ARGV==2;

my  ($file_name, $usr_name) = @ARGV;
open my $prot_fh,  "<", $ARGV[0] or 
die "No such file name as $ARGV[0] \nUSAGE: <file name>, <name to search>\n";

#if user name has non-protein characters, warn and die
if ($ARGV[1] =~ m/B|J|O|U|X|Z/i) 
{die "your name has illegal protein characters\n"} ;

#open output file to write t,o
open my $matches_fh, ">>", 'genes_w_name.txt';

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#use %matches to save gene names and sequences
# write this to a file



    my ($prot_seq, $cur_line)= "";
    my $gn_present;
    my $count = 0;
    my $gene_name = "";
     #may have to put this in a loop

    #obtain prot sequence using gene_read sub
    # for (my %matches) {

    


     gene_read ($prot_fh); #process my gene to a str and return it
     print "Name '$usr_name' encountered $count times \n";


    #search my name and return gene of gene containing it 
    


sub gene_read {
    # my $prot_fh = shift; #clarify shift meaning XXXXXXXXXXXXXXXXXXXX wgo
    # my ($prot_fh) = @_; #Dont use @_ use $_ for current iteration

while (<$prot_fh>) {
        
        
        
        next if ($_ =~ m/^$/);

        my $cur_line =$_;
        chomp $cur_line;
            

            if   ($cur_line =~ m/^>At.g\d{5}/i)  {
                 my $gene_name = substr $cur_line, 0, 13; #extract gene name only w/o info, $gene_name will reset 
                 $cur_line =""; 
                 next;
            }


        $prot_seq .= $cur_line;
        
        if ($prot_seq =~ m/.*\*$/i) { #call name search sub if end of gene
            my $gn_present = name_search($prot_seq); 



                #output gene name to a file separated w/ a tab then seq. 
                if  ($gn_present == 1) {
                    print $matches_fh "$gene_name\t$prot_seq\n"; #XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX not printing $gene_name. outside of scope?
                    $count++;
                    $gn_present = 0;
                    # print $gene_name, $count, " tests\n";

                 $prot_seq = ""; #reset prot seq 

            }
        }


                if  (eof) 
                {return $count;} 
        
        
}
}



sub name_search {    
    my $prot_seq=$prot_seq; #local $prot_seq
    if ($prot_seq =~ m/($usr_name)/i) {
        print length($prot_seq);
        return 1
    }
    else {return 0}
}



close ($matches_fh);
close ($prot_fh);

print "Run time for $usr_name is $run_time";