import 'dart:convert';

class Computador {
  int? id;
  String? modelo;
  String? marca;
  int? anio;

  Computador({
    required this.id,
    required this.modelo,
    required this.marca,
    required this.anio,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "modelo": modelo,
        "marca": marca,
        "anio": anio,
      };

  factory Computador.fromJson(Map<String, dynamic> json) {
    return Computador(
      id: json["id"],
      modelo: json["modelo"],
      marca: json["marca"],
      anio: json["anio"],
    );
  }

  static String computadorToJson(Computador data) => json.encode(data.toJson());
  static Computador computadorFromJson(String str) =>
      Computador.fromJson(json.decode(str));

  factory Computador.init() =>
      Computador(id: 0, modelo: "vacio", marca: "vacio", anio: 2023);
}
