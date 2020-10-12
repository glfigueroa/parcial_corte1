import 'package:flutter/material.dart';
import 'package:parcial_corte1/activity.dart';
import 'dart:async';
import 'Base de datos//database_helper.dart';

Future<List<Activity>> fetchEmployeesFromDatabase() async {
  var dbHelper = DBHelper();
  var db = dbHelper.db;
  if(db!=null){
    Future<List<Activity>> employees = dbHelper.getEmployees();
    return employees;
  }

}

class MyEmployeeList extends StatefulWidget {
  @override
  MyEmployeeListPageState createState() => new MyEmployeeListPageState();
}

class MyEmployeeListPageState extends State<MyEmployeeList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Consultar'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<Activity>>(
          future: fetchEmployeesFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text("Actividad: "+ snapshot.data[index].nameActivity.toUpperCase(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),

                          new Text("Porcentaje: "+snapshot.data[index].porcentaje.toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          new Text("Nota: "+ snapshot.data[index].note.toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          new Text("Acumulado: "+ snapshot.data[index].definitive.toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          new Text("Definitiva Total: "+ snapshot.data[index].definitiveGeneral.toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          new Divider()
                        ]);
                  });
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}