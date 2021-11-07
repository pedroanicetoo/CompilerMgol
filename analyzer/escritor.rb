
def instance_file_aux
    @file = File.open('out_aux.c', 'w')
end

def close_file_aux
    @file.close
end

def varfim()
    @file << ";\n"
    @file << "/*------------------------------*/ \n"
end

def write_type(lexema)
    @file << lexema
end

def w_type(type, st = nil)
    @file << ";" unless st
    @file << "  " + type + " " if st
    @file << "\n  " + type + " " if !st
end

def id_pt_v(lexema)
    @file << ", " + lexema
end

def scanf(t, lexema)
    @file << '  scanf("%' + t + '", &' + lexema + ");\n"
end

def escreva(arg)
    if arg['tipo'] == 'literal'
        text = '  printf("%s",' + arg['lexema'] + ");\n"
    elsif arg['tipo'] == 'real' || arg['tipo'] == 'num'
        text = '  printf("%lf",' + arg['lexema'] + ");\n"
    elsif arg['tipo'] == 'inteiro'
        text = '  printf("%d",' + arg['lexema'] + ");\n"
    else
        text = '  printf(' + arg['lexema'] + ");\n"
    end
    @file << text
end

def rcb_writer(id, rcb, ld)
    @file << '  ' + id + ' ' + rcb + ' ' + ld + ";\n"
end

def opm_writer(tx, oprd1, opm, oprd2)
    @file << '  ' + tx + ' = ' + oprd1 + ' ' + opm + ' ' + oprd2 + ";\n"
end

def fim_cond()
    @file << "  }\n"
end

def ini_cond(exp_r)
    @file << '  if (' + exp_r + "){\n"
end

def opr_writer(tx, oprd1, opr, oprd2)
    if opr == '='
        @file << "  " + tx + ' = ' + oprd1 + ' == ' + oprd2 + ";\n"
    elsif opr == '<>'
        @file << "  " + tx + ' = ' + oprd1 + ' != ' + oprd2 + ";\n"
    else
        @file << "  " + tx + " = " + oprd1 + " " + opr + " " + oprd2 + ";\n"
    end
end

def close_file()
    @file.close()
end

def cabecalho(tx_20, tx_27)
    out_aux = File.open('out_aux.c', 'r')
    traducao = out_aux.readlines()
    arq_final = File.open('out.c', 'w')

    arq_final << "#include<stdio.h>\n"
    arq_final << "typedef char literal[256];\n"
    arq_final << "void main(void){\n"

    arq_final.write("\n/*----Variaveis temporarias----*/\n")

    for i in 0..(tx_20 - 1)
        arq_final << '  int T' + i.to_s + ";\n"
    end

    arq_final << "/*------------------------------*/\n" 

    for c in traducao
        arq_final << c
    end

    arq_final << '}'
end