import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;
  final String? tipo_campo;

  Editor(
      {this.controlador, this.rotulo, this.dica, this.icone, this.tipo_campo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          // Verifica se esta sendo passado o parametro de icone
          // Com essa condicao nao fica um espaco em branco na frente do campo
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType:
            // Condição ? Se verdadeira : Se falso
            tipo_campo == 'number' ? TextInputType.number : null,
      ),
    );
  }
}
