import 'models/marcador.dart';

/// 8 puntos por el resultado exacto. Si no: +2 por acertar el 1X2
/// y +2 por cada equipo cuyos goles hayas acertado.
int calcularPuntos(Marcador real, Marcador porra) {
  if (real.local == porra.local && real.visitante == porra.visitante) {
    return 8; // resultado exacto
  }
  var puntos = 0;
  if (real.signo() == porra.signo()) puntos += 2;
  if (real.local == porra.local) puntos += 2;
  if (real.visitante == porra.visitante) puntos += 2;
  return puntos;
}
