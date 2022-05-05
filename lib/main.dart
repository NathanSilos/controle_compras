import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: ListaTransferencias()),
    );
  }
}

class FormularioCadastramento extends StatelessWidget {
  final TextEditingController _controladorCampoNomeGasto =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastramento de Gasto')),
      body: Column(
        children: <Widget>[
          Editor(
              controlador: _controladorCampoNomeGasto,
              rotulo: 'Nome do Gasto',
              dica: 'Mercado'),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final String nomeGasto = _controladorCampoNomeGasto.text;
              final double valorGasto =
                  double.parse(_controladorCampoValor.text);

              if (nomeGasto != null && valorGasto != null) {
                final CompraCriada = Compra(nomeGasto, valorGasto);
              }
            },
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

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
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Gastos'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Compra('Mercado', 200.00)),
          ItemTransferencia(Compra('Shopping', 400.00)),
          ItemTransferencia(Compra('Farmacia', 100.00)),
          ItemTransferencia(Compra('Futebol', 60.00)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioCadastramento();
            }));
          }, // null function
          child: Icon(Icons.add)),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Compra _compra;

  ItemTransferencia(this._compra);

  @override
  Widget build(BuildContext) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_compra.nomeGasto.toString()),
        subtitle: Text(_compra.valorGasto.toString()),
      ),
    );
  }
}

class Compra {
  final String nomeGasto;
  final double valorGasto;

  Compra(this.nomeGasto, this.valorGasto);

  @override
  String toString() {
    return 'Compra{nomeGasto: $nomeGasto, valorGasto: $valorGasto}';
  }
}