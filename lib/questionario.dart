import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(String) quandoResponder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['options']
        : [];

    return Column(
      children: <Widget>[
        Questao(texto: perguntas[perguntaSelecionada]['question'].toString()),
         ...respostas.map((resp) {
          return Resposta(
           texto: resp['name'] as String,
            onSelect: () => quandoResponder(resp['alias'].toString()),
          );
        }),
      ],
    );
  }
}
