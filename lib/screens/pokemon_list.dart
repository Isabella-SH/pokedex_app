
import 'package:flutter/material.dart';

class PokemonList extends StatefulWidget{

  const PokemonList({super.key, required this.pokemons});
  final List? pokemons;

  @override
  State<PokemonList> createState()=> _PokemonListState();
}

class _PokemonListState extends State<PokemonList>{

  @override
  Widget build(BuildContext context){

    return ListView.builder(

      itemCount: (widget.pokemons==null)? 0: widget.pokemons?.length,

      itemBuilder: (context,index){
        return ListTile(
          title: Text(widget.pokemons?[index].name),
        );
      }
    );
  }
}


