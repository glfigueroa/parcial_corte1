import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:parcial_corte1/activity.dart';
class DBHelper{



  static Database _db;

  // ignore: missing_return
  Future<Database>get db async{
    if(_db ==null)
      _db = await initDB();
      return _db;

  }

  Future <Database> initDB() async{
    io.Directory documentsDirectory= await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,"PARCIALM.db");
    var theDatabase= await openDatabase(path,version: 1,onCreate: _onCreate);
    return theDatabase;
  }
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE ACTIVIDAD(idActivity TEXT PRIMARY KEY, nameActivity TEXT, porcentaje TEXT, note TEXT, definitive TEXT, definitiveTotal TEXT )");
         print("Created tables");
  }
  Future<List<Activity>> getEmployees() async {
    var dbActivity = await Future.value(db);
    List<Activity> listActivity= List();
    List<Map> queryList= await dbActivity.rawQuery(
      'SELECT * FROM ACTIVIDAD',
    );
    for(int i =0; i<queryList.length;i++){
      listActivity.add(Activity.consulta(
        queryList[i]['idActivity'],
        queryList[i]['nameActivity'],
        queryList[i]['porcentaje'],
        queryList[i]['note'],
        queryList[i]['definitive'],
        queryList[i]['definitiveTotal'],));
      }
    return listActivity;
  }
  void addItem(Activity activity) async {
    var dbActivity = await db;
    await dbActivity.transaction((txn) async {
      if ((double.parse(activity.porcentaje) >= 0 ||
          double.parse(activity.porcentaje) <= 100) &&
          (int.parse(activity.note) >= 0
              || int.parse(activity.note) <= 5)) {
        activity.definitive = activity.CalcularDefinitivaActividad(
            activity.porcentaje, activity.note);
        if (activity.definitive != "-1") {
          return await txn.rawInsert(
              'INSERT INTO ACTIVIDAD(idActivity,nameActivity,porcentaje, note, definitive, definitiveTotal) VALUES(' +
                  '\'' +
                  activity.idActivity +
                  '\'' +
                  ',' +
                  '\'' +
                  activity.nameActivity +
                  '\'' +
                  ',' +
                  '\'' +
                  activity.porcentaje +
                  '\'' +
                  ',' +
                  '\'' +
                  activity.note +
                  '\'' +
                  ',' +
                  '\'' +
                  activity.definitive +
                  '\'' +
                  ',' +
                  '\'' +
                  activity.definitiveGeneral +
                  '\'' +
                  ')');
        }
      }
    });

    }

  }


