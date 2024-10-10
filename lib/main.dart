import 'package:flutter/material.dart';
import 'package:trivia/pages/scorepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(
          31,
          31,
          31,
          1.0,
        ),
        primaryColor: const Color.fromRGBO(
          31,
          31,
          31,
          1.0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
