import 'package:admin_panel/view/admin_panel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(bodyColor: Color(0xffe0e0e0), displayColor: Color(0xffe0e0e0)),
      ),
      debugShowCheckedModeBanner: false,
      home: AdminPanel(),
    );
  }
}
