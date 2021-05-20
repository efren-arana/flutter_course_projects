
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actor_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class ActorProvider {

  String _apiKey   = 'd0a72b0d2656413987278d327dacd589';
  String _domain   = 'api.themoviedb.org';
  bool _cargando  = false;

  List<Actor> _actores = new List();

  //Patron BLoC
  /*
  final _popularesStreamController = StreamController<List<Actor>>.broadcast();

  //introducir y escuchar datos a nuestro Stream
  Function(List<Actor>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Actor>> get popularesStream => _popularesStreamController.stream;


  void dispose() {
    _popularesStreamController?.close();
  }

  */

  Future<List<Actor>> getCast( Pelicula pelicula) async {
    String _resource = '/3/movie/${pelicula.id}/credits';
     
    if ( _cargando ) return [];
    //print('Cargando !!');
    _cargando =  true;


    final url = Uri.https( _domain , _resource, {
      'api_key' : _apiKey
    });
    

    final resp = await this._httpGet(url);

    _actores.addAll(resp);

    //agrego peliculas a mi stream
    //popularesSink( _actores );

    _cargando = false;
    return resp;
  }

  ///Consume el servicio por el metodo get y obtiene la lista de actores por medio del constructor
  Future<List<Actor>> _httpGet(Uri url) async{
    final response = await http.get(url);

    //obtiene toda la informacion como un mapa
    final jsonMap =  json.decode(response.body);
    //retorno una lista de pelicula List<Actor> items
    return Cast.fromJsonList(jsonMap['cast']).actores;
  }
}