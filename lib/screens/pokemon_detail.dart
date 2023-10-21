import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/pokemon_service.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({super.key, required this.id});

  //parametros
  final int id;

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {

  //variables
  PokemonInfo? pokemonInfo;

  @override
  void initState(){
    initialize();
    super.initState();
  }

  Future initialize()async{
    pokemonInfo=await PokemonService().getPokemonById(widget.id);
    setState(() {
      pokemonInfo=pokemonInfo;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: pokemonInfo==null?
          //si el pokemoninfo es nulo muestra el ciurcular...., ":"->sino
        const Center(child:CircularProgressIndicator()):
          //muestra toda esta estructura
        Text(pokemonInfo!.name),
    );
  }
}


