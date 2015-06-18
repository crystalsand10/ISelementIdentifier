#!/usr/bin/ruby 

$VERBOSE = true

require('../Lib/inputs') 

inputs = Inputs.new(ARGV)

if (inputs.help == true)  
	puts "hahaha"
else 
	puts "tra la la "
end 

puts inputs.dataFile 






