import 'package:flutter/material.dart';

String _resultado = '';
TextEditingController _controller_peso = TextEditingController();
TextEditingController _controller_altura = TextEditingController();

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora de IMC"),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.blueGrey[200],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 10.0),
              child: Text(
                'Preencha os campos abaixo',
                style: TextStyle(fontSize: 20.0),),
            ),
            criarEdt('Altura (cm)', _controller_altura),
            criarEdt('Peso (kg)', _controller_peso),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 0.0),
              child: Text(
                _resultado,
                style: TextStyle(fontSize: 25.0, color: Colors.red),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 50.0,
              width: 200.0,
              color: Colors.blue,
              child: ElevatedButton(
                    onPressed: () {
                      double? peso = double.tryParse(_controller_peso.text);
                      double? altura = double.tryParse(_controller_altura.text);

                      if (peso != null && altura != null) {
                        altura = altura / 100.0;
                        double resultImc = (peso / (altura * altura));

                        setState((){
                          _resultado = 'IMC : $resultImc';
                        });
                      }

                      debugPrint('Peso: $peso | altura: $altura | Resultado: $_resultado');
                    },
                    child: Text('Calcular')),
            ),
          ],
        ),
      ),
    );
  }

  Padding criarEdt(String Texto, TextEditingController controller) {
    return Padding(
          padding: EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 0.0),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: Texto,
                border: OutlineInputBorder(),
                labelStyle: TextStyle(fontSize: 25.0, color: Colors.black87)),
          ),
        );
  }
}