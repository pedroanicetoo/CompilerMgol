require_relative './writer'

def semantico(regra, a, modulo_B) # (Número da regra, Regra à esquerda, número de simbolos à direita)
  # pilha semantica -> @stack_sem
  # contador de variáveis temporárias @tx
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

  st = (@stack_sem.last['classe'] == 'varinicio') if @stack_sem.last

  if regra == 5  # LV→ varfim pt_v
    varfim()
  elsif regra == 8 || regra == 7 # L→ id || L→ id vir L
    id = simbolos['id']
    type = @stack_sem.select{|x| x if x['classe'] == 'TIPO'}.last
    @lex.atribuicao_tipo(id['lexema'], type['tipo'])
    if regra == 7 # L→ id vir L
      write_id_vir(id['lexema'])
    end
    if regra == 8 # L→ id
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
        print("\n-->Erro Variável não declarada.(linha: #{@lex.get_l}, coluna: #{@lex.get_c})\n")
        @erros_semanticos += 1
    end
  elsif regra == 14  # ES→ escreva ARG pt_v
    arg = simbolos['ARG']
    printf_writer(arg) if arg['lexema']
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
        print("\n-->Erro Variável não declarada.(linha: #{@lex.get_l}, coluna: #{@lex.get_c})\n")
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
        print("\n-->Erro Variável não declarada.(linha: #{@lex.get_l}, coluna: #{@lex.get_c})\n")
        @erros_semanticos += 1
    end
  elsif regra == 20 # LD→ OPRD opm OPRD
    tx = 'T' + @tx.to_s

    oprd1 = simbolos['OPRD1']
    oprd2 = simbolos['OPRD2']
    tipos_equivalentes = ['num','real','inteiro']
    if tipos_equivalentes.include?(oprd1['tipo']) && tipos_equivalentes.include?(oprd2['tipo'])
        s['lexema'] = tx
        s['tipo'] = 'inteiro'
 
        @tx = @tx + 1

        opm = simbolos['opm']
        opm_writer(tx, oprd1['lexema'], opm['lexema'], oprd2['lexema'])
    else
        s['lexema'] = tx
        s['tipo'] = 'num'
        print("\n-->Erro Operandos com tipos incompatíveis.(linha: #{@lex.get_l}, coluna: #{@lex.get_c})\n")
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
      print("\nErro: Variável não declarada.(linha: #{@lex.get_l}, coluna: #{@lex.get_c})\n")
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
        tx = 'T' + @tx.to_s
        s['lexema'] = tx
        s['tipo'] = 'boolean'
        @tx = @tx + 1
        opr = simbolos['opr']
        opr_writer(tx, oprd1['lexema'], opr['lexema'], oprd2['lexema'])

        # Tratamento do Repita
        if @stack_sem[-2] && @stack_sem[-2]['lexema'] == 'repita'
          ini_rep(tx)
        end
    else
        print("\n-->Erro Operandos com tipos incompatíveis.(linha: #{@lex.get_l}, coluna: #{@lex.get_c})\n")
        @erros_semanticos += 1
    end
  elsif regra == 33 # R → repita ab_p EXP_R fc_p CP_R    
    fim_cond_rep()
  end
  @stack_sem.append(s)
end
