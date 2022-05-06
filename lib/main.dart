//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.green[700]),
      ),
      home: ListaTransferencias(),
    );
  }
}

class FormularioCadastramento extends StatelessWidget {
  final TextEditingController _controladorCampoNomeGasto =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastramento de Gasto')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNomeGasto,
                rotulo: 'Nome do Gasto',
                dica: 'Mercado'),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on,
                tipo_campo: 'number'),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () {
                final String nomeGasto = _controladorCampoNomeGasto.text;
                final double valorGasto =
                    double.parse(_controladorCampoValor.text);

                if (nomeGasto != null && valorGasto != null) {
                  final CompraCriada = Compra(nomeGasto, valorGasto);
                  Navigator.pop(context, CompraCriada);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

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

class ListaTransferencias extends StatefulWidget {
  final List<Compra> _compras = [];

  @override
  State<StatefulWidget> createState() {
    debugPrint('$_compras');
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Valor retornado: $widget._compras');
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Gastos'),
      ),
      body: ListView.builder(
        itemCount: widget._compras.length,
        itemBuilder: (context, indice) {
          final compra = widget._compras[indice];
          debugPrint('$compra');

          return ItemTransferencia(compra);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Compra?> future =
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioCadastramento();
            }));
            future.then((compraRecebida) {
              if (compraRecebida != null) {
                setState(() {
                  widget._compras.add(compraRecebida!);
                });
              }
            });
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
