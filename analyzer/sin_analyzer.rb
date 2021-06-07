require_relative '../static/lex'
require_relative '../static/sin'
require_relative '../static/sem'
require_relative './lex_analyzer'
require_relative '../writer'
require 'colorize'
require 'pry'

module Analyzer
  class SinAnalyzer

    attr_reader :file

    def initialize(file_name)
      @lex = Analyzer::LexAnalyzer.new(file_name)
      @writer = Writer.writer.new
      @stack = []
      @stack_semantic = []
      @tx_18 = 0
      @tx_25 = 0
      @semantic_errors = 0
    end

    def instance_tables
      @lex.instance_tables
      @t_analys = Static::TableAnalyse::T_ANALISY
      @t_semantic = Static::TableSemantic::REGRAS_SEM
      @gramatic = Static::Gramatic::GRAMATIC
      @terminal = Static::Terminal::TERMINAL
      @not_terminal = Static::NotTerminal::NOTERMINAL
    end

    def error(a)
      #Indicando erros
      finals = 'simbolos esperados: '
      s = @stack[-1]
      for terminal in @terminal
        action = @t_analys[s][terminal]
        finals += terminal + '    '  if action != 'erro'
      end

      print(finals)
      #tratando erros

      while true
        s = @stack.pop
        aux = false
        for rule_a in @not_terminal
          unless (@t_analys[s][rule_a] == '-1')
            aux = true
            break;
          end
        end
        if aux
          break;
        end
      end

      while true
        s = @stack[-1]
        if a == false
          return a
        end
        action = @t_analys[s][a["token"]]
        if action[0] == "s" || action[0] == "r"
          if a["token"] == "id"
            id = a if a["token"] == "id"
          end
          return a
        elsif a["token"] == '$'
          print("\n")
          print('Erro sintatico invalida toda analise sintatica.')
          exit!
        end
        a = @lex.analisador
      end
    end

    def main
      a = @lex.analisador
      @stack.push 0
      while true
        if a == false || a == nil
          break;
        end

        s = @stack[-1]
        action = @t_analys[s][a["token"]]
        if action[0] == "s"
          @stack.append(action.split('s').last.to_i)
          @stack_semantic.push a
          a = @lex.analisador
        elsif action[0] == 'r'
          regra = @gramatic[(action.split('r').last.to_i) - 1] ## look
          rule_a = regra['A']
          rule_b = regra['B']
          modulo_B = (rule_b.split).length

          for i in 1..modulo_B
            @stack.pop
          end

          t = @stack.last #look
          @stack.push((@t_analys[t][rule_a]).to_i)
          print("-----------------------------------------\n")
          print("\n#{rule_a} -> #{rule_b}\n")
          ##semantic
        elsif action == 'acc'
          break;
        else
          line = @lex.get_l
          print("\n")
          print("Erro Sintatico(linha: #{line})")
          a = error(a)
        end
      end
    end

    def semantic(rule, rule_a, modulo_B)
      rule_semantic = @t_semantic[rule  - 1]
      puts "Regra Semântica: #{rule_semantic} \n"
      
      symbols = {}

      if rule == 18 || rule == 25
        aux = @t_semantic.pop
        symbols['OPRD2'] = aux
        aux = @t_semantic.pop
        symbols[aux['token']] = aux
        aux = @t_semantic.pop
        symbols['OPRD1'] = aux
      else
        (1..modulo_B).each do |x|
          aux = @t_semantic.pop
          symbols[aux['token']] = aux
        end

        s = {'token' => rule_a}

        if rule == 5
          @writer.varfim
        elsif regra == 6
          id = symbols['id']
          type = symbols['TIPO']
          @lex.atribuicao_tipo(id['lexema', type['tipo'])
          @writer.tipo(type['tipo'],id['lexema'])
        elsif regra == 7
          s['tipo'] = 'int'
        elsif regra == 8
          s['tipo'] = 'real'
        elsif regra == 9
          s['tipo'] = 'lit'
        elsif regra == 11
          id = symbols['id']
          if @lex.id_declarado(id['lexema'])
            if id['tipo'] == 'lit'
              @writer.scanf('s', id['lexema'])
            elsif id['tipo'] == 'int'
              @writer.scanf('d', id['lexema'])
            elsif id['tipo'] == 'real'
              @writer.scanf('lf', id['lexema'])
            end
          else
            print('\n-->Erro: Variável não declarada.\n')
            @semantic_errors += 1
          end
        elsif regra == 12
          arg = symbols['ARG']
          @writer.escreva(arg)
        elsif regra == 13
          literal = simbolo['literal']
          s['lexema'] = literal['lexema']
          s['tipo'] = 'literal'
        elsif regra == 14
          num = symbols['num']
          s['lexema'] = num['lexema']
          s['tipo'] = 'num'
        elsif regra == 15
          id = symbols['id']
          if @lex.id_declarado(id['lexema'])
            id = simbolos['id']
            s['lexema'] = id['lexema']
            s['tipo'] = id['tipo']
          else
            print('\n-->Erro: Variável não declarada.\n')
            @semantic_errors += 1
          end
        elsif regra == 17
          id = symbols['id']
          if @lex.id_declarado(id['lexema'])
            ld = symbols['LD']
            if (id['tipo'] == ld['tipo']) || (id['tipo'] == 'real' && (ld['tipo'] == 'num' || ld['tipo'] == 'int'))
              rcb = symbols['rcb']
              rcb['tipo'] = '='
              @writer.rcb(id['lexema'],rcb['tipo'],ld['lexema'])
            else
              puts "\n-->Erro: Tipos diferentes para atribuição.\n"
              @semantic_errors += 1
            end
          else
            puts "\n-->Erro: Variável não declarada.\n"
            @semantic_errors += 1
          end
        elsif regra == 18
          tx = "T#{@tx_18}"
          oprd1 = symbols['OPRD1']
          oprd2 = symbols['OPRD2']
          tipos_equivalentes = ['num','real','int']
          if tipos_equivalentes.include? oprd1['tipo'] && tipos_equivalentes.include? oprd2['tipo']
            s['lexema'] = tx
            s['tipo'] = 'int'

            @tx_18 +=1

            opm = symbols['opm']
            @writer.opm(tx,oprd1['lexema'],opm['lexema'],oprd2['lexema'])
          else
            s['lexema'] = tx
            s['tipo'] = 'num'
            puts "\n-->Erro: Operandos com tipos incompatíveis.\n"
            @semantic_errors += 1
          end
        elsif regra == 19
          oprd = symbols['OPRD']
          s['lexema'] = oprd['lexema']
          s['tipo'] = oprd['tipo']
        elsif regra == 20
          id = symbols['id']
          if @lex.id_declarado(id['lexema'])
            s['lexema'] = id['lexema']
            s['tipo'] = id['tipo']
          else
            puts "\n-->Erro: Variável não declarada.\n"
            @semantic_errors += 1
          end
        elsif regra == 21
          num = symbols['num']
          s['lexema'] = num['lexema']
          s['tipo'] = num['token']
        elsif regra == 23
          @writer.fim_cond
        elsif regra == 24
          exp_r = symbols['EXP_R']
          @writer.ini_cond(exp_r['lexema'])
        elsif regra == 25
          oprd1 = symbols['OPRD1']
          oprd2 = symbols['OPRD2']
          tipos_equivalentes = ['num','int','real']
          if (oprd1['tipo'] == oprd2['tipo']) || ((tipos_equivalentes.include? oprd1['tipo']) && (tipos_equivalentes.include? oprd2['tipo']))
            tx = "T#{@tx_25}"
            s['lexema'] = tx
            s['tipo'] = 'boolean'
            @tx_18 +=1

            opr = symbols['opr']
            @writer.opr(tx,oprd1['lexema'],opr['lexema'],oprd2['lexema'])
          else
            puts "\n-->Erro: Operandos com tipos incompatíveis.\n"
            @semantic_errors += 1
          end
        end 
        @stack_semantic.push s
      end
    end

    def perform
      main
      puts "\nErros: #{@semantic_errors}"
      @writer.close_file
      @writer.cabecalho(@tx_18, @tx_25, 'SAIDA.c')
    end

  end
end