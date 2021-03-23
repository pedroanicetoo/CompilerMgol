require_relative '../controller/data'
require_relative '../controller/character'
require_relative '../syntax/symbols'
require_relative '../file_compiler'

module Analyzer
  class AnalyzerLexicon

    attr_reader :pos, :error, :error_line, :error_col, :dictionary, :dictionary_char

    def perform!
      fill_lexic_analyzer
      fill_file(set_out_of_title)
      @file.close
    end
    

    def file_input(file_name)
      line = col = 1
      @dictionary_char = {}
      File.open(file_name,'r') do |f|
        f.each_char do |c| # iterate on each character
          key = c+'_'+line.to_s+'_'+col.to_s
          @dictionary_char[key] = Controller::Character.new(c,line,col) 
          col += 1
          puts @dictionary_char[key].char+'=====linha:'+@dictionary_char[key].line.to_s+'=====coluna:'+@dictionary_char[key].column.to_s
          if c == "\n"
            col = 0
            line += 1
          end
        end
     end
    end
    
    
    def file_output(file_name)
      @file = File.open(file_name, "w+") 
    end

    def fill_file(text)
      @file << text
    end
    
    def fill_lexic_analyzer
      @dictionary = {}
      Syntax::Symbols::TOKENS.each do |token, description|
        @dictionary[token] = Controller::Data.new(token, token, " ") 
      end     
    end
    
    def set_out_of_title
      @dictionary['inicio'].lexem
    end
    

  end
end