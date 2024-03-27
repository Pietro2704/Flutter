import 'dart:math';

void main() {
  // STRING ----------------------------------------------------------------------------------------------------------------------------
  // Acessando caracteres em uma string ------------------------------------------------------------------------------------------------
  
  var resultado = 'Olá Dart';
  var primeiraLetra = resultado[0];
  print(primeiraLetra);
  // Saída: O

  
  // Métodos de string
  var maiuscula = resultado.toUpperCase();
  var minuscula = resultado.toLowerCase();
  print(maiuscula);
  print(minuscula);
  // Saída: OLÁ DART!
  // Saída: olá dart!

  
  // Verificando o comprimento de uma string
  var comprimento = resultado.length;
  print(comprimento);
  // Saída: 10

  
  // Substituição de parte da string
  var novaString = resultado.replaceAll('Dart', 'Flutter');
  print(novaString);
  // Saída: Olá Flutter!

  
  // Verificando se uma string contém outra
  var contemDart = resultado.contains('Dart');
  print(contemDart);
  // Saída: true

  
  // Extraindo parte de uma string
  var parte = resultado.substring(4, 7);
  print(parte);
  // Saída: Dar


  
  // LISTAS ----------------------------------------------------------------------------------------------------------------------------
  // ADD -------------------------------------------------------------------------------------------------------------------------------
  var frutas = <String>['Maça', 'Pêra', 'Banana'];
  
  frutas.add('Jaca');
  print(frutas);
  //    0    1       2      3
  // [Maça, Pêra, Banana, Jaca]


  // Inserindo pelo ÍNDICE
  frutas.insert(1, 'Mamão');
  print(frutas);
  //    0    1       2      3     4
  // [Maça, Mamão, Pêra, Banana, Jaca]


  // Inserindo em ESCALA

  // Exemplo 1:
  frutas
    ..add('Caqui')
    ..add('Laranja');
  print(frutas);
  //    0    1       2      3     4     5       6
  // [Maça, Mamão, Pêra, Banana, Jaca, Caqui, Laranja]

  //Exemplo 2:
  frutas.addAll(['Limão', 'Abacaxi', 'Uva']);
  print(frutas);
  //   0     1      2     3      4      5       6       7       8      9
  // [Maça, Mamão, Pêra, Banana, Jaca, Caqui, Laranja, Limão, Abacaxi, Uva]

  // Exemplo 3:
  frutas.insertAll(3, ['Tâmara', 'Atemóia', 'Seriguela', 'Pitomba']);
  print(frutas);
  //   0      1     2      3       4          5         6       7      8      9     10        11      12    13
  // [Maça, Mamão, Pêra, Tâmara, Atemóia, Seriguela, Pitomba, Banana, Jaca, Caqui, Laranja, Limão, Abacaxi, Uva]





  // REMOVE ---------------------------------------------------------------------------------------------------------------------------
  List<String> eletronico = ['Celular', 'Remédio', 'Notebook', 'Fotografia', 'Tablet', 'Bateria', 'Guardanapo', 'Televisão'];

  eletronico.remove('Remédio');
  print(eletronico);
  //     0           1            2          3         4           5             6
  // ['Celular', 'Notebook', 'Fotografia', 'Tablet', 'Bateria', 'Guardanapo', 'Televisão']

  // Remoção pelo ÍNDICE
  eletronico.removeAt(2);
  print(eletronico);
  //     0           1           2         3           4              5
  // ['Celular', 'Notebook', 'Tablet', 'Bateria', 'Guardanapo', 'Televisão']

  // Remover em ESCALA
  eletronico.removeRange(0,3);
  print(eletronico);
  //     0           1              2     
  // ['Bateria', 'Guardanapo', 'Televisão']


  // Remover o ULTIMO

  // Exemplo 1:
  eletronico.removeAt(eletronico.length -1);  
  print(eletronico); 
  //     0           1        
  // ['Bateria', 'Guardanapo']


  // Exemplo 2:
  eletronico.removeLast();                     
  print(eletronico);
  //     0           
  // ['Bateria']


  // Limpar a lista toda
  eletronico.clear();
  print(eletronico);
  // []





  // EXEMPLO DE UMA LISTA COM VALOR IGUAL ----------------------------------------------------------------------------------------------
  List<String> listaErrada = ['Ana','Lucia','Ana','Maria','Pietro','Edson','Maria', 'Lucia', 'Edson'];

  // Tira apenas UMA 'Ana'
  listaErrada.remove('Ana');
  print(listaErrada);  
  // ['Lucia','Ana','Maria','Pietro','Edson','Maria', 'Lucia', 'Edson']


  // Tira TODAS as 'Ana'
  listaErrada.removeWhere((String nome) => nome == 'Ana');
  print(listaErrada);
  // [Lucia, Maria, Pietro, Edson, Maria, Lucia, Edson]


  // Tira todas as 'Lucia' e 'Maria'
  listaErrada.removeWhere(
    (String elemento) => elemento == 'Lucia' || elemento == 'Maria'
  );
  print(listaErrada);
  // [Pietro, Edson, Edson]


  // Tira todos os valores que forem passados
  listaErrada.removeWhere(
    (String elemento) => ['Pietro', 'Edson'].contains(elemento)
  );
  print(listaErrada);
  // []





  // PESQUISAR -------------------------------------------------------------------------------------------------------------------------
  print(listaErrada.contains('Edson')); // False





  // ALTERAR VALOR ---------------------------------------------------------------------------------------------------------------------
  listaErrada = ['Ana', 'Ana'];

  listaErrada[0] = 'Ana Maria';
  listaErrada[1] = 'Ana Lucia';
  print(listaErrada);
  // [Ana Maria, Ana Lucia]





  // ORDENAÇÃO -------------------------------------------------------------------------------------------------------------------------
  List<String> nomes = ['Ana', 'Lucia', 'Maria', 'Pietro', 'Edson', 'Mariana'];

  nomes.sort();
  print(nomes);
  // [Ana, Edson, Lucia, Maria, Mariana, Pietro]


  // Usando LAMBDA
  nomes.sort((comeco,fim) => fim.compareTo(comeco));
  print(nomes);
  // [Pietro, Mariana, Maria, Lucia, Edson, Ana]



  // MATRIZ
  var matriz = <dynamic>[
    ['Eu', 4.0, 2],
    ['Estou', 2.6, 6],
    [2.6, 'Aq', 6]
  ];
  print("${matriz[0][0]} ${matriz[1][0]} ${matriz[2][1]}"); // Eu Estou Aq
}
