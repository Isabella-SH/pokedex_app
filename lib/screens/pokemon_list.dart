
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';

class PokemonList extends StatefulWidget{

  const PokemonList({super.key, required this.pokemons});
  final List? pokemons;      //puede ssr una lista nula

  @override
  State<PokemonList> createState()=> _PokemonListState();
}

class _PokemonListState extends State<PokemonList>{

  @override
  Widget build(BuildContext context){

    //retorna una lista de pokemons item
    return ListView.builder(
                 //si la lista en nula muestro 0 resultados
                                              //si no es nula muestro los resultados que tenga la lista
      itemCount: (widget.pokemons==null)? 0: widget.pokemons?.length,

      itemBuilder: (context,index){
        return PokemonItem(pokemon:widget.pokemons?[index]);
      }
    );
  }
}

//FUCIONES QUE  RETORNAN WIDGETS NO
//MEJOR ES CREAR CLASES QUE HEREDE DE WIDGET

class PokemonItem extends StatefulWidget{

  const PokemonItem({super.key, required this.pokemon});

  //parametros
  final Pokemon pokemon;  

  @override
  State<PokemonItem> createState()=>_PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem>{

  late NetworkImage image;
  
  @override
  Widget build(BuildContext context){
    
    //definir la imagen antes de añadirla en el card
    image=const NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png");
    
    //cada pokemonitem es un card con la siguiente estructura
    return Card(

      color: Colors.white,
      elevation: 2.0,
      child: Row(
        children: [
          Image(image: image,),
          Text(widget.pokemon.name)
        ],
      )
    );
  }
}







