#!/usr/bin/ruby 

$VERBOSE = true

require '../ManipulateDBs/configuration.rb'
require '../ManipulateDBs/createDBs.rb'


checkVars = Configuration.new('../config')
checkVars.load()

puts checkVars.folder_data

#var = CreateDBs.new('lala', 'tralala')

# print("hello world\n");


# exec( "echo 'hi'" )