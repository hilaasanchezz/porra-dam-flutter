/// Un equipo de la liga. El color se guarda como int (0xFFB3261E)
/// para que el modelo no dependa de Flutter.
class Equipo {
  const Equipo({
    required this.nombre,
    required this.iniciales,
    required this.color,
  });

  final String nombre;
  final String iniciales;
  final int color;
}
