  literal B, A;
  inteiro B;
  inteiro D;
  real C;
/*------------------------------*/ 
  printf("Digite B");
  scanf("%d", &B);
  printf("Digite A:");
  scanf("%s", &A);
  T0 = B > 2;
  if (T0){
  T1 = B <= 4;
  if (T1){
  printf("B esta entre 2 e 4");
  }
  }
  T2 = B + 1;
  B = T2;
  T3 = B + 2;
  B = T3;
  T4 = B + 3;
  B = T4;
  D = B;
  C = 5.0;
  T5 = B < 5;
  while(T5) { 
  T6 = B + 2;
  D = T6;
  T7 = B <= 4;
  if (T7){
  printf("B esta entre 2 e 4");
  }
  printf("%d",D);
  T8 = B + 1;
  B = T8;
  }
  printf("D=");
  printf("%d",D);
  printf("C=");
  printf("%lf",C);
  printf("A=");
  printf("%s",A);
