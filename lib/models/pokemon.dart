
import 'package:pokedex_app/utils/Functions.dart';

class Pokemon{

  //va a tenr un atributo de name
  final String name;
  final String id;

  const Pokemon({required this.name, required this.id});

  //recojemos la informacion de un pokemon de un json
  //claave: recibe primero el tipo de dato
  //dynamic: cualquier valor
  //                    clave,valor                 asi se llama en el json
  Pokemon.fromJson(Map<String, dynamic>json):
        name=json["name"],
        id=getId(json["url"]);  //usa la funcion de FUNCTIONS
}

class PokemonInfo{

  String name;
  int weight;
  int height;
  List<String> types;
  List<Stat> stats;

  PokemonInfo(
      { required this.name,
        required this.weight,
        required this.height,
        required this.types,
        required this.stats,
      }
  );

  PokemonInfo.fromJson(Map<String,dynamic>json)
      :
  //el jon tiene la estructura de stats->stat->name
  //                              stats->base_stat
        name=json["name"],
        height=json["height"],
        weight=json["weight"],

        //el jon tiene la estructura de types->type->name
        types=json["types"]
            .map<String>((type)=> type["type"]["name"].toString()).toList(),

        stats=json["stats"]
            .map<Stat>((stat)=> Stat.fromJson(stat)).toList().cast<Stat>();
}


class Stat{
  String name;
  int value;

  Stat({required this.name,required this.value});

  Stat.fromJson(Map<String,dynamic>json):

      //el jon tiene la estructura de stats->stat->name
      //                              stats->base_stat
      name=json["stat"]["name"],
      value=json["base_stat"];
}





