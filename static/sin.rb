class Static
  module TableAnalyse
    T_ANALISY = [
      # estado 0 #
      {'inicio':'s2','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 1 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'acc','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 2 #
      {'inicio':'erro','varinicio':'s4','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'3','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 3 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'s9','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'5','ES':'6','ARG':'-1','CMD':'7','LD':'-1','OPRD':'-1','COND':'8','CABECALHO':'38','EXP_R':'-1','CORPO':'-1'},

      # estado 4 #
      {'inicio':'erro','varinicio':'erro','varfim':'s28','id':'s31','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'27','D':'30','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 5 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'r2','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 6 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'s9','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'57','ES':'6','ARG':'-1','CMD':'7','LD':'-1','OPRD':'-1','COND':'8','CABECALHO':'38','EXP_R':'-1','CORPO':'-1'},

      # estado 7 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'s9','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'39','ES':'6','ARG':'-1','CMD':'7','LD':'-1','OPRD':'-1','COND':'8','CABECALHO':'38','EXP_R':'-1','CORPO':'-1'},

      # estado 8 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'s9','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'58','ES':'6','ARG':'-1','CMD':'7','LD':'-1','OPRD':'-1','COND':'8','CABECALHO':'38','EXP_R':'-1','CORPO':'-1'},

      # estado 9 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'r30','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 10 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s18','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 11 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s17','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'s15','num':'s16','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'13','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 12 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'s20',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 13 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'s14','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 14 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r12','int':'erro','real':'erro','lit':'erro','leia':'r12','escreva':'r12','literal':'erro','num':'erro','se':'r12','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r12','fim':'r12','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 15 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'r13','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 16 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'r14','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 17 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'r15','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 18 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'s19','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 19 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r11','int':'erro','real':'erro','lit':'erro','leia':'r11','escreva':'r11','literal':'erro','num':'erro','se':'r11','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r11','fim':'r11','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 20 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s25','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'s26','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'21','OPRD':'23','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 21 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'s22','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 22 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r17','int':'erro','real':'erro','lit':'erro','leia':'r17','escreva':'r17','literal':'erro','num':'erro','se':'r17','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r17','fim':'r17','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 23#
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'s24','opr':'erro','rcb':'erro',';':'r19','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 24 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s25','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'s26','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'40','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 25 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'r20','entao':'erro','opm':'r20','opr':'r20','rcb':'erro',';':'r20','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 26 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'r21','entao':'erro','opm':'r21','opr':'r21','rcb':'erro',';':'r21','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 27 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r3','int':'erro','real':'erro','lit':'erro','leia':'r3','escreva':'r3','literal':'erro','num':'erro','se':'r3','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'r3','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 28 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'s29','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 29 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r5','int':'erro','real':'erro','lit':'erro','leia':'r5','escreva':'r5','literal':'erro','num':'erro','se':'r5','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'r5','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 30 #
      {'inicio':'erro','varinicio':'erro','varfim':'s28','id':'s31','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'32','D':'30','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 31 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'s35','real':'s36','lit':'s37','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'33','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 32 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r4','int':'erro','real':'erro','lit':'erro','leia':'r4','escreva':'r4','literal':'erro','num':'erro','se':'r4','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'r4','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 33 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'s34','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 34 #
      {'inicio':'erro','varinicio':'erro','varfim':'r6','id':'r6','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 35 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'r7','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 36 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'r8','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 37 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'r9','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 38 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'s46','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'42','ARG':'-1','CMD':'44','LD':'-1','OPRD':'-1','COND':'47','CABECALHO':'38','EXP_R':'-1','CORPO':'41'},

      # estado 39 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'r16','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 40  #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'r18','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 41 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r23','int':'erro','real':'erro','lit':'erro','leia':'r23','escreva':'r23','literal':'erro','num':'erro','se':'r23','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r23','fim':'r23','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 42 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'s46','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'42','ARG':'-1','CMD':'44','LD':'-1','OPRD':'-1','COND':'47','CABECALHO':'38','EXP_R':'-1','CORPO':'43'},

      # estado 43 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r26','int':'erro','real':'erro','lit':'erro','leia':'r26','escreva':'r26','literal':'erro','num':'erro','se':'r26','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r26','fim':'r26','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 44 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'s46','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'42','ARG':'-1','CMD':'44','LD':'-1','OPRD':'-1','COND':'47','CABECALHO':'38','EXP_R':'-1','CORPO':'45'},

      # estado 45 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r27','int':'erro','real':'erro','lit':'erro','leia':'r27','escreva':'r27','literal':'erro','num':'erro','se':'r27','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r27','fim':'r27','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 46 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r29','int':'erro','real':'erro','lit':'erro','leia':'r29','escreva':'r29','literal':'erro','num':'erro','se':'r29','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r29','fim':'r29','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 47 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s12','int':'erro','real':'erro','lit':'erro','leia':'s10','escreva':'s11','literal':'erro','num':'erro','se':'s49','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'s46','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'42','ARG':'-1','CMD':'44','LD':'-1','OPRD':'-1','COND':'47','CABECALHO':'38','EXP_R':'-1','CORPO':'48'},

      # estado 48 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r28','int':'erro','real':'erro','lit':'erro','leia':'r28','escreva':'r28','literal':'erro','num':'erro','se':'28','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r28','fim':'r28','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 49 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'s50',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 50 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s25','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'s26','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'51','COND':'-1','CABECALHO':'-1','EXP_R':'54','CORPO':'-1'},

      # estado 51 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'s52','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 52 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'s25','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'s26','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'53','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 53 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'r25','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 54 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'s55','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 55 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'s56','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 56 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'r24','int':'erro','real':'erro','lit':'erro','leia':'r24','escreva':'r24','literal':'erro','num':'erro','se':'r24','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'r24','fim':'erro','$':'erro','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 57 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'r10','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'},

      # estado 58 #
      {'inicio':'erro','varinicio':'erro','varfim':'erro','id':'erro','int':'erro','real':'erro','lit':'erro','leia':'erro','escreva':'erro','literal':'erro','num':'erro','se':'erro','(':'erro',')':'erro','entao':'erro','opm':'erro','opr':'erro','rcb':'erro',';':'erro','fimse':'erro','fim':'erro','$':'r22','P':'-1','V':'-1','LV':'-1','D':'-1','TIPO':'-1','A':'-1','ES':'-1','ARG':'-1','CMD':'-1','LD':'-1','OPRD':'-1','COND':'-1','CABECALHO':'-1','EXP_R':'-1','CORPO':'-1'}
    ]
  end
  module Gramatic
    GRAMATIC = [
      {'A':"P'",'B':'P'},
      {'A':'P','B':'inicio V A'},
      {'A':'V','B':'varinicio LV'},
      {'A':'LV','B':'D LV'},
      {'A':'LV','B':'varfim ;'},
      {'A':'D','B':'id TIPO ;'},
      {'A':'TIPO','B':'int'},
      {'A':'TIPO','B':'real'},
      {'A':'TIPO','B':'lit'},
      {'A':'A','B':'ES A'},
      {'A':'ES','B':'leia id ;'},
      {'A':'ES','B':'escreva ARG ;'},
      {'A':'ARG','B':'literal'},
      {'A':'ARG','B':'num'},
      {'A':'ARG','B':'id'},
      {'A':'A','B':'CMD A'},
      {'A':'CMD','B':'id rcb LD ;'},
      {'A':'LD','B':'OPRD opm OPRD'},
      {'A':'LD','B':'OPRD'},
      {'A':'OPRD','B':'id'},
      {'A':'OPRD','B':'num'},
      {'A':'A','B':'COND A'},
      {'A':'COND','B':'CABECALHO CORPO'},
      {'A':'CABECALHO','B':'se ( EXP_R ) entao'},
      {'A':'EXP_R','B':'OPRD opr OPRD'},
      {'A':'CORPO','B':'ES CORPO'},
      {'A':'CORPO','B':'CMD CORPO'},
      {'A':'CORPO','B':'COND CORPO'},
      {'A':'CORPO','B':'fimse'},
      {'A':'A','B':'fim'}
    ]
  end
  module NotTerminal
    NOTERMINAL = ['P','V','LV','D','TIPO','A','ES','ARG','CMD','LD','OPRD','COND','CABECALHO','EXP_R','CORPO']
  end
  module Terminal
    TERMINAL = ['inicio','varinicio','varfim','id','int','real','lit','leia','escreva','literal','num','se','(',')','entao','opm','opr','rcb',';','fimse','fim','$']
  end
end
