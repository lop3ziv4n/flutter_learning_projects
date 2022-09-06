import 'dart:convert';

ResponseCentileData responseCentileDataFromJson(String str) =>
    ResponseCentileData.fromJson(json.decode(str));

String responseCentileDataToJson(ResponseCentileData data) =>
    json.encode(data.toJson());

class ResponseCentileData {
  ResponseCentileData({
    required this.prematuro,
    required this.tipo,
    required this.centilos,
    required this.tipoEdad,
    required this.sexo,
  });

  final bool prematuro;
  final String tipo;
  final List<Centilo> centilos;
  final String tipoEdad;
  final String sexo;

  factory ResponseCentileData.fromJson(Map<String, dynamic> json) =>
      ResponseCentileData(
        prematuro: json["prematuro"],
        tipo: json["tipo"],
        centilos: List<Centilo>.from(
            json["centilos"].map((x) => Centilo.fromJson(x))),
        tipoEdad: json["tipoEdad"],
        sexo: json["sexo"],
      );

  Map<String, dynamic> toJson() => {
        "prematuro": prematuro,
        "tipo": tipo,
        "centilos": List<dynamic>.from(centilos.map((x) => x.toJson())),
        "tipoEdad": tipoEdad,
        "sexo": sexo,
      };
}

class Centilo {
  Centilo({
    required this.edad,
    required this.centilo3,
    required this.centilo10,
    required this.centilo25,
    required this.centilo50,
    required this.centilo75,
    required this.centilo90,
    required this.centilo97,
  });

  final double edad;
  final double centilo3;
  final double centilo10;
  final double centilo25;
  final double centilo50;
  final double centilo75;
  final double centilo90;
  final double centilo97;

  factory Centilo.fromJson(Map<String, dynamic> json) => Centilo(
        edad: json["edad"].toDouble(),
        centilo3: json["centilo3"].toDouble(),
        centilo10: json["centilo10"].toDouble(),
        centilo25: json["centilo25"].toDouble(),
        centilo50: json["centilo50"].toDouble(),
        centilo75: json["centilo75"].toDouble(),
        centilo90: json["centilo90"].toDouble(),
        centilo97: json["centilo97"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "edad": edad,
        "centilo3": centilo3,
        "centilo10": centilo10,
        "centilo25": centilo25,
        "centilo50": centilo50,
        "centilo75": centilo75,
        "centilo90": centilo90,
        "centilo97": centilo97,
      };
}
