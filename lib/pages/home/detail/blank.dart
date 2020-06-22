import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieBlankPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: Center(
        child: Text("404,not found", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
