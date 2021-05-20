import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_map_sqlite/src/bloc/scans_bloc.dart';
import 'package:qr_map_sqlite/src/models/scan_model.dart';
import 'package:qr_map_sqlite/src/pages/dir_pages.dart';
import 'package:qr_map_sqlite/src/pages/maps_pages.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_map_sqlite/src/utils/scan_util.dart' as utilscan;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final scanBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scanBloc.borrarAllScans,
          )
        ],
      ),
      body: _crearPage(_currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scanQR(context),
        child: Icon(Icons.filter_center_focus),
      ),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  void _scanQR(BuildContext context) async {
    dynamic futureString = '';

    //geo:40.63987808730795,-74.2023219152344
    //Future String: https://www.udemy.com/

    futureString = 'https://www.udemy.com/';
    /*
    try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString = e.toString();
    }
    print('Future String: ${futureString.rawContent}');
    */

    if (futureString != null) {
      final nuevoScan = ScanModel(valor: futureString);
      scanBloc.agregarScan(nuevoScan);

      if (Platform.isIOS) Future.delayed(Duration(milliseconds: 750));

      final nuevoScan2 = ScanModel(valor: 'geo:-1.959776,-79.724865');
      scanBloc.agregarScan(nuevoScan2);

      utilscan.launchURL(context, nuevoScan);
    }
  }

  Widget _crearPage(int index) {
    switch (index) {
      case 0:
        return MapsPages();
        break;
      case 1:
        return DirPages();
        break;
      default:
        return MapsPages();
    }
  }

  _crearBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Map')),
          BottomNavigationBarItem(icon: Icon(Icons.web), title: Text('Dir'))
        ]);
  }
}
