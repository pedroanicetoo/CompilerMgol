require_relative '../controller/data'
require_relative '../controller/character'
require_relative '../syntax/symbols'
require_relative '../syntax/transitions'

module Analyzer
  class AnalyzerLexicon

    attr_reader :pos, :error, :error_line, :error_col, :dictionary_tokens, :dictionary_char
    @dictionary_tokens = {}
    def perform!
      fill_reserved_words
      fill_transition_table
      fill_error_table
      fill_file(set_out_of_title)
      @file.close
    end
    
    # read file input and save each character to dictionary_char table
    def file_input(file_name)
      begin 
        File.open(file_name,'r') {|char_list| fill_dictionary_char(char_list) }
      rescue Exception => e
        puts e
      end
    end

    def fill_dictionary_char(char_list)
      @dictionary_char = {}
      line = col = 1
      char_list.each_char do |c| # iterate on each character
        key = line.to_s+'_'+col.to_s
        @dictionary_char[key] = Controller::Character.new(c,line,col) 
        col += 1
        if c == "\n"
          col = 0
          line += 1
        end
      end
    end

    def dictionary_list
      @dictionary_char.each{|x,y| puts [x, y.char]}
    end
    

    def fill_transition_table
      lines = 29
      cols = 24
      @transition_table = Array.new(lines){Array.new(cols)}
      s = Syntax::Transitions::T
      t = 0
      for i in 0..28
        for j in 0..23
          @transition_table[i][j] = Syntax::Transitions::T[t]
          t += 1
        end
      end
    end

    def fill_error_table
      @error_table = {}
      @error_table[1] = "Identificador não permitido"
      @error_table[16] = "Constantes literais nao permitidas"
      @error_table[18] = "Erro de foramatacao de comentario (chaves)"
      @error_table[21] = "Constantes numericas nao permitidas"
      @error_table[23] = "Constantes numericas nao permitidas"
      @error_table[24] = "Constantes numericas nao permitidas"
    end
    
    
    def file_output(file_name)
      @file = File.open(file_name, "w+") 
    end

    def fill_file(text)
      @file << text
    end
    
    def fill_reserved_words
      Syntax::Symbols::TOKENS.each do |token, description|
        @dictionary_tokens[token] = Controller::Data.new(token, token, " ") 
      end     
    end
    
    def set_out_of_title
      @dictionary_tokens['inicio'].lexem
    end
    

  end
end