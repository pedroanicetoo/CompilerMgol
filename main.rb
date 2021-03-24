require_relative 'analyzer/analyzer_lexicon.rb'

class Main
  include Analyzer

  analyzer = AnalyzerLexicon.new

  # print "Digite o nome do Arquivo de Saída:"
  # file_output_name = gets.chomp

  # analyzer.file_output(file_output_name)
  # analyzer.perform!

  print "Digite o nome do Arquivo de Entrada:"
  file_input_name = gets.chomp
  analyzer.file_input(file_input_name)
  analyzer.dictionary_list

end

