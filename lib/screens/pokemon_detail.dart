import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/utils/Functions.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({super.key, required this.id});

  //parametros
  final String id;

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {

  //variables
  //"_"-> indica que es privado
  PokemonInfo? _pokemonInfo;
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
    _pokemonInfo=await _pokemonService!.getById(widget.id);
    setState(() {
      _pokemonInfo=_pokemonInfo;
    });
  }

  @override
  Widget build(BuildContext context) {

    final image= getImage(widget.id);  //fucnion de FUNCTIONS

    return Scaffold(
      appBar: AppBar(
        title: Text(_pokemonInfo?.name ??""),
      ),
      body: Column(
        children: [
          Image(image: image,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _pokemonInfo?.types
                  .map((e) => Container(
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(e),
                ),
              )).toList()??[]
          ),
          Column(
            children: _pokemonInfo?.stats.map((e) => Text(e.name)).toList()??[],
          )
        ],
      )
    );
  }
}