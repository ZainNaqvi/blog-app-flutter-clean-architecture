import 'package:blog_app_with_clean_architecture/core/theme/app_pallate.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
      border: _outlineInputBorder(),
    ),
  );

  static OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppPallete.borderColor,
        width: 3,
      ),
    );
  }

  static final lightThemeMode = ThemeData.light();
}
