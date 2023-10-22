
import 'package:pokedex_app/databases/pokemon_database.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';

class PokemonRepository{

  //insertar un pokemon
  Future insert(Pokemon pokemon) async{
    Database db= await PokemonDatabase().openDb();
                                                   //metodo de pokemon.dart
    db.insert(PokemonDatabase().tableName, pokemon.toMap());
  }

  Future delete(Pokemon pokemon) async{
    Database db= await PokemonDatabase().openDb();
    //metodo de pokemon.dart
    db.delete(PokemonDatabase().tableName,
        where: "id=?", whereArgs:[pokemon.id]);
  }

  //lista pokemons que se marcaron como favorito
  Future<bool> isFavorite(Pokemon pokemon) async{
    Database db= await PokemonDatabase().openDb();
    //metodo de pokemon.dart
    final maps=await db.query(PokemonDatabase().tableName,
        where: "id=?", whereArgs: [pokemon.id]);

    //maps esta lleno es true, por eso el "isNotEmpty"
    return maps.isNotEmpty;  //devuelve todos los que se guardaron como favoritos
  }







}





