
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


