import '../models/participante.dart';

class ClasificacionDePrueba {
  static const List<Participante> participantes = [
    Participante(
      posicion: 1,
      nombre: 'LUCÍA R.',
      puntos: 45,
      color: 0xFFE91E63,
    ),
    Participante(
      posicion: 2,
      nombre: 'PabloDev',
      puntos: 41,
      color: 0xFF3F51B5,
    ),
    Participante(posicion: 3, nombre: 'Nerea_K', puntos: 40, color: 0xFF9C27B0),
    Participante(
      posicion: 4,
      nombre: 'mcoma',
      puntos: 38,
      color: 0xFF16A34A,
      esYo: true,
    ),
    Participante(posicion: 5, nombre: 'Hugo M.', puntos: 35, color: 0xFFFF9800),
    Participante(posicion: 6, nombre: 'Aitana', puntos: 33, color: 0xFFAB47BC),
    Participante(
      posicion: 7,
      nombre: 'xavier.dev',
      puntos: 30,
      color: 0xFF00ACC1,
    ),
    Participante(posicion: 8, nombre: 'Iván G.', puntos: 27, color: 0xFF43A047),
    Participante(posicion: 9, nombre: 'Sara P.', puntos: 26, color: 0xFF5C6BC0),
    Participante(
      posicion: 10,
      nombre: 'Dani_804',
      puntos: 19,
      color: 0xFFFB8C00,
    ),
  ];
}
