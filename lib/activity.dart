
class Activity {
  String idActivity;
  String nameActivity;
  String porcentaje;
  String note;
  String definitive;

  Activity(this.idActivity, this.nameActivity, this.porcentaje, this.note);
  Activity.consulta(this.idActivity, this.nameActivity, this.porcentaje, this.note, this.definitive);

Map<String,dynamic> toMap(){
  return<String,dynamic>{
    "idActivity": idActivity,
    "nameActivity": nameActivity,
    "note": note,
    "porcentaje": porcentaje,

  };


}

  String CalcularDefinitivaActividad(String porcentaje, String note){
    var def= double.parse(porcentaje) * (double.parse(note))/100;
    this.definitive = def.toString();
    return this.definitive;
    }
}