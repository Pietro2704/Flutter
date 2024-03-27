void main() { // função (método) principal

  // para apresentar dados usamos o print();
  // neste caso, a saída é o Console (Consol)
  print("PRIMEIRO CÓDIGO:");
  print("Hello World!\n");


  // Variáveis em Dart
  // tipo da variável nome = valor
  
  /**
  * tipos: int, List, Map, String, bool,
  * float, double, var e dynamic.
  *
  * Dart é fortemente tipado
  */


  // Tipos de dados
  String nome = 'Pietro';
  int idade = 21;
  double altura = 1.75;
  bool solteiro = true;
  List<String> lista= ['isso', 'é', 'uma', 'lista'];
  
  // Variavel Nula
  double? peso;

  // Variáveis Especiais
  final ano = 2016;                       // Imutável
  var carro = 'Astra';                    // varia para o mesmo tipo
  dynamic cor = 'Preto';                  // varia qualquer tipo

  print("TIPO:");
  print('O tipo da variavel carro é ' +carro.runtimeType.toString() +'\n');

  // Concatenação
  print("\nCONCATENAÇÃO:");
  print("O " + nome + " tem um " + carro + " " + cor);
  print("O " + carro + " do " + nome + " é do ano de " + ano.toString() +'\n');

  // Interpolação
  print("\nINTERPOLAÇÃO:");
  print("${nome} tem ${idade} anos e ${altura} de altura");
  print("O ${carro} do ${nome} é do ano de ${ano}\n");

  // Operadores

  // Ternário
  print("\nOPERADORES");
  print("\nTernário:");
  print("Pietro é solteiro? " + (solteiro ? 'sim':'não'));

  // Aritmético
  int a = 10;
  int b = 4;

  print("\nAritimetico:");
  print("Sendo a = $a e b = $b");
  // Soma
  print("Soma: ${a + b}");

  // Subtração
  print("Subtração: ${a - b}");

  // Multiplicação
  print("Multiplicação: ${a * b}");

  // Divisão
  print("Divisão: ${a / b}");

  // Divisão Inteira
  print("Divisão Inteira: ${a ~/ b}");

  // Resto da Divisão
  print("Resto da Divisão: ${a % b}");



  // Operadores Relacionais
  print("\nRelacionais:");
  // Igualdade
  print("Igualdade: ${a == b}");

  // Diferença
  print("Diferença: ${a != b}");

  // Maior que
  print("Maior que: ${a > b}");

  // Menor que
  print("Menor que: ${a < b}");

  // Maior ou igual que
  print("Maior ou igual que: ${a >= b}");

  // Menor ou igual que
  print("Menor ou igual que: ${a <= b}");



  // Operador Lógico
  print("\nLógicos:");
  bool verdadeiro = true;
  bool falso = false;

  // E lógico
  print("AND: ${verdadeiro && falso}");   // False

  // OU lógico
  print("OR: ${verdadeiro || falso}");    // True

  // Negação lógica
  print("NEG: ${!verdadeiro}");           // False


  

  // MANIPULAÇÃO DE DADOS

  // // String: pegando partes de um valor (substring)
  // String data = "10/12/1970";
  // // Em que ano eu nasci?
  // print("Dia: ${data.substring(0, 2)}");
  // print("Mês: ${data.substring(3, 5)}");
  // print("Ano: ${data.substring(6, 10)}");

  // // ARREDONDAMENTO: toStringAsFixed(casas decimais)
  // dynamic valor = 1275.1234126314624356425245623456;
  // print(valor.toStringAsFixed(1));
  // print(valor.toStringAsFixed(2));
  // print(valor.toStringAsFixed(3));
  // print(valor.toStringAsFixed(4));

  
} // fim do método main()
