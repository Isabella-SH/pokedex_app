
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/repositories/pokemon_repository.dart';
import 'package:pokedex_app/screens/pokemon_detail.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/utils/Functions.dart';

class PokemonList extends StatefulWidget{

  const PokemonList({super.key});

  @override
  State<PokemonList> createState()=> _PokemonListState();
}

class _PokemonListState extends State<PokemonList>{

  //"_"-> indica que es privado
  List<Pokemon>? _pokemons;
  PokemonService? _pokemonService;

  @override
  void initState(){
    //inicializa el servicio
    _pokemonService=PokemonService();
    initialize();
    super.initState();
  }

  Future initialize()async{
    //llama a un metodo del servicio y lo almacena en pokemons
    _pokemons=await _pokemonService?.getAll();
    setState(() {
      _pokemons=_pokemons;
    });
  }

  @override
  Widget build(BuildContext context){
            //retorna una lista de pokemons item
    return ListView.builder(
                 //si la lista en nula muestro 0 resultados
                                              //si no es nula muestro los resultados que tenga la lista
      itemCount: _pokemons?.length ?? 0,
      itemBuilder: (context,index)=>PokemonItem(pokemon:_pokemons?[index]),
    );
  }
}

//FUCIONES QUE  RETORNAN WIDGETS NO
//MEJOR ES CREAR CLASES QUE HEREDE DE WIDGET

class PokemonItem extends StatefulWidget{

  const PokemonItem({super.key, required this.pokemon});

  //parametros
  final Pokemon? pokemon;

  @override
  State<PokemonItem> createState()=>_PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem>{

  bool isFavorite=false;

  @override
  void initState(){
    initialize();
    super.initState();
  }

  //para saber si el pokemos recibido esta marcado como favorito o no
  initialize()async{
    //si es true, llama al repository y su metodo de mostrar los favoritos
    isFavorite= await PokemonRepository().isFavorite(widget.pokemon!);
    setState(() {
      isFavorite= isFavorite;
    });
  }

  @override
  Widget build(BuildContext context){

    //definir la imagen antes de añadirla en el card
    final image = getImage(widget.pokemon?.id?? "");  //llama al metodo de FUNCTIONS
    final icon= Icon(
      Icons.favorite,
      //cambia de rojo a gris
      color: isFavorite ? Colors.red : Colors.grey,
    );
    final pokemon=widget.pokemon;

    //cada pokemonitem es un card con la siguiente estructura
    return GestureDetector(
      //al darle click
      onTap: ()=>
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetail(id: pokemon?.id ?? "1"))),
      child: Card(

          elevation: 2,

          child: ListTile(

            leading: Image(image: image),
            title: Text(pokemon?.name ?? ""),
            trailing: IconButton(
              onPressed: (){
                setState(() {
                  isFavorite= !isFavorite;
                });
                //si es true inserta el pokemon a la db
                isFavorite? PokemonRepository().insert(pokemon!)
                //sino es false, se elimina de la db
                :PokemonRepository().delete(pokemon!);
              },
              icon: icon,
            ),
          )
      ),
    );
  }
}







