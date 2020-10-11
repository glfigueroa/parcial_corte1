import 'package:flutter/material.dart';
import 'formCortes.dart';
class FormMatter extends StatefulWidget{
  @override
  FormMaterialState createState()=> FormMaterialState();

}

class FormMaterialState extends State<FormMatter>{
  final scaffelkey= new GlobalKey<ScaffoldState>();
  final formKey=new GlobalKey<FormState>();
  final TextEditingController _nameMatter = TextEditingController();
  final TextEditingController _note1 = TextEditingController();
  final TextEditingController _note2 = TextEditingController();
  final TextEditingController _note3 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffelkey,
      appBar: AppBar(title: Text("Registro Materias"),),
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
                      return 'INGRESE LA MATERIA, OBLIGATORIO';
                    }
                    return null;
                  },
                  controller: _nameMatter,
                  decoration: InputDecoration(
                    hintText: 'Nombre Materia',
                    labelText: "Materia",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Nota Corte 1';
                    }
                    return null;
                  },
                  controller: _note1,
                  decoration: InputDecoration(
                    hintText: 'Nota Corte 1',
                    labelText: "Corte 1",
                  ),
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Registrar Corte 1"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormCortes()),
                    );
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Nota Corte 2';
                    }
                    return null;
                  },
                  controller: _note2,
                  decoration: InputDecoration(
                    hintText: 'Nota Corte 2',
                    labelText: "Corte 2",

                  ),

                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Registrar Corte 2"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormCortes()),
                    );
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingrese Nota Corte  3';
                    }
                    return null;
                  },
                  controller: _note3,
                  decoration: InputDecoration(

                    hintText: 'Nota Corte 3',
                    labelText: "Corte 3",
                  ),
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("Registrar Corte 3"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormCortes()),
                    );
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text("GUARDAR"),
                  onPressed: (){
                    final form= formKey.currentState;
                    if(form.validate()){

                      form.save();
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

}