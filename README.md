# ISelementIdentifier
Bioinformatics, identify IS elements in bacterial genomes

## Usage

ruby main.rb -h 
usage: 



#### Required arguments 
|Argument| Argument-value| Explanation|
| ---|---|---|
|-data| loc/datafile.fq |  location and name of sequence reads file (in fasta format)|

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

+ Check configuration items

