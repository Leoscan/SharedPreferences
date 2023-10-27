import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  List<String> _storedNumbers = [];

  @override
  void initState() {
    super.initState();
    _loadStoredNumbers();
  }

  _loadStoredNumbers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedNumbers = prefs.getStringList('numbers') ?? [];
    });
  }

  _saveNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storedNumbers.add(number);
    await prefs.setStringList('numbers', _storedNumbers);
  }

  _onOkButtonPressed() {
    String inputNumber = _controller.text;
    _saveNumber(inputNumber);
    _loadStoredNumbers();
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Armazenamento Números'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Números Armazenados:'),
            Column(
              children: _storedNumbers.map((number) {
                return Text(number);
              }).toList(),
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              minLines: 1,
              decoration: InputDecoration(
                labelText: 'Digite um número',
                prefixIcon: Icon(Icons.format_list_numbered),
              ),
            ),
            ElevatedButton(
              onPressed: _onOkButtonPressed,
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
