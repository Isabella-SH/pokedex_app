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
    final width= MediaQuery.of(context).size.width;

    return Scaffold(

      body: SingleChildScrollView(

        child: Column(

          children: [
                                          //LA IMAGEN COMO ENCABEZADO
            Padding(

              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
                  width: width,
                  height: width * 0.7,
                  child: Image(image: image)),
            ),

                                        //NOMBRE EN EL CENTRO
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                _pokemonInfo?.name ?? "",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),

                              //MOSTRAR LOS TYPES DEL POKEMON COMO FILA
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _pokemonInfo?.types
                      .map((e) => Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(e),
                    ),
                  ))
                      .toList() ??
                      []),
            ),

                             //MOSTRAR DATOS DEL WIGHT Y HEIGHT
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        _pokemonInfo?.weight.toString() ?? "",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Weight",
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  Column(children: [
                    Text(
                      _pokemonInfo?.height.toString() ?? "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Height",
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ]),
                ],
              ),
            ),

                             //MOSTRAR EN COLUMNA LOS DATOS DE STATS
            Column(
              children:
              _pokemonInfo?.stats.map((e) => Text(e.name)).toList() ?? [],
            )
          ],
        ),
      ),
    );
  }
}