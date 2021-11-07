require_relative './escritor'

def semantico(regra, a, modulo_B)
  # global @stack_sem
  # global @erros_semanticos
  # regra_sem = util_sem.regras_sem[regra-1]
  # print ('Regra Semântica '+ regra_sem + '\n')
  simbolos = {}
  if regra == 20 || regra == 27 # (20) LD -> OPRD opm OPRD | (27) EXP_R -> OPRD opr OPRD
    aux = @stack_sem.pop
    simbolos['OPRD2'] = aux
    aux = @stack_sem.pop
    simbolos[aux['classe']] = aux
    aux = @stack_sem.pop
    simbolos['OPRD1'] = aux
   else
    for i in (1..modulo_B)
      aux = @stack_sem.pop
      simbolos[aux['classe']] = aux
    end
  end

  s = {'classe' => a}

  if @stack_sem.last
    st = (@stack_sem.last['classe'] == 'varinicio')
  end

  if regra == 5  # LV→ varfim pt_v
    varfim()
  elsif regra == 8 || regra == 7 # L→ id || L→ id vir L
    id = simbolos['id']
    type = @stack_sem.select{|x| x if x['classe'] == 'TIPO'}.last
    @lex.atribuicao_tipo(id['lexema'], type['tipo'])
    if regra == 7
      id_pt_v(id['lexema'])
    end
    if regra == 8
      write_type(id['lexema'])
    end
  elsif regra == 9 # TIPO→ inteiro
    s['tipo'] = 'inteiro'
    w_type('inteiro', st)
  elsif regra == 10 # TIPO→ real
    s['tipo'] = 'real'
    w_type('real', st)
  elsif regra == 11 # TIPO→ literal
    s['tipo'] = 'literal'
    w_type('literal', st)
  elsif regra == 13 # ES→ leia id pt_v
    id = simbolos['id']
    if @lex.id_declarado(id['lexema'])
      if id['tipo'] == 'literal'
        scanf('s', id['lexema'])
      elsif id['tipo'] == 'inteiro'
        scanf('d', id['lexema'])
      elsif id['tipo'] == 'real'
        scanf('lf', id['lexema'])
      end
    else
        print('\n-->Erro Variável não declarada.\n')
        @erros_semanticos += 1
    end
  elsif regra == 14  # ES→ escreva ARG pt_v
    arg = simbolos['ARG']
    escreva(arg)
  elsif regra == 15  # ARG→ lit
    lit = simbolos['lit']
    s['lexema'] = lit['lexema']
    s['tipo'] = 'lit'
  elsif regra == 16 # ARG→ num
    num = simbolos['num']
    s['lexema'] = num['lexema']
    s['tipo'] = 'num'
  elsif regra == 17 # ARG→ id
    id_arg = simbolos['id']
    if @lex.id_declarado(id_arg['lexema'])
      id_arg = simbolos['id']
        s['lexema'] = id_arg['lexema']
        s['tipo'] = id_arg['tipo']
    else
        print('\n-->Erro Variável não declarada.\n')
        @erros_semanticos += 1
    end
  elsif regra == 19 # CMD→ id rcb LD pt_v
    id = simbolos['id']
    if @lex.id_declarado(id['lexema'])
        ld = simbolos['LD']
        if (id['tipo'] == ld['tipo']) || (id['tipo'] == 'real' && (ld['tipo'] == 'num' || ld['tipo'] == 'inteiro'))
          rcb = simbolos['rcb']
          rcb['tipo'] = '='
          rcb_writer(id['lexema'],rcb['tipo'],ld['lexema'])
        else
          print("\n-->Erro Tipos diferentes para atribuição.\n")
          @erros_semanticos += 1
        end
    else
        print("\n-->Erro Variável não declarada.\n")
        @erros_semanticos += 1
    end
  elsif regra == 20 # LD→ OPRD opm OPRD
    tx = 'T' + @tx_20.to_s

    oprd1 = simbolos['OPRD1']
    oprd2 = simbolos['OPRD2']
    tipos_equivalentes = ['num','real','inteiro']
    if tipos_equivalentes.include?(oprd1['tipo']) && tipos_equivalentes.include?(oprd2['tipo'])
        s['lexema'] = tx
        s['tipo'] = 'inteiro'
 
        @tx_20 = @tx_20 + 1

        opm = simbolos['opm']
        opm_writer(tx, oprd1['lexema'], opm['lexema'], oprd2['lexema'])
    else
        s['lexema'] = tx
        s['tipo'] = 'num'
        print('\n-->Erro Operandos com tipos incompatíveis.\n')
        @erros_semanticos += 1
    end
  elsif regra == 21 # LD→ OPRD
    s['lexema'] = simbolos['OPRD']['lexema']
    s['tipo'] = simbolos['OPRD']['tipo']
  elsif regra == 22 # OPRD→ id
    if @lex.id_declarado(simbolos['id']['lexema'])
      s['lexema'] = simbolos['id']['lexema']
      s['tipo'] = simbolos['id']['tipo']
    else
      print("\n“Erro: Variável não declarada” ”, linha: #{@lex.get_l}, coluna: #{@lex.get_c}\n")
    end
  elsif regra == 23 # OPRD→ num
    s['lexema'] = simbolos['num']['lexema']
    if simbolos['num']['tipo'].to_i.is_a? Integer
      s['tipo'] = 'num'
    else
      s['tipo'] = simbolos['num']['tipo']
    end
  elsif regra == 25 # COND→ CAB CP
    fim_cond_rep()
  elsif regra == 26 # CAB→ se ab_p EXP_R fc_p então
    exp_r = simbolos['EXP_R']
    ini_cond(exp_r['lexema'])
  elsif regra == 27 # EXP_R→ OPRD opr OPRD
    oprd1 = simbolos['OPRD1']
    oprd2 = simbolos['OPRD2']
    tipos_equivalentes = ['num', 'inteiro', 'real']
    if ((oprd1['tipo'] == oprd2['tipo']) || (tipos_equivalentes.include?(oprd1['tipo']) && tipos_equivalentes.include?(oprd2['tipo'])))
        tx = 'T' + @tx_20.to_s
        s['lexema'] = tx
        s['tipo'] = 'boolean'
        @tx_20 = @tx_20 + 1
        opr = simbolos['opr']
        opr_writer(tx, oprd1['lexema'], opr['lexema'], oprd2['lexema'])
        if @stack_sem.select{|x| x['lexema'] == 'repita'}.length > 0
          ini_rep(tx)
        end
    else
        print("\n-->Erro Operandos com tipos incompatíveis.\n")
        @erros_semanticos += 1
    end
  elsif regra == 33 # R → repita ab_p EXP_R fc_p CP_R    
    fim_cond_rep()
  end


  # if regra == 5
  #     escritor.varfim()

#   elsif regra == 6
#       id = simbolos['id']
#       TIPO = simbolos['TIPO']
#       lexico.atribuicao_tipo(id['lexema'], TIPO['tipo'])
#       escritor.Tipo(TIPO['tipo'], id['lexema'])
# 
#   elsif regra == 11
#       id = simbolos['id']
#       if lexico.id_declarado(id['lexema'])
#           if id['tipo'] == 'lit'
#               escritor.scanf('s', id['lexema'])
#           elsif id['tipo'] == 'int'
#               escritor.scanf('d', id['lexema'])
#           elsif id['tipo'] == 'real'
#               escritor.scanf('lf', id['lexema'])
#       else
#           print('\n-->Erro Variável não declarada.\n')
#           erros_semanticos += 1
# 
#   elsif regra == 12
#       ARG = simbolos['ARG']
#       escritor.escreva(ARG)
# 
#   elsif regra == 13
#       literal = simbolos['literal']
#       S['lexema'] = literal['lexema']
#       S['tipo'] = 'litetal'
#   elsif regra == 14
#       num = simbolos['num']
#       S['lexema'] = num['lexema']
#       S['tipo'] = 'num'
#   elsif regra == 15
#       id = simbolos['id']
#       if lexico.id_declarado(id['lexema'])
#           id = simbolos['id']
#           S['lexema'] = id['lexema']
#           S['tipo'] = id['tipo']
#       else
#           print('\n-->Erro Variável não declarada.\n')
#           erros_semanticos += 1
# 
#   elsif regra == 17
#       id = simbolos['id']
#       if lexico.id_declarado(id['lexema'])
#           LD = simbolos['LD']
#           if (id['tipo'] == LD['tipo']) || (id['tipo'] == 'real' and (LD['tipo'] == 'num' || LD['tipo'] == 'int'))
#               rcb = simbolos['rcb']
#               rcb['tipo'] = '='
#               escritor.rcb(id['lexema'],rcb['tipo'],LD['lexema'])
#           else
#               print('\n-->Erro Tipos diferentes para atribuição.\n')
#               erros_semanticos += 1
#       else
#           print('\n-->Erro Variável não declarada.\n')
#           erros_semanticos += 1
# 
#   elsif regra == 18
#       global Tx_18
#       Tx = 'T' + str(Tx_18)
# 
#       OPRD1 = simbolos['OPRD1']
#       OPRD2 = simbolos['OPRD2']
#       tipos_equivalentes = ['num','real','int']
#       if OPRD1['tipo'] in tipos_equivalentes and OPRD2['tipo'] in tipos_equivalentes
#           S['lexema'] = Tx
#           S['tipo'] = 'int'
# 
#           Tx_18 += 1
# 
#           opm = simbolos['opm']
#           escritor.opm(Tx, OPRD1['lexema'], opm['lexema'], OPRD2['lexema'])
#       else
#           S['lexema'] = Tx
#           S['tipo'] = 'num'
#           print('\n-->Erro Operandos com tipos incompatíveis.\n')
#           erros_semanticos += 1
# 
#   elsif regra == 19
#       OPRD = simbolos['OPRD']
#       S['lexema'] = OPRD['lexema']
#       S['tipo'] = OPRD['tipo']
# 
#   elsif regra == 20
#       id = simbolos['id']
#       if lexico.id_declarado(id['lexema'])
#           S['lexema'] = id['lexema']
#           S['tipo'] = id['tipo']
#       else
#           print('\n-->Erro Variável não declarada.\n')
#           erros_semanticos += 1
# 
#   elsif regra == 21
#       num = simbolos['num']
#       S['lexema'] = num['lexema']
#       S['tipo'] = num['token']
# 
#   elsif regra == 23
#       escritor.fim_cond()
# 
#   elsif regra == 24
#       EXP_R = simbolos['EXP_R']
#       escritor.ini_cond(EXP_R['lexema'])
# 
#   elsif regra == 25
#       global Tx_25
# 
#       OPRD1 = simbolos['OPRD1']
#       OPRD2 = simbolos['OPRD2']
#       tipos_equivalentes = ['num', 'int', 'real']
#       if (OPRD1['tipo'] == OPRD2['tipo']) || (OPRD1['tipo'] in tipos_equivalentes and OPRD2['tipo'] in tipos_equivalentes)
#           Tx = 'T' + str(Tx_25)
#           S['lexema'] = Tx
#           S['tipo'] = 'boolean'
#           Tx_18 += 1
# 
#           opr = simbolos['opr']
#           escritor.opr(Tx, OPRD1['lexema'], opr['lexema'], OPRD2['lexema'])
# 
#       else
#           print('\n-->Erro Operandos com tipos incompatíveis.\n')
#           erros_semanticos += 1
#       end

  @stack_sem.append(s)
end
