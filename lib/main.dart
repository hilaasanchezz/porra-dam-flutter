import 'package:flutter/material.dart';

import 'app/theme.dart';
import 'features/bienvenida/pantalla_bienvenida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porra DAM',
      debugShowCheckedModeBanner: false,
      theme: temaPorra(), // siempre en modo claro: las tarjetas son blancas
      home: const PantallaBienvenida(),
    );
  }
}
