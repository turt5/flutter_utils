import 'package:flutter/material.dart';

ThemeData lightTheme(){
  return ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
      primary: Colors.deepOrange.shade600
    )
  );
}