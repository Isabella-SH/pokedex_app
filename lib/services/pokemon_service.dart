import 'dart:convert';
import 'dart:io';                               //importar .io
import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/pokemon.dart';

class PokemonService{

  final baseUrl="https://pokeapi.co/api/v2/pokemon/";

  //devuelve en algun momento una lista
  Future<List> getAllPokemons() async{

    http.Response response=await http.get(Uri.parse(baseUrl));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);

      //accede a results, esta es una lista de map
      final pokemonsMap= jsonResponse["results"];

      //cada map es asignado a un objeto Pokemon usando su metodo de fromJson
      //crea una lista de Pokemon
      return pokemonsMap.map((map)=> Pokemon.fromJson(map)).toList();
    }
    return [];
  }

  Future<PokemonInfo?>getPokemonById(int id) async{
                           //https://pokeapi.co/api/v2/pokemon/6
    http.Response response=await http.get(Uri.parse("$baseUrl$id"));
    final PokemonInfo? pokemonInfo;

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){
      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);
      pokemonInfo=PokemonInfo.fromJson(jsonResponse);
      return pokemonInfo;
    }
    return null;
  }


}







