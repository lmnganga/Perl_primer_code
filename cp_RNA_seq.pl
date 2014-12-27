#!/usr/bin/env perl

#!/usr/bin/env perl
# program goals
# obtain RNAseq data and save the seq with PolyA tails
# user species the folder with fails and enters length of poly A tail
# 
# Write another program after this to.
# get cp genes from data and save to a file
# Chop up the RNAseq data to match to the cp genome thus obtained.
# How many times do you find each sequence (how repeatable is it)
# Count how many hits you get for each sequence when matche to the genome. 

use warnings;
use strict;

my ($fq_dir, $poly_A_len) = @ARGV;
#User enters a file name and his/her name
die "Invalid entry \n <Usage: RNAseq data directory>, <PolyA Length>\n" unless scalar @ARGV==2;

my $count = 0;

opendir (my $dh, $fq_dir); #file containing dir
my $file_name= "";
my @all_files = "";

while (readdir $dh) {
    $file_name = $_;
    push @all_files, $file_name; #file names in array
    $count +=1;

}
print "I'm done reading dir. $fq_dir.\nIt has $count files.\nFiles:\n@all_files\n";
closedir $dh;



my $count_poly_A = my $count_all_ids = 0;

$count =0;


    #validate that it's a fastaQ file
    $count_all_ids =validate_fq ();
    # print "just got out of Validate sub.\n";

    if ($count_all_ids) {print "The files were valid FASTQ.\n";}
    print "There were $count_all_ids reads in total.\n";    


   
    #save seq seqs with a poly A tail to poly_A_extract file


    $count_poly_A = poly_A_extract();
    # print "I just got out of Poly A extract sub.\n";


    print "$count_poly_A poly A reads out of $count_all_ids total of length $poly_A_len reads were saved in \"poly_A_extract.txt\".\n";



    sub validate_fq {
        # print "I'm just in validate sub.\n";
        opendir (my $dh, $fq_dir);


        while (readdir $dh) {
            # print "In the validate dir while loop.\n";
            open (my $fq_IN_fh, "<", "$fq_dir/$_");
                while (<$fq_IN_fh>) {
                    # print "I'm in validate sub proper. 1+ $count_all_ids\n";
                    $count_all_ids +=1;

                    my $seq_id = $_;
                    my $seq = <$fq_IN_fh>;
                    my $seq_qual = <$fq_IN_fh>;
                    my $seq_score = <$fq_IN_fh>;


                        if (($seq_id !~ m/^\@/)|| ($seq !~ m/[ACTGN]/i) || ($seq_qual !~ m/^\+/) || (length $seq_id !~ length $seq_qual))
                        {die "The file you entered has an invalid FASTQ format on at least one line.\n"} 


                }
                    
                close $fq_IN_fh;

        }
        closedir $dh;
        return $count_all_ids;
    }

# my $count = 0; 
    sub poly_A_extract {
        # print "About to get in the poly A sub.\n";
        opendir ($dh, $fq_dir);

        while (readdir $dh) {        
                open (my $fq_IN_fh, "<", "$fq_dir/$_");
                open (my $fq_OUT_fh, ">>", "poly_A_extract.txt");
                # print "I'm just in poly_A_extract sub.\n";

                    while (<$fq_IN_fh>) {
                        # print "I'm  in poly_A_extract sub proper. 1+ $count\n";
                        # $count +=1;

                        my $seq_id = $_;
                        my $seq = <$fq_IN_fh>;
                        my $seq_id_2 = <$fq_IN_fh>;
                        my $seq_qual = <$fq_IN_fh>;

                            if ($seq =~ m/A{$poly_A_len|T{$poly_A_len}/i ) {
                                print $fq_OUT_fh $seq_id, $seq, $seq_id_2, $seq_qual;

                                $count_poly_A +=1;

                            }

                    }

                    close ($fq_IN_fh);
                    close ($fq_OUT_fh);

            }
        closedir $dh;
        return $count_poly_A;
        }