import 'package:flutter/material.dart';

import '../../app/pantalla_principal.dart';
import '../../app/theme.dart';
import '../../core/widgets/fondo_app.dart';

class PantallaBienvenida extends StatefulWidget {
  const PantallaBienvenida({super.key});

  @override
  State<PantallaBienvenida> createState() => _PantallaBienvenidaState();
}

class _PantallaBienvenidaState extends State<PantallaBienvenida> {
  final _alias = TextEditingController();
  final _codigo = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Repinta al escribir para activar o desactivar el botón
    _alias.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _alias.dispose();
    _codigo.dispose();
    super.dispose();
  }

  void _entrar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PantallaPrincipal(alias: _alias.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final aliasValido = _alias.text.trim().isNotEmpty;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: FondoApp()),
          SafeArea(
            // LayoutBuilder: para pegar el contenido abajo y poder hacer scroll
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 48,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Porra ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            'DAM',
                            style: TextStyle(
                              color: AppColors.verde,
                              fontSize: 44,
                              fontWeight: FontWeight.w900,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Pronostica los partidos de cada jornada y compite con tu clase. ¿Quién acertará más?',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _tarjetaFormulario(aliasValido),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tarjetaFormulario(bool aliasValido) {
    const etiqueta = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    final borde = OutlineInputBorder(borderRadius: BorderRadius.circular(12));

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            const Text('TU ALIAS', style: etiqueta),
            const SizedBox(height: 6), // hueco para la etiqueta flotante
            TextField(
              controller: _alias,
              decoration: InputDecoration(
                labelText: 'Escribe tu nombre o alias',
                prefixIcon: const Icon(Icons.person),
                border: borde,
              ),
            ),
            const SizedBox(height: 4),
            const Text('CÓDIGO DEL GRUPO', style: etiqueta),
            const SizedBox(height: 6), // hueco para la etiqueta flotante
            TextField(
              controller: _codigo,
              decoration: InputDecoration(
                labelText: 'p. ej. 1A - DAM - 2026',
                prefixIcon: const Icon(Icons.group),
                border: borde,
              ),
            ),
            const SizedBox(height: 8),
            // El color negro y la forma salen del tema (elevatedButtonTheme)
            SizedBox(
              height: 54,
              child: ElevatedButton(
                onPressed: aliasValido ? _entrar : null,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      'Entrar en la porra',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
