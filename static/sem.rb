class Static
  module TableSemantic
    REGRAS_SEM = [
      '-',
      '-',
      '-',
      '-',
      'Imprimir três linhas brancas no arquivo objeto;',
      'id.tipo <- TIPO.tipo\nImprimir ( TIPO.tipo id.lexema ; )',
      'TIPO.tipo <- inteiro.tipo',
      'TIPO.tipo <- real.tipo',
      'TIPO.tipo <- literal.tipo',
      '-',
      'Verificar se o campo tipo do identificador está preenchido indicando a declaração do identificador (execução da regra semântica de número 6).\nSe sim, então:\n\t Se id.tipo = literal Imprimir ( scanf(“%s”, id.lexema); )\n\t Se id.tipo = inteiro Imprimir ( scanf(“%d”, &id.lexema); )\n\t Se id.tipo = real Imprimir ( scanf(“%lf”, &id.lexema); )\nCaso Contrário:\n\tEmitir na tela “Erro: Variável não declarada”.',
      'Gerar código para o comando escreva no arquivo objeto.\nImprimir ( printf(“ARG.lexema”); )',
      'ARG.atributos <- literal.atributos (Copiar todos os atributos de literal para os atributos de ARG).',
      'ARG.atributos <- num.atributos (Copiar todos os atributos de literal para os atributos de ARG).',
      'Verificar se o identificador foi declarado (execução da regra semântica de número 6).\nSe sim, então:\n\tARG.atributos <- id.atributos (copia todos os atributos de id para os de ARG).\nCaso Contrário:\n\tEmitir na tela “Erro: Variável não declarada”',
      '-',
      'Verificar se id foi declarado (execução da regra semântica de número 6).\nSe sim, então:\n\tRealizar verificação do tipo entre os operandos id e LD (ou seja, se ambos são do mesmo tipo).\n\tSe sim, então:\n\t\tImprimir (id.lexema rcb.tipo LD.lexema) no arquivo objeto.\n\tCaso contrário emitir:”Erro: Tipos diferentes para atribuição”.\nCaso contrário emitir “Erro: Variável não declarada”.',
      'Verificar se tipo dos operandos são equivalentes e diferentes de literal.\nSe sim, então:\n\tGerar uma variável numérica temporária Tx, em que x é um número gerado sequencialmente.\nLD.lexema <- Tx\nImprimir (Tx = OPRD.lexema opm.tipo OPRD.lexema) no arquivo objeto.\nCaso contrário emitir “Erro: Operandos com tipos incompatíveis”.',
      'LD.atributos <- OPRD.atributos (Copiar todos os atributos de OPRD para os atributos de LD).',
      'Verificar se o identificador está declarado.\nSe sim, então:\n\tOPRD.atributos	<- id.atributos\nCaso contrário emitir “Erro: Variável não declarada”',
      'OPRD.atributos	<- num.atributos (Copiar todos os atributos de num para os atributos de OPRD).',
      '-',
      'Imprimir ( } ) no arquivo objeto.',
      'Imprimir ( if (EXP_R.lexema) { ) no arquivo objeto.',
      'Verificar se os tipos de dados de OPRD são iguais ou equivalentes para a realização de comparação relacional.\nSe sim, então:\n\tGerar uma variável booleana temporária Tx, em que x é um número gerado sequencialmente.\n\tEXP_R.lexema <-	Tx\n\tImprimir (Tx = OPRD.lexema opr.tipo OPRD.lexema) no arquivo objeto.\nCaso contrário emitir “Erro: Operandos com tipos incompatíveis”.',
      '-',
      '-',
      '-',
      '-',
      '-'
      ]
  end
end
