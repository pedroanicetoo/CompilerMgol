class Static
  module Transitions
    T_TRANSICOES = 
    [  #\n \t  ' '  D   "   L    {   <   >   =   +   -   *   /   (   )   ;  EOF  .   E   C   _   }   ,   &
      [ 0,  0,  0,  1,  7,  9,  10, 12, 14, 16, 18, 18, 18, 18, 19, 20, 21, 22, -1, -1, -1, -1, -1, 23, -1], #0 ok
      [-1, -1, -1,  1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  2,  4, -1, -1, -1, -1, -1], #1 ok
      [-1, -1, -1,  3, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #2 ok
      [-1, -1, -1,  3, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  4, -1, -1, -1, -1, -1], #3 ok
      [-1, -1, -1,  6, -1, -1,  -1, -1, -1, -1,  5,  5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #4 ok
      [-1, -1, -1,  6, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #5 ok
      [-1, -1, -1,  6, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #6 ok
      [-1, -1, -1, -1,  8, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  7, -1, -1, -1, -1], #7 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #8 ok
      [-1, -1, -1,  9, -1,  9,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  9, -1, -1, -1], #9 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 10, -1, 11, -1, -1], #10 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #11 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, 13, 13, -1, 17, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #12 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #13 ok 
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, 15, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #14 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #15 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #16 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #17 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #18 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #19 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #20 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #21 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #22 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], #23 ok
      [-1, -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1]  #24 ok
    ]
  end 

  module Dictionary
    DIC={}
    DIC["\n"]=0
    DIC["\t"]=1
    DIC[' ']=2
    DIC['D']=3
    DIC['"']=4
    DIC['L']=5
    DIC['{']=6
    DIC['<']=7
    DIC['>']=8
    DIC['=']=9
    DIC['+']=10
    DIC['-']=11
    DIC['*']=12
    DIC['/']=13
    DIC['(']=14
    DIC[')']=15
    DIC[';']=16
    DIC["EOF"]=17
    DIC['.']=18
    DIC['E']=19
    DIC['C']=20 #character
    DIC['_']=21
    DIC['}']=22
    DIC[',']=23
    DIC['&']=24
  end

  module Digits
    DIGITS = ['0','1','2','3','4','5','6','7','8','9']
  end

  module Letters
    LETTERS = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
      'q','r','s','t','u','v','x','y','w','z','A','B','C','D','E',
      'F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T',
      'U','V','X','W','Y','Z']
  end

  module Symbols
    T_SYMBOLS={}
    T_SYMBOLS['inicio']={'lexema' => 'inicio','classe' => 'inicio','tipo' => '-'}
    T_SYMBOLS['varinicio']={'lexema' => 'varinicio','classe' => 'varinicio','tipo' => '-'}
    T_SYMBOLS['varfim']={'lexema' => 'varfim','classe' => 'varfim','tipo' => '-'}
    T_SYMBOLS['escreva']={'lexema' => 'escreva','classe' => 'escreva','tipo' => '-'}
    T_SYMBOLS['leia']={'lexema' => 'leia','classe' => 'leia','tipo' => '-'}
    T_SYMBOLS['se']={'lexema' => 'se','classe' => 'se','tipo' => '-'}
    T_SYMBOLS['entao']={'lexema' => 'entao','classe' => 'entao','tipo' => '-'}
    T_SYMBOLS['fimse']={'lexema' => 'fimse','classe' => 'fimse','tipo' => '-'}
    T_SYMBOLS['repita']={'lexema' => 'repita','classe' => 'repita','tipo' => '-'}
    T_SYMBOLS['fimrepita']={'lexema' => 'fimrepita','classe' => 'fimrepita','tipo' => '-'}
    T_SYMBOLS['fim']={'lexema' => 'fim','classe' => 'fim','tipo' => '-'}
    T_SYMBOLS['inteiro']={'lexema' => 'inteiro','classe' => 'inteiro','tipo' => 'inteiro'}
    T_SYMBOLS['literal']={'lexema' => 'literal','classe' => 'literal','tipo' => 'literal'}
    T_SYMBOLS['real']={'lexema' => 'real','classe' => 'real','tipo' => 'real'}
  end

  module Tokens
    TOKENS={}
    TOKENS[1] = 'num'
    TOKENS[3] = 'num'
    TOKENS[6] = 'num'
    TOKENS[8] = 'lit'
    TOKENS[9] = 'id'
    TOKENS[11] = 'comentario'
    TOKENS[22] = 'EOF'
    TOKENS[12] = 'opr'
    TOKENS[13] = 'opr'
    TOKENS[14] = 'opr'
    TOKENS[15] = 'opr'
    TOKENS[16] = 'opr'
    TOKENS[17] = 'rcb'
    TOKENS[18] = 'opm'
    TOKENS[19] = '('
    TOKENS[20] = ')'
    TOKENS[21] = ';'
    TOKENS[23] = ','
  end

  module FinalStates
    FINALSTATES=[1,3,6,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23]
  end

  module Errors
    ERRORS=[]
    ERRORS[0] = 'Símbolo inválido.'
    ERRORS[2] = 'Espera-se um dígito.'
    ERRORS[4] = 'Espera-se um sinal seguido de dígito ou somente um dígito após o "E".'
    ERRORS[5] = 'Espera-se um dígito após o sinal.'
    ERRORS[7] = "Espera-se o fechamento das aspas do literal."
    ERRORS[10] = 'Espera-se "}".'
  end

end