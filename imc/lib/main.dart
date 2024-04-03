// Aplicativo de cálculo de combustível
// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  runApp(const MaterialApp(
    home: Home(), // primeira tela do aplicativo (rota)
    debugShowCheckedModeBanner: false, // tira o logo do debug
  ));
}



// classe que configura o ambiente como "editável"
class Home extends StatefulWidget {
  const Home({super.key});

  // criação de um controle de estado para a aplicação
  @override
  _HomeState createState() => _HomeState();
}



// Controle das variáveis da aplicação
class _HomeState extends State<Home> {

  // TextEditingController: campo de entrada de dados texto (input)
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  // texto de resposta da aplicação
  String _resultado = ''; 

  // objeto para controlar o fomulário onde estarão os inputs
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // limpa os campos do formulário e o seu estado
  void _reset() {
    setState(() {
      pesoController.text = '';
      alturaController.text = '';
      _resultado = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  // NÃO PODE ESQUECER o setState() dentro de um método que fará alguma alteração em variáveis e/ou objetos
  void _calcularCombustivel() {
    double varPeso = double.parse(pesoController.text.replaceAll(',', '.'));
    double varAltura = double.parse(alturaController.text.replaceAll(',', '.'));

    double imc = varPeso / (varAltura * varAltura);

    String resultado;
    if (imc < 18.5) {
      resultado = 'Abaixo do peso';
    } else if (imc >= 18.5 && imc <= 24.9) {
      resultado = 'Peso normal';
    } else if (imc >= 25.0 && imc <= 29.9) {
      resultado = 'Sobrepeso';
    } else if (imc >= 30.0 && imc <= 34.9) {
      resultado = 'Obesidade Grau I';
    } else if (imc >= 35.0 && imc <= 39.9) {
      resultado = 'Obesidade Grau II';
    } else {
      resultado = 'Obesidade Grau III';
    }

    setState(() {
      _resultado = 'Seu IMC é $imc e indica $resultado.';
    });

  }

  // Construtor
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // barra superior
      appBar: AppBar(
        title: const Text(
          'IMC',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _reset();
              },
              icon: const Icon(Icons.refresh, color: Colors.white)),
        ],
      ),


      // Corpo da aplicação
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0), // Margem interna
        child: Form(

          key: _formKey, // Referência para o formulário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // alargar

            // Inputs
            children: <Widget>[
              const Icon(
                Icons.scale,
                size: 70.0,
                color: Colors.lightBlue,
              ),


              TextFormField(
                controller: pesoController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty
                    ? 'Esse valor é obrigatório'
                    : null, // validacão de dados
                decoration: InputDecoration(
                  labelText: 'Digite seu Peso: ',
                  labelStyle: TextStyle(color: Colors.lightBlue[900]),
                ),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 25.0),
              ),


              TextFormField(
                controller: alturaController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty
                    ? 'Esse valor é obrigatório'
                    : null, // validacão de dados
                decoration: InputDecoration(
                  labelText: 'Digite sua Altura:',
                  labelStyle: TextStyle(color: Colors.lightBlue[900]),
                ),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 25.0),
              ),


              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: SizedBox(
                  height: 50,

                  child: RawMaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcularCombustivel();
                      }
                    },
                    fillColor: Colors.lightBlue[900],
                    child: const Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),

                ),
              ),

              
              Text(
                _resultado, // variável com o valor do resultado retornado
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}