class Usuarios {
  final int folio;
  final String tipo;
  final String cliente;
  final int pieza;

  const Usuarios({
    required this.folio,
    required this.tipo,
    required this.cliente,
    required this.pieza,
  });
  Usuarios copy({
    int? folio,
    String? tipo,
    String? cliente,
    int? pieza,
  }) =>
      Usuarios(
          folio: folio ?? this.folio,
          tipo: tipo ?? this.tipo,
          cliente: cliente ?? this.cliente,
          pieza: pieza ?? this.pieza);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Usuarios &&
          runtimeType == other.runtimeType &&
          folio == other.folio &&
          tipo == other.tipo &&
          cliente == other.cliente &&
          pieza == other.pieza;

  @override
  int get hashCode =>
      folio.hashCode ^ tipo.hashCode ^ cliente.hashCode ^ pieza.hashCode;
}
