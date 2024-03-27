import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(), // Primeira tela do app (rota)
    debugShowCheckedModeBanner: false // Tira o demo
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override // sobrescrita de método da classe pai
  // criação de um controle de estado para a aplicação
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  // TextEditingController: campo de entrada de dados de texto (input)
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  // Variável public do resultado que irá aparecer
  String _resultado = '';

  // Objeto para controlar o formulario onde estao os inputs
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // meteodo que altera o estado das variaveis
  void reset(){
    setState(() {
      alcoolController.text = '';
      gasolinaController.text = '';
      _resultado = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  void calcularCombustivel(){
    // Manipulacao String
    double varAlcool = double.parse(alcoolController.text.replaceAll(',', '.'));
    double varGasolina = double.parse(gasolinaController.text.replaceAll(',', '.'));

    // Calculo dos valores do combustivel
    double proporcao = varAlcool / varGasolina;

    // Setar o resultado
    setState(() {
      _resultado = (proporcao < 0.7) ? 'Abasteça com ácool' : 'Abasteça com gasolina';
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // Barra sup
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[800],

        title: const Text(
          'Aqui é o título', 
          style: TextStyle(color: Colors.white),
        ),

        actions: <Widget>[
          IconButton(
            onPressed: (){  reset();  }, 
            icon: const Icon(Icons.refresh, color: Colors.white)
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),

        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Alargar

            // Campos de entradas
            children: <Widget>[
              const Icon(
                Icons.local_gas_station,
                size: 70,
                color: Colors.lightBlue,
              ),
              

              TextFormField(
                controller: alcoolController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Valor do Litro do Alcool', 
                  labelStyle: TextStyle(color: Colors.lightBlue[700]),
                ),
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 40.0
                )
              ),

              TextFormField(
                controller: gasolinaController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Valor do Litro do Alcool', 
                  labelStyle: TextStyle(color: Colors.lightBlue[700]),
                ),
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 40.0
                )
              )
            ],
          ),
        ),
      ),

    );
  }
}
