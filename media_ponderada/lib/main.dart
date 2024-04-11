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

class _HomeState extends State<Home> {
  // titulo inicial
  String _titulo = 'Curso A';

  // TextEditingController: campo de entrada de dados de texto (input)
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  TextEditingController n3Controller = TextEditingController();
  TextEditingController n4Controller = TextEditingController();

  // resultado que irá aparecer
  String _resultado = '';

  // Objeto para controlar o formulario onde estao os inputs
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _alterarTitulo(String novoTitulo) {
    setState(() {
      _titulo = novoTitulo; // Atualizando o valor do título
    });
  }

  // meteodo que altera o estado das variaveis
  void reset() {
    setState(() {
      n1Controller.text = '';
      n2Controller.text = '';
      n3Controller.text = '';
      n4Controller.text = '';
      _resultado = '';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _mostrarOpcoes() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Curso A'),
                onTap: () {
                  _alterarTitulo('Curso A');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Curso B'),
                onTap: () {
                  _alterarTitulo('Curso B');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Curso C'),
                onTap: () {
                  _alterarTitulo('Curso C');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Curso D'),
                onTap: () {
                  _alterarTitulo('Curso D');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void calcular() {
    // Manipulacao String
    double varN1 = double.parse(n1Controller.text.replaceAll(',', '.'));
    double varN2 = double.parse(n2Controller.text.replaceAll(',', '.'));
    double varN3 = double.parse(n3Controller.text.replaceAll(',', '.'));
    double varN4 = double.parse(n4Controller.text.replaceAll(',', '.'));

    // Defina varCurso com base no título selecionado
    String varCurso = '';
    switch (_titulo) {
      case 'Curso A':
        varCurso = 'A';
        break;

      case 'Curso B':
        varCurso = 'B';
        break;

      case 'Curso C':
        varCurso = 'C';
        break;

      case 'Curso D':
        varCurso = 'D';
        break;
    }

    int peso1 = 0;
    int peso2 = 0;
    int peso3 = 0;
    int peso4 = 0;

    if (varCurso == 'A') {
      peso1 = 2;
      peso2 = 3;
      peso3 = 4;
      peso4 = 5;
    } else if (varCurso == 'B') {
      peso1 = 3;
      peso2 = 4;
      peso3 = 4;
      peso4 = 6;
    } else if (varCurso == 'C') {
      peso1 = 6;
      peso2 = 3;
      peso3 = 4;
      peso4 = 3;
    } else if (varCurso == 'D') {
      peso1 = 2;
      peso2 = 3;
      peso3 = 5;
      peso4 = 5;
    }

    // Cálculo da média ponderada
    double mediaPonderada = (varN1 * peso1) +
        (varN2 * peso2) +
        (varN3 * peso3) +
        (varN4 * peso4) / (peso1 + peso2 + peso3 + peso4);

    // Verificação de aprovação ou reprovação
    String resultado = '';
    if (mediaPonderada >= 6.0) {
      resultado = 'Aprovado';
    } else {
      resultado = 'Reprovado';
    }

    // Atualizar o estado para exibir o resultado
    setState(() {
      _resultado = 'Média: ${mediaPonderada.toStringAsFixed(1)} - $resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra sup
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[800],
        title: Text(
          _titulo,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          onPressed: () {
            _mostrarOpcoes();
          },
          iconSize: 45,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                reset();
              },
              icon: const Icon(Icons.refresh, color: Colors.white))
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
                Icons.scale,
                size: 70,
                color: Colors.lightBlue,
              ),
              TextFormField(
                  controller: n1Controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nota 1: ',
                    labelStyle: TextStyle(color: Colors.lightBlue[700]),
                  ),
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20.0)),
              TextFormField(
                  controller: n2Controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nota 2: ',
                    labelStyle: TextStyle(color: Colors.lightBlue[700]),
                  ),
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20.0)),
              TextFormField(
                  controller: n3Controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nota 3: ',
                    labelStyle: TextStyle(color: Colors.lightBlue[700]),
                  ),
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20.0)),
              TextFormField(
                  controller: n4Controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nota 4: ',
                    labelStyle: TextStyle(color: Colors.lightBlue[700]),
                  ),
                  // ignore: prefer_const_constructors
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20.0)),
              ElevatedButton(
                onPressed: () {
                  calcular();
                },
                child: Text('Calcular Média'),
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
