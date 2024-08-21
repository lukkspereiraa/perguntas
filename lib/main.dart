import 'package:flutter/material.dart';
import 'package:perguntas/questionario.dart';
import 'package:perguntas/resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecinada = 0;
  void _responder() {
    if (temPerguntaSelecinada) {
      setState(() {
        _perguntaSelecinada++;
      });
    }
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'resposta': ['Preto', 'Branco', 'Verde'],
    },
    {
      'texto': 'Qual é sua animal favorito?',
      'resposta': ['Largado', 'Tamandua', 'Anta'],
    },
    {
      'texto': 'Qual é seu desenho favorito?',
      'resposta': ['One Pince', 'Dragon ball ', 'Naruto'],
    },
  ];

  bool get temPerguntaSelecinada {
    return _perguntaSelecinada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            elevation: 1,
            centerTitle: true,
            title: const Text(
              "Perguntas",
            ),
          ),
          body: temPerguntaSelecinada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecinada: _perguntaSelecinada,
                  qundoResponder: _responder)
              : Resultado("Final")),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
