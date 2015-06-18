# This class gets an array (+argv+) of inputs: containing values as -property value -property value ...
# and makes them accesible. 
## Folders are returned with an '/' at the end
## All check-performing functions in this class can exit after printing error. 
class Inputs

	# global variables 
	@@progName_makeBlastDB = 'makeblastdb' # name of the program to create blast db. 
	
	#getters 
	
	attr_reader :dataFile # loc. and name of dataFile
	attr_reader :blastProg # location of the blast programs 
	attr_reader :blastDBLoc # location where the blast databases will be created 


	# initalise with ARGV 
	def initialize(argv)
		@argv = argv
		readVars() 
		areArgsPresent()
		@blastDBLoc = '../BlastDatabases/'
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
				checkDataFile(); 
			when '-blastProgFolder'
				@blastProgLoc = @argv[i+1]
				@blastProgLoc = checkDirSlash(@blastProgLoc)
				@blastProg = @blastProgLoc + @@progName_makeBlastDB
				checkMakeBlastDB();
			when '-blastDBLoc' 
				@blastDBLoc = @argv[i+1]
				checkBlastDBLoc(); 
 			end 
			i = i + 1
		end 
	end 

	# print help of this program and exit 
	# invoked with usage of -h or --help 
	def printHelp() 
		print "\n"
		puts "print help and exit"
		exit
	end 


	# Checks that all compulsory arguments present. 
	# Adds some arguments are added if not specified
	def areArgsPresent()
		if not defined?(@dataFile)
			puts "Error: you did not specify a data file."
			printHelp()
		elsif not defined?(@blastProgLoc)
			puts "Error: you did not specify the location of the blast programs"
			printHelp()
		elsif not defined?(@blastDBLoc)
			@blastDBLoc = '../BlastDatabases/'
			checkBlastDBLoc()
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
		if File.directory?(@blastProg) || (not File.exists?(@blastProg))
			puts "Error: cannot find the program " + @blastProg
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


	# checks if an input +dirName+ contains a / at the end, if not appends it and 
	# returns the ++dirName++ with / appended (if not already present) 
	def checkDirSlash(dirName) 
		if(not(/\/$/ =~ dirName))
			return dirName + '/' 
		end 
		return dirName
	end 


	private :readVars
	private :printHelp 
	private :checkMakeBlastDB
	private :areArgsPresent 

end 