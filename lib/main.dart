import 'package:flutter/material.dart';
import 'package:pokedex_app/screens/Home.dart';
import 'package:pokedex_app/screens/pokemon_list.dart';
import 'package:pokedex_app/services/pokemon_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

