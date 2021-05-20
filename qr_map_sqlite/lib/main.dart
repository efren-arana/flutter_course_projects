import 'package:flutter/material.dart';
import 'package:qr_map_sqlite/src/pages/color_page.dart';
import 'package:qr_map_sqlite/src/pages/home_page.dart';
import 'package:qr_map_sqlite/src/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'QR Scanner App',
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          'mapa': (BuildContext context) => MapaPage()
        },
        theme: ThemeData(
          primaryColor: Colors.blue,
          primaryIconTheme: IconThemeData(color: Colors.red),
        ));
  }
}
