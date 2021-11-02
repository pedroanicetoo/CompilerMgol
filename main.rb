require_relative 'analyzer/lex_analyzer'
require_relative 'analyzer/sin_analyzer'
require_relative 'static/lex'
require_relative 'static/sin'

class Main
  include Analyzer
  # print "Digite o nome do Arquivo de Entrada:"
  # Analyzer::AnalyzerLexicon.new(gets.chomp).perform!
  # Analyzer::LexAnalyzer.new(gets.chomp).out

  # Static::Symbols::T_SYMBOLS.each do |i|
  #   print("#{i}:#{Static::Symbols::T_SYMBOLS[i]}")
  # end



  # new_version LEX
  # file_name = gets.chomp
  # lex = Analyzer::LexAnalyzer.new(file_name)
  # lex.instance_tables
  # lex.perform!

  # Sin Analyzer

  sin = Analyzer::SinAnalyzer.new('Mgol_entry')
  sin.instance_tables
  sin.main
end
