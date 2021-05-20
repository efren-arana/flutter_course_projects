import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/pelicula_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_horizontal.dart';
import 'package:peliculas/src/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  final peliculaProvider = PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    //obtengo la lista de peliculas popuelares
    //ejecuto el skin al stream
    peliculaProvider.getPopulares();

    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en Cines'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: DataSearch(),
                    query: null,
                  );
                })
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _swiperTarjetas(),
              _footer(context),
            ],
          ),
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculaProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
            height: 300.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child:
                Text('Populares', style: Theme.of(context).textTheme.subtitle1),
          ),
          SizedBox(
            height: 5.0,
          ),
          //StreamBuilder: Se ejecuta cada vez que se emita un valor en el stream
          StreamBuilder(
            stream: peliculaProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return CardHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina:
                      peliculaProvider.getPopulares, //definicion de la funcion
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
