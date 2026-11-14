import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Colores de la Porra (los mismos que en la versión de Kotlin).
class AppColors {
  static const verde = Color(0xFF16A34A);
  static const verdeClaro = Color(0xFFDCFCE7);
  static const gris = Color(0xFF6B7280);
  static const grisClaro = Color(0xFFF3F4F6);
  static const borde = Color(0xFFE5E7EB);
  static const rojo = Color(0xFFDC2626);
  static const rojoClaro = Color(0xFFFEE2E2);
  static const negro = Color(0xFF111111);
  static const oro = Color(0xFFF5B800);
  static const plata = Color(0xFFB0B7C3);
  static const bronce = Color(0xFFCD7F32);
}

/// El aspecto de toda la app, definido una sola vez.
ThemeData temaPorra() {
  final colores = ColorScheme.fromSeed(
    seedColor: AppColors.verde,
    // Botones negros como en el mockup; el verde va en secondary
    primary: AppColors.negro,
    onPrimary: Colors.white,
    secondary: AppColors.verde,
    // Barra de abajo en blanco
    surface: Colors.white,
    surfaceContainer: Colors.white,
    // Pestaña seleccionada de la barra de abajo
    secondaryContainer: AppColors.verdeClaro,
    onSecondaryContainer: AppColors.verde,
    // Grises neutros para textos y bordes
    onSurface: const Color(0xFF1C1B1F),
    onSurfaceVariant: const Color(0xFF49454F),
    outline: const Color(0xFF79747E),
  );

  return ThemeData(
    colorScheme: colores,
    textTheme: const TextTheme(
      // Texto normal (el que usa Text por defecto)
      bodyMedium: TextStyle(fontSize: 16, height: 1.5, letterSpacing: 0.5),
      bodyLarge: TextStyle(fontSize: 16, height: 1.5, letterSpacing: 0.5),
      // Boldonse solo en el título de la barra: es muy ancha
      titleLarge: TextStyle(
        fontFamily: 'Boldonse',
        fontSize: 18,
        height: 28 / 18,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent, // deja ver la foto
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      toolbarHeight: 64, // misma altura que la TopAppBar de Compose
      // Iconos oscuros en la barra de estado, como en la versión de Kotlin
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    // Botones negros, sin sombra y con las esquinas redondeadas, en toda la app
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.negro,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: AppColors.verdeClaro,
      surfaceTintColor: Colors.transparent,
      iconTheme: WidgetStateProperty.resolveWith(
        (estados) => IconThemeData(
          color: estados.contains(WidgetState.selected)
              ? AppColors.verde
              : const Color(0xFF49454F),
        ),
      ),
      labelTextStyle: WidgetStateProperty.resolveWith(
        (estados) => TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: estados.contains(WidgetState.selected)
              ? AppColors.verde
              : const Color(0xFF49454F),
        ),
      ),
    ),
  );
}
