
import 'package:flutter/material.dart';
import 'package:fatima1/core/config/theme/button_styles.dart';
import 'package:fatima1/core/config/theme/text_styles.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFFEFC3CA);

  static ThemeData getTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        // Aquí podrías aplicar los estilos de texto si quieres que sean los por defecto
        // para ciertos widgets de texto de Flutter, como displayLarge, bodyMedium, etc.
      ),
      // Aplicamos los temas de botones personalizados
      floatingActionButtonTheme: AppButtonStyles.floatingActionButtonTheme(colorScheme),
      iconButtonTheme: AppButtonStyles.iconButtonTheme(colorScheme),
    );
  }
}
