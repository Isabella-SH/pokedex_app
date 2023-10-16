import 'package:flutter/material.dart';
import 'package:pokedex_app/screens/pokemon_list.dart';
import 'package:pokedex_app/services/pokemon_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //variables nulas que se inicializan al ejecutar
  PokemonService? service;
  List? pokemons;

  @override
  void initState() {
    service=PokemonService();
    initialize();
    super.initState();
  }

  //espera tener la respuesta del servicio para llamar al metodo getall
  initialize() async{
    pokemons=await service?.getAllPokemons();
    setState(() {
      pokemons=pokemons;
    });
  }

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: PokemonList(pokemons: pokemons!),
        ),
      )
    );
  }
}

