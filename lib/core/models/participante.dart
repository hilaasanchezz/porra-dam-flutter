class Participante {
  const Participante({
    required this.posicion,
    required this.nombre,
    required this.puntos,
    required this.color,
    this.esYo = false,
  });

  final int posicion;
  final String nombre;
  final int puntos;
  final int color;
  final bool esYo;
}
