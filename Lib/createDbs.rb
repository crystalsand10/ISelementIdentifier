# This class given an input fasta file name, and an output DB loc,
# blast-db program location 
# creates a blast database file
class CreateDbs

=begin 
	def initialize(blastDBProg, inputFile, blastDBFolder) 
		@blastDBProg = blastDBProg
		@inputFile = inputFile 
		@blastDBFolder = blastDBFolder
	end
=end 

	def createBlastDB(blastDBProg, inputFile, blastDBFolder)
		exec(blastDbProg + 'makeblastdb' + ' -in ' + inputFile + ' -out ' +  blastDBFolder + inputFile + ' -dbtype ' + nucl)
	end  

end 




