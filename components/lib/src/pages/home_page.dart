import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component Home Page!'),
        centerTitle: true,
      ),
      body: _listView(),
    );
  }

  Widget _listView() {
    
    //print(menuProvider.opciones);
   return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {
            print('Builder!:');
            print(snapshot);
            return ListView(
                children: _listTile( snapshot.data, context )
                );
      },
    );

  }

  List<Widget> _listTile(List<dynamic> data, BuildContext context) {
    List<Widget> lista = new List();

    data.forEach((element) {
      final widgetTemp =  ListTile(
                          title: Text( element['texto']),
                          subtitle: Text('subtitle'),
                          leading: getIcon( element['icon']),
                          trailing:getIcon( element['icon']),
                          onTap: (){
                            Navigator.pushNamed(context, element['ruta']);
                            /*
                            final route =  MaterialPageRoute(
                              builder: ( context){
                                return AlertPage();
                              }
                              );
                              Navigator.push(context, route);
                             */ 
                          },
                  );

      lista..add(widgetTemp)..add(Divider());     
    });

    return lista;
  }
}