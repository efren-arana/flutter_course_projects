import 'package:flutter/material.dart';


class BasicoPage extends StatelessWidget {


  final estiloTitulo = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle( fontSize: 17.0, fontWeight: FontWeight.w100);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            _crearImagen(),

            _crearTitulo(),
            
            _crearAcciones(),

            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
          ),
      ) 
      );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage('https://latintrails.com/wp-content/uploads/2017/08/The-most-beautiful-landscapes-in-Ecuador-for-photography-lovers2.jpg'),
        height: 230.0,
        fit: BoxFit.cover,
        ),
    );
  }

  Widget _crearTitulo() {

    return SafeArea(
      child: Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Vista al volcan Chimborazo', style: estiloTitulo,),
                        SizedBox(height: 7.0,),
                        Text('Chimborazo, Ecuador', style: estiloSubTitulo,),
                      ],
                    ),
                  ),
                  Icon( Icons.star, color: Colors.red, size: 30.0,),

                  Text('4.1',style: TextStyle( fontSize: 20.0),)
                ],
                
              ),
            ),
    );
  }

  _crearAcciones() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        _accion(Icons.call,'CALL',Colors.blue),
        _accion(Icons.near_me,'ROUTE',Colors.blue),
        _accion(Icons.share,'SHARE',Colors.blue),
      ],
    );
  }

  Widget _accion(IconData icon, String texto, Color color) {

    return Column(
          children: <Widget>[
            Icon (icon, color: color),
            SizedBox(height: 5.0,),
            Text(texto, style: TextStyle( fontSize: 15.0, color: color)),
          ],
    );
  }

  Widget _crearTexto() {

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
        child: Text('Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.',
               textAlign: TextAlign.justify,   
                ),
      ),
    );
  }
  
}