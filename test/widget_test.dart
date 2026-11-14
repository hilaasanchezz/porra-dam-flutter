import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:porra_dam/core/calcular_puntos.dart';
import 'package:porra_dam/core/models/marcador.dart';
import 'package:porra_dam/main.dart';

void main() {
  testWidgets('Bienvenida: el botón se activa con alias y entra a la porra', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    ElevatedButton boton() =>
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(boton().onPressed, isNull); // sin alias, desactivado

    await tester.enterText(find.byType(TextField).first, 'mcoma');
    await tester.pump();
    expect(boton().onPressed, isNotNull);

    await tester.tap(find.text('Entrar en la porra'));
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Jornada 1'), findsOneWidget);

    await tester.tap(find.text('Perfil'));
    await tester.pumpAndSettle();
    expect(find.text('38 pts · 4º puesto'), findsOneWidget);
  });

  test('calcularPuntos sigue las reglas de la porra', () {
    const real = Marcador(local: 2, visitante: 1);
    expect(calcularPuntos(real, const Marcador(local: 2, visitante: 1)), 8);
    expect(
      calcularPuntos(
        const Marcador(local: 3, visitante: 0),
        const Marcador(local: 2, visitante: 0),
      ),
      4,
    );
    expect(
      calcularPuntos(
        const Marcador(local: 1, visitante: 1),
        const Marcador(local: 1, visitante: 0),
      ),
      2,
    );
    expect(calcularPuntos(real, const Marcador(local: 1, visitante: 1)), 2);
    expect(calcularPuntos(real, const Marcador(local: 0, visitante: 3)), 0);
  });
}
