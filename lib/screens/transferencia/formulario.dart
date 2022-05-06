import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/compra.dart';

const _tituloAppBar = 'Cadastramento de Gasto';

const _nomeCampoGasto = 'Nome do Gasto';
const _dicaCampoGasto = 'Mercado';

const _nomeCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioCadastramento extends StatelessWidget {
  final TextEditingController _controladorCampoNomeGasto =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNomeGasto,
                rotulo: _nomeCampoGasto,
                dica: _dicaCampoGasto),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _nomeCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on,
                tipo_campo: 'number'),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
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
