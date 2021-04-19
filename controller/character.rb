module Controller
  class Character
    
    attr_accessor :char,:ascii,:line, :column

    def initialize(char, ascii, line, column)
      @char = char
      @ascii = ascii
      @line = line
      @column = column
    end
    
  end
end