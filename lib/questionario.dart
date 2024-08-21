import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/responder.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecinada;
  final void Function() qundoResponder;

  Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecinada,
    required this.qundoResponder,
  });

  bool get temPerguntaSelecinada {
    return perguntaSelecinada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecinada
        ? perguntas[perguntaSelecinada].cast()['resposta']
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecinada]['texto'].toString()),
        ...respostas.map((t) => Respostas(t, qundoResponder)).toList(),
      ],
    );
  }
}
