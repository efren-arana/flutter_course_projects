import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_map_sqlite/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final mapController = MapController();
  int count = 0;
  static String street = 'ckcb1ahw10qm21inw5uuxcwq6';
  static String satelital = 'ckcb50zlu00991ipk55jamb5q';
  static String outDoors = 'ckcb6osvb010c1jqm9fjf01j4';

  String tipoMapa = 'ckcb1ahw10qm21inw5uuxcwq6';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Geolocation QR'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.my_location),
                onPressed: () {
                  mapController.move(scan.getLtdLng(), 15.0);
                })
          ],
        ),
        body: _crearFlutterMap(scan),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.track_changes),
            onPressed: () {
              if (tipoMapa == street) {
                tipoMapa = satelital;
              } else if (tipoMapa == satelital) {
                tipoMapa = outDoors;
              } else {
                tipoMapa = street;
              }
              setState(() {});
            }));
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return new FlutterMap(
        mapController: mapController,
        options: new MapOptions(center: scan.getLtdLng(), minZoom: 5.0),
        layers: [
          new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/efren-arana/{id}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiZWZyZW4tYXJhbmEiLCJhIjoiY2tjYXJiZG9tMTg0ajJ0bGNzNGd0Z3Y4YSJ9.DJCD7gYwCF2rif94fFjvYQ',
                'id': '$tipoMapa'
              }),
          new MarkerLayerOptions(markers: [
            new Marker(
                width: 45.0,
                height: 45.0,
                point: scan.getLtdLng(),
                builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.blue,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
          ])
        ]);
  }
}
