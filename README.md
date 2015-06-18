# ISelementIdentifier
Bioinformatics, identify IS elements in bacterial genomes

## Usage

ruby main.rb -h 
usage: 


Note: this pipeline has only been tested on Mac OS X 10.10.3 and x86_64 GNU/Linux, with ruby versions 2.0.0 and 1.8.7.  


#### Required arguments 
|Argument| Argument-value| Explanation|
| ---|---|---|
|-data| loc/datafile.fq |  location and name of sequence reads file (in fasta format)|
|-blastProgFolder| loc | location of the folder containing the various blast programs (in particular the programs used are makeblastdb)| 
|-blastDBLoc| loc | folder where the blast databases will be created, if folder does not exist, it will be created.| 



#### Optional arguments 
|Argument| Argument-value| Explanation|
| ---|---|---|
|-h, --help||print this help and exit|





## Pipeline steps

1. load configuration from config file 

2. create databases of
..* IS sequences (in fasta format)
..* Gene sequences (in fasta format)
..* Reference genome (in fasta format)

3. do some blasting




## TODO's

+ inputs/printHelp()
+ optional argument, name of the blastDatabase


