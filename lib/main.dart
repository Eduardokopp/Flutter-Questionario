import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Azul', 'Amarelo', 'Vermelho', 'Verde']
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Gato', 'Cachorro', 'Rato', 'Peixe']
      }
    ];

    List<Widget> respostas = [];
    for (String textoResp
        in perguntas[_perguntaSelecionada].cast()['respostas']) {
      {
        respostas.add(Resposta(texto: textoResp, onSelect: _responder));
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(texto: perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
