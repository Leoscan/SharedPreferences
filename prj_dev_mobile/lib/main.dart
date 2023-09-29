import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escolha entre Cachorro ou Gato',
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _imagemUrl = '';

  void _escolherOpcao(String escolha) {
    setState(() {
      if (escolha == 'Cachorro') {
        _imagemUrl =
            'https://media.istockphoto.com/id/479809942/pt/foto/dachshund-isolado-no-fundo-branco-castanha-de-c%C3%A3o-olhando-para-cima.jpg?s=612x612&w=0&k=20&c=cW3WEgg8FhvxQgnG1u7HyCiMHzpqwm-8rJjC3McCdb0='; // Substitua pela URL da imagem do cachorro
      } else if (escolha == 'Gato') {
        _imagemUrl =
            'https://png.pngtree.com/thumb_back/fw800/background/20210831/pngtree-cat-carrying-one-leg-of-a-cat-white-background-image_769565.jpg'; // Substitua pela URL da imagem do gato
      } else if (escolha == 'Gosto dos dois') {
        _imagemUrl =
            'https://media.istockphoto.com/id/504907820/pt/foto/cachorrinho-e-dachshund-filhote-de-gato.jpg?s=1024x1024&w=is&k=20&c=QH5Isq5CrSxr2u0HGfPI_4mTDSZvd7rmhVGbud0vBs0='; // Substitua pela URL da imagem de ambos
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha entre cachorro ou gato'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Você prefere Cachorro ou Gato?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _escolherOpcao('Cachorro'),
              child: Text('Cachorro'),
            ),
            ElevatedButton(
              onPressed: () => _escolherOpcao('Gato'),
              child: Text('Gato'),
            ),
            ElevatedButton(
              onPressed: () => _escolherOpcao('Gosto dos dois'),
              child: Text('Gosto dos dois'),
            ),
            SizedBox(height: 20),
            _imagemUrl.isNotEmpty
                ? Image.network(
                    _imagemUrl,
                    width: 200,
                    height: 200,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
