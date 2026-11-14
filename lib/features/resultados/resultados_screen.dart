import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/calcular_puntos.dart';
import '../../core/data/jornada_de_prueba.dart';
import '../../core/models/equipo.dart';
import '../../core/models/marcador.dart';
import '../../core/models/partido.dart';
import '../../core/widgets/comunes.dart';

// Pleno (8) en verde, 0 en rojo y el resto en gris
Color colorFondoPuntos(int puntos) => switch (puntos) {
  8 => AppColors.verdeClaro,
  0 => AppColors.rojoClaro,
  _ => AppColors.grisClaro,
};

Color colorTextoPuntos(int puntos) => switch (puntos) {
  8 => AppColors.verde,
  0 => AppColors.rojo,
  _ => AppColors.gris,
};

class ResultadosScreen extends StatelessWidget {
  const ResultadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Los puntos los calcula calcularPuntos(), no la pantalla
    var total = 0;
    for (final partido in JornadaDePrueba.partidos) {
      final porra = JornadaDePrueba.pronosticos[partido.id] ?? const Marcador();
      total += calcularPuntos(partido.resultado ?? const Marcador(), porra);
    }

    return TarjetaBlanca(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Resultados',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Selector(texto: 'Jornada 1'),
            ],
          ),
          const Text(
            'Resultados oficiales y puntos obtenidos',
            style: TextStyle(color: AppColors.gris, fontSize: 13),
          ),
          const SizedBox(height: 8),
          for (final partido in JornadaDePrueba.partidos) ...[
            TarjetaResultado(
              partido: partido,
              porra:
                  JornadaDePrueba.pronosticos[partido.id] ?? const Marcador(),
            ),
            const Separador(),
          ],
          const SizedBox(height: 12),
          _TotalJornada(total: total),
        ],
      ),
    );
  }
}

class _TotalJornada extends StatelessWidget {
  const _TotalJornada({required this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.grisClaro,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: AppColors.oro),
          const SizedBox(width: 8),
          const Expanded(child: Text('Total jornada')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.verdeClaro,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '+$total pts',
              style: const TextStyle(
                color: AppColors.verde,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TarjetaResultado extends StatelessWidget {
  const TarjetaResultado({
    super.key,
    required this.partido,
    required this.porra,
  });

  final Partido partido;
  final Marcador porra;

  @override
  Widget build(BuildContext context) {
    final real = partido.resultado ?? const Marcador();
    final puntos = calcularPuntos(real, porra);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EquipoConGoles(equipo: partido.local, goles: real.local),
                const SizedBox(height: 4),
                EquipoConGoles(
                  equipo: partido.visitante,
                  goles: real.visitante,
                ),
                const SizedBox(height: 6),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorFondoPuntos(puntos),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Tu porra: ${porra.local} - ${porra.visitante}',
                    style: TextStyle(
                      color: colorTextoPuntos(puntos),
                      fontSize: 11,
                      height: 24 / 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorFondoPuntos(puntos),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              puntos > 0 ? '+$puntos' : '0',
              style: TextStyle(
                color: colorTextoPuntos(puntos),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EquipoConGoles extends StatelessWidget {
  const EquipoConGoles({super.key, required this.equipo, required this.goles});

  final Equipo equipo;
  final int goles;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EscudoEquipo(equipo: equipo),
        const SizedBox(width: 12),
        Expanded(
          child: Text(equipo.nombre, style: const TextStyle(fontSize: 14)),
        ),
        Text(
          '$goles',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
