import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/pelicula_provider.dart';


class DataSearch  extends SearchDelegate {

  PeliculaProvider _peliculasProvider = new PeliculaProvider();
  

  String seleccion = '';
  List peliculas = [
    'Spiderman',
    'Batman',
    'Deadpool',
    'Superman',
    'Ironman',
    'Ironman 1',
    'Ironman 2',
    'Ironman 3',
  ];

  List peliculasRecientes = [
    'Acuaman',
    'End Game Vengadores',
    'WonderWoman'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
      // Las acciones de nuestro AppBar
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: ()=> query = '',
          )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda de nuestro AppBar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, 
          progress: transitionAnimation
          ), 
        onPressed: () => close( context, null),
        );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Builder que crea los resultados a mostrar
      return Center(
        child: Container(
          height: 150.0,
          width: 150.0,
          color: Colors.blueAccent,
          child: Text(seleccion),
        ));
    }
  

  @override
    Widget buildSuggestions(BuildContext context) {
    // Sugenrencias (peticion AJAX)

    if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: _peliculasProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        
        final peliculas = snapshot.data;

        if (snapshot.hasData){
          return ListView(
              children: peliculas.map((pelicula) {
                pelicula.uniqueId = '${pelicula.id}-serch';
                return Hero(
                  tag: pelicula.uniqueId,
                  child: ListTile(
                    leading: FadeInImage(
                      placeholder: AssetImage('assets/img/no-image.jpg'), 
                      image: NetworkImage(pelicula.getPosterImg()),
                      width: 50.0,
                      fit: BoxFit.contain,
                      ),
                    title: Text(pelicula.title, style: Theme.of(context).textTheme.headline6,),
                    subtitle: Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subtitle2),
                    onTap: (){
                      //close(context, null);
                      
                      Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                      //showResults(context);
                    },
                  ),
                );
              }
              ).toList(),
              
            );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    
  }



    /*
    @override
    Widget buildSuggestions(BuildContext context) {
    // Sugenrencias (peticion AJAX)

    final listaSugerida = (query.isEmpty) ? 
                          peliculasRecientes : 
                          peliculas.where(
                            (element) => element.toString().toLowerCase().startsWith(query.toLowerCase())
                            ).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            seleccion = listaSugerida[i];
            showResults(context);
          },
        );
      },
      );
  }
  */  

}