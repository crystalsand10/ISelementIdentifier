# Author:: Crystalised sandman  (mailto:crystalsand10@gmail.com)
# 
#
# Last modified:: 2015, June 14 - 

# This class holds configuration of the project stored in the *config* file.
# Ignores all comment lines (lines begining with #). 
class Configuration


        FOLDER_DATA = "DATAFOLDER"
        FOLDER_DB = "DATABASEFOLDER"
        FOLDER_BLASTRES = "BLASTRESULTSFOLDER" 
        FOLDER_FINALRES = "FINALRESULTSFOLDER" 


        # Initiliase class with the location and name of the config file +fileName_vars+ 
        def initialize(fileName_vars)
                @fileName_vars = fileName_vars
        end

        attr_reader :folder_data
        attr_reader :folder_db
        attr_reader :folder_blastRes
        attr_reader :folder_finalRes




        # If config exists, if it does, and loads the various variables.
        def load()

                checkFileExists()
                loadConfigs()
                checkConfigs() 
        end



        # Checks if *config* file exists
        def checkFileExists()
                if(File.exist?(@fileName_vars))
                        return
                else
                        abort("Error: could not find the config file. Please make sure it is in the root of the application folder.")
                end
        end



        # Opens and loads the configuration variables; 
        def loadConfigs()
                fh = File.open(@fileName_vars, "r")

                fh.each do |line| 
                        line.gsub!(/[\s]/, '') # removes white spaces 

                        if(!(/^\#/.match(line)) && /:/.match(line)) # only considers lines not begining with #
                                line.sub!(/\#.*$/, '') # removes all trailing comments
                                line.upcase!
                                arr_configs = line.split(/:/)
                                case arr_configs[0] 
                                when FOLDER_DATA
                                        @folder_data = arr_configs[1]
                                when FOLDER_DB
                                        @folder_db = arr_configs[1]
                                when FOLDER_BLASTRES
                                        @folder_blastRes = arr_configs[1]
                                when FOLDER_FINALRES
                                        @folder_finalRes = arr_configs[1]
                                end 
                                #puts arr[0] + "\t" + arr[1]
                                #puts line
                        end 

                end 

                fh.close
        end

        ## checks configuration parameters
        def checkConfigs() 
                # DATA folder should contain some files

                # Databases folder should be empty (can give warning)

                # BlastResults folder should be empty 

                # ProcessedResults folder should be empty       
        end 


        private :checkFileExists
        private :loadConfigs
        private :checkConfigs

end



