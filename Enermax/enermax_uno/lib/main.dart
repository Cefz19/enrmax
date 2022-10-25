import 'package:flutter/material.dart';

import 'package:enermax_uno/src/screens/screen_login_password.dart';
import 'package:enermax_uno/src/screens/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: <String, WidgetBuilder>{
        'splash_screen': (_) => const ScreenSplash(),
        'login_password': (_) => const ScreenLoginPassword(),
      },
    );
  }
}
