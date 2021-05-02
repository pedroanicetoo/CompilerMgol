require_relative '../static/lex'
require_relative '../static/sin'
require_relative './lex_analyzer'
require 'colorize'

module Analyzer
  class SinAnalyzer

    attr_reader :file

    def initialize(file_name)
      @lex = Analyzer::LexAnalyzer.new(file_name)
      @stack = []
      @stack_sem = []
      @semantic_errors = 0
      @tx_18 = 0
      @tx_25 = 0
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
      s = @stack.pop
      for terminal in @terminal
        action = @t_analys[s][terminal]
        finals += terminal + '    '  if action != 'erro'
      end

      print(finais)
      #tratando erros

      while true
        s = @stack.pop
        aux = false
        for rule_a in @not_terminal
          if @t_analys[s][rule_a] != '-1'
            aux = true
            break;
          end
        end
        if aux
          break;
        end
      end

      while true
        s = pilha.pop
        if a == false
          return a
        end

        action = @t_analys[s][a['token']]

        if action[0] == 's' || action[0] == 'r'
          if a['token'] == 'id'
            id = a
            return a
          end
        elsif a['token'] == '$'
          print('Erro sintatico invalida toda analise sintatica.')
          exit!
        end
        a = @lex.analisador()
      end
    end

    def main
      a = @lex.analisador
      @stack.push 0
      while true
        if a == false
          break;
        end

        s = @stack.last ##look
        action = @t_analys[s][a['token']]

        if action[0] == 's'
          @stack.push action['1'].to_i
          @stack_sem.push a
          a = @lex.analisador
        elsif action[0] == 'r'
          regra = @gramatic[(action['1'].to_i) - 1] ## look
          rule_a = regra['A']
          rule_b = regra['B']
          modulo_B = (rule_b.split).length

          for i in 0..modulo_B
            @stack.pop
          end

          t = @stack.last #look
          @stack.push((@t_analys[t][rule_a]).to_i)
          print('-----------------------------------------\n')
        elsif action == 'acc'
          break;
        else
          line = @lex.get_l
          printf("Eroo Sintatico(linha: #{line} )")
          a = erro(a)
        end
      end
    end
  end
end
