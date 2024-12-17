import 'package:drassistant/themes/dark_theme.dart';
import 'package:drassistant/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themedata){
    _themeData = themedata;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData==lightMode){
      themeData == darkMode;
    }else{
      themeData == lightMode;
    }
  }
}