import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 100.0;
  bool   _checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only( top: 80.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _switch(),
            Expanded ( child: _crearImage()),
          ],
        ),
      )
    ); 
    
    
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.red,
      label: 'Tamanio Imagen',
      //divisions: 30,
      value: _valueSlider, 
      min: 100.0,
      max: 500.0,
      onChanged: ( _checkValue ) ? null : ( value ) {
        //espresion ternaria (if corto)
        setState( ( ) => _valueSlider = value );
      });
  }

  _crearImage() {

     return Image(
       image: NetworkImage ('https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2019/10/superman.jpg'),
       width: _valueSlider,
       fit: BoxFit.contain,); 
  }

  _checkBox() {
    //return Checkbox(
    //  value: _checkValue, 
    //  onChanged: ( value ) {
    //    setState(() {
    //      _checkValue = value;
    //    });
    //  });

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _checkValue, 
      onChanged: ( value ) {
        setState(() {
          _checkValue = value;
          });
        }
    );
  }

  _switch() {

    return SwitchListTile(
      title: Text('Switchear Slider'),
      value: _checkValue, 
      onChanged: ( value ) {
        setState(() {
          _checkValue = value;
          });
        });
  }
}