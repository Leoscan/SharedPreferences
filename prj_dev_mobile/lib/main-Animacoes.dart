import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appName = 'Temas Customizados';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        secondaryHeaderColor: Colors.deepPurple,
        hintColor: Colors.orangeAccent,
      ),
      home: Home(title: appName),
    );
  }
}

class Home extends StatelessWidget {
  final String title;

  Home({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Opacity(
              opacity: 0.25,
              child: Text("Faded"),
            ),
          ),
          Spacer(),
          Center(
            child: Container(
              color: Theme.of(context).hintColor,
              child: Text(
                "Texto com cor de fundo",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Spacer(),
          Center(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF000000), Color(0xFFFF0000)],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
                child: const Text(
                  "Hello",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: Container(
              color: Colors.yellow,
              child: Transform(
                alignment: Alignment.bottomLeft,
                transform: Matrix4.skewY(0.9)..rotateZ(-6 / 12.0),
                child: Text("Eat at Joe's!",
                    style: TextStyle(color: Colors.green)),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
