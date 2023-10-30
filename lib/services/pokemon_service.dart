import 'dart:convert';
import 'dart:developer';
import 'dart:io';                               //importar .io
import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/pokemon.dart';

class PokemonService{

  final baseUrl="https://pokeapi.co/api/v2/pokemon/";

  //devuelve en algun momento una lista
  Future<List<Pokemon>?> getAll(int page, int size) async{

    http.Response response=await http.get(Uri
        .parse("$baseUrl?offset=${page*size}&limit=$size"));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);

      //importar el developer, para ver que devuelve el servicio al ejecutar(solo para probar)
      log(response.body);

      final List maps=jsonResponse["results"];

      //cada map es asignado a un objeto Pokemon usando su metodo de fromJson
      //crea una lista de Pokemon
      final pokemons = maps.map((e) => Pokemon.fromJson(e)).toList();

      return pokemons;
    }
    return [];
  }

  Future<PokemonInfo?>getById(String id) async{
                           //https://pokeapi.co/api/v2/pokemon/6
    http.Response response=await http.get(Uri.parse("$baseUrl$id"));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){
      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);
      final pokemonInfo=PokemonInfo.fromJson(jsonResponse);
      return pokemonInfo;
    }
    return null;
  }

}







