
class Pokemon{

  //va a tenr un atributo de name
  String name;
  Pokemon({required this.name});

  //recojemos la informacion de un pokemon de un json
  //claave: recibe primero el tipo de dato
  //dynamic: cualquier valor
  //                    clave,valor                 asi se llama en el json
  Pokemon.fromJson(Map<String, dynamic>json): name=json["name"];

}

class PokemonInfo{

  String name;
  int weight;
  int height;
  List types;
  List stats;
  String urlImage;

  PokemonInfo(
      { required this.name,
        required this.weight,
        required this.height,
        required this.types,
        required this.stats,
        required this.urlImage
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
        types=json["types"].map((i)=> i["type"]["name"].toString()).toList(),

        stats=json["stats"].map((map)=> Stat.fromJson(map)).toList(),

        //el jon tiene la estructura de sprites->front_default
        urlImage=json["sprites"]["front_default"];

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





