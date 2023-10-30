
import 'package:flutter/cupertino.dart';
import 'package:pokedex_app/repositories/pokemon_repository.dart';
import 'package:pokedex_app/models/pokemon.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({super.key});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {

  PokemonRepository? _pokemonRepository;
  List<Pokemon>? _pokemons;

  initialize() async{ // "?? []" -> si es nulo, devuelve un arreglo vacio
    _pokemons=await _pokemonRepository?.getAll()??[];
    setState((){
      _pokemons=_pokemons;
    });
  }

  @override
  void initState(){
    _pokemonRepository=PokemonRepository();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _pokemons?.length?? 0 ,
      itemBuilder: ((context,index){
        return Text(_pokemons?[index].name??'');
      })
    );
  }
}

//grabacion en 46:46
