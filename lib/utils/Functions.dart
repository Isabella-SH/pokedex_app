
//url completa->https://pokeapi.co/api/v2/pokemon/6

//obtiene el id
import 'package:flutter/cupertino.dart';

String getId(String url){

  String id= RegExp(r'https://pokeapi.co/api/v2/pokemon/([^]*?)/')
      .firstMatch(url)?[1] as String;
  return id;
}

//obtener la imagen en base al id
ImageProvider getImage(String id){
  
  NetworkImage image= NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$id.png");
  return image;
}








