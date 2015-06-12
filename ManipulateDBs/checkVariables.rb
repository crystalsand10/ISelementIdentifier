class CheckVariables

        def initialize(fileName_vars)
                @fileName_vars = fileName_vars
        end

        def check()
                #f = File.open("my/file/path", "r")

                doesExistFile();
                assignVariables();
        end

        def doesExistFile()
                if(File.exist?(@fileName_vars))
                        return
                else
                        abort("Error: could not find the Variable.tab file. Please make sure it is in the root of the application folder.")
                end
        end

        def assignVariables()

        end

        private :doesExistFile
        private :assignVariables


end