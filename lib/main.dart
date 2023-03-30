import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:programa1/provider/theme_provider.dart';
import 'package:programa1/routes.dart';
import 'package:programa1/screens/onboard_screen.dart';
import 'package:programa1/settings/styles_settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/flags_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(context)),
        ChangeNotifierProvider(create: (_) => FlagsProvider())
      ],
      child: const PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    String initialTheme = '';

    SharedPreferences.getInstance().then((prefs) {
      if (prefs.containsKey('theme')) {
        initialTheme = prefs.getString('theme')!;
        if (initialTheme == 'dark') {
          theme.setthemeData(StylesSettings.darkTheme(context));
        } else if (initialTheme == 'light') {
          theme.setthemeData(StylesSettings.lightTheme(context));
        } else if (initialTheme == 'custom') {
          theme.setthemeData(StylesSettings.spaceTheme(context));
        }
      }
    });

    return MaterialApp(
      theme: theme.getthemeData(),
      routes: getApplicationRoutes(),
      home: Home(),
    );
  }
}
