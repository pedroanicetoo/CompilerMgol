module Controller
  class Character
    
    attr_accessor :char, :line, :column

    def initialize(char, line, column)
      @char = char
      @line = line
      @column = column
    end
    
  end
end