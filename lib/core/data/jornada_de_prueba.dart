import '../models/equipo.dart';
import '../models/marcador.dart';
import '../models/partido.dart';

/// Datos inventados. Más adelante se sustituyen por la base de datos y la red.
class JornadaDePrueba {
  static const _marina = Equipo(
    nombre: 'Atlético Marina',
    iniciales: 'AM',
    color: 0xFFB3261E,
  );
  static const _costa = Equipo(
    nombre: 'Racing Costa',
    iniciales: 'RC',
    color: 0xFF1565C0,
  );
  static const _huerta = Equipo(
    nombre: 'UD Huerta',
    iniciales: 'UH',
    color: 0xFF2E7D32,
  );
  static const _albufera = Equipo(
    nombre: 'CF Albufera',
    iniciales: 'CA',
    color: 0xFFF9A825,
  );
  static const _sierra = Equipo(
    nombre: 'Real Sierra',
    iniciales: 'RS',
    color: 0xFF6A1B9A,
  );
  static const _faro = Equipo(
    nombre: 'Deportivo Faro',
    iniciales: 'DF',
    color: 0xFF00838F,
  );
  static const _olivar = Equipo(
    nombre: 'SD Olivar',
    iniciales: 'SO',
    color: 0xFF558B2F,
  );
  static const _salinas = Equipo(
    nombre: 'CD Salinas',
    iniciales: 'CS',
    color: 0xFF37474F,
  );
  static const _puerto = Equipo(
    nombre: 'Unión Puerto',
    iniciales: 'UP',
    color: 0xFFD84315,
  );
  static const _almendro = Equipo(
    nombre: 'Club Almendro',
    iniciales: 'CL',
    color: 0xFF4E342E,
  );

  // De momento los partidos ya traen el resultado para poder pintar Resultados
  static const List<Partido> partidos = [
    Partido(
      id: 'j1-p1',
      local: _marina,
      visitante: _costa,
      resultado: Marcador(local: 2, visitante: 1),
    ),
    Partido(
      id: 'j1-p2',
      local: _huerta,
      visitante: _albufera,
      resultado: Marcador(local: 3, visitante: 0),
    ),
    Partido(
      id: 'j1-p3',
      local: _sierra,
      visitante: _faro,
      resultado: Marcador(local: 1, visitante: 1),
    ),
    Partido(
      id: 'j1-p4',
      local: _olivar,
      visitante: _salinas,
      resultado: Marcador(local: 2, visitante: 1),
    ),
    Partido(
      id: 'j1-p5',
      local: _puerto,
      visitante: _almendro,
      resultado: Marcador(local: 1, visitante: 0),
    ),
  ];

  // Mi porra de cada partido, buscada por el id del partido
  static const Map<String, Marcador> pronosticos = {
    'j1-p1': Marcador(local: 2, visitante: 1),
    'j1-p2': Marcador(local: 2, visitante: 0),
    'j1-p3': Marcador(local: 1, visitante: 0),
    'j1-p4': Marcador(local: 1, visitante: 1),
    'j1-p5': Marcador(local: 1, visitante: 0),
  };
}
