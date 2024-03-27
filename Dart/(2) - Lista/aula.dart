/// Estruturas de listas
/// Listas são estruturas de dados que permitem armazenar dados de forma
/// sequencial. São identificadas por colchetes [].

void main() {

  // Declarando uma lista como String
  // O símbolo <> recebe o nome de diamond
  // Uma lista trabalha com índices (sempre iniciando em zero) e valores

  //     0        1        2
  // ["Edson", "Maria", "João"]

  var produtos = <String>['Cenoura', 'Batata', 'Melão'];
  print(produtos);

  // Mostrando os elementos de forma individual
  // Acessar os elementos pelo índice
  print('\nelemento 1: ' +produtos[0]); // cenoura
  print('elemento 2: ' +produtos[1]); // batata
  print('elemento 3: ' +produtos[2] +'\n'); // melão


  // Usando loop (laços) para percorrer uma lista
  // Duas formas: "for()" ou "for in"
  // for()
  // length = comprimento
  for (int i = 0; i < produtos.length; i++) {
    print('Índice: $i => ${produtos[i]}');
  }

  // for in
  for (var produto in produtos) {
    print('Elemento: $produto');
  }

}