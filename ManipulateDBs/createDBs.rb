## 
class CreateDBs

        def initialize(dataLoc, dbLoc)

                @dataLoc = dataLoc;
                @dbLoc = dbLoc;

                @inputFile_IS = nil
                @inputFile_genome = nil
                @inputFile_geneSeqs = nil

                @dbName_IS = nil
                @dbName_geneSeqs = nil
                @dbName_reference = nil
        end

        attr_reader :inputFile_genome
        attr_reader :inputFile_geneSeqs

        attr_reader :dbName_IS
        attr_reader :dbName_geneSeqs
        attr_reader :dbName_reference



        def createDB_IS()
                checkInputs(@inputFile_IS, @dbName_IS)
        end


        def createDB_geneSeqs()

        end

        def createDB_reference()

        end


        def checkInputs()

        end

        private :checkInputs
end