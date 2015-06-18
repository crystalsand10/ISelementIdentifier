# This class gets an array (+argv+) of inputs: containing values as -property value -property value ...
# and makes them accesible. 
## Folders are returned with an '/' at the end
## All check-performing functions in this class can exit after printing error. 
class Inputs

	# global variables 
	@progName_makeBlastDB = 'makeblastdb' # name of the program to create blast db. 
	
	#getters 
	attr_reader :dataFile # loc. and name of dataFile
	attr_reader :help # if the -h or --help option is called 
	attr_reader :blastProgLoc # location of the blast programs 
	attr_reader :blastDBLoc # location where the blast databases will be created 


	# initalise with ARGV 
	def initialize(argv)
		@argv = argv
		readVars() 
	end 

	# read each as a pair and store property and value
	def readVars()
		i = 0 
		while i < @argv.length-1 do 
			case @argv[i]
			when '-h', '--help'
				@help = true 
				printHelp()
			when '-data' 
				@dataFile = @argv[i+1]
			when '-blastProgFolder'
				@blastProgLoc = @argv[i+1]
				doesExistMakeBlastDB(); 
			when '-blastDBLoc' ## if folder does not exist, create folder
				@blastDBLoc = @argv[i+1]
 			end 
			i = i + 1
		end 
	end 

	# print help of this program and exit 
	# invoked with usage of -h or --help 
	def printHelp() 
		puts "print help and exit"
		exit
	end 

	# checks if the program make blast db exists if not prints error and exits
	def doesExistMakeBlastDB()
		if exists?@blastProgFolder+@progName_makeBlastDB
			puts "all good"
		else 
			puts "Error: cannot find the program " + @progName_makeBlastDB + " in folder " + @blastProgFolder 
			exit
		end 
	end 

	private :readVars
	private :printHelp 

end 