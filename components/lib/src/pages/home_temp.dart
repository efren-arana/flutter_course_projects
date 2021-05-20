import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno','Dos','Tres','Cuatro','Cinco','Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Components') ),
      body: ListView(
        children: _creatItemsCorta()
      )
    );
  }

  List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>();

    for (String item in opciones) {
      ListTile temWidget = new ListTile(
        title: Text(item),
      );

      lista..add(temWidget)..add(Divider());
    }


    return lista;
  }

  List<Widget> _creatItemsCorta(){
    return  opciones.map((f) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(f+'!'),
            subtitle: Text('Subtitle'),
            leading: Icon (Icons.accessibility_new),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }
    ).toList();

    //return widgets;
  }
}