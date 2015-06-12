#!/usr/bin/ruby 

$VERBOSE = true

require '../ManipulateDBs/checkVariables.rb'
require '../ManipulateDBs/createDBs.rb'


checkVars = CheckVariables.new('../ivariables.tab')
checkVars.check();

var = CreateDBs.new('lala', 'tralala')

print("hello world\n");


exec( "echo 'hi'" )