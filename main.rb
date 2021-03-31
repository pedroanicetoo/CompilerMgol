require_relative 'analyzer/analyzer_lexicon.rb'

class Main
  include Analyzer

  # print "Digite o nome do Arquivo de Saída:"
  # file_output_name = gets.chomp

  # analyzer.file_output(file_output_name)
  # analyzer.perform!

  print "Digite o nome do Arquivo de Entrada:"
  Analyzer::AnalyzerLexicon.new(gets.chomp).perform!


end

