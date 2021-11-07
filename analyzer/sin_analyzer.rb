require_relative '../static/lex'
require_relative '../static/sin'
require_relative './lex_analyzer'
require_relative './sem_analyzer'
require 'colorize'
require 'pry'

module Analyzer
  class SinAnalyzer

    attr_reader :file

    def initialize(file_name)
      @lex = Analyzer::LexAnalyzer.new(file_name)
      @stack = []
      @stack_sem = []
      @tx = 0
      @erros_semanticos = 0
    end

    def instance_tables
      @lex.instance_tables
      @t_analys = Static::TableAnalyse::T_ANALISY
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
        action = @t_analys[s][a["classe"]]
        if action[0] == "s" || action[0] == "r"
          if a["classe"] == "id"
            id = a if a["classe"] == "id"
          end
          return a
        elsif a["classe"] == '$'
          print("\n")
          print('Erro sintatico invalida toda analise sintatica.')
          exit!
        end
        a = @lex.analisador
      end
    end

    def main
      instance_file_aux() # Arquivo auxiliar
      a = @lex.analisador # token
      @stack.push 0
      while true
        if a == false || a == nil
          break;
        end
        s = @stack[-1]
        action = @t_analys[s][a["classe"]]
        if action[0] == "s"
          @stack.append(action.split('s').last.to_i)
          @stack_sem.push(a) # empilha simbolo atual na pilha semantica
          a = @lex.analisador
        elsif action[0] == 'r'
          regra = @gramatic[(action.split('r').last.to_i) - 1] ## look
          rule_number = action.split('r').last.to_i
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

          # CHAMADA DO COMPILADOR SEMANTICO
          semantico(rule_number, rule_a, modulo_B)
          # CHAMADA DO COMPILADOR SEMANTICO
        elsif action == 'acc'
          break;
        else
          print("\n")
          print("Erro Sintatico(linha: #{@lex.get_l + 1}, coluna: #{@lex.get_c + 1})")
          a = error(a)
        end
      end
    end

    def out
      close_file_aux()
      header(@tx)
    end
  end
end