
def instance_file_aux
    @file = File.open('out_aux.c', 'w')
end

def close_file_aux
    @file.close
end

def varfim()
    @file << ";\n\n\n"
end

def write_type(lexema)
    @file << lexema
end

def w_type(type, st = nil)
    type_c = 'int' if type == 'inteiro'
    type_c = 'double' if type == 'real'
    type_c = "literal" if type == 'literal'

    # checando se esta no começo
    @file << "  #{type_c} " if st
    @file << ";\n  #{type_c} " if !st
end

def write_id_vir(lexema)
    @file << ", #{lexema}"
end

def scanf(t, lexema)
    @file << '  scanf("%' + t + '", &' + lexema + ");\n"
end

def printf_writer(arg)
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
    @file << "  #{id} #{rcb} #{ld};\n"
end

def opm_writer(tx, oprd1, opm, oprd2)
    @file << "  #{tx} = #{oprd1} #{opm} #{oprd2};\n"
end

def fim_cond_rep()
    @file << "  }\n"
end

def ini_cond(exp_r)
    @file << "  if(#{exp_r}) {\n"
end

def ini_rep(tx)
    @file << "  while(#{tx}) {\n"
end

def opr_writer(tx, oprd1, opr, oprd2)
    if opr == '='
        @file << "  #{tx} = #{oprd1} == #{oprd2};\n"
    elsif opr == '<>'
        @file << "  #{tx} = #{oprd1} != #{oprd2};\n"
    else # > <
        @file << "  #{tx} = #{oprd1} #{opr} #{oprd2};\n"
    end
end

def close_file()
    @file.close()
end

def header(tx)
    out_aux = File.open('out_aux.c', 'r')
    traducao = out_aux.readlines()
    arq_final = File.open('programa.c', 'w')

    arq_final << "#include<stdio.h>\n"
    arq_final << "typedef char literal[256];\n"
    arq_final << "void main(void){\n"

    arq_final << "\n/*----Variaveis temporarias----*/\n"

    for i in 0..(tx - 1)
        arq_final << "  int T#{i.to_s};\n"
    end

    arq_final << "/*------------------------------*/\n"

    for c in traducao
        arq_final << c
    end

    arq_final << '}'
end
