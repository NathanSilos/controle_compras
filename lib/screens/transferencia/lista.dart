import 'package:flutter/material.dart';
import '../../models/compra.dart';
import 'formulario.dart';

const _tituloAppBar = 'Controle de Gastos';

class ListaTransferencias extends StatefulWidget {
  final List<Compra> _compras = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Valor retornado: $widget._compras');
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._compras.length,
        itemBuilder: (context, indice) {
          final compra = widget._compras[indice];
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
