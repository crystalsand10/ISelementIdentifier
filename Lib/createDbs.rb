# This class given an input fasta file name, and an output DB loc,
# blast-db program location 
# creates a blast database file
class CreateDbs

	def initialize()
	end


	def createBlastDB(makeBlastDb, inputFile, blastOutputFile)
		exec(makeBlastDb + ' -in ' + inputFile + ' -out ' +  blastOutputFile + ' -dbtype ' + 'nucl')
	end  

end 




