import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String texto;
  const Resultado(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        texto,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
