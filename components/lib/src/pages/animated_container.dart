
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimatedContainerPage extends StatefulWidget {
  
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerPage> {
  
  double _width = 50.0;
  double _height= 50.0;
  Color  _color = Colors.purple;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainerPage')
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration( seconds: 1),
          curve: Curves.easeIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon ( Icons.play_circle_filled ) , 
        onPressed: _changeStatus,
        ),
    );
  }

  void _changeStatus() {
    final random = Random();
     
    setState(() {
      
      _width =  random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}