module Controller
  class Data
    
    attr_accessor :classname, :lexem, :type

    def initialize(classname = nil, lexem = nil, type = nil)
      @classname = classname
      @lexem = lexem
      @type = type
    end
  
    def title
      "Classe: #{@classname} - Lexema: #{@lexem} - Tipe: #{@type}"
    end
    
  end
end