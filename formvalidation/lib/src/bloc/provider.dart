import 'package:flutter/material.dart';

import 'package:formvalidation/src/bloc/login_bloc.dart';
export 'package:formvalidation/src/bloc/login_bloc.dart';

import 'package:formvalidation/src/bloc/productos_bloc.dart';
export 'package:formvalidation/src/bloc/productos_bloc.dart';

/// Clase alternativa al singleton que permite manejar el estado de los widgets
/// Esta clase es implementada por el pck provider
/// Notifica cuando hay un cambio en una de sus propiedades
class Provider extends InheritedWidget {
  final loginBloc = new LoginBloc();
  
  final _productosBloc = new ProductosBloc();

  //implementacion del patron de diseno singleton
  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  //constructor privato que evita que el constructor se inicialice
  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static ProductosBloc productosBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._productosBloc;
  }
}
