import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/responder.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecinada = 0;
  void _responder() {
    setState(() {
      perguntaSelecinada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
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

    List<Widget> respostas = [];
    for (String textoResposta
        in perguntas[perguntaSelecinada].cast()['resposta']) {
      respostas.add(Respostas(textoResposta, _responder));
    }

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
        body: Column(
          children: [
            Questao(perguntas[perguntaSelecinada]['texto'].toString()),
            ...respostas,
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
