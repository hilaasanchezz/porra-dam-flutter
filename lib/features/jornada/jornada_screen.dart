import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/data/jornada_de_prueba.dart';
import '../../core/models/equipo.dart';
import '../../core/models/marcador.dart';
import '../../core/models/partido.dart';
import '../../core/widgets/comunes.dart';

class JornadaScreen extends StatelessWidget {
  const JornadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _CabeceraJornada(),
        // Tarjeta blanca con los partidos
        Expanded(
          child: TarjetaBlanca(
            margenSuperior: 0,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    children: [
                      for (final partido in JornadaDePrueba.partidos) ...[
                        TarjetaPronostico(
                          partido: partido,
                          porra:
                              JornadaDePrueba.pronosticos[partido.id] ??
                              const Marcador(),
                        ),
                        const Separador(),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Guardar pronósticos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Título, subtítulo y fecha de cierre, encima de la foto.
class _CabeceraJornada extends StatelessWidget {
  const _CabeceraJornada();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jornada 1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Tu porra para esta jornada',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.85)),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Icon(Icons.calendar_today, color: Colors.white, size: 16),
                Text(
                  'Se cierra el: Sáb 12 oct · 16:00',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TarjetaPronostico extends StatelessWidget {
  const TarjetaPronostico({
    super.key,
    required this.partido,
    required this.porra,
  });

  final Partido partido;
  final Marcador porra;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          FilaEquipo(
            equipo: partido.local,
            goles: porra.local,
            flecha: Icons.keyboard_arrow_up,
          ),
          FilaEquipo(
            equipo: partido.visitante,
            goles: porra.visitante,
            flecha: Icons.keyboard_arrow_down,
          ),
        ],
      ),
    );
  }
}

class FilaEquipo extends StatelessWidget {
  const FilaEquipo({
    super.key,
    required this.equipo,
    required this.goles,
    required this.flecha,
  });

  final Equipo equipo;
  final int goles;
  final IconData flecha;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EscudoEquipo(equipo: equipo),
        const SizedBox(width: 12),
        Expanded(
          child: Text(equipo.nombre, style: const TextStyle(fontSize: 14)),
        ),
        // Cajita con los goles (de momento no se puede cambiar)
        Container(
          padding: const EdgeInsets.fromLTRB(12, 4, 2, 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borde),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                '$goles',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.gris,
                size: 18,
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(flecha, color: AppColors.gris),
          onPressed: () {},
        ),
      ],
    );
  }
}
