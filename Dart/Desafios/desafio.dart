void main() {
  
/*
  Crie duas variáveis "x" e "y", atribua valores e:
  Mostre a soma e a divisão entre elas
*/

// double x = 10, y = 5, soma, divisao;
// soma = x + y;
// divisao = x / y;
// print("$x + $y = $soma \n$x / $y = $divisao");



/*
  Criar uma lista com 10 números e mostrar a soma entre eles
*/

// var desafio = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
// var soma = 0;

/**
 * for (var i = 0; i < desafio.length; i++) { 
 *   soma += desafio[i];
 * }
 * */

/**
 * for (var n in desafio) {
 *   soma += n;
 * }
 **/

 // print('A soma dos números é: $soma');



/*
 Com base na lista "numeros" mostre apenas os valores contidos
 nos índices "pares"

 var numeros = <int>[12, 21, 32, 44, 5, 6, 7, 8, 9, 10];
*/

// for (var numero in numeros) {
//   var indice = numeros.indexOf(numero);
//   if (indice % 2 == 0) {
//     print(numero);
//   }
// }


/*
  Ainda, sobre a mesma lista, mostre apenas os números pares
*/

//   for (var numero in numeros) {
//     if (numero % 2 == 0) {
//       print('$numero');
//     }
//   }



/**
 * Gerar uma lista com 50 nums aleatorios de 0 a 100
 * Remover os nums que forem menores que 10
 * Verificar se existe o número 77
 * Criar uma lista com 10 nums negativos e adicionar na lista principal
 * Mostrar a lista em ordem decrescente
 */

// var rand = Random();
// var nums = List.generate(50, (_) => rand.nextInt(101));

// print("\nA lista possui ${nums.length} números");
// print(nums);

// nums.removeWhere((int elemento) => elemento < 10);

// print("\nAgora a lista possui ${nums.length} números");
// print(nums);

// print("\nExiste o número 77? " + (nums.contains(77)).toString());

// var numsNeg = <int>[-1,-2,-3,-4,-5,-6,-7,-8,-9,-10];             // Normalmente
// var numsNeg = List.generate(10, (_) => rand.nextInt(101) * -1);  // Randomicamente
// nums.addAll(numsNeg);

// print("\nAgora a lista possui ${nums.length} números");

// nums.sort((com, fim) => fim.compareTo(com));

// print(nums);



/**
 * Baseado em duas listas
 * Uma sendo as resposta de uma prova
 * E a outra sendo o gabarito de um aluno
 * Defina quantas questões o aluno acertou
 */

// var respostas = ['a','a','b','d','e','e','c','b','d','e','a','a','e','c','d'];
// var gabarito = ['a','c','e','b','d','e','e','a','d','e','e','a','e','b','d'];

// var acertou = 0;
// var errou = 0;

// if(respostas.length == gabarito.length){

//   for(int i = 0; i < respostas.length; i++){

//     if(respostas[i] == gabarito[i]){
//       acertou++;
//     }
//     else{
//       errou++;
//     }

//   }
// print("Acertou $acertou e errou $errou");

// }else{
//   print("Tamanho incompatível, há ${respostas.length} questões, foram colocadas ${gabarito.length} respostas");
// }

}
