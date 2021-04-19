require_relative '../controller/data'
require_relative '../controller/character'
require_relative '../syntax/symbols'
require_relative '../syntax/transitions'
require 'colorize'

module Analyzer
  class AnalyzerLexicon

    attr_reader :pos, :error, :linerror, :columnerror, :dictionary_tokens, :char_stream, :state_stack

    def initialize(file)
      @file = file
      @dictionary_tokens = {}
      @char_stream = {}
      @error_table = {}
      @state_stack=[]
      @bffCaracter = ""
      @transition_table = Array.new(29){Array.new(24)}
      @pos, @error, @linerror, @columnerror = 0, 0, 1, 1
    end
  
    def perform!
      fill_reserved_words
      fill_error_table
      fill_transition_table
      if read_file_input(@file)
        output
      end
    end
    
    # read file input and save each character to dictionary_char table
    def read_file_input(file_name)
      begin 
        File.open(file_name,'r') {|file| fill_dictionary_char(file) }
      rescue Exception => e
        puts "Erro ao abrir arquivo".red
      end
    end

    def fill_dictionary_char(file)
      line = col = 1
      index = 0
      ch = ""
      until(file.eof?)
        ch = file.getc
        unless ch == "\n"
          @char_stream[index] = Controller::Character.new(ch,ch.ord,line,col) 
          col += 1
          index+=1
        else
          @char_stream[index] = Controller::Character.new(ch,ch.ord,line,col) 
          col = 0
          line += 1
          index+=1
        end
      end
      @char_stream[index] = Controller::Character.new("\x03",3,0,0) if file.eof? 
    end
    
    def fill_error_table
      @error_table[1] = "ERRO1 - Caractere Inválido na linguagem".red
      @error_table[16] = "ERRO16 - Constantes literais nao permitidas".red
      @error_table[18] = "ERRO18 - Formatacao de comentário (chaves) inválida".red
      @error_table[28] = "ERRO28 - Formatacao de comentário (chaves) inválida".red
      @error_table[21] = "ERRO21 - Constantes numericas não permitidas".red
      @error_table[23] = "ERRO23 - Constantes numericas nao permitidas".red
      @error_table[24] = "ERRO24 - Constantes numericas nao permitidas".red
    end
    
    def fill_reserved_words
      Syntax::Symbols::TOKENS.each do |token, description|
        @dictionary_tokens[token] = Controller::Data.new(token, token, nil) 
      end     
    end
  
    def output
      character, line, col = 0, 1, 0
      stream_size = @char_stream.length
      set_initial_state_on_trasition_table
      while @pos <= stream_size && @error == 0
        testing = 0
        character = @char_stream[@pos] if !@char_stream[@pos].nil?
        #wich column from transition table is be choosen ? (generic Symbols)
        for i in 0..23
          if @transition_table[0][i]==character.ascii ## testing if symbol in or not on transition table
            col = i
            testing = 1
          end
        end

        ######if symbol not in transition table put it on the right column######
        col = 17 if testing == 0 && character.ascii != 10 && character.ascii != 13 && character.ascii == 32

        col = 19 if testing == 0 && (character.ascii == 10 || character.ascii == 13 || character.ascii == 32) # space,tab,\n

        col = 18 if (character.ascii == -1 || character.ascii == 3) # EOF
        
        col = 1   if numeric?(character.char) # D

        @bffCaracter << character.char if col == 21 && character.ascii == 32 && @state_stack.last == 15 # space inside string

        col = 2 if character.ascii == 92 && @state_stack.last == 15 #if \n and current state is literal dont ignore

        col = 2   if letter?(character.char)
        
        col = 3   if ((character.ascii == 69 || character.ascii == 101) && (@state_stack.last == 19 || @state_stack.last == 21)) # e|E on D 

        #On this column, wich line represent the current state of transition ?
        (0..28).map{|i| line = i if @transition_table[i][0] == @state_stack.last}
        
        # current state
        @state_stack << @transition_table[line][col] # Adicionana na tabela de estados
        
        # current state is empty or error
        if @transition_table[line][col] == 0
          if Syntax::Symbols::TOKENS.include? @bffCaracter
            output_lexem(@dictionary_tokens[@bffCaracter])
          else
            @state_stack.pop
            case @state_stack.last
            when 1..2,4..5,7
              laux = Controller::Data.new(@bffCaracter, "opr", nil)
              output_lexem(laux)
            when 3,-1
              laux = Controller::Data.new("EOF", "EOF", nil)
              output_lexem(laux)
            when 6
              laux = Controller::Data.new(@bffCaracter, "rcb", nil)
              output_lexem(laux)
            when 8
              laux = Controller::Data.new(@bffCaracter, "pt_v", nil)
              output_lexem(laux)
            when 9
              laux = Controller::Data.new(@bffCaracter, "ab_p", nil)
              output_lexem(laux)
            when 10
              laux = Controller::Data.new(@bffCaracter, "fc_p", nil)
              output_lexem(laux)
            when 11..14,26
              laux = Controller::Data.new(@bffCaracter, "opm", nil)
              output_lexem(laux)
            when 16
              laux = Controller::Data.new(@bffCaracter, "literal", "literal")
              output_lexem(laux)
            when 18
              output_lexem(laux)
            when 19
              laux = Controller::Data.new(@bffCaracter, "num", "inteiro")
              output_lexem(laux)
            when 21,24
              laux = Controller::Data.new(@bffCaracter, "num", "real")
              output_lexem(laux)
            when 25
              laux = Controller::Data.new(@bffCaracter, "id", nil)
              output_lexem(laux)
              @dictionary_tokens[@bffCaracter] = laux 
            else
              symerror = Controller::Data.new("ERRO#{line}", @bffCaracter, nil)
              output_lexem_error(symerror)
              puts "#{@error_table[line]}, linha #{@linerror}, coluna #{@columnerror}"
              skip_line
            end
          end
          @state_stack.clear # clear stable stack
          @state_stack << @transition_table[1][col] 
          @bffCaracter = ""
        end

        # if current character if not space,tab or \n store this on the buffer
        @bffCaracter << character.char if not_jumps(character)

        if !(Syntax::Transitions::S.include? character.ascii) && not_jumps(character) && !numeric?(character.char) && !letter?(character.char)
          output_lexem_error(Controller::Data.new("ERRO#{line}", character.char, nil))
          puts "#{@error_table[line]}, linha #{@linerror}, coluna #{@columnerror}"
          @bffCaracter = ""
          skip_line
        end

        if @transition_table[line][col] == 132
          output_lexem_error(Controller::Data.new("ERRO#{line}", character.char, nil))
          puts "#{@error_table[line]}, linha #{@linerror}, coluna #{@columnerror}"
          @error = 1
        end

        @pos+=1 #count
        
        if(character.ascii == 13 || character.ascii == 10) #\n
          @linerror+=1
          @columnerror=1
        else
          @columnerror+=1
        end
      end
    end

    def set_initial_state_on_trasition_table
      line = 1
      col = 0
      @state_stack.push @transition_table[line][col]  
    end
    
    def fill_transition_table
      s = Syntax::Transitions::S
      t = 0
      for i in 0..28
        for j in 0..23
          @transition_table[i][j] = Syntax::Transitions::S[t]
          t += 1
        end
      end
    end

    def skip_line
      while @char_stream[@pos] && @char_stream[@pos].ascii && @char_stream[@pos].ascii != 10 
        @pos+=1
      end
      @linerror+=1
      @columnerror=0
    end
    
    def output_lexem(data)
      puts "Classe: #{data.classname}, Lexema: #{data.lexem}, Tipo: #{data.type.nil? ? 'NULO' : data.type}".green     
    end

    def output_lexem_error(data)
      puts "Classe: #{data.classname}, Lexema: #{data.lexem}, Tipo: #{data.type.nil? ? 'NULO' : data.type}".yellow
    end
    
    def letter?(lookAhead)
      lookAhead.match?(/[[:alpha:]]/)
    end
    
    def numeric?(lookAhead)
      lookAhead.match?(/[[:digit:]]/)
    end

    def not_jumps(character)
      (character.ascii != 10 && character.ascii != 13 && character.ascii != 32)
    end
    

  end
end