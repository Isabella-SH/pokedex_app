
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
        return PokemonItem(pokemon:widget.pokemons?[index], index:index);
      }
    );
  }
}

//FUCIONES QUE  RETORNAN WIDGETS NO
//MEJOR ES CREAR CLASES QUE HEREDE DE WIDGET

class PokemonItem extends StatefulWidget{

  const PokemonItem({super.key, required this.pokemon, required this.index});

  //parametros
  final Pokemon pokemon;
  final int index;

  @override
  State<PokemonItem> createState()=>_PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem>{

  late NetworkImage image;
  late bool isFavorite;

  //inicializa el booleano en false
  @override
  void initState(){
    isFavorite=false;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    
    //definir la imagen antes de añadirla en el card
    image = NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.index + 1}.png");
    
    //cada pokemonitem es un card con la siguiente estructura
    return Card(

      color: Colors.white,
      elevation: 2.0,

      child: Row(

        children: [

          Image(image: image,),
          Text(widget.pokemon.name),

          //FAVORITE
          Expanded( //utiliza tod el espacio disponible
              child:
              Row( //crea una fila donde su unico elemento es el icono de favorite
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: (){
                        //cambia el estado del booleano
                        setState(() {
                          isFavorite=!isFavorite;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        //cambia de rojo a gris
                        color: isFavorite ? Colors.red : Colors.grey,
                      )
                  ),
                ],
              )
          )
        ],
      )
    );
  }
}







