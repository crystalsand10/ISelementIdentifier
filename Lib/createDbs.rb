# This class given an input (+fasta file name+), and an (+output DB loc+),
# (+blast-db program location+) 
# creates (++a blast database file++)
class CreateDbs

	@@NUCL = 'nucl'
	@@progName_makeBlastDB = 'makeblastdb' # name of the program to create blast db. 
	
	def initialize(blastDbLoc)
		@makeBlastDb = blastDbLoc + @@progName_makeBlastDB
		checkBlastProgsExist() 
	end


	def createNuclBlastDB(inputFile, blastOutputFile)
		if (system(@makeBlastDb + ' -in ' + inputFile + ' -out ' +  blastOutputFile + ' -dbtype ' + @@NUCL) == false) 
			puts "Error: an error occured in creating the blast database" 
			exit() 
		end 
	end  

	def checkBlastProgsExist() 
		 if(not File.exists?(@makeBlastDb))
		 	puts 'Error: cannot find the blast program ' + @makeBlastDb
		 	exit() 
		 end 
	end 


end 




