import 'package:flutter/material.dart';
import 'home.dart';
void main() => runApp(Aplication());
class Aplication extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: "Navegation Drawer",
        home: Home(),
        theme: ThemeData(
          primaryColor: Colors.lightGreen,

        )
    );
  }
}
