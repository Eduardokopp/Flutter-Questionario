import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final List pontuacao;

  final void Function() quandoReiniciarQuestionario;
  const Resultado(
      {super.key,
      required this.pontuacao,
      required this.quandoReiniciarQuestionario});

  String get fraseResultado {
    int countA = pontuacao.where((alias) => alias == 'A').length;
    int countB = pontuacao.where((alias) => alias == 'B').length;

    if (countA > countB) {
      return 'Você é um Vilão!';
    } else if (countB > countA) {
      return 'Você é um Herói!';
    } else {
      return 'Você está equilibrado entre Herói e Vilão!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text(
          fraseResultado,
          style: const TextStyle(
            fontSize: 28,
          ),
        )),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(color: Colors.green),
          ),
        )
      ],
    );
  }
}
