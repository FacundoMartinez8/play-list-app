import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getTheme() {
    return ThemeData(
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'SFPRODISPLAYREGULAR'),
      ),
    );
  }

  final LinearGradient gradientScaffold = const LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color.fromRGBO(7, 0, 11, 1),
      Color.fromRGBO(16, 1, 20, 1),
    ],
  );

  final BoxDecoration gradientContainer1 = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(0, 0, 0, 0.58), // Color con opacidad
        Color.fromRGBO(0, 0, 0, 0), // Color transparente
      ],
      stops: [0.1574, 0.8268], // Porcentaje de opacidad de cada color
      begin: Alignment.topCenter, // Desde la parte superior
      end: Alignment.bottomCenter, // Hacia la parte inferior
    ),
  );

  final BoxDecoration gradientContainer2 = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(42, 8, 53, 1.0), // Color más intenso
        Color.fromRGBO(42, 8, 53, 0.05), // Color menos intenso
      ],
      begin: Alignment.bottomCenter, // Desde la parte inferior
      end: Alignment.topCenter, // Hacia la parte superior
    ),
  );
}
