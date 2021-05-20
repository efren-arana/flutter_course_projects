import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page!'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('EA'),
              backgroundColor: Colors.green[600],
              foregroundColor: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
             margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
               backgroundImage: NetworkImage('https://aws.revistavanityfair.es/prod/designs/v1/assets/2444x2020/170456.jpg'),
                radius: 25.0,
              ),
          ),
        ],
      ),
      body: Center(
        child: Container (
          child: FadeInImage(
            placeholder: AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://aws.revistavanityfair.es/prod/designs/v1/assets/2444x2020/170456.jpg'),
            fadeInDuration: Duration(milliseconds: 5000),
            )
          )
      ),
    );
  }
  
}