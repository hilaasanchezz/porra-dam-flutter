import 'package:flutter/material.dart';

import '../core/widgets/fondo_app.dart';
import '../features/clasificacion/clasificacion_screen.dart';
import '../features/jornada/jornada_screen.dart';
import '../features/perfil/perfil_screen.dart';
import '../features/resultados/resultados_screen.dart';
import 'pestanas.dart';
import 'theme.dart';

/// Scaffold compartido: AppBar + NavigationBar.
/// Las pestañas solo devuelven su contenido, nunca otro Scaffold.
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required this.alias});

  final String alias;

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _indice = 0; // Empieza en Jornada

  @override
  Widget build(BuildContext context) {
    // La foto debajo y el Scaffold transparente encima
    return Stack(
      children: [
        const Positioned.fill(child: FondoApp()),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Menú',
              onPressed: () {},
            ),
            // Centrado en el hueco entre el menú y los puntos
            title: const Center(child: Text('Porra DAM')),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.verde,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '38 pts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // IndexedStack conserva el estado de cada pestaña al cambiar
          body: IndexedStack(
            index: _indice,
            children: [
              const JornadaScreen(),
              const ResultadosScreen(),
              ClasificacionScreen(alias: widget.alias),
              PerfilScreen(alias: widget.alias),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _indice,
            onDestinationSelected: (i) => setState(() => _indice = i),
            destinations: [
              for (final p in pestanas)
                NavigationDestination(icon: Icon(p.icono), label: p.titulo),
            ],
          ),
        ),
      ],
    );
  }
}
