# This class gets an array (+argv+) of inputs: containing values as -property value -property value ...
# and makes them accesible. 
## Folders are returned with an '/' at the end
## All check-performing functions in this class can exit after printing error. 
class Inputs

	# global variables 
	@@dbName_ISseqs = 'IS_seqs' # name of 
	@@dbName_GeneSeqs = 'gene_Seqs' 





	#getters 
	attr_reader :dataFile # loc. and name of dataFile
	attr_reader :geneSeqsFile # loc. and name of file containing gene sequences.

	attr_reader :blastProgLoc # location of the blast programs 
	attr_reader :blastDBLoc # location where the blast databases will be created 
	attr_reader :dbFileName_ISseqs # IS seqs database file 
	attr_reader :dbFileName_geneSeqs # Gene seqs file 


	# initalise with ARGV 
	def initialize(argv)
		@argv = argv
		readVars() 
		areArgsPresent()
		@blastDBLoc = '../BlastDatabases/'
	end 

	# read each as a pair and store property and value
	def readVars()
		if(@argv.include?('-h') || @argv.include?('--help'))
			printHelp() 
			exit 
		end 
		i = 0 
		while i < @argv.length-1 do 
			case @argv[i]
			when '-data' 
				@dataFile = @argv[i+1]
				checkDataFile(); 
			when '-blastProgFolder'
				@blastProgLoc = @argv[i+1]
				@blastProgLoc = checkDirSlash(@blastProgLoc)
				checkMakeBlastDB();
			when '-blastDBLoc' 
				@blastDBLoc = @argv[i+1]
				checkBlastDBLoc(); 
			when '-geneSeqs'
				@geneSeqsFile = @argv[i+1] 
				checkGeneSeqsFile();  
			else 
				unrecognisedOption(@argv[i]) 
				printHelp()
				exit
 			end 
			i = i + 2
		end 
	end 


	# prints an error, the help and exits
	def unrecognisedOption(option)
		puts 'Error: unrecognised option ' + option 
		printHelp() 
		exit 
	end 



	# Checks that all compulsory arguments present. 
	# Adds some arguments are added if not specified
	def areArgsPresent()
		if not defined?(@dataFile)
			puts "Error: you did not specify a data file."
			printHelp()
			exit() 
		end 
		if not defined?(@blastProgLoc)
			puts "Error: you did not specify the location of the blast programs"
			printHelp()
			exit() 
		end 
		if not defined?(@blastDBLoc)
			@blastDBLoc = '../BlastDatabases/'
			checkBlastDBLoc()
		end 
		if not defined?(@dbFileName_ISseqs)
			checkdbNameISseqs() 
		end 
		if not defined?(@dbFileName_geneSeqs)
			checkdbNameGeneSeqs() 
		end 
		if not defined?(@geneSeqsFile)
			puts "Error: you did not specify a file containing gene sequences"
			printHelp() 
			exit() 
		end 

	end 




	# print help of this program and exit 
	# invoked with usage of -h or --help 
	def printHelp()
		puts "\n\nThis is program help: "

		usage = "Usage: ruby thisProg.rb -blastProgFolder <rootBlastProgramFolder> -data <readsDataFile> -blastDBLoc <userSpecBlastResFolder> -geneSeqs <geneSeqsFile>"
		 
		puts
		print usage
		puts 
		puts "print help and exit"
		puts
		exit
	end 




################## CHECKING DEFINITIONS ####################################################

	# checks if gene seqs file exists or not. 
	def checkGeneSeqsFile()
		if File.directory?(@geneSeqsFile) || (not File.exists?(@geneSeqsFile))
			puts "Error: cannot find the gene sequences file " + @geneSeqsFile
			printHelp() 
			exit
		end  
	end 

	# checks if data file exists or not. 
	def checkDataFile() 
		if File.directory?(@dataFile) || (not File.exists?(@dataFile))
			puts "Error: cannot find the sequence reads data file " + @dataFile
			printHelp() 
			exit
		end  
	end 




	# checks if the program make blast db exists if not prints error and exits
	def checkMakeBlastDB()
		if not File.directory?(@blastProgLoc)
			puts "Error: cannot find the directory " + @blastProgLoc
			printHelp() 
			exit
		end 

	end 


	# checks if +blastDBLoc+ folder exists, if not, creates one, (makes sure folder name end with '/' else appends it)
	def checkBlastDBLoc() 
		@blastDBLoc = checkDirSlash(@blastDBLoc) 
		if not File.directory?(@blastDBLoc) 
			Dir.mkdir(@blastDBLoc) 
		end 
	end 

	# given a blast database folder, and the name of IS seqs file (appends the two) 
	# for a global variable 
	def checkdbNameISseqs() 
		checkBlastDBLoc()
		@dbFileName_ISseqs = @blastDBLoc + @@dbName_ISseqs
	end 

	# given a blast database folder, and the name of IS seqs file (appends the two) 
	# for a global variable 
	def checkdbNameGeneSeqs()
		checkBlastDBLoc()
		@dbFileName_geneSeqs = @blastDBLoc + @@dbName_GeneSeqs
	end 


	# checks if an input +dirName+ contains a / at the end, if not appends it and 
	# returns the ++dirName++ with / appended (if not already present) 
	def checkDirSlash(dirName) 
		if(not(/\/$/ =~ dirName))
			return dirName + '/' 
		end 
		return dirName
	end 



#################################### PRIVATE DEFINITIONS ##################################


	private :readVars
	private :printHelp 
	private :checkMakeBlastDB
	private :areArgsPresent 

end 