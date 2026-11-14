import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/widgets/comunes.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key, required this.alias});

  final String alias;

  @override
  Widget build(BuildContext context) {
    return TarjetaBlanca(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Avatar(nombre: alias, color: AppColors.verde),
            const SizedBox(height: 12),
            Text(
              alias,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              '38 pts · 4º puesto',
              style: TextStyle(color: AppColors.gris),
            ),
          ],
        ),
      ),
    );
  }
}
