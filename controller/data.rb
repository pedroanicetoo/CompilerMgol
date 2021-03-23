module Controller
  class Data
    
    attr_accessor :classname, :lexem, :type

    def initialize(classname, lexem, type)
      @classname = classname
      @lexem = lexem
      @type = type
    end
  
    def title
      "Classe: #{@classname} - Lexema: #{@lexem} - Tipe: #{@type}"
    end
    
  end
end