# encoding: utf-8
class Syntax
  module Symbols
    INICIO          = 'inicio'
    VARINICIO       = 'varinicio'
    VARFIM          = 'varfim'
    ESCREVA         = 'escreva' 
    LEIA            = 'leia' 
    SE              = 'se' 
    ENTAO           = 'entao' 
    FIMSE           = 'fimse' 
    FACAATE         = 'faca-ate' 
    FIMFACA         = 'fimfaca' 
    FIM             = 'fim' 
    INTEIRO         = 'inteiro' 
    LIT             = 'lit' 
    REAL            = 'real'
    TOKENS = {
      INICIO          => 'Delimita o início do programa',
      VARINICIO       => 'Delimita o início da declaração de variáveis',
      VARFIM          => 'Delimita o fim da declaração de variáveis',
      ESCREVA         => 'Imprime na saída padrão',
      LEIA            => 'Lê da saída padrão', 
      SE              => 'Estrutura condiciona', 
      ENTAO           => 'Elemento de estrutura condicional', 
      FIMSE           => 'Elemento de estrutura condicional', 
      FACAATE         => 'Elemento de estrutura de repetição', 
      FIMFACA         => 'Elemento de estrutura de repetição', 
      FIM             => 'Delimita o fim do programa', 
      INTEIRO         => 'Tipo de dado inteiro', 
      LIT             => 'Tipo de dado literal', 
      REAL            => 'Tipo de dado real'
    }
  end
end
