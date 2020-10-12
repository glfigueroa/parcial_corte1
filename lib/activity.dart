
class Activity {
  String idActivity;
  String nameActivity;
  String porcentaje;
  String note;
  String definitive;
  String definitiveGeneral;
  static int total=100;
  static int contaPorcentaje=0;
  static double definitiveTotal=0;

  Activity(this.idActivity, this.nameActivity, this.porcentaje, this.note);
  Activity.consulta(this.idActivity, this.nameActivity, this.porcentaje, this.note, this.definitive, this.definitiveGeneral);

Map<String,dynamic> toMap(){
  return<String,dynamic>{
    "idActivity": idActivity,
    "nameActivity": nameActivity,
    "note": note,
    "porcentaje": porcentaje,

  };


}

  String CalcularDefinitivaActividad(String Porcentaje, String note){
    contaPorcentaje = contaPorcentaje + int.parse(Porcentaje);
    if(contaPorcentaje<=total){
      var def= double.parse(porcentaje) * (double.parse(note))/100;
      this.definitive = def.toString();
      definitiveTotal= definitiveTotal + double.parse(this.definitive);
      this.definitiveGeneral = definitiveTotal.toString();
      return this.definitive;



    }
    return "-1";
    }

}