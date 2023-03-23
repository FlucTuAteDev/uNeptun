import 'package:flutter/material.dart';
import 'package:turbo_neptun/pages/app_start.dart';
import 'package:turbo_neptun/pages/home.dart';
import 'package:turbo_neptun/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.dark
      ),
      initialRoute: "/load",
      routes: {
        "/load": (context) => const AppStart(),
        "/login": (context) => const Login(),
        "/home": (context) => const Home()
      },
    );
  }
}