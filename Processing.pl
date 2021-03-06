#####Code for application
#!/usr/bin/perl -w

# First, converting the fastq file to fasta file using BlastStation.

# Second, removing reverse primer and unknown N bases using clip sequence from galaxy.

#open the input file non-essential genes containing raw barcode sequences
open (PREFILE, "Galaxy5.fasta") || die "Can't open fasta file: $!\n";


#open the output file preprocessing containing the processing barcode sequences   
open (POSTFILE, ">Galaxy5_processed.txt") || die "Can't open preprocessing file: $!\n";

#store
$process = <PREFILE>;


# read by FASTA record
local $/ = "\n>";  


   
    #use strict;
    #use warnings;
   


while ($process = <PREFILE>) 
{
chomp $process;

# remove FASTA header
    $process =~ s/^>*.+\n//; 
    

# remove endlines
    $process =~ s/\n//g;
    
 
# discard blank line
    $process =~ /^\s*$/;


# discard comment line
    $process =~ /^\s*#/;     


# discard fasta header line
   #$process =~ /^>/;


# remove common reverse region
   # $process =~ s/CAAGCAGAAGACGGCATACGAGCTCTTCCGATCTGCACGTCAAGACTGTCAAGG\n//g;
     
# remove common tag priming site U1
   # $process =~ s/GATGTCCACGAGGTCTCT\n//g;     
    
# remove common tag priming site U2 
    #$process =~ s/CGTACGCTGCAGGTCGAC\n//g;     
 
      
# remove the N letter 
    #$process =~ s/N\n//g;

# remove non-sequence data
    $process =~ s/\s//g;


print POSTFILE "$process \n";

}

exit;

#####End of code for application
