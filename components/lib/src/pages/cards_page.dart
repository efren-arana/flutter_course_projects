import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards - Tarjetas'),
      ),
      body: ListView(
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2()
        ],
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Card'),
            subtitle: Text('Subtitulo de la tarjeta.'),
          ),
          Row(
            children: <Widget>[
              FlatButton(child: Text('Cancelar'), onPressed: () {}),
              FlatButton(child: Text('OK'), onPressed: () {})
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            FadeInImage(
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage(
                  'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
              fadeInDuration: Duration(milliseconds: 500),
              height: 250.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
            //Image (
            //  image: NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg')
            //),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Vista al mar de Noruega!'),
            )
          ],
        ));

    return Container(
      child: ClipRRect(child: card, borderRadius: BorderRadius.circular(20.0)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]
          //color: Colors.red,
          ),
    );
  }
}
