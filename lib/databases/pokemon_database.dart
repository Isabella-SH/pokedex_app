import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PokemonDatabase{

  final int version=1;
  final String databaseName="Pokedex.db";
  final String tableName="pokemons";

  Database? db;

  //funcion patra la creacion de nuetsra base de datos
  //y la tabla llamada pokemons que almacena el id
  Future<Database> openDb()async{
    db ??= await openDatabase(join(await getDatabasesPath(), databaseName),
      onCreate: (database, version){
      database.execute("create table $tableName (id text primary key, name text)");
      }, version: version
    );
    return db as Database;
  }
}






