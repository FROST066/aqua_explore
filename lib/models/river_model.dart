class RiverModel {
  int id;
  String nomDuCou;
  double x;
  double y;
  String descrip;
  int tempC;
  int ph;
  int tubi;

  RiverModel({
    required this.id,
    required this.nomDuCou,
    required this.x,
    required this.y,
    required this.descrip,
    required this.tempC,
    required this.ph,
    required this.tubi,
  });

  factory RiverModel.fromJson(Map<String, dynamic> json) => RiverModel(
        id: json["ID"],
        nomDuCou: json["Nom du cou"],
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
        descrip: json["Descrip"],
        tempC: json["Temp °C"],
        ph: json["Ph"],
        tubi: json["tubi"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Nom du cou": nomDuCou,
        "x": x,
        "y": y,
        "Descrip": descrip,
        "Temp °C": tempC,
        "Ph": ph,
        "tubi": tubi,
      };
}
