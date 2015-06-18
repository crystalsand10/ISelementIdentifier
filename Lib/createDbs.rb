# This class given an input fasta file name, and an output DB loc,
# blast-db program location 
# creates a blast database file
class CreateDbs

	def initialize()
	end


	def createBlastDB(makeBlastDb, inputFile, blastDBFolder)
		exec(makeBlastDb + ' -in ' + inputFile + ' -out ' +  blastDBFolder + inputFile + ' -dbtype ' + nucl)
	end  

end 




