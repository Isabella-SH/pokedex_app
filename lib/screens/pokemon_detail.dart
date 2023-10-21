import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/screens/pokemon_list.dart';
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
        PokemonItem(pokemonInfo: pokemonInfo!),
    );
  }
}

class PokemonItem extends StatefulWidget {
  const PokemonItem({super.key, required this.pokemonInfo});

  //parametros
  final PokemonInfo pokemonInfo;

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  @override

  Widget build(BuildContext context) {

    final image=NetworkImage(widget.pokemonInfo.urlImage, scale: 0.50);

    return
        Scaffold(

          appBar: AppBar(
            title: Text(widget.pokemonInfo.name),
          ),

          body: Column(
            children: [
              Image(image: image),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.pokemonInfo.types
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
               children: widget.pokemonInfo.stats.map((e) => Text(e.name)).toList()??[],
             )
            ],
          ),
        );
  }
}



