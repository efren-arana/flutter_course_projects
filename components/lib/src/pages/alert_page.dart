import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon ( Icons.arrow_back ) , 
        onPressed: (){
          Navigator.pop(context);
        },
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Monstrar alerta!'),
            color: Colors.blue[400],
            shape: StadiumBorder(),
            textColor: Colors.white,
            onPressed: ( ) => _mostrarAlert(context)
            ),
        ),
    );
  }
  

  void _mostrarAlert(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text('Title'),
            content: Column(
              children: <Widget>[
                Text('Contenido'),
                FlutterLogo(size: 100.0,)
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            actions: <Widget>[
              FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancelar')),
              FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK'))
            ],
        );
      }
      ); 
  }
}