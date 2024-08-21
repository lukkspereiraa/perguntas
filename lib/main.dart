import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/responder.dart';
import 'package:perguntas/resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecinada = 0;
  void _responder() {
    if (temPerguntaSelecinada) {
      setState(() {
        perguntaSelecinada++;
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
    return perguntaSelecinada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecinada
        ? _perguntas[perguntaSelecinada].cast()['resposta']
        : [];
    //feito com map
    List<Widget> widgetRespostas =
        respostas.map((toElement) => Respostas(toElement, _responder)).toList();
    // feito com for
    // for (String textoResposta in respostas) {
    //   widgetRespostas.add(Respostas(textoResposta, _responder));
    // }

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
              ? Column(
                  children: [
                    Questao(_perguntas[perguntaSelecinada]['texto'].toString()),
                    ...widgetRespostas,
                  ],
                )
              : Resultado("Final")),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
