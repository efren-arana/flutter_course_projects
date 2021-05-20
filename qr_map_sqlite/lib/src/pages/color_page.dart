import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(color: Color.fromRGBO(255, 183, 27, 0.9)),
            //decoration: BoxDecoration(color: Color(0x59FFB71B)),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromRGBO(255, 183, 27, 1.0)),
            //decoration: BoxDecoration(color: Color(0x59FFB71B)),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 200.0,
            width: double.infinity,
            decoration:
                BoxDecoration(color: Color.fromRGBO(255, 183, 27, 0.89)),
            //decoration: BoxDecoration(color: Color(0x59FFB71B)),
          ),
        ],
      ),
    );
  }
}
