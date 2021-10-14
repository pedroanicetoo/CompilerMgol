require_relative 'analyzer/lex_analyzer'
require_relative 'analyzer/sin_analyzer'
require_relative 'static/lex'
require_relative 'static/sin'
require_relative 'static/sem'

module Writer
  class writer
    def initialize
      @file_aux_aux = File.open("file_aux.c", "w")
    end

    def varfim
      @file_aux.puts "\n\n\n"
    end

    def tipo(t, lexema)
      if t == 'lit'
        @file_aux.puts "literal #{lexema};\n"
      elsif t == 'real'
        @file_aux.puts "double #{lexema};\n"
      else
        @file_aux.puts "#{t} #{lexema};\n"
      end
    end

    def scanf(t, lexema)
      @file_aux.puts "scanf('%#{t}, &#{lexema}');\n"
    end

    def escreva(arg)
      if arg['tipo'] == 'lit'
        text = "printf('%s', #{arg['lexema']});\n"
      elsif arg['tipo'] == 'real' || arg['tipo'] == 'num'
        text = "printf('%lf', #{arg['lexema']});\n"
      elsif arg['tipo'] == 'int'
        text = "printf('%d', #{arg['lexema']});\n"
      else
        text = "printf('#{arg['lexema']});\n"
      end
      @file_aux.puts text
    end

    def rcb(id,rcb,ld)
      @file_aux.puts "#{id} #{rcb} #{ld};\n"
    end

    def opm(tx,oprd1,opm,oprd2)
      @file_aux.puts "#{tx} = #{oprd1} #{opm} #{oprd2};\n"
    end

    def fim_cond
      @file_aux.puts "}\n"
    end

    def ini_cond(exp_r)
      @file_aux.puts "if (#{exp_r}){\n"
    end

    def opr(tx,oprd1,opr,oprd2)
      if opr == '='
        @file_aux.puts "#{tx} = #{oprd1} == #{oprd2};\n"
      elsif opr == '<>'
        @file_aux.puts "#{tx} = #{oprd1} != #{oprd2};\n"
      else
        @file_aux.puts "#{rx} = #{oprd1} #{opr} #{oprd2};\n"
      end
    end

    def close_file
      @file_aux.close 
    end

    def cabecalho(tx_18, tx_25,out_file_name)
      out_aux  = File.open('file_aux.c', 'r')
      traducao = out_aux.readlines

      final_file = File.open("#{out_file_name}.c", "w")

      final_file.puts "#include<stdio.h>\n"
      final_file.puts "typedef char literal[256];\n"
      final_file.puts "void main(void){\n"

      final_file.puts "\n/*----Variaveis temporarias----*/\n"
      
      i = 0
      (0..tx_18).each do |x|
        final_file.puts "int T #{i};\n"
        i += 1
      end
      
      i = 0
      (tx_18..tx_25).each do |x|
        final_file.puts "int T #{i};\n"
        i += 1
      end
      final_file.puts "/*------------------------------*/\n"

      (0..traducao.each do |c|
        final_file.puts c
      end

      final_file.puts "}"

      final_file.close
    end
  end
end