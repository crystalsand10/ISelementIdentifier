#!/usr/bin/ruby 

$VERBOSE = true ## to print out warnings 

require('../Lib/inputs') ## handling command line arguments 
require('../Lib/createDbs') ## for creating blast databases required



inputs = Inputs.new(ARGV)


createDbs = CreateDbs.new()
createDbs.createBlastDB(inputs.blastProg, inputs.dataFile, inputs.blastDBLoc)








