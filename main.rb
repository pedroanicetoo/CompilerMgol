require_relative 'analyzer/analyzer_lexicon.rb'


require_relative 'analyzer/lex_analyzer'
require_relative 'static/lex'

class Main
  include Analyzer
  # print "Digite o nome do Arquivo de Entrada:"
  # Analyzer::AnalyzerLexicon.new(gets.chomp).perform!
  # Analyzer::LexAnalyzer.new(gets.chomp).out

  # Static::Symbols::T_SYMBOLS.each do |i|
  #   print("#{i}:#{Static::Symbols::T_SYMBOLS[i]}")
  # end

  Analyzer::LexAnalyzer.new(gets.chomp).perform!

end

