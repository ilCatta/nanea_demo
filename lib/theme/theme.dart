import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  //get theme
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;
}

class Themes {
  // --------------------------------------------------------
  // TEMA CHIARO
  static final light = ThemeData.light().copyWith();

  // --------------------------------------------------------
  // TEMA SCURO
  static final dark = ThemeData.dark().copyWith();
}
