class Compra {
  final String nomeGasto;
  final double valorGasto;

  Compra(this.nomeGasto, this.valorGasto);

  @override
  String toString() {
    return 'Compra{nomeGasto: $nomeGasto, valorGasto: $valorGasto}';
  }
}
