import 'package:flutter/material.dart';
import 'package:programa1/screens/dashboard_screen.dart';
import 'package:programa1/screens/login_screen.dart';
import 'package:programa1/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/login': (BuildContext context) => const LoginScreen()
  };
}
