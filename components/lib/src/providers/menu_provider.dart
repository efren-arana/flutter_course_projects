import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];
 
  // No se puede tener un constructor asincrono
  _MenuProvider(){
 
  }

 /// Reliza una tarea asincrona en otro thread (Promesa: JavaScript)
  Future<List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('assets/data/menu_opts.json');

       Map rawJson = json.decode(resp);
      
      //print(rawJson['rutas']);
      opciones = rawJson['rutas'];

       // retorna una lista de Mapas!! 
      return opciones;
}
}

final menuProvider = new _MenuProvider();