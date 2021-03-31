require_relative '../controller/data'
require_relative '../controller/character'
require_relative '../syntax/symbols'
require_relative '../syntax/transitions'

module Analyzer
  class AnalyzerLexicon

    attr_reader :pos, :error, :linerror, :columnerror, :dictionary_tokens, :char_stream, :state_stack

    def initialize(file)
      @file = file
      @dictionary_tokens = {}
      @char_stream = {}
      @delimiters = [" ", "\n"]
      @error_table = {}
      @state_stack=[]
      @transition_table = Array.new(29){Array.new(24)}
      @pos, @error, @linerror, @columnerror = 0, 0, 1, 1
    end
  
    def perform!
      fill_reserved_words
      fill_error_table
      fill_transition_table
      read_file_input(@file)
      output
    end
    
    # read file input and save each character to dictionary_char table
    def read_file_input(file_name)
      begin 
        File.open(file_name,'r') {|file| fill_dictionary_char(file) }
      rescue Exception => e
        puts e
      end
    end

    def fill_dictionary_char(file)
      line = col = 1
      index = 0
      ch = ""
      until(file.eof?)
        ch = file.getc
        unless ch == "\n"
          @char_stream[index] = Controller::Character.new(ch,line,col) 
          col += 1
          index+=1
        else
          @char_stream[index] = Controller::Character.new(ch,line,col) 
          col = 0
          line += 1
          index+=1
        end
      end
      @char_stream[index] = Controller::Character.new("\x03",0,0) if file.eof? 
    end
    
    def fill_error_table
      @error_table[1] = "ERRO1 - Caractere Inválido na linguagem"
      @error_table[16] = "ERRO16 - Constantes literais nao permitidas"
      @error_table[18] = "ERRO18 - Formatacao de comentário (chaves) inválida"
      @error_table[21] = "ERRO21 - Constantes numericas não permitidas"
      @error_table[23] = "ERRO23 - Constantes numericas nao permitidas"
      @error_table[24] = "ERRO24 - Constantes numericas nao permitidas"
    end
    
    def fill_reserved_words
      Syntax::Symbols::TOKENS.each do |token, description|
        @dictionary_tokens[token] = Controller::Data.new(token, token, nil) 
      end     
    end
  
    def output
      bffCaracter = ""
      caracter, line, col = 0, 1, 0
      stream_size = @char_stream.length
      set_initial_state_on_trasition_table
      while @pos <= stream_size && @error == 0
        testing = 0
        character = @char_stream[@pos].char if !@char_stream[@pos].nil?

        #Qual coluna da tabela de transição vai ser escolhida ?
        #Generic Symbols
        for i in 0..23
          if @transition_table[0][i]== character.ord ##Testing if symbol in or not on transition table
            col = i
            testing = 1
          end
        end

        col = 17 if testing == 0 && character.ord != 10 && character.ord != 13 && character.ord == 32 # Coloque ele na coluna que representa a coluna dos outros caracteres

        col = 19 if testing == 0 && (character.ord == 10 || character.ord == 13 || character.ord == 32) # Verifico se o caracter é espaço, tab ou quebra linha

        col = 18 if (character.ord == -1 || character.ord == 3) # Verifico se o caracter é EOF
        
        col = 1   if numeric?(character) # numeric check

        bffCaracter << character if col == 21 && character.ord == 32 && @state_stack.last == 15

        col = 2 if caracter.ord == 92 && @state_stack.last == 15 #Se for \n e o estado atual é de literal não ignore

        col = 2   if letter?(character)
        
        col = 3   if ((character.ord == 69 || character.ord == 101) && (@state_stack.last == 19 || @state_stack.last == 21)) # Tratando e|E em numéricos
        
        ## Nessa Coluna, qual linha representa o estado atual da transição ???
        # search for the current_state
        (0..28).map{|i| line = i if @transition_table[i][0] == @state_stack.last}
        
        @state_stack << @transition_table[line][col] # Adicionana na tabela de estados
        
        # Verificando se o estado atual é vazio ou de erro
        if @transition_table[line][col] == 0
          output_lexem(@dictionary_tokens[bffCaracter]) if Syntax::Symbols::TOKENS.include? bffCaracter
          unless Syntax::Symbols::TOKENS.include? bffCaracter # Caso não esteja na tabela - Buscar qual token este estado pertence
            @state_stack.pop
            case @state_stack.last
            when 1..2,4..5,7
              laux = Controller::Data.new(bffCaracter, "opr", nil)
              output_lexem(laux)
            when 3,-1
              laux = Controller::Data.new("EOF", "EOF", nil)
              output_lexem(laux)
            when 6
              laux = Controller::Data.new(bffCaracter, "rcb", nil)
              output_lexem(laux)
            when 8
              laux = Controller::Data.new(bffCaracter, "pt_v", nil)
              output_lexem(laux)
            when 9
              laux = Controller::Data.new(bffCaracter, "ab_p", nil)
              output_lexem(laux)
            when 10
              laux = Controller::Data.new(bffCaracter, "fc_p", nil)
              output_lexem(laux)
            when 11..14,26
              laux = Controller::Data.new(bffCaracter, "opm", nil)
              output_lexem(laux)
            when 16
              laux = Controller::Data.new(bffCaracter, "literal", "literal")
              output_lexem(laux)
            when 18
              output_lexem(laux)
            when 19
              laux = Controller::Data.new(bffCaracter, "num", "inteiro")
              output_lexem(laux)
            when 21,24
              laux = Controller::Data.new(bffCaracter, "num", "real")
              output_lexem(laux)
            when 25
              laux = Controller::Data.new(bffCaracter, "id", nil)
              output_lexem(laux)
              @dictionary_tokens[bffCaracter] = laux 
            else
              symerror = Controller::Data.new("ERRO#{line}", bffCaracter, nil)
              output_lexem(symerror)
              puts "#{@error_table[line]}, linha #{@linerror}, coluna #{@columnerror}"
            end
          end
          @state_stack.clear # clear stable stack
          @state_stack << @transition_table[1][col] 
          bffCaracter = ""
        end
        
        # puts "[#{@linerror},#{@columnerror}]coluna #{col} / tabela de estados #{@state_stack} / caracter: #{character} caracterascc: #{character.ord} / tabela de tansição [#{line},#{col}]" # DEBUGG
        
        if @transition_table[line][col] == 132 && character.ord != 10
          puts "#{@error_table[line]}, linha #{@linerror}, coluna #{@columnerror}"
          @error = 1
        end

        # Caso o caracter atual não seja espaço, tab ou quebra linha guarde ele no buffer
        bffCaracter << character if character.ord != 10 && character.ord != 13 && character.ord != 32

        @pos+=1
        
        if(character.ord == 13 || character.ord == 10) #\n
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

    def next_start_line
      while  @char_stream[@pos].char != "\n"
        return (@pos-1) if @char_stream[@pos].char.ord == 3 # if stream is EOF
        @pos+=1
      end
      return @pos
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
    
    def output_lexem(data)
      puts "Classe: #{data.classname}, Lexema: #{data.lexem}, Tipo: #{data.type.nil? ? 'NULO' : data.type}"      
    end
    
    def letter?(lookAhead)
      lookAhead.match?(/[[:alpha:]]/)
    end
    
    def numeric?(lookAhead)
      lookAhead.match?(/[[:digit:]]/)
    end

  end
end