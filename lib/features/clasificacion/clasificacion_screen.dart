import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/data/clasificacion_de_prueba.dart';
import '../../core/models/participante.dart';
import '../../core/widgets/comunes.dart';

class ClasificacionScreen extends StatelessWidget {
  const ClasificacionScreen({super.key, required this.alias});

  final String alias;

  @override
  Widget build(BuildContext context) {
    const cabecera = TextStyle(color: AppColors.gris, fontSize: 12);

    return TarjetaBlanca(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Clasificación',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Selector(texto: 'General'),
            ],
          ),
          const SizedBox(height: 12),
          // Cabecera de la tabla
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                SizedBox(width: 28, child: Text('#', style: cabecera)),
                SizedBox(width: 12),
                Expanded(child: Text('Participante', style: cabecera)),
                Text('Puntos', style: cabecera),
              ],
            ),
          ),
          const SizedBox(height: 4),
          for (final participante in ClasificacionDePrueba.participantes)
            FilaClasificacion(participante: participante, alias: alias),
        ],
      ),
    );
  }
}

class FilaClasificacion extends StatelessWidget {
  const FilaClasificacion({
    super.key,
    required this.participante,
    required this.alias,
  });

  final Participante participante;
  final String alias;

  @override
  Widget build(BuildContext context) {
    // Si soy yo, uso mi alias y pinto la fila en verde
    final yo = participante.esYo;
    final nombre = yo ? alias : participante.nombre;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: yo ? AppColors.verdeClaro : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Posicion(posicion: participante.posicion),
          const SizedBox(width: 12),
          Avatar(nombre: nombre, color: Color(participante.color)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              yo ? 'Tú · $nombre' : nombre,
              style: TextStyle(
                fontWeight: yo ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          if (participante.posicion == 1) ...[
            const Icon(
              Icons.star,
              color: AppColors.oro,
              semanticLabel: 'Líder',
            ),
            const SizedBox(width: 8),
          ],
          Text(
            '${participante.puntos}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

/// Los tres primeros llevan medalla (oro, plata y bronce).
class Posicion extends StatelessWidget {
  const Posicion({super.key, required this.posicion});

  final int posicion;

  @override
  Widget build(BuildContext context) {
    final color = switch (posicion) {
      1 => AppColors.oro,
      2 => AppColors.plata,
      3 => AppColors.bronce,
      _ => Colors.transparent,
    };

    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        '$posicion',
        style: TextStyle(
          color: posicion <= 3 ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
