import 'package:flutter/material.dart';
import 'package:practice/screens/add_roulette_screen.dart';
import 'package:practice/screens/roulette_screen.dart';
import 'package:practice/screens/welcom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RouletteScreen.id: (context) => RouletteScreen(),
        AddRouletteScreen.id: (context) => AddRouletteScreen(),
      },
    );
  }
}
