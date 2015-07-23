# ISelementIdentifier
Bioinformatics, identify IS (Insertion Sequence) elements in bacterial genomes

## Requirements 

1. Ruby 1.8.7 or greater
2. Installed Blast command line applications
2. Are using a Unix/Linux system 
3. Have access to a HPC


Note: this pipeline has only been tested on x86_64 GNU/Linux, with ruby version 1.8.7, and a blade based Dell cluster. 


## Usage

ruby main.rb -h 
usage: 




#### Required arguments 
|Argument| Argument-type| Explanation|
| ---|---|---|
|-data| loc/datafile.fq |  location and name of sequence reads file (in fasta format)|
|-geneSeqs| fileName | Location and name of the gene sequence file (fasta format) | 
|-blastProgFolder| loc | location of the folder containing the various blast programs (in particular the programs used are makeblastdb)| 
|-blastDBLoc| loc | folder where the blast databases will be created, if folder does not exist, it will be created.| 
|-clusterTemplateFile| loc+fileName| location and name of a template HPC file (to which blasting commands will be appended). 


#### Optional arguments 
|Argument| Argument-value| Explanation|
| ---|---|---|
|-h, --help||print this help and exit|





## Pipeline steps

1. Process input arguments 

2. Make databases of [requires blast]: 
  * IS sequences (file input in fasta format)
  * Gene sequences (file input in fasta format)
  * Reference genome (file input in fasta format)

3. Blast reads (file format fastq.gz) against IS and Gene sequence databases (created in step 2). [requires a template cluster script]. 

4. 








## TODO's

+ inputs/printHelp()
+ Can extend optional arguments: 
  * name of isSeqs database 



