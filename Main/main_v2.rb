#!/usr/bin/ruby 

$VERBOSE = true ## to print out warnings 

require('../Lib/inputs') ## handling command line arguments 
require('../Lib/createDBs') ## for creating blast databases required



inputs = Inputs.new(ARGV)

createDBs = CreateDBs.new() 

createDBs.createBlastDB(inputs.dataFile, )

puts inputs.dataFile 






