#!/usr/bin/ruby 

$VERBOSE = true ## to print out warnings 

require('../Lib/inputs') ## handling command line arguments 
require('../Lib/createDbs') ## for creating blast databases required


## Deal with the input arguments to the program and makes an object with standard names available for use.
inputs = Inputs.new(ARGV)


## Create databases 
createDbs = CreateDbs.new(inputs.blastProgLoc)
createDbs.createNuclBlastDB(inputs.dataFile, inputs.dbFileName_ISseqs)
createDbs.createNuclBlastDB(inputs.geneSeqsFile, inputs.dbFileName_geneSeqs)


## Creating and submitting blast scripts




## Process results








