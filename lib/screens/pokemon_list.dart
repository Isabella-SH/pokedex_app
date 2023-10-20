
import 'package:flutter/material.dart';

class PokemonList extends StatefulWidget{

  const PokemonList({super.key, required this.pokemons});
  final List? pokemons;      //puede ssr una lista nula

  @override
  State<PokemonList> createState()=> _PokemonListState();
}

class _PokemonListState extends State<PokemonList>{

  @override
  Widget build(BuildContext context){

    return ListView.builder(
                 //si la lista en nula muestro 0 resultados
                                              //si no es nula muestro los resultados que tenga la lista
      itemCount: (widget.pokemons==null)? 0: widget.pokemons?.length,

      itemBuilder: (context,index){
        return ListTile(
          title: Text(widget.pokemons?[index].name),
        );
      }
    );
  }
}


