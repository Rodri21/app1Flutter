import 'package:flutter/material.dart';
import 'package:programa1/settings/styles_settings.dart';

class ThemeProvider with ChangeNotifier {
  //BuildContext? context;
  ThemeData? _themeData;
  ThemeProvider(BuildContext context) {
    _themeData = StylesSettings.lightTheme(context);
  }

  getthemeData() => this._themeData;
  setthemeData(ThemeData theme) {
    this._themeData = theme;
    notifyListeners();
  }
}
