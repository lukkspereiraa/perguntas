import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;
  const Respostas(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
