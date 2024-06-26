// Aplicativo de cálculo de combustível
// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';



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
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  // texto de resposta da aplicação
  String _resultado = ''; 

  // objeto para controlar o fomulário onde estarão os inputs
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // limpa os campos do formulário e o seu estado
  void _reset() {
    setState(() {
      alcoolController.text = '';
      gasolinaController.text = '';
      _resultado = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  // NÃO PODE ESQUECER o setState() dentro de um método que fará alguma alteração em variáveis e/ou objetos
  void _calcularCombustivel() {
    double varGasolina = double.parse(gasolinaController.text.replaceAll(',', '.'));
    double varAlcool = double.parse(alcoolController.text.replaceAll(',', '.'));
    double proporcao = varAlcool / varGasolina; // proporção de 70%
    setState(() {
      _resultado = (proporcao < 0.7) ? 'Abasteça com álcool' : 'Abasteça com gasolina';
    });
  }

  // Construtor
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // barra superior
      appBar: AppBar(
        title: const Text(
          'Título do APP',
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
                Icons.local_gas_station,
                size: 70.0,
                color: Colors.lightBlue,
              ),


              TextFormField(
                controller: alcoolController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty
                    ? 'Esse valor é obrigatório'
                    : null, // validacão de dados
                decoration: InputDecoration(
                  labelText: 'Valor do litro do Álcool',
                  labelStyle: TextStyle(color: Colors.lightBlue[900]),
                ),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 25.0),
              ),


              TextFormField(
                controller: gasolinaController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty
                    ? 'Esse valor é obrigatório'
                    : null, // validacão de dados
                decoration: InputDecoration(
                  labelText: 'Valor do litro da Gasolina',
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
                    fillColor: Colors.lightBlue,
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