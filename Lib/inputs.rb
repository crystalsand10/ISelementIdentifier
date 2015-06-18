# This class gets and array of inputs -property value -property value ...
# and saves them
class Inputs

	#getters 
	attr_reader :dataFile # loc. and name of dataFile
	attr_reader :help # if the -h or --help option is called 


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
			end 
			i = i + 1
		end 
	end 


	def printHelp() 
		puts "print help and exit"
		exit
	end 


	private :readVars
	private :printHelp 

end 