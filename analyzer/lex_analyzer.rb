require_relative '../static/lex'
require 'colorize'

module Analyzer
  class LexAnalyzer

    attr_reader :file

    def initialize(file)
      @f = open(file, 'r')
      @font = @f.readlines
      @n_linha = 0
      @n_coluna = 0
    end

    def instance_tables
      @digits = Static::Digits::DIGITS
      @letters = Static::Letters::LETTERS
      @dic = Static::Dictionary::DIC
      @tokens = Static::Tokens::TOKENS
      @t_symbols = Static::Symbols::T_SYMBOLS
      @t_transictions = Static::Transitions::T_TRANSICOES
      @errors = Static::Errors::ERRORS
      @final_states = Static::FinalStates::FINALSTATES
    end

    def token(lexema, estado)
      token = @tokens[estado]
      obj = {'lexema':lexema,'token':token,'tipo':'-'}

      if token == 'id'
        if !(@t_symbols.include? lexema)
          @t_symbols[lexema]={'lexema':lexema,'token':token,'tipo':'-'}
        else
          obj=@t_symbols[lexema]
        end
      end
      obj
    end

    def proximo(estado_atual, simbolo)
      if (estado_atual == 1 || estado_atual == 3) && simbolo == 'E'
        return @t_transictions[estado_atual][@dic['E']]

      elsif estado_atual == 7 && !(simbolo == '"') && !(simbolo == '\n')
        return @t_transictions[estado_atual][@dic['C']]

      elsif estado_atual == 10 && !(simbolo == '}') && !(simbolo == '\n')
        return @t_transictions[estado_atual][@dic['C']]

      elsif @digits.include? simbolo
        return @t_transictions[estado_atual][@dic['D']]

      elsif @letters.include? simbolo
        return @t_transictions[estado_atual][@dic['L']]

      elsif !(@dic.include? simbolo)
        return @t_transictions[estado_atual][@dic['&']]

      else
        return @t_transictions[estado_atual][@dic[simbolo]]

      end
    end

    def error(simbolo,estado, n_linha, n_coluna)
      print "Erro (#{@n_linha+1},#{@n_coluna+1}):#{@errors[estado]}: #{simbolo}"
    end

    def get_l
      return @n_linha
    end

    def lexema
      lex=""
      linha = @font[@n_linha]
      estado_atual = 0
      estado_prox = 0

      while true
        simbolo = linha[@n_coluna]
        estado_prox = proximo(estado_atual, simbolo)
        if estado_prox == -1
          if @final_states.include? estado_atual
            return token(lex, estado_atual)
          else
            return error(simbolo,estado_atual, @n_linha, @n_coluna)
          end
        elsif estado_prox == 0
          lex = ""
          if simbolo == "\n"
            @n_linha += 1
            if !(@font[@n_linha].nil?)
              linha = @font[@n_linha]
            else
              return token(lex, 22)
            end
            @n_coluna = 0
          else
            @n_coluna += 1
          end
        else
          lex << simbolo
          @n_coluna += 1
          estado_atual = estado_prox
        end
      end
    end

    def analisador
      token = lexema
      if token['token'] == 'EOF'
        return {'lexema':'$','token':'$','tipo':'-'}
      end
      token
    end

    def atribuicao_tipo(lexema, tipo)
      @t_symbols[lexema][:tipo] = tipo
    end

    def id_declarado(lexema)
      if @t_symbols.include? lexema
        return @t_symbols[lexema] == '-'
      end
      false
    end

    def perform!

      while true
        token = lexema
        break if token.nil? || token == false
        print("#{token}\n")
        break if token[:token] == 'EOF'
      end

      print("\nTabela de símbolos:\n")
      @t_symbols.each do |i|
        print("#{i}:#{@t_symbols[i]}\n")
      end
    end

  end
end