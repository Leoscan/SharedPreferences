import 'package:flutter/material.dart';

void main() => runApp(ExemploInicial());

class ExemploInicial extends StatelessWidget {
  final perguntas = ['Voce possui CNH?', 'Você possui veiculo?'];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('olá flutter'),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Opacity(opacity: .25, child: Text("Faded"))),
              SizedBox(
                  width: 200,
                  height: 400,
                  child: Text(perguntas[0], overflow: TextOverflow.ellipsis)),
              Card(
                  color: Color.fromRGBO(123, 221, 111, 100),
                  child: ElevatedButton(onPressed: null, child: Text('Sim'))),
              Divider(),
              ElevatedButton(onPressed: null, child: Text('Não')),
              ElevatedButton(onPressed: null, child: Text('Em Processo'))
            ],
          ))),
    );
  }
}
