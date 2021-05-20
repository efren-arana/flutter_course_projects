import 'package:design/src/page/basico_page.dart';
import 'package:design/src/page/botones_page.dart';
import 'package:design/src/page/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //cambia el color de la barra de notificaciones
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      initialRoute: 'boton',
      routes: {
        'basico' : (BuildContext context) => BasicoPage(),
        'scroll' : (BuildContext context) => ScrollPage(),
        'boton'  : (BuildContext context) => BotonesPage(),
        },
    );
  }
}