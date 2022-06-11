import 'package:flutter/material.dart';

String _resultado = '';
TextEditingController _controller_peso = TextEditingController();
TextEditingController _controller_altura = TextEditingController();
var cor_resultado = Colors.black;

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
                style: TextStyle(fontSize: 25.0, color: cor_resultado, fontWeight: FontWeight.bold),
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
                        String situacao = '';
                        double resultImc = (peso / (altura * altura));

                        if (resultImc <= 18.5)  {
                          situacao = 'Abaixo do Peso';
                          cor_resultado = Colors.black;
                        }else if (resultImc > 18.5 && resultImc < 25.0){
                          situacao = 'Peso Normal';
                          cor_resultado = Colors.green;
                        }else if (resultImc > 24.9 && resultImc < 30) {
                          situacao = 'Sobrepeso';
                          cor_resultado = Colors.yellow;
                        }else if (resultImc > 29.9 && resultImc < 35) {
                          situacao = 'Obesidade !';
                          cor_resultado = Colors.orange;
                        }else if (resultImc > 34.9 && resultImc < 40) {
                          situacao = 'Obesidade Severa !!';
                          cor_resultado = Colors.red;
                        }else if (resultImc > 39.9) {
                          situacao = 'Obesidade Morbida !!!';
                          cor_resultado = Colors.deepPurple;
                        }

                        String resultImcFormatado = resultImc.toStringAsFixed(2);

                        setState((){
                          _resultado = '$situacao ($resultImcFormatado)';
                          limpa_campos();
                        });
                      }

                      // debugPrint('Peso: $peso | altura: $altura | Resultado: $_resultado');
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

  void limpa_campos() {
    _controller_peso.clear();
    _controller_altura.clear();
  }
}