import 'package:flutter/cupertino.dart';

import 'formMatter.dart';
import 'package:flutter/material.dart';

import 'consultar.dart';
class Home extends StatefulWidget{
  HomeState createState()=> HomeState();

}

class HomeState extends State<Home>{
  int  _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0 : return FormMatter();
      case 1: return MyEmployeeList();
      case 2: return ;
      case 3: return ;
      case 4: return ;
    }
  }
  _onSelectItem(int pos){
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Materias UPC')
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Gian Lucas Figueroa Felizola',style: TextStyle(color: Colors.white), ),
              accountEmail: Text('glfigueroa@unicesar.edu.co', style: TextStyle(color: Colors.white),),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightGreenAccent,
                child: Text('G',
                    style: TextStyle(fontSize: 40.0, color: Colors.green)),

              ),
            ),
            ListTile(
              title: Text('Materias'),
              leading: Icon(Icons.assignment),
              selected: (0== _selectDrawerItem),
              onTap: (){

                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Consultar'),
              leading: Icon(Icons.search),
              selected: (1== _selectDrawerItem),
              onTap: (){

                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              selected: (4== _selectDrawerItem),
              onTap: (){

                _onSelectItem(4);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}