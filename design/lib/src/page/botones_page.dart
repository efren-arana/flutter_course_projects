import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[_titulos(), _botonesRedondeados()],
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottonNavigationBar(context)
        /*BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.blue),
                title: Text('Home' , style: TextStyle(color: Colors.blue))
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,color: Colors.blue),
                title: Text('Favoritos', style: TextStyle(color: Colors.blue))
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.speaker_notes,color: Colors.blue),
                title: Text('Pedidos', style: TextStyle(color: Colors.blue))
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search,color: Colors.blue),
                title: Text('Buscar', style: TextStyle(color: Colors.blue))
                ),
            ]
            ),
            */
        );
  }

  _fondoApp() {
    //const color = const Color(0x990047BA);
    const colorBlue = Color.fromRGBO(0, 71, 186, 1.0);
    const colorYellow = Color.fromRGBO(255, 183, 27, 1.0);

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.4),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
      angle: -math.pi / 5.0,
      child: Container(
        height: 350.0,
        width: 350.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(242, 142, 172, 1.0),
            ])),
      ),
    );
    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: cajaRosa)],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify Transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15.0,
            ),
            Text('Classify this Transaction into a particular category',
                style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }

  Widget _bottonNavigationBar(BuildContext context) {
    const colorBlue = Color.fromRGBO(0, 71, 186, 1.0);
    const style = TextStyle(color: Colors.blue);

    return new Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text('Favoritos')),
            BottomNavigationBarItem(
                icon: Icon(Icons.speaker_notes), title: Text('Pedidos')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Buscar')),
          ]),
    );
  }

  _botonesRedondeados() {
    return Table(
      children: <TableRow>[
        TableRow(children: <Widget>[
          _crearBotonRedondeado(
              Colors.blueAccent, Icons.account_circle, 'Text'),
          _crearBotonRedondeado(
              Colors.purpleAccent, Icons.add_shopping_cart, 'Text'),
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.greenAccent, Icons.assignment, 'Text'),
          _crearBotonRedondeado(Colors.pinkAccent, Icons.ac_unit, 'Text'),
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(
              Colors.yellowAccent, Icons.wifi_tethering, 'Text'),
          _crearBotonRedondeado(
              Colors.orangeAccent, Icons.visibility_off, 'Text'),
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.redAccent, Icons.trip_origin, 'Text'),
          _crearBotonRedondeado(Colors.cyanAccent, Icons.vpn_key, 'Text'),
        ]),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icon, String text) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                radius: 35.0,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                backgroundColor: color,
              ),
              Text(
                text,
                style: TextStyle(color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
