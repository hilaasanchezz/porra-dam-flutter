/// Goles de un partido (resultado real o pronóstico).
class Marcador {
  const Marcador({this.local = 0, this.visitante = 0});

  final int local;
  final int visitante;

  /// '1' gana el local, 'X' empate, '2' gana el visitante.
  String signo() {
    if (local > visitante) return '1';
    if (local < visitante) return '2';
    return 'X';
  }
}
