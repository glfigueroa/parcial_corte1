import 'package:flutter/material.dart';
import 'package:parcial_corte1/Base%20de%20datos/database_helper.dart';
import 'activity.dart';
class FormCortes extends StatefulWidget{
  @override
  FormCortesState createState()=> FormCortesState();

}
class FormCortesState extends State<FormCortes>{
  final TextEditingController _idActivity = TextEditingController();
  final TextEditingController _nameActivity = TextEditingController();
  final TextEditingController _porcentaje = TextEditingController();
  final TextEditingController _note = TextEditingController();




  final scaffelkey= new GlobalKey<ScaffoldState>();
  final formKey=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffelkey,
      appBar: AppBar(title: Text("Anexar Materia"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese ID*';
                    }
                    return null;
                  },
                  controller: _idActivity,
                  decoration: InputDecoration(
                    hintText: 'id actividad',
                    labelText: "ID",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese El Nombre De La Actividad*';
                    }
                    return null;
                  },
                  controller: _nameActivity,
                  decoration: InputDecoration(
                    hintText: 'Nombre Actividad',
                    labelText: "Actividad",
                  ),
                ),


                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Porcentaje*';
                    }else if((double.parse(value)<0)||(double.parse(value)>100)){
                      return 'Ingrese un porcentaje valido, entre 0 y 100';
                    }
                    return null;
                  },
                  controller: _porcentaje,
                  decoration: InputDecoration(
                    hintText: '%',
                    labelText: "Porcentaje",
                  ),
                ),

                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Nota*';
                    }else if((double.parse(value)<0)||(double.parse(value)>5)){
                      return 'Ingrese una nota valida, entre 0 y 5';
                    }
                    return null;
                  },
                  controller: _note,
                  decoration: InputDecoration(
                    hintText: 'Nota Actividad',
                    labelText: "Nota Actividad",
                  ),
                ),


                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Registrar"),
                  onPressed: (){
                    final form= formKey.currentState;
                    if(form.validate()){
                      form.save();
                      var activity = Activity(_idActivity.text, _nameActivity.text, _porcentaje.text, _note.text);
                      var dbHelper = DBHelper();
                      dbHelper.addItem(activity);
                      _showAlertDialog();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Mensaje"),
            content: Text("Agregado Correctamente"),
            actions: <Widget>[
              RaisedButton(
                child: Text("CERRAR", style: TextStyle(color: Colors.red),),
                onPressed: (){ Navigator.of(context).pop(); },
              )
            ],
          );
        }
    );
  }
}