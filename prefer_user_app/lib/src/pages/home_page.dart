import 'package:flutter/material.dart';
import 'package:prefer_user_app/src/share_prefs/prefs_user.dart';
import 'package:prefer_user_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final PrefsUser prefsUser = new PrefsUser();

  @override
  Widget build(BuildContext context) {
    prefsUser.ultimaPagina = HomePage.routeName;
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              (prefsUser.colorSecundario) ? Colors.teal : Colors.blue,
          title: Text('Prerencias de usuario'),
        ),
        drawer: MenuWidget(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Color secundario: ${prefsUser.colorSecundario}'),
              Divider(),
              Text('Genero: ${prefsUser.genero}'),
              Divider(),
              Text('Nombre de usuario: ${prefsUser.nombre}'),
              Divider(),
            ]));
  }
}
