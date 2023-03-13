import 'package:flutter/material.dart';
import 'package:programa1/settings/styles_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  //BuildContext? context;
  ThemeData? _themeData;
  ThemeProvider(BuildContext context) {
    _themeData = StylesSettings.lightTheme(context);
  }

  getthemeData() => this._themeData;
  setthemeData(ThemeData theme) async {
    this._themeData = theme;
    notifyListeners();

  }
}

