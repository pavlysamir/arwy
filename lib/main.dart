import 'package:arwyapp/moduels/LoginScreen/LogiScreen.dart';
import 'package:flutter/material.dart';

import 'shared/style/themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme,
      home: LoginScreen(),
    );
  }
}

