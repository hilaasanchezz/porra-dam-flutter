import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../models/equipo.dart';

/// Círculo de color con la inicial del participante.
class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.nombre, required this.color});

  final String nombre;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        nombre[0], // primera letra
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// Círculo de color con las iniciales, en lugar del escudo.
class EscudoEquipo extends StatelessWidget {
  const EscudoEquipo({super.key, required this.equipo, this.tamano = 28});

  final Equipo equipo;
  final double tamano;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamano,
      height: tamano,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(equipo.color), // int → Color, solo en la interfaz
        shape: BoxShape.circle,
      ),
      child: Text(
        equipo.iniciales,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 11,
          height: 16 / 11,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// "Jornada 1 ▾" (de momento no despliega nada).
class Selector extends StatelessWidget {
  const Selector({super.key, required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 4, 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borde),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(texto, style: const TextStyle(fontSize: 13)),
          const Icon(Icons.arrow_drop_down, color: AppColors.gris),
        ],
      ),
    );
  }
}

/// Tarjeta blanca con las esquinas de arriba redondeadas,
/// la base de Resultados, Clasificación y Perfil.
class TarjetaBlanca extends StatelessWidget {
  const TarjetaBlanca({
    super.key,
    required this.child,
    this.margenSuperior = 8,
  });

  final Widget child;
  final double margenSuperior;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: margenSuperior),
      elevation: 0,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: child,
      ),
    );
  }
}

/// Línea gris de separación entre partidos.
class Separador extends StatelessWidget {
  const Separador({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppColors.borde);
  }
}
