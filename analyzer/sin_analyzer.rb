require_relative '../static/lex'
require_relative '../static/sin'
require_relative '../static/sem'
require_relative './lex_analyzer'
require 'colorize'
require 'pry'

module Analyzer
  class SinAnalyzer

    attr_reader :file

    def initialize(file_name)
      @lex = Analyzer::LexAnalyzer.new(file_name)
      @stack = []
      # @stack_semantic = []
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
          # @stack_semantic.push a
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
  end
end