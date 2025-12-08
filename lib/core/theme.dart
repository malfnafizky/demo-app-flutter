import 'package:demo_app/core/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _inputBorder([
    Color borderColor = AppPallete.borderColor,
  ]) => OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 2),
    borderRadius: BorderRadius.circular(10),
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: AppBarTheme(backgroundColor: AppPallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
      focusedBorder: _inputBorder(AppPallete.primaryColor),
      errorBorder: _inputBorder(AppPallete.errorColor),
    ),
  );
}
