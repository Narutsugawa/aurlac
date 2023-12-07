import 'package:aurlac/acceuil.dart';
import 'package:aurlac/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Aurlac',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aurlac'),
    );
  }
}
