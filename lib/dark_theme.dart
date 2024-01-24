import 'package:flutter/material.dart';

ThemeData darkTheme(){
  return ThemeData(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.deepOrange.shade600
    )
  );
}