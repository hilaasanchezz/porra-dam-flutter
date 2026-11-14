import 'equipo.dart';
import 'marcador.dart';

class Partido {
  const Partido({
    required this.id,
    required this.local,
    required this.visitante,
    this.resultado, // null hasta que se juega
  });

  final String id;
  final Equipo local;
  final Equipo visitante;
  final Marcador? resultado;
}
