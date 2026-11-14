import 'package:flutter/material.dart';

/// Lista única de pestañas: texto e icono en un solo sitio.
class Pestana {
  const Pestana({required this.titulo, required this.icono});

  final String titulo;
  final IconData icono;
}

const pestanas = [
  Pestana(titulo: 'Jornada', icono: Icons.calendar_today),
  Pestana(titulo: 'Resultados', icono: Icons.sports_soccer),
  Pestana(titulo: 'Clasificación', icono: Icons.leaderboard),
  Pestana(titulo: 'Perfil', icono: Icons.person),
];
