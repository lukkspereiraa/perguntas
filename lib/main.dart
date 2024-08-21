import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/responder.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecinada = 0;
  void _responder() {
    setState(() {
      perguntaSelecinada++;
    });
    print(perguntaSelecinada);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual seu animal favorito ?',
      'Qual seu desenho favorito ?',
      'Qual sua cor favorita ?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          elevation: 1,
          centerTitle: true,
          title: Text(
            "Perguntas",
          ),
        ),
        body: Column(
          children: [
            Questao(perguntas[perguntaSelecinada]),
            Respostas("Resposta 1", _responder),
            Respostas("Resposta 2", _responder),
            Respostas("Resposta 3", _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
