//import 'dart:html';
//Aplicativo de compras

import 'package:flutter/material.dart';

import 'screens/transferencia/lista.dart';

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
