import 'package:flutter/material.dart';
import 'package:flutter_tutorial2/dark_theme.dart';
import 'package:flutter_tutorial2/light_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData=lightTheme();

  ThemeData get themeData => _themeData;

  bool get isDark => _themeData==darkTheme();

  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==lightTheme()){
      themeData=darkTheme();
    }else{
      themeData=lightTheme();
    }
  }
}